# rspt01_1 ----

#' @describeIn rspt01_1 Main TLG function
#'
#' @inheritParams gen_args
#' @param dataset (`string`) the name of a table in the `adam_db` object.
#' @param ref_group (`string`) The name of the reference group, the value should
#'  be identical to the values in `arm_var`, if not speficied, it will by default
#'  use the first level or value of `arm_var`.
#' @param odds_ratio (`flag`) should the odds ratio be calculated, default is TRUE
#' @param strat_analysis (`flag`) should the stratified analysis be performed,
#' default is FALSE
#' @param conf_level (`numeric`) the level of confidence interval, default is 0.95.
#'
#' @details
#' * No overall value.
#'
#'
#' @export
#'
#'
#'
rspt01_1_main <- function(adam_db,
                          dataset = "adrs",
                          arm_var = "ARM",
                          ref_group = NULL,
                          odds_ratio = TRUE,
                          strat_analysis = FALSE,
                          strata = NULL,
                          conf_level = 0.95,
                          methods = list(),
                          deco = std_deco("RSPT01"),
                          ...) {
  anl <- adam_db[[dataset]]
  assert_colnames(anl, c(arm_var, strata, "PARAMCD", "is_rsp", "rsp_lab"))
  assert_only_one_paramcd(anl$PARAMCD)
  checkmate::assert_string(ref_group, null.ok = TRUE)
  checkmate::assert_flag(odds_ratio)
  checkmate::assert_flag(strat_analysis)

  arm_level <- unique(anl[[arm_var]])
  ref_group <- ifelse(is.null(ref_group), as.character(arm_level[1]), ref_group)

  lyt <- rspt01_1_lyt(
    arm_var = arm_var,
    ref_group = ref_group,
    odds_ratio = odds_ratio,
    strat_analysis = strat_analysis,
    strata = strata,
    conf_level = conf_level,
    methods = methods,
    deco = deco
  )

  tbl <- build_table(lyt, anl)

  tbl
}

#' @describeIn rspt01_1 Layout
#' @param
#'
#' @inheritParams gen_args
#'
#'
#' @export
#'
rspt01_1_lyt <- function(arm_var,
                         ref_group,
                         odds_ratio,
                         strat_analysis,
                         strata,
                         conf_level,
                         methods,
                         deco) {

  lyt <- basic_table(show_colcounts = TRUE) %>%
    split_cols_by(var = arm_var, ref_group = ref_group) %>%
    estimate_proportion(
      vars = "is_rsp",
      conf_level = conf_level,
      method = methods[["prop_conf_method"]] %||% "waldcc",
      table_names = "est_prop"
    ) %>%
    proportion_lyt(arm_var = arm_var,
                   odds_ratio = odds_ratio,
                   strat_analysis = strat_analysis,
                   strata = strata,
                   conf_level = conf_level,
                   methods = methods) %>%
    estimate_multinomial_response(
      var = "rsp_lab",
      conf_level = conf_level,
      method = methods[["prop_conf_method"]] %||% "waldcc"
    )

  return(lyt)
}

#' @describeIn rspt01_1 Preprocessing
#'
#' @inheritParams gen_args
#' @param dataset (`string`) the name of a table in the `adam_db` object.
#' @param responder (`string`) responder defined in the table, by default use c("CR", "PR").
#'
#' @export
#'
#' @examples
#' rspt01_1_pre(syn_data)
rspt01_1_pre <- function(adam_db, arm_var = "ARM", dataset = "adrs", responder = c("CR", "PR"),
                         ...) {
  assert_all_tablenames(adam_db, c("adsl", dataset))
  assert_colnames(adam_db[[dataset]], c(arm_var, "AVALC"))

  adam_db[[dataset]] <- adam_db[[dataset]] %>%
    mutate(rsp_lab = d_onco_rsp_label(AVALC)) %>%
    mutate(is_rsp = AVALC %in% responder)

  adam_db
}

#' @describeIn rspt01_1 Postprocessing
#'
#' @inheritParams gen_args
#'
#'
#' @export
rspt01_1_post <- function(tlg, prune_0 = TRUE, ...) {
  if (prune_0) {
    tlg <- smart_prune(tlg)
  }
  std_postprocess(tlg)
}

#' `RSPT01` Table 1 (Default) Demographics and Baseline Characteristics Table 1.
#'
#' For each variable, summary statistics are
#' by default based on the number of patients in the corresponding `n` row.
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' library(dplyr)
#' library(dunlin)
#'
#' syn_data2 <- log_filter(syn_data, PARAMCD == "BESRSPI", "adrs")
#' run(rspt01_1, syn_data2)
#' run(rspt01_1, syn_data2, odds_ratio = FALSE, strat_analysis = TRUE, strata = c("STRATA1", "STRATA2"))
rspt01_1 <- chevron_t(
  main = rspt01_1_main,
  preprocess = rspt01_1_pre,
  postprocess = rspt01_1_post,
  adam_datasets = c("adsl")
)

#' @describeIn rspt01_1 get proportion layout
#'
#' @inheritParams gen_args
#' @param odds_ratio (`flag`) should the odds ratio be calculated, default is TRUE
#' @param strat_analysis (`flag`) should the stratified analysis be performed,
#'
#' @export
proportion_lyt <- function(lyt, arm_var, methods, strata, conf_level, odds_ratio = TRUE, strat_analysis = FALSE) {
  lyt <- lyt %>%
    estimate_proportion_diff(
      vars = "is_rsp",
      show_labels = "visible",
      var_labels = if (!strat_analysis) "Unstratified Analysis" else "Stratified Analysis",
      conf_level = conf_level,
      method = if (!strat_analysis) methods[["diff_conf_method"]] %||% "waldcc" else methods[["strat_diff_conf_method"]] %||% "cmh",
      variables = list(strata = strata),
      table_names = if (!strat_analysis) "est_prop_diff" else "est_prop_diff_strat"
    ) %>%
    test_proportion_diff(
      vars = "is_rsp",
      method = if (!strat_analysis) methods[["diff_pval_method"]] %||% "chisq" else methods[["strat_diff_pval_method"]] %||% "cmh",
      variables = list(strata = strata),
      table_names = if (!strat_analysis) "test_prop_diff" else "test_prop_diff_strat"
    )

  if (odds_ratio) {
    lyt <- lyt %>%
      estimate_odds_ratio(
        vars = "is_rsp",
        variables = if (!strat_analysis) list(strata = NULL, arm = NULL) else list(strata = strata, arm = arm_var),
        table_names = if (!strat_analysis) "est_or" else "est_or_strat"
      )
  }

  lyt
}
