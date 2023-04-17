# coxt02_1 ----

#' @describeIn coxt02_1 Main TLG function
#'
#' @inheritParams gen_args
#' @param time (`flag`) time variable in a Cox proportional hazards regression model.
#' @param event (`flag`) event variable in a Cox proportional hazards regression model.
#' @param covariates (`character`) will be fitted and the corresponding effect estimates will be.
#'
#' @details
#'  * The table allows confidence level to be adjusted, default is 2-sided 5%.
#'  * The stratified analysis is with DISCRETE tie handling.
#'  * Model includes treatment plus specified covariate(s) as factor(s), with `"AGE"`, `"RACE"` and `"SEX"` as default.
#'  * The selection of the covariates and whether or not there is a selection process
#'  (vs. a fixed, pre-specified list) needs to be specified in the DAP.
#'  * For pairwise comparisons using the hazard ratio, the value for the control group is the denominator.
#'  * Keep zero-count rows unless overridden with `prune_0 = TRUE`.
#'
#' @note
#'   * `adam_db` object must contain an `adtte` table with columns, `"AVAL"`, `"CNSR"`, and `"PARAMCD"`.
#'
#' @export
#'
coxt02_1_main <- function(adam_db,
                          arm_var = "ARM",
                          lbl_term = "Effect/Covariate Included in the Model",
                          time = "AVAL",
                          event = "event",
                          covariates = c("AGE", "SEX", "RACE"),
                          conf_level = .95,
                          deco = std_deco("COXT02"),
                          ...) {
  dbsel <- get_db_data(adam_db, "adsl", "adtte")
  checkmate::assert_subset(covariates, c("AGE", "SEX", "RACE"))
  checkmate::assert_true(is.numeric(conf_level))
  checkmate::assert_true(conf_level >= 0 && conf_level <= 1)

  multivar_model <- fit_coxreg_multivar(
    variables = list(
      time = time, event = event, arm = arm_var,
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
coxt02_1_pre <- function(adam_db, ...) {
  coxt02_1_check(adam_db)

  new_format <- list(
    adtte = list(
      ARM = rule(
        "No Coding available" = c("", NA, "<Missing>")
      ),
      SEX = rule(
        "No Coding available" = c("", NA, "<Missing>")
      ),
      RACE = rule(
        "No Coding available" = c("", NA, "<Missing>")
      )
    )
  )

  dunlin::reformat(adam_db, new_format, na_last = TRUE)

  adam_db$adtte <- adam_db$adtte %>%
    filter(
      .data$PARAMCD == "CRSD",
      .data$ARM != "No Grading Available",
      .data$SEX != "No Grading Available",
      .data$RACE != "No Grading Available",
      !is.na(.data$CNSR),
      !is.na(.data$AVAL),
      !is.na(.data$AGE)
    ) %>%
    mutate(
      ARM = droplevels(relevel(.data$ARM, "B: Placebo")),
      SEX = factor(.data$SEX,
        levels = setdiff(levels(.data$SEX), "No Grading Available")
      ),
      RACE = factor(.data$RACE,
        levels = setdiff(levels(.data$RACE), "No Grading Available")
      )
    ) %>%
    mutate(event = 1 - .data$CNSR) %>%
    var_relabel(
      ARM = "Planned Arm",
      SEX = "Sex",
      RACE = "Race",
      AGE = "Age"
    )

  adam_db
}

#' @describeIn coxt02_1 Checks
#'
#' @inheritParams gen_args
#'
coxt02_1_check <- function(adam_db,
                           req_tables = c("adsl", "adtte"),
                           arm_var = "ARM") {
  assert_all_tablenames(adam_db, req_tables)

  msg <- NULL

  adex_layout_col <- c("USUBJID", "PARAMCD", "AVAL", "CNSR", "SEX", "RACE", "AGE")
  adsl_layout_col <- c("USUBJID")

  msg <- c(msg, assert_colnames(adam_db$adex, c(arm_var, adex_layout_col)))
  msg <- c(msg, assert_colnames(adam_db$adsl, c(adsl_layout_col)))

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
#' run(coxt02_1, syn_data, conf_level = .90)
coxt02_1 <- chevron_t(
  main = coxt02_1_main,
  preprocess = coxt02_1_pre,
  postprocess = coxt02_1_post,
  adam_datasets = c("adsl", "adtte")
)
