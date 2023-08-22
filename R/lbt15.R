# lbt15 ----

#' @describeIn lbt15 Preprocessing
#'
#' @inheritParams gen_args
#'
#' @export
#'
lbt15_pre <- function(adam_db, ...) {
  format <- rule(
    "LOW" = c("-3", "-4"),
    "MODERATE/NORMAL" = c("-2", "-1", "0", "1", "2"),
    "HIGH" = c("3", "4"),
    .to_NA = NULL
  )

  adam_db$adlb <- adam_db$adlb %>%
    filter(
      .data$ONTRTFL == "Y",
      .data$PARCAT2 == "SI"
    ) %>%
    mutate(
      PARAM = with_label(.data$PARAM, "Laboratory Test"),
      ANRIND = with_label(.data$ANRIND, "Direction of Abnormality")
    ) %>%
    mutate(
      ANRIND = reformat(.data$ATOXGR, .env$format),
      BNRIND = reformat(.data$BTOXGR, .env$format)
    )

  adam_db
}

#' `LBT15` Laboratory Test Shifts to `NCI-CTCAE` Grade 3-4 Post-Baseline Table.
#' @source `lbt04.R`
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' run(lbt15, syn_data)
lbt15 <- chevron_t(
  main = lbt04_main,
  preprocess = lbt15_pre,
  postprocess = lbt04_post
)
