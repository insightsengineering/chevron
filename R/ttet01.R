# ttet01 ----

#' @describeIn ttet01 Main TLG function
#'
#' @inheritParams gen_args
#' @param dataset (`string`) the name of a table in the `adam_db` object.
#' @param ref_group (`string`) The name of the reference group, the value should
#'  be identical to the values in `arm_var`, if not speficied, it will by default
#'  use the first level or value of `arm_var`.
#' @param odds_ratio (`flag`) should the odds ratio be calculated, default is TRUE
#' @param perform_analysis (`string`) option to display statistical comparisons using stratified analyses,
#'  or unstratified analyses, or both, e.g. c("unstrat", "strat"). Only unstratified will be displayed by default
#' @param strat (`string`) stratification factors, e.g. strat = c("STRATA1", "STRATA2"), by default as NULL
#' @param conf_level (`numeric`) the level of confidence interval, default is 0.95.
#' @param methods (`list`) a named list, use a named list to control, for example:
#' methods = list(prop_conf_method = "wald",
#'                diff_conf_method = "wald",
#'                strat_diff_conf_method = "ha",
#'                diff_pval_method = "fisher",
#'                strat_diff_pval_method = "schouten")
#' `prop_conf_method` controls the methods of calculating proportion confidence interval,
#' `diff_conf_method` controls the methods of calculating unstratified difference confidence interval,
#' `strat_diff_conf_method` controls the methods of calculating stratified difference confidence interval,
#' `diff_pval_method` controls the methods of calculating unstratified p-value for odds ratio,
#' `strat_diff_pval_method` controls the methods of calculating stratified p-value for odds ratio,
#' see more details in `tern`
#'
#' @details
#' * No overall value.
#'
#'
#' @export
#'
#'
ttet01_main <- function(adam_db,
                        dataset = "adtte",
                        arm_var = "ARM",
                        ref_group = NULL,
                        summarize_event = TRUE,
                        perform_analysis = c("unstrat"),
                        strata = NULL,
                        pval_method = "log-rank",
                        conf_level = 0.95,
                        conf_type = "log-log",
                        quantiles = c(0.25, 0.75),
                        ties = "efron",
                        timepoint = c(6, 12),
                        method = "both",
                        ...) {
  anl <- adam_db[[dataset]]
  assert_colnames(anl, c(arm_var, strata, "AVAL", "AVALU", "PARAMCD", "is_event", "is_not_event", "EVNT1", "EVNTDESC"))
  assert_single_paramcd(anl$PARAMCD)
  checkmate::assert_string(ref_group, null.ok = TRUE)
  checkmate::assert_flag(summarize_event)
  checkmate::assert_subset(perform_analysis, c("unstrat", "strat"))
  checkmate::assert_character(strata, null.ok = !"stata" %in% perform_analysis)

  arm_level <- lvls(anl[[arm_var]])
  ref_group <- ifelse(is.null(ref_group), as.character(arm_level[1]), ref_group)

  timeunit <- unique(anl[["AVALU"]])

  lyt2 <- ttet01_lyt(
    arm_var = arm_var,
    ref_group = ref_group,
    summarize_event = F,
    perform_analysis = perform_analysis,
    strata = strata,
    pval_method = pval_method,
    conf_level = conf_level,
    conf_type = conf_type,
    quantiles = quantiles,
    ties = ties,
    timeunit = timeunit,
    timepoint = timepoint,
    method = method
  )

  tbl <- build_table(lyt, anl)

  tbl
}

#' @describeIn ttet01 Layout
#'
#' @inheritParams gen_args
#'
#'
#' @export
#'
ttet01_lyt <- function(arm_var,
                       ref_group,
                       summarize_event,
                       perform_analysis,
                       strata,
                       pval_method,
                       conf_level,
                       conf_type,
                       quantiles,
                       ties,
                       timeunit,
                       timepoint,
                       method) {
  lyt01 <- basic_table(show_colcounts = TRUE) %>%
    split_cols_by(
      var = arm_var, ref_group = ref_group
    ) %>%
    summarize_vars(
      vars = "is_event",
      .stats = "count_fraction",
      .labels = c(count_fraction = "Patients with event (%)")
    )

  if (summarize_event) {
    lyt01 <- lyt01 %>%
      split_rows_by(
        "EVNT1",
        split_label = "Earliest contributing event",
        split_fun = keep_split_levels("Patients with event (%)"),
        label_pos = "visible",
        child_labels = "hidden",
        indent_mod = 1L,
      ) %>%
      summarize_vars("EVNTDESC", split_fun = drop_split_levels)
  }

  lyt01 <- lyt01 %>%
    summarize_vars(
      vars = "is_not_event",
      .stats = "count_fraction",
      .labels = c(count_fraction = "Patients without event (%)"),
      nested = FALSE,
      show_labels = "hidden"
    ) %>%
    surv_time(
      vars = "AVAL",
      var_labels = "Time to Event (Months)",
      is_event = "is_event",
      control = control_surv_time(
        conf_level = conf_level,
        conf_type = conf_type,
        quantiles = quantiles
      ),
      table_names = "time_to_event"
    )

  for (perform in perform_analysis) {
    lyt01 <- lyt01 %>%
      coxph_pairwise(
        vars = "AVAL",
        is_event = "is_event",
        var_labels = if (perform == "strat") "Stratified Analysis" else "Unstratified Analysis",
        strat = if (perform == "strat") strata else NULL,
        control = control_coxph(
          pval_method = pval_method,
          conf_level = conf_level,
          ties = ties
        ),
        table_names = if (perform == "strat") "coxph_stratified" else "coxph_unstratified"
      )
  }

  lyt <- lyt01 %>%
    surv_timepoint(
      vars = "AVAL",
      var_labels = timeunit,
      time_point = timepoint,
      is_event = "is_event",
      method = method,
      control = control_surv_timepoint(
        conf_level = conf_level,
        conf_type = conf_type
      )
    )

  return(lyt)
}

#' @describeIn ttet01 Preprocessing
#'
#' @inheritParams gen_args
#' @param dataset (`string`) the name of a table in the `adam_db` object.
#' @param responder (`string`) responder defined in the table, by default use c("CR", "PR").
#'
#' @export
#'
#' @examples
#' ttet01_pre(syn_data)
ttet01_pre <- function(adam_db, arm_var = "ARM", dataset = "adtte",
                       ...) {
  assert_all_tablenames(adam_db, c("adsl", dataset))
  assert_colnames(adam_db[[dataset]], c(arm_var, "CNSR", "EVNTDESC"))

  adam_db[[dataset]] <- adam_db[[dataset]] %>%
    mutate(
      AVAL = day2month(AVAL),
      AVALU = "MONTHS",
      is_event = CNSR == 0,
      is_not_event = CNSR == 1,
      EVNT1 = factor(
        case_when(
          is_event == TRUE ~ "Patients with event (%)",
          is_event == FALSE ~ "Patients without event (%)"
        ),
        levels = c("Patients with event (%)", "Patients without event (%)")
      ),
      EVNTDESC = factor(EVNTDESC)
    )

  adam_db
}

#' @describeIn ttet01 Postprocessing
#'
#' @inheritParams gen_args
#'
#'
#' @export
ttet01_post <- function(tlg, ...) {
  std_postprocess(tlg)
}

#' `TTET01` Binary Outcomes Summary
#'
#' TTET01 template may be used to summarize any binary outcome or response variable at
#' a single time point. Typical application for oncology
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' library(dplyr)
#' library(dunlin)
#'
#' syn_data2 <- log_filter(syn_data, PARAMCD == "PFS", "adtte")
#' run(ttet01, syn_data2)
#' run(ttet01, syn_data2,
#'   summarize_event = FALSE, perform_analysis = c("unstrat", "strat"),
#'   strata = c("STRATA1", "STRATA2")
#' )
ttet01 <- chevron_t(
  main = ttet01_main,
  preprocess = ttet01_pre,
  postprocess = ttet01_post,
  adam_datasets = c("adsl")
)
