# aet05_all ----

#' @describeIn aet05_all Main TLG function
#'
#' @inheritParams gen_args
#' @param occurrence (`character`) time intervals with respect to first occurrence or all occurrences.
#'
#' @details
#'  * Total patient-years at risk is the sum over all patients of the time intervals (in years).
#'  * Split columns by arm, typically `ACTARM`.
#'  * Keep zero count rows by default.
#'
#' @note
#'  * `adam_db` object must contain an `adaette` table with the columns `""` and `""`.
#'
#'
#' @export
#'
aet05_all_main <- function(adam_db,
                       arm_var = "ACTARM",
                       ...) {
  lyt <- aet05_all_lyt(
    arm_var = arm_var
  )

  tbl <- build_table(lyt, adam_db$adaette, alt_counts_df = adam_db$adsl)

  tbl
}

#' `aet05_all` Layout
#'
#' @inheritParams aet05_all_main
#'
#' @keywords internal
#'
aet05_all_lyt <- function(arm_var) {
  lyt <- basic_table(show_colcounts = TRUE) %>%
    split_cols_by(arm_var) %>%
    estimate_incidence_rate(
      vars = "AVAL",
      n_events = "n_events",
      control = control_incidence_rate(conf_level = 0.95, conf_type = "exact", time_unit_output = 100)
    )
}

#' @describeIn aet05_all Preprocessing
#'
#' @inheritParams gen_args
#'
#' @export
#'
aet05_all_pre <- function(adam_db, ...) {
  adam_db$adaette <- adam_db$adaette %>%
    filter("TOT" %in% .data$PARAMCD | .data$PARAMCD == "AEREPTTE") %>%
    mutate(PARAMCD = droplevels(.data$PARAMCD)) %>%
    mutate(n_events = as.integer(n_events),
    aval = occurrence == "all" & PARAMCD == "AEREPTTE" ~ AVAL) %>%
    filter(!is.na(.data$aval))

    adam_db
}

#' @describeIn aet05_all Postprocessing
#'
#' @inheritParams gen_args
#'
#' @export
#'
aet05_all_post <- function(tlg, prune_0 = FALSE, ...) {
  if (prune_0) {
    tlg <- smart_prune(tlg)
  }
  std_postprocess(tlg)
}

#' `AET05_ALL` Table 1 (Default) Adverse Event Rate Adjusted for Patient-Years at Risk - All Occurrences.
#'
#' The `AET05_ALL` table produces the standard adverse event rate adjusted for patient-years at risk summary
#' considering all occurrences.
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' run(aet05_all, syn_data)
#'
#' run(aet05_all, syn_data, conf_type = "exact")
aet05_all <- chevron_t(
  main = aet05_all_main,
  preprocess = aet05_all_pre,
  postprocess = aet05_all_post,
  adam_datasets = c("adsl", "adaette")
)
