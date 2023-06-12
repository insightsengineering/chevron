# aet05 ----

#' @describeIn aet05 Main TLG function
#'
#' @inheritParams gen_args
#' @param ... Further arguments passed to `tern::control_incidence_rate()`.
#'
#' @details
#'  * Total patient-years at risk is the sum over all patients of the time intervals (in years).
#'  * Split columns by arm, typically `ACTARM`.
#'  * The table allows confidence level to be adjusted, default is 2-sided 5%.
#'  * Keep zero count rows by default.
#'
#' @note
#'  * `adam_db` object must contain an `adaette` table with the columns `""` and `""`.
#'
#'
#' @export
#'
aet05_main <- function(adam_db,
                       arm_var = "ACTARM",
                       ...) {
  assert_all_tablenames(adam_db, c("adsl", "adaette"))
  assert_valid_var_pair(adam_db$adsl, adam_db$adaette, arm_var)
  assert_valid_variable(adam_db$adaette, "USUBJID", empty_ok = TRUE, types = list(c("character", "factor")))
  assert_valid_variable(adam_db$adsl, c("USUBJID", arm_var), types = list(c("character", "factor")))
  assert_valid_variable(adam_db$adaette, "AVAL", types = list("numeric"), lower = 0)
  assert_valid_variable(adam_db$adaette, "n_events", types = list("logical"))
  control <- execute_with_args(control_incidence_rate, ...)

  lyt <- aet05_lyt(
    arm_var = arm_var,
    vars = "AVAL",
    n_events = "n_events",
    control = control
  )

  tbl <- build_table(lyt, adam_db$adaette, alt_counts_df = adam_db$adsl)

  tbl
}

#' `aet05` Layout
#'
#' @inheritParams aet05_main
#'
#' @keywords internal
#'
aet05_lyt <- function(arm_var,
                      vars,
                      n_events,
                      control) {
  lyt <- basic_table(show_colcounts = TRUE) %>%
    split_cols_by(arm_var) %>%
    estimate_incidence_rate(
      vars = vars,
      n_events = n_events,
      control = control
    )
}

#' @describeIn aet05 Preprocessing
#'
#' @inheritParams gen_args
#'
#' @export
#'
aet05_pre <- function(adam_db, ...) {
  adam_db$adaette <- adam_db$adaette %>%
    filter("TTE" %in% .data$PARAMCD) %>%
    mutate(PARAMCD = droplevels(.data$PARAMCD)) %>%
    mutate(
      n_events = as.integer(.data$CNSR == 0)
    )

  adam_db
}

#' @describeIn aet05 Postprocessing
#'
#' @inheritParams gen_args
#'
#' @export
#'
aet05_post <- function(tlg, prune_0 = FALSE, ...) {
  if (prune_0) {
    tlg <- smart_prune(tlg)
  }
  std_postprocess(tlg)
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
#' run(aet05, syn_data)
#'
#' run(aet05, syn_data, conf_type = "exact", time_unit_output = 100)
aet05 <- chevron_t(
  main = aet05_main,
  preprocess = aet05_pre,
  postprocess = aet05_post,
  adam_datasets = c("adsl", "adaette")
)
