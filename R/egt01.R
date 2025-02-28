# egt01 ----

#' @describeIn egt01 Main TLG function
#'
#' @inherit cfbt01_main
#' @include cfbt01.R
#' @returns the main function returns an `rtables` object.
#'
#' @note default precision is 0.
#'
#' @export
#'
egt01_main <- modify_default_args(cfbt01_main, dataset = "adeg", precision = quote(list(default = 0L)))

#' @describeIn egt01 Preprocessing
#'
#' @inherit cfbt01_pre
#' @returns the preprocessing function returns a `list` of `data.frame`.
#'
#' @export
#'
egt01_pre <- modify_default_args(cfbt01_pre, dataset = "adeg")

#' `EGT01` ECG Parameters and Change from Baseline By Visit Table.
#'
#' The `EGT01` table provides an
#' overview of the ECG values and its change from baseline of each respective arm
#' over the course of the trial.
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' run(egt01, syn_data)
egt01 <- chevron_t(
  main = egt01_main,
  preprocess = egt01_pre,
  postprocess = cfbt01_post,
  dataset = c("adeg", "adsl")
)
