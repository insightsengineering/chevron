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
egt01_main <- function(adam_db,
                       dataset = "adeg",
                       arm_var = "ACTARM",
                       lbl_overall = NULL,
                       row_split_var = NULL,
                       summaryvars = c("AVAL", "CHG"),
                       visitvar = "AVISIT",
                       precision = list(default = 0L),
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
  dataset = c("adsl", "adeg")
)
