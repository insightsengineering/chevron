# aet05_all ----

#' @describeIn aet05_all Preprocessing
#'
#' @inheritParams gen_args
#'
#' @export
#'
aet05_all_pre <- function(adam_db, ...) {
  anl_tte <- adam_db$adaette %>%
    filter(.data$PARAMCD == "AEREPTTE") %>%
    select(-PARAMCD)

  anl_events <- adam_db$adaette %>%
    filter(grepl("TOT", .data$PARAMCD)) %>%
    mutate(
      PARAMCD = droplevels(.data$PARAMCD),
      n_events = as.integer(AVAL)
    ) %>%
    select(USUBJID, ACTARM, PARAMCD, n_events)

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
#' library(dplyr)
#' library(dunlin)
#'
#' proc_data <- log_filter(syn_data, PARAMCD == "AETOT1" | PARAMCD == "AEREPTTE", "adaette")
#'
#' run(aet05_all, proc_data, time_unit_output = 100)
#'
#' run(aet05_all, proc_data, conf_level = 0.90, conf_type = "exact", time_unit_output = 100)
aet05_all <- chevron_t(
  main = aet05_main,
  preprocess = aet05_all_pre,
  postprocess = aet05_post,
  adam_datasets = c("adsl", "adaette")
)
