# aet05 ----

#' @describeIn aet05 Main TLG function
#'
#' @inheritParams gen_args
#' @param dataset (`string`) the name of a table in the `adam_db` object.
#' @param arm_var (`string`) the arm variable used for arm splitting.
#' @param ... Further arguments passed to `tern::control_incidence_rate()`.
#' @returns the main function returns an `rtables` object.
#'
#' @details
#'  * Total patient-years at risk is the sum over all patients of the time intervals (in years).
#'  * Split columns by arm, typically `ACTARM`.
#'  * Split rows by parameter code.
#'  * `AVAL` is patient-years at risk.
#'  * `N_EVENTS` is the number of adverse events observed.
#'  * The table allows confidence level to be adjusted, default is 95%.
#'  * Keep zero count rows by default.
#'
#' @note
#'  * `adam_db` object must contain table named as `dataset` with the columns `"PARAMCD"`, `"PARAM"`,
#'  `"AVAL"`, and `"CNSR"`.
#'
#' @export
#'
aet05_main <- function(adam_db,
                       dataset = "adsaftte",
                       arm_var = "ACTARM",
                       lbl_overall = NULL,
                       ...) {
  assert_string(dataset)
  assert_all_tablenames(adam_db, "adsl", dataset)
  assert_string(arm_var)
  assert_string(lbl_overall, null.ok = TRUE)
  df_lbl <- paste0("adam_db$", dataset)
  assert_valid_variable(adam_db$adsl, c("USUBJID", arm_var), types = list(c("character", "factor")))
  assert_valid_variable(adam_db[[dataset]], c("USUBJID", arm_var, "PARAMCD", "PARAM"),
    types = list(c("character", "factor")), label = df_lbl
  )
  assert_valid_variable(adam_db[[dataset]], "AVAL", types = list("numeric"), lower = 0, na_ok = TRUE, label = df_lbl)
  assert_valid_variable(adam_db[[dataset]], "N_EVENTS",
    types = list("numeric"), integerish = TRUE, lower = 0L,
    label = df_lbl
  )
  assert_valid_var_pair(adam_db$adsl, adam_db[[dataset]], arm_var)

  lbl_overall <- render_safe(lbl_overall)
  control <- execute_with_args(control_incidence_rate, ...)

  lyt <- aet05_lyt(
    arm_var = arm_var,
    lbl_overall = lbl_overall,
    param_label = "PARAM",
    vars = "AVAL",
    n_events = "N_EVENTS",
    control = control
  )

  tbl <- build_table(lyt, adam_db[[dataset]], alt_counts_df = adam_db$adsl)

  tbl
}

#' `aet05` Layout
#'
#' @inheritParams gen_args
#' @param param_label (`string`) variable for parameter code.
#' @param vars (`string`) variable for the primary analysis variable to be iterated over.
#' @param n_events (`string`) variable to count the number of events observed.
#' @param control (`list`) parameters for estimation details, specified by using the helper function
#' control_incidence_rate().
#' @returns a `PreDataTableLayouts` object.
#'
#' @keywords internal
#'
aet05_lyt <- function(arm_var,
                      lbl_overall,
                      param_label,
                      vars,
                      n_events,
                      control) {
  lyt <- basic_table(show_colcounts = TRUE) %>%
    split_cols_by_with_overall(arm_var, lbl_overall) %>%
    split_rows_by(param_label, split_fun = drop_split_levels) %>%
    estimate_incidence_rate(
      vars = vars,
      n_events = n_events,
      control = control
    )
}

#' @describeIn aet05 Preprocessing
#'
#' @inheritParams gen_args
#' @returns the preprocessing function returns a `list` of `data.frame`.
#' @export
#'
aet05_pre <- function(adam_db, dataset = "adsaftte", ...) {
  adam_db[[dataset]] <- adam_db[[dataset]] %>%
    filter(grepl("(AE|CQ|SMQ)TTE", .data$PARAMCD)) %>%
    mutate(
      N_EVENTS = as.integer(.data$CNSR == 0)
    )

  adam_db
}

#' @describeIn aet05 Postprocessing
#'
#' @inheritParams gen_args
#' @returns the postprocessing function returns an `rtables` object or an `ElementaryTable` (null report).
#' @export
#'
aet05_post <- function(tlg, prune_0 = FALSE, ...) {
  if (prune_0) {
    tlg <- smart_prune(tlg)
  }
  std_postprocessing(tlg)
}

#' `AET05` Table 1 (Default) Adverse Event Rate Adjusted for Patient-Years at Risk - First Occurrence.
#'
#' The `AET05` table produces the standard adverse event rate adjusted for patient-years at risk summary
#' considering first occurrence.
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' library(dplyr)
#' library(dunlin)
#'
#' proc_data <- log_filter(syn_data, PARAMCD == "AETTE1", "adsaftte")
#'
#' run(aet05, proc_data)
#'
#' run(aet05, proc_data, conf_level = 0.90, conf_type = "exact")
aet05 <- chevron_t(
  main = aet05_main,
  preprocess = aet05_pre,
  postprocess = aet05_post
)
