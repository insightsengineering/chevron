# coxt02_1 ----

#' @describeIn coxt02_1 Main TLG function
#'
#' @inheritParams gen_args
#' @param arm_var (`string`) the arm variables used for arm splitting.
#' @param anl_vars (`character`) variables in a Cox proportional hazards regression model.
#' @param covariates (`character`) will be fitted and the corresponding effect will be estimated.
#' @param with_strata (`character`) will be fitted for the stratified analysis.
#' @param lbl_vars (`string`) text label for the a Cox regression model variables.
#' @param conf_level (`string`) confidence level of the interval when fitting a Cox regression model
#' and estimating hazard ratio to describe the effect size in a survival analysis.
#'
#' @details
#'  * The table allows confidence level to be adjusted, default is 2-sided 5%.
#'  * The stratified analysis is with DISCRETE tie handling (equivalent to `tern::control_coxreg(ties = "exact")` in R).
#'  * Model includes treatment plus specified covariate(s) as factor(s) or numeric(s),
#'  with `"SEX"`, `"RACE"` and `"AGE"` as default candidates.
#'  * The selection of the covariates and whether or not there is a selection process
#'  (vs. a fixed, pre-specified list) needs to be specified in the DAP.
#'  * For pairwise comparisons using the hazard ratio, the value for the control group is the denominator.
#'  * Keep zero-count rows unless overridden with `prune_0 = TRUE`.
#'
#' @note
#'   * `adam_db` object must contain an `adtte` table with with `"PARAMCD"`, `"ARM"`, and the columns specified by
#'   `"anl_vars"` which is denoted as `c("CNSR", "AVAL")` by default.
#'
#' @export
#'
coxt02_1_main <- function(adam_db,
                          arm_var = "ARM",
                          anl_vars = c("CNSR", "AVAL"),
                          covariates = NULL,
                          with_strata = NULL,
                          lbl_vars = "Effect/Covariate Included in the Model",
                          conf_level = .95,
                          deco = std_deco("COXT02"),
                          ...) {
  dbsel <- get_db_data(adam_db, "adsl", "adtte")
  assert_colnames(dbsel$adtte, c(arm_var, anl_vars, covariates, with_strata))

  checkmate::assert_character(covariates, null.ok = TRUE, any.missing = FALSE)
  checkmate::assert_character(with_strata, null.ok = TRUE, any.missing = FALSE)
  checkmate::assert_number(conf_level, null.ok = FALSE, lower = 0, upper = 1)

  dbsel$adtte <- dbsel$adtte %>%
    mutate(EVENT = 1 - .data$CNSR)

  variables <- list(
    time = anl_vars[2],
    event = "EVENT",
    arm = arm_var
  )
  if (!is.null(covariates)) variables <- c(variables, list(covariates = covariates))
  if (!is.null(with_strata)) variables <- c(variables, list(with_strata = with_strata))

  lyt <- coxt02_1_lyt(
    variables = variables,
    lbl_vars = lbl_vars,
    conf_level = conf_level,
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
                         deco) {
  basic_table_deco(deco) %>%
    summarize_coxreg(
      variables = variables,
      control = control_coxreg(
        conf_level = conf_level,
        ties = "exact"
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
coxt02_1_pre <- function(adam_db, arm_var = "ARM", anl_vars = c("CNSR", "AVAL"),
                         covariates = NULL, with_strata = NULL, ...) {
  coxt02_1_check(adam_db,
    arm_var = arm_var, anl_vars = anl_vars,
    covariates = covariates, with_strata = with_strata
  )

  assert_single_paramcd(adam_db$PARAMCD)

  lapply(covariates, function(x) {
    if (is.factor(adam_db$adtte[[x]])) adam_db$adtte[[x]] <- droplevels(adam_db$adtte[[x]])
  })

  adam_db
}

#' @describeIn coxt02_1 Checks
#'
#' @inheritParams gen_args
#'
#' @export
#'
coxt02_1_check <- function(adam_db,
                           arm_var,
                           anl_vars,
                           covariates,
                           with_strata,
                           req_tables = c("adsl", "adtte")) {
  assert_all_tablenames(adam_db, req_tables)

  msg <- NULL

  msg <- c(msg, check_all_colnames(adam_db$adtte, c("USUBJID", "PARAMCD", arm_var, anl_vars, covariates, with_strata)))
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
#' run(coxt02_1, proc_data, covariates = c("SEX", "AGE"), with_strata = c("RACE"), conf_level = 0.90)
coxt02_1 <- chevron_t(
  main = coxt02_1_main,
  preprocess = coxt02_1_pre,
  postprocess = coxt02_1_post,
  adam_datasets = c("adsl", "adtte")
)
