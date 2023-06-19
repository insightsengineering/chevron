# coxt02 ----

#' @describeIn coxt02 Main TLG function
#'
#' @inherit coxt01_main
#'
#' @source utils.R
#'
#' @export
#'
coxt02_main <- modify_default_args(coxt01_main, multivar = TRUE)
#' `COXT02` Multi-Variable Cox Regression Model Table.
#'
#' The `COXT02` table follows the same principles as the general Cox model analysis
#' and produces the estimates for each of the covariates included in the model
#' (usually the main effects without interaction terms).
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' library(dunlin)
#'
#' proc_data <- log_filter(syn_data, PARAMCD == "CRSD", "adtte")
#'
#' run(coxt02, proc_data)
#'
#' run(coxt02, proc_data, covariates = c("SEX", "AAGE"), strata = c("RACE"), conf_level = 0.90)
coxt02 <- chevron_t(
  main = coxt02_main,
  preprocess = coxt01_pre,
  postprocess = coxt01_post,
  adam_datasets = c("adsl", "adtte")
)
