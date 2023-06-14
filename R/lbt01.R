# lbt01 ----

#' @describeIn lbt01 Main TLG function
#'
#' @inherit cfbt01_main
#' @source `cfbt01.R`
#' @export
#'
lbt01_main <- modify_default_args(cfbt01_main, dataset = "adlb")

#' @describeIn lbt01 Preprocessing
#'
#' @inherit cfbt01_pre
#' @export
#'
lbt01_pre <- modify_default_args(cfbt01_pre, dataset = "adlb")

#' `LBT01` Lab Results and Change from Baseline by Visit Table.
#'
#' The `LBT01` table provides an
#' overview of the Lab values and its change from baseline of each respective arm
#' over the course of the trial.
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' run(lbt01, syn_data)
lbt01 <- chevron_t(
  main = lbt01_main,
  preprocess = lbt01_pre,
  postprocess = cfbt01_post,
  adam_datasets = c("adsl", "adlb")
)
