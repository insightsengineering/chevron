# vst01 ----

#' @describeIn vst01 Main TLG function
#'
#' @inherit cfbt01_main
#' @include cfbt01.R
#' @returns the main function returns an `rtables` object.
#'
#' @export
#'
vst01_main <- modify_default_args(
  cfbt01_main,
  dataset = "advs",
  precision = quote(list(DIABP = 0, PUL = 0, SYSBP = 0, default = 2L))
)

#' @describeIn vst01 Preprocessing
#'
#' @inherit cfbt01_pre
#' @returns the preprocessing function returns a `list` of `data.frame`.
#' @export
#'
vst01_pre <- modify_default_args(
  cfbt01_pre,
  dataset = "advs"
)

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
#' library(dunlin)
#'
#' proc_data <- log_filter(
#'   syn_data,
#'   PARAMCD %in% c("DIABP", "SYSBP"), "advs"
#' )
#' run(vst01, proc_data)
vst01 <- chevron_t(
  main = vst01_main,
  preprocess = vst01_pre,
  postprocess = cfbt01_post,
  dataset = c("adsl", "advs")
)
