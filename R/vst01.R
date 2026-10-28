# vst01 ----

#' @describeIn vst01 Main TLG function
#'
#' @inherit cfbt01_main
#' @include cfbt01.R
#' @returns the main function returns an `rtables` object.
#'
#' @export
#'
vst01_main <- function(adam_db,
                       dataset = "advs",
                       arm_var = "ACTARM",
                       lbl_overall = NULL,
                       row_split_var = NULL,
                       summaryvars = c("AVAL", "CHG"),
                       visitvar = "AVISIT",
                       precision = list(DIABP = 0, PUL = 0, SYSBP = 0, default = 2L),
                       page_var = "PARAMCD",
                       .stats = c("n", "mean_sd", "median", "range"),
                       skip = list(CHG = "BASELINE"),
                       ...) {
  cfbt01_main(
    adam_db = adam_db,
    dataset = dataset,
    arm_var = arm_var,
    lbl_overall = lbl_overall,
    row_split_var = row_split_var,
    summaryvars = summaryvars,
    visitvar = visitvar,
    precision = precision,
    page_var = page_var,
    .stats = .stats,
    skip = skip,
    ...
  )
}

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
