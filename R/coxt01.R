# coxt01 ----

#' @describeIn coxt01 Main TLG function
#'
#' @inheritParams gen_args
#' @param arm_var (`string`) the arm variable used for arm splitting.
#' @param time_var (`string`) the time variable in a Cox proportional hazards regression model.
#' @param event_var (`string`) the event variable in a Cox proportional hazards regression model.
#' @param covariates (`character`) will be fitted and the corresponding effect will be estimated.
#' @param strata (`character`) will be fitted for the stratified analysis.
#' @param lbl_vars (`string`) text label for the a Cox regression model variables.
#' @param multivar (`flag`) indicator of whether multivariate cox regression is conducted.
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
#'  (vs. a fixed, pre-specified list) needs to be pre-specified.
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
coxt01_main <- function(adam_db,
                        arm_var = "ARM",
                        time_var = "AVAL",
                        event_var = "EVENT",
                        covariates = c("SEX", "RACE", "AAGE"),
                        strata = NULL,
                        lbl_vars = "Effect/Covariate Included in the Model",
                        multivar = FALSE,
                        ...) {
  assert_all_tablenames(adam_db, "adtte")
  checkmate::assert_string(arm_var)
  checkmate::assert_string(time_var)
  checkmate::assert_string(event_var)
  checkmate::assert_character(covariates, null.ok = TRUE)
  checkmate::assert_character(strata, null.ok = TRUE)
  checkmate::assert_flag(multivar)
  assert_valid_variable(adam_db$adtte, arm_var, types = list("factor"), n.levels = if (!multivar) 2L)
  assert_valid_variable(adam_db$adtte, c("USUBJID", arm_var, "PARAMCD"), types = list(c("character", "factor")))
  assert_valid_variable(adam_db$adtte, strata, types = list(c("factor", "integer", "character")), na_ok = TRUE)
  assert_valid_variable(adam_db$adtte, covariates, na_ok = TRUE)
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

  lyt <- coxt01_lyt(
    variables = variables,
    col_split = if (!multivar) "COL_LABEL",
    lbl_vars = lbl_vars,
    multivar = multivar,
    control = control,
    ...
  )
  col_split <- "Treatment Effect Adjusted for Covariate"
  adam_db$adtte$COL_LABEL <- factor(rep(col_split, nrow(adam_db$adtte)), levels = col_split)
  tbl <- build_table(lyt, adam_db$adtte)

  tbl
}

#' `COXT01` Layout
#'
#' @inheritParams gen_args
#' @param variables (`list`) list of variables in a Cox proportional hazards regression model.
#'
#' @keywords internal
#'
coxt01_lyt <- function(variables,
                       col_split,
                       lbl_vars,
                       control,
                       multivar,
                       ...) {
  lyt <- basic_table() %>%
    ifneeded_split_col(col_split)
  lyt <- execute_with_args(
    summarize_coxreg,
    lyt = lyt, variables = variables, control = control, multivar = multivar, ...
  )
  lyt %>%
    append_topleft(lbl_vars)
}

#' @describeIn coxt01 Preprocessing
#'
#' @inheritParams gen_args
#'
#' @export
#'
coxt01_pre <- function(adam_db, ...) {
  adam_db$adtte <- adam_db$adtte %>%
    mutate(EVENT = 1 - .data$CNSR)

  adam_db
}

#' @describeIn coxt01 Postprocessing
#'
#' @inheritParams gen_args
#'
#' @export
#'
coxt01_post <- function(tlg, prune_0 = FALSE, ...) {
  if (prune_0) {
    tlg <- smart_prune(tlg)
  }
  std_postprocess(tlg)
}

#' `COXT01` (Default) Cox Regression Model Table.
#'
#' Cox models are the most commonly used methods to estimate the magnitude of the effect in survival analyses.
#' It assumes proportional hazards; that is, it assumes that the ratio of the hazards
#' of the two groups (e.g. two arms) is constant over time.
#' This ratio is referred to as the "hazard ratio" and is one of the most commonly reported metrics
#' to describe the effect size in survival analysis.
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' library(dunlin)
#'
#' proc_data <- log_filter(syn_data, PARAMCD == "CRSD", "adtte")
#' proc_data <- log_filter(proc_data, ARMCD != "ARM C", "adsl")
#' proc_data$adtte$ARM <- droplevels(proc_data$adtte$ARM)
#' run(coxt01, proc_data)
#'
#' run(coxt01, proc_data, covariates = c("SEX", "AAGE"), strata = c("RACE"), conf_level = 0.90)
coxt01 <- chevron_t(
  main = coxt01_main,
  preprocess = coxt01_pre,
  postprocess = coxt01_post
)
