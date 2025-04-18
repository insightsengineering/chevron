# rmpt04 ----

#' @describeIn rmpt04 Main TLG function
#'
#' @inheritParams gen_args
#' @inheritParams rmpt01
#' @returns the main function returns an `rtables` object.
#'
#' @details
#'   * Person time is the sum of exposure across all patients.
#'   * Summary statistics are by default based on the number of patients in the corresponding `N` row
#'   (number of non-missing values).
#'   * Does not remove zero-count rows unless overridden with `prune_0 = TRUE`.
#'
#' @export
#'
rmpt04_main <- modify_default_args(rmpt01_main, summaryvars = "ETHNIC")

#' @describeIn rmpt04 Preprocessing
#'
#' @inheritParams gen_args
#' @inheritParams rmpt04_main
#' @returns the preprocessing function returns a `list` of `data.frame`.
#' @export
#'
rmpt04_pre <- modify_default_args(
  rmpt01_pre,
  summaryvars = "ETHNIC"
)

#' `RMPT04`Extent of Exposure by Ethnic Origin for Risk Management Plan Table.
#'
#' The `RMPT04` table provides an overview of duration of exposure extent.
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' run(rmpt04, syn_data)
rmpt04 <- chevron_t(
  main = rmpt04_main,
  preprocess = rmpt04_pre,
  postprocess = rmpt01_post,
  dataset = c("adsl", "adex")
)
