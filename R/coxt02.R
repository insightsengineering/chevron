# coxt02_1 ----

#' @describeIn coxt02_1 Main TLG function
#'
#' @inheritParams gen_args
#' @param arm_var (`string`) the arm variable used for arm splitting.
#' @param time_var (`string`) the time variable in a Cox proportional hazards regression model.
#' @param censor_var (`string`) the censor variable in a Cox proportional hazards regression model.
#' @param covariates (`character`) will be fitted and the corresponding effect will be estimated.
#' @param strata (`character`) will be fitted for the stratified analysis.
#' @param lbl_vars (`string`) text label for the a Cox regression model variables.
#' @param conf_level (`string`) confidence level of the interval when fitting a Cox regression model
#' and estimating hazard ratio to describe the effect size in a survival analysis.
#' @param ties (`string`) specifies the method for tie handling.
#'
#' @details
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
#'   * `adam_db` object must contain an `adtte` table with with `"PARAMCD"`, `"ARM"`,
#'   `"AVAL"`, `"CNSR`, and the columns specified by `"covariates"` which is denoted as
#'   `c("SEX", "RACE", "AAGE")` by default.
#'
#' @export
#'
coxt02_1_main <- function(adam_db,
                          arm_var = "ARM",
                          time_var = "AVAL",
                          censor_var = "CNSR",
                          covariates = c("SEX", "RACE", "AAGE"),
                          strata = NULL,
                          lbl_vars = "Effect/Covariate Included in the Model",
                          conf_level = .95,
                          ties = "exact",
                          deco = std_deco("COXT02"),
                          ...) {
  dbsel <- get_db_data(adam_db, "adsl", "adtte")
  assert_colnames(dbsel$adtte, c(arm_var, time_var, censor_var, covariates, strata))

  assert_single_paramcd(dbsel$adtte$PARAMCD)

  checkmate::assert_character(covariates, null.ok = TRUE, any.missing = FALSE)
  checkmate::assert_character(strata, null.ok = TRUE, any.missing = FALSE)
  checkmate::assert_number(conf_level, null.ok = FALSE, lower = 0, upper = 1)
  checkmate::assert_string(ties, null.ok = TRUE)

  dbsel$adtte <- dbsel$adtte %>%
    mutate(event = 1 - .data[[censor_var]])

  variables <- list(
    time = time_var,
    event = "event",
    arm = arm_var,
    covariates = covariates,
    strata = strata
  )

  lyt <- coxt02_1_lyt(
    variables = variables,
    lbl_vars = lbl_vars,
    conf_level = conf_level,
    ties = ties,
    deco = deco
  )

  tbl <- build_table(lyt, dbsel$adtte)

  tbl
}

#' @describeIn coxt02_1 Layout
#'
#' @inheritParams gen_args
#' @param variables (`list`) list of variables in a Cox proportional hazards regression model.
#'
#' @export
#'
coxt02_1_lyt <- function(variables,
                         lbl_vars,
                         conf_level,
                         ties,
                         deco) {
  basic_table_deco(deco) %>%
    summarize_coxreg(
      variables = variables,
      control = control_coxreg(
        conf_level = conf_level,
        ties = ties,
      ),
      multivar = TRUE
    ) %>%
    append_topleft(lbl_vars)
}

#' @describeIn coxt02_1 Preprocessing
#'
#' @inheritParams gen_args
#'
#' @export
#'
coxt02_1_pre <- function(adam_db, arm_var = "ARM", time_var = "AVAL", censor_var = "CNSR",
                         covariates = c("SEX", "RACE", "AAGE"), strata = NULL, ...) {
  coxt02_1_check(adam_db,
    arm_var = arm_var, time_var = time_var, censor_var = censor_var,
    covariates = covariates, strata = strata
  )

  adam_db
}

#' @describeIn coxt02_1 Checks
#'
#' @inheritParams gen_args
#'
#' @export
#'
coxt02_1_check <- function(adam_db, arm_var, time_var, censor_var, covariates, strata,
                           req_tables = c("adsl", "adtte")) {
  assert_all_tablenames(adam_db, req_tables)

  msg <- NULL

  msg <- c(msg, check_all_colnames(adam_db$adtte, c(
    "USUBJID", "PARAMCD", arm_var, time_var, censor_var,
    covariates, strata
  )))
  msg <- c(msg, check_all_colnames(adam_db$adsl, c("USUBJID")))

  if (is.null(msg)) {
    TRUE
  } else {
    stop(paste(msg, collapse = "\n  "))
  }
}

#' @describeIn coxt02_1 Postprocessing
#'
#' @inheritParams gen_args
#'
#' @export
#'
coxt02_1_post <- function(tlg, prune_0 = FALSE, ...) {
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
#' run(coxt02_1, proc_data)
#'
#' run(coxt02_1, proc_data, covariates = c("SEX", "AAGE"), strata = c("RACE"), conf_level = 0.90)
coxt02_1 <- chevron_t(
  main = coxt02_1_main,
  preprocess = coxt02_1_pre,
  postprocess = coxt02_1_post,
  adam_datasets = c("adsl", "adtte")
)
