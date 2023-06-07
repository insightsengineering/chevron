# egt01 ----

#' @describeIn egt01 Main TLG function
#'
#' @inherit cfbt01_main
#' @source cfbt01.R
#' @export
#'
egt01_main <- modify_default_args(cfbt01_main, dataset = "adeg")

#' @describeIn vst01 Preprocessing
#'
#' @inherit cfbt01_pre
#' @export
#'
egt01_pre <- modify_default_args(cfbt01_pre, dataset = "adeg")

#' `EGT01` Vital Sign Results and change from Baseline By Visit Table.
#'
#' The `EGT01` table provides an
#' overview of the Ecg values and its change from baseline of each respective arm
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
  adam_datasets = c("adsl", "adeg")
)
