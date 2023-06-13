# aet05_all ----

#' @describeIn aet05_all Main TLG function
#'
#' @inheritParams gen_args
#' @param arm_var (`string`) the arm variable used for arm splitting.
#' @param ... Further arguments passed to `tern::control_incidence_rate()`.
#'
#' @details
#'  * Total patient-years at risk is the sum over all patients of the time intervals (in years).
#'  * Split columns by arm, typically `ACTARM`.
#'  * The table allows confidence level to be adjusted, default is 2-sided 5%.
#'  * Keep zero count rows by default.
#'
#' @note
#'  * `adam_db` object must contain an `adaette` table with the columns `"PARAMCD"`, `"AVAL"`, and `"CNSR"`.
#'
#'
#' @export
#'
aet05_all_main <- function(adam_db,
                           arm_var = "ACTARM",
                           ...) {
  assert_all_tablenames(adam_db, c("adsl", "adaette"))
  checkmate::assert_string(arm_var)
  assert_valid_variable(adam_db$adsl, c("USUBJID", arm_var), types = list(c("character", "factor")))
  assert_valid_variable(adam_db$adaette, c("USUBJID", arm_var), types = list(c("character", "factor")))
  assert_valid_variable(adam_db$adaette, "AVAL", types = list("numeric"), lower = 0, na_ok = TRUE)
  assert_valid_variable(adam_db$adaette, "n_events", types = list("numeric"), integerish = TRUE, lower = 0L)
  assert_valid_var_pair(adam_db$adsl, adam_db$adaette, arm_var)
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

#' @describeIn aet05_all Preprocessing
#'
#' @inheritParams gen_args
#'
#' @export
#'
aet05_all_pre <- function(adam_db, ...) {
  anl_tte <- adam_db$adaette %>%
    filter(.data$PARAMCD == "AEREPTTE")

  anl_events <- adam_db$adaette %>%
    filter(grepl("TOT", .data$PARAMCD)) %>%
    mutate(n_events = as.integer(AVAL)) %>%
    select(USUBJID, ACTARM, n_events)

  adam_db$adaette <- full_join(anl_tte, anl_events, by = c("USUBJID", "ACTARM"))

  adam_db
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
#' run(aet05_all, syn_data, time_unit_output = 100)
#'
#' run(aet05_all, syn_data, conf_level = 0.90, conf_type = "exact", time_unit_output = 100)
aet05_all <- chevron_t(
  main = aet05_all_main,
  preprocess = aet05_all_pre,
  postprocess = aet05_post,
  adam_datasets = c("adsl", "adaette")
)
