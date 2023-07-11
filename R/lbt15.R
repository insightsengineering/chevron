# lbt15 ----

#' @describeIn lbt15 Main TLG function
#' @source `lbt04.R`
#'
#' @inheritParams lbt04
#'
#' @export
#'
lbt15_main <- modify_default_args(lbt04_main, analysis_abn_var = "ATOXGR", baseline_abn_var = "BTOXGR")

#' @describeIn lbt15 Preprocessing
#'
#' @inheritParams gen_args
#'
#' @export
#'
lbt15_pre <- function(adam_db, ...) {
  format <- rule(
    "LOW" = c("-2", "-3", "-4"),
    "MODERATE/NORMAL" = c("-1", "0", "1"),
    "HIGH" = c("2", "3", "4")
  )

  adam_db$adlb <- adam_db$adlb %>%
    filter(
      .data$ONTRTFL == "Y",
      .data$PARCAT2 == "SI",
      !is.na(.data$ATOXGR)
    ) %>%
    mutate(
      PARAM = with_label(.data$PARAM, "Laboratory Test"),
      ANRIND = with_label(.data$ANRIND, "Direction of Abnormality")
    ) %>%
    mutate(
      ATOXGR = reformat(.data$ATOXGR, .env$format),
      BTOXGR = reformat(.data$BTOXGR, .env$format)
    )

  adam_db
}

#' `LBT15` Laboratory Test Shifts to `NCI-CTCAE` Grade 3-4 Post-Baseline Table.
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' run(lbt15, syn_data)
lbt15 <- chevron_t(
  main = lbt15_main,
  preprocess = lbt15_pre,
  postprocess = lbt04_post
)
