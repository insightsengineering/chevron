# rmpt05 ----

#' @describeIn rmpt05 Main TLG function
#'
#' @inheritParams gen_args
#' @inheritParams rmpt01
#'
#' @details
#'   * Person time is the sum of exposure across all patients.
#'   * Summary statistics are by default based on the number of patients in the corresponding `N` row
#'   (number of non-missing values).
#'   * Does not remove zero-count rows unless overridden with `prune_0 = TRUE`.
#'
#' @export
#'
rmpt05_main <- modify_default_args(rmpt01_main, summaryvars = "RACE")

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
  preprocess = rmpt01_pre,
  postprocess = rmpt01_post
)
