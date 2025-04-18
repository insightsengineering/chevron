# aet05_all ----

#' @describeIn aet05_all Preprocessing
#'
#' @inheritParams gen_args
#' @returns the preprocessing function returns a `list` of `data.frame`.
#' @export
#'
aet05_all_pre <- function(adam_db, dataset = "adsaftte", ...) {
  anl_tte <- adam_db[[dataset]] %>%
    filter(.data$PARAMCD == "AEREPTTE") %>%
    select(all_of(c("USUBJID", "AVAL")))

  adam_db[[dataset]] <- adam_db[[dataset]] %>%
    filter(grepl("TOT", .data$PARAMCD)) %>%
    mutate(
      N_EVENTS = as.integer(.data$AVAL),
      AVAL = NULL
    ) %>%
    left_join(anl_tte, by = c("USUBJID"))

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
#' proc_data <- log_filter(syn_data, PARAMCD == "AETOT1" | PARAMCD == "AEREPTTE", "adsaftte")
#'
#' run(aet05_all, proc_data)
#'
#' run(aet05_all, proc_data, conf_level = 0.90, conf_type = "exact")
aet05_all <- chevron_t(
  main = aet05_main,
  preprocess = aet05_all_pre,
  postprocess = aet05_post,
  dataset = c("adsl", "adsaftte")
)
