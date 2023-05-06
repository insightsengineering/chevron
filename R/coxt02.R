# coxt02_1 ----

#' @describeIn coxt02_1 Main TLG function
#'
#' @inheritParams gen_args
#' @param adtte_vars (`character`) event and time variables in a Cox proportional hazards regression model.
#' @param coxreg_vars (`character`) will be fitted and the corresponding effect will be estimated.
#'
#' @details
#'  * The table allows confidence level to be adjusted, default is 2-sided 5%.
#'  * The stratified analysis is with DISCRETE tie handling.
#'  * Model includes treatment plus specified covariate(s) as factor(s), with `"SEX"`, `"RACE"` and `"AGE"` as default.
#'  * The selection of the covariates and whether or not there is a selection process
#'  (vs. a fixed, pre-specified list) needs to be specified in the DAP.
#'  * For pairwise comparisons using the hazard ratio, the value for the control group is the denominator.
#'  * Keep zero-count rows unless overridden with `prune_0 = TRUE`.
#'
#' @note
#'   * `adam_db` object must contain an `adtte` table with columns `"ARM"`, `"AVAL"`, `"CNSR"`, and `"PARAMCD"`.
#'
#' @export
#'
coxt02_1_main <- function(adam_db,
                          anl_vars = c("CNSR", "ARM", "AVAL"),
                          covariates = c("SEX", "RACE", "AGE"),
                          lbl_term = "Effect/Covariate Included in the Model",
                          conf_level = .95,
                          deco = std_deco("COXT02"),
                          ...) {
  dbsel <- get_db_data(adam_db, "adsl", "adtte")
  assert_colnames(dbsel$adtte, c(adtte_vars, coxreg_vars))
  checkmate::assert_character(covariates, null.ok = FALSE)

  checkmate::assert_true(is.numeric(conf_level))
  checkmate::assert_true(conf_level >= 0 && conf_level <= 1)

  dbsel$adtte <- dbsel$adtte %>%
    mutate(EVENT = 1 - .data$CNSR)

  multivar_model <- fit_coxreg_multivar(
    variables = list(
      time = anl_vars[3], event = EVENT, arm = anl_vars[2],
      covariates = covariates
    ),
    data = dbsel$adtte
  )

  df <- tidy(multivar_model)
  assert_colnames(df, c("term"))

  lyt <- coxt02_1_lyt(
    lbl_term = lbl_term,
    conf_level = conf_level,
    deco = deco
  )

  tbl <- build_table(lyt, df)

  tbl
}

#' @describeIn coxt02_1 Layout
#'
#' @inheritParams gen_args
#'
#' @param lbl_term (`string`) text label for the `term` variable.
#' @param conf_level (`string`) confidence level of the interval when fitting a Cox regression model
#' and estimating hazard ratio to describe the effect size in a survival analysis.
#'
#' @export
#'
coxt02_1_lyt <- function(lbl_term,
                         conf_level,
                         deco) {
  basic_table_deco(deco) %>%
    split_rows_by("term",
      child_labels = "hidden",
      split_fun = drop_split_levels,
      label_pos = "topleft",
      split_label = obj_label(lbl_term)
    ) %>%
    summarize_coxreg(multivar = TRUE, conf_level = conf_level)
}

#' @describeIn coxt02_1 Preprocessing
#'
#' @inheritParams gen_args
#'
#' @export
#'
coxt02_1_pre <- function(adam_db, anl_vars = c("CNSR", "ARM", "AVAL"),
                         covariates = c("SEX", "RACE", "AGE"), ...) {
  coxt02_1_check(adam_db, anl_vars = anl_vars, covariates = covariates)
  adam_db <- dunlin::log_filter(adam_db, PARAMCD == "CRSD", "adtte")
  lapply(setdiff(covariates, "AGE"), function(x) {
    adam_db$adtte[[x]] <- droplevels(adam_db$adtte[[x]])
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
                           anl_vars,
                           covariates,
                           req_tables = c("adsl", "adtte")) {
  assert_all_tablenames(adam_db, req_tables)

  msg <- NULL

  msg <- c(msg, check_all_colnames(adam_db$adtte, c("USUBJID", "PARAMCD", anl_vars, covariates)))
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
#' run(coxt02_1, syn_data)
#'
#' run(coxt02_1, syn_data, covariates = c("SEX", "RACE"), conf_level = .90)
coxt02_1 <- chevron_t(
  main = coxt02_1_main,
  preprocess = coxt02_1_pre,
  postprocess = coxt02_1_post,
  adam_datasets = c("adsl", "adtte")
)
