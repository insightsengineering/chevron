# coxt02 ----

#' @describeIn coxt02 Main TLG function
#'
#' @inheritParams gen_args
#' @param arm_var (`string`) the arm variable used for arm splitting.
#' @param time_var (`string`) the time variable in a Cox proportional hazards regression model.
#' @param event_var (`string`) the event variable in a Cox proportional hazards regression model.
#' @param covariates (`character`) will be fitted and the corresponding effect will be estimated.
#' @param strata (`character`) will be fitted for the stratified analysis.
#' @param lbl_vars (`string`) text label for the a Cox regression model variables.
#' @param ... Further arguments passed to `tern::control_coxreg()`.
#'
#' @details
#'  * The reference arm will always the first level of `arm_var`. Please change the level if you want to
#'  change the reference arms.
#'  * The table allows confidence level to be adjusted, default is 2-sided 5%.
#'  * The stratified analysis is with DISCRETE tie handling (equivalent to `tern::control_coxreg(ties = "exact")` in R).
#'  * Model includes treatment plus specified covariate(s) as factor(s) or numeric(s),
#'  with `"SEX"`, `"RACE"` and `"AAGE"` as default candidates.
#'  * The selection of the covariates and whether or not there is a selection process
#'  (vs. a fixed, pre-specified list) needs to be specified in the DAP.
#'  * For pairwise comparisons using the hazard ratio, the value for the control group is the denominator.
#'  * Keep zero-count rows unless overridden with `prune_0 = TRUE`.
#'
#' @note
#'   * `adam_db` object must contain an `adtte` table with `"PARAMCD"`, `"ARM"`,
#'   `"AVAL"`, `"CNSR`, and the columns specified by `"covariates"` which is denoted as
#'   `c("SEX", "RACE", "AAGE")` by default.
#'
#' @export
#'
coxt02_main <- function(adam_db,
                        arm_var = "ARM",
                        time_var = "AVAL",
                        event_var = "EVENT",
                        covariates = c("SEX", "RACE", "AAGE"),
                        strata = NULL,
                        lbl_vars = "Effect/Covariate Included in the Model",
                        ...) {
  assert_all_tablenames(adam_db, "adtte")
  checkmate::assert_string(arm_var)
  checkmate::assert_string(time_var)
  checkmate::assert_string(event_var)
  checkmate::assert_character(covariates, null.ok = TRUE)
  checkmate::assert_character(strata, null.ok = TRUE)
  assert_valid_variable(adam_db$adtte, arm_var, types = list("factor"))
  assert_valid_variable(adam_db$adtte, c("USUBJID", arm_var, "PARAMCD"), types = list(c("character", "factor")))
  assert_valid_variable(adam_db$adtte, c(covariates, strata), types = list(c("factor", "numeric")), na_ok = TRUE)
  assert_valid_variable(adam_db$adtte, event_var, types = list("numeric"), integerish = TRUE, lower = 0L, upper = 1L)
  assert_valid_variable(adam_db$adtte, time_var, types = list("numeric"), lower = 0)
  assert_single_value(adam_db$adtte$PARAMCD)
  control <- execute_with_args(control_coxreg, ...)

  variables <- list(
    time = time_var,
    event = event_var,
    arm = arm_var,
    covariates = covariates,
    strata = strata
  )

  lyt <- coxt02_lyt(
    variables = variables,
    lbl_vars = lbl_vars,
    control = control
  )

  tbl <- build_table(lyt, adam_db$adtte)

  tbl
}

#' coxt02 Layout
#'
#' @inheritParams gen_args
#' @param variables (`list`) list of variables in a Cox proportional hazards regression model.
#'
#' @keywords internal
#'
coxt02_lyt <- function(variables,
                       lbl_vars,
                       control) {
  basic_table() %>%
    summarize_coxreg(
      variables = variables,
      control = control,
      multivar = TRUE
    ) %>%
    append_topleft(lbl_vars)
}

#' @describeIn coxt02 Preprocessing
#'
#' @inheritParams gen_args
#'
#' @export
#'
coxt02_pre <- function(adam_db, ...) {
  adam_db$adtte <- adam_db$adtte %>%
    mutate(EVENT = 1 - .data$CNSR)
  adam_db
}

#' @describeIn coxt02 Postprocessing
#'
#' @inheritParams gen_args
#'
#' @export
#'
coxt02_post <- function(tlg, prune_0 = FALSE, ...) {
  if (prune_0) {
    tlg <- smart_prune(tlg)
  }
  std_postprocess(tlg)
}

#' `COXT02` Table 1 (Default) Multi-Variable Cox Regression Model Table 1.
#'
#' The `COXT02` table follows the same principles as the general Cox model analysis
#' and produces the estimates for each of the covariates included in the model
#' (usually the main effects without interaction terms).
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' library(dplyr)
#' library(dunlin)
#'
#' proc_data <- log_filter(syn_data, PARAMCD == "CRSD", "adtte")
#'
#' run(coxt02, proc_data)
#'
#' run(coxt02, proc_data, covariates = c("SEX", "AAGE"), strata = c("RACE"), conf_level = 0.90)
coxt02 <- chevron_t(
  main = coxt02_main,
  preprocess = coxt02_pre,
  postprocess = coxt02_post,
  adam_datasets = c("adsl", "adtte")
)
