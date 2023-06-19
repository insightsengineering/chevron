# vst01 ----

#' @describeIn vst01 Main TLG function
#'
#' @inherit cfbt01_main
#' @source `cfbt01.R`
#' @export
#'
vst01_main <- modify_default_args(cfbt01_main, dataset = "advs")

#' @describeIn vst01 Preprocessing
#'
#' @inherit cfbt01_pre
#' @export
#'
vst01_pre <- modify_default_args(cfbt01_pre, dataset = "advs")

#' `VST01` Vital Sign Results and change from Baseline By Visit Table.
#'
#' The `VST01` table provides an
#' overview of the Vital Sign values and its change from baseline of each respective arm
#' over the course of the trial.
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' run(vst01, syn_data)
vst01 <- chevron_t(
  main = vst01_main,
  preprocess = vst01_pre,
  postprocess = cfbt01_post
)
