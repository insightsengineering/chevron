# rmpt05 ----

#' @describeIn rmpt05 Main TLG function
#'
#' @inheritParams gen_args
#' @inheritParams rmpt01
#'
#' @export
#'
rmpt05_main <- modify_default_args(rmpt01_main, summaryvars = "RACE")

#' @describeIn rmpt05 Preprocessing
#'
#' @inheritParams gen_args
#'
#' @export
#'
rmpt05_pre <- function(adam_db, ...) {
  adam_db$adex <- adam_db$adex %>%
    filter(.data$PARAMCD == "TDURD")

  adam_db
}

#' @describeIn rmpt05 Postprocessing
#'
#' @inheritParams gen_args
#'
#' @export
#'
rmpt05_post <- function(tlg, prune_0 = FALSE, ...) {
  if (prune_0) {
    tlg <- smart_prune(tlg)
  }
  std_postprocess(tlg)
}

#' `RMPT05` Extent of Exposure by Race for Risk Management Plan Table.
#'
#' The `RMPT05` table provides an overview of duration of exposure extent.
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' run(rmpt05, syn_data)
rmpt05 <- chevron_t(
  main = rmpt05_main,
  preprocess = rmpt05_pre,
  postprocess = rmpt05_post,
  adam_datasets = c("adsl", "adex")
)
