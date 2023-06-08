# ttet01 ----

#' @describeIn ttet01 Main TLG function
#'
#' @inheritParams gen_args
#' @param dataset (`string`) the name of a table in the `adam_db` object.
#' @param ref_group (`string`) The name of the reference group, the value should
#'  be identical to the values in `arm_var`, if not speficied, it will by default
#'  use the first level or value of `arm_var`.
#' @param summarize_event (`flag`) should the event discription be displayed, default is TRUE
#' @param perform_analysis (`string`) option to display statistical comparisons using stratified analyses,
#'  or unstratified analyses, or both, e.g. c("unstrat", "strat"). Only unstratified will be displayed by default
#' @param strata (`string`) stratification factors, e.g. strata = c("STRATA1", "STRATA2"), by default as NULL
#' @param pval_method (`string`) p-value method for testing hazard ratio = 1.
#' Default method is "log-rank", can also be set to "wald" or "likelihood".
#' @param conf_level (`numeric`) the level of confidence interval, default is 0.95.
#' @param conf_type (`string`) confidence interval type. Options are "plain" (default), "log", "log-log",
#'  see more in survival::survfit(). Note option "none" is no longer supported.
#' @param quantiles (`numeric`) of length two to specify the quantiles of survival time.
#' @param ties (`string`) specifying the method for tie handling. Default is "efron",
#'  can also be set to "breslow" or "exact". see more in survival::coxph()
#' @param timepoint (`numeric`) survival time point of interest.
#' @param method (`string`) either "surv" (survival estimations),
#'  "surv_diff" (difference in survival with the control) or "both".
#'
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
                        perform_analysis = "unstrat",
                        strata = NULL,
                        pval_method = "log-rank",
                        conf_level = 0.95,
                        conf_type = "log-log",
                        quantiles = c(0.25, 0.75),
                        ties = "efron",
                        timepoint = c(6, 12),
                        method = "both",
                        ...) {
  checkmate::assert_string(dataset)
  assert_all_tablenames(adam_db, "adsl", dataset)
  anl <- adam_db[[dataset]]
  assert_single_value(anl$PARAMCD, label = sprintf("adam_db$%s$PARAMCD", dataset))
  checkmate::assert_string(ref_group, null.ok = TRUE)
  df_label <- sprintf("adam_db$%s", dataset)
  assert_valid_variable(adam_db[[dataset]], "AVALU", types = list("character"), label = df_label)
  assert_valid_variable(adam_db[[dataset]], c("IS_EVENT", "IS_NOT_EVENT"), types = list("logical"), label = df_label)
  assert_valid_variable(adam_db[[dataset]], "AVAL", types = list("numeric"), lower = 0, label = df_label)
  assert_valid_variable(
    adam_db[[dataset]], c("USUBJID", arm_var, "EVNT1", "EVNTDESC"),
    types = list(c("character", "factor")), label = df_label
  )
  checkmate::assert_flag(summarize_event)
  checkmate::assert_subset(perform_analysis, c("unstrat", "strat"))
  checkmate::assert_character(
    strata,
    null.ok = !"strat" %in% perform_analysis,
    min.len = as.integer(!"strat" %in% perform_analysis)
  )

  checkmate::assert_subset(ref_group, lvls(adam_db[[dataset]][[arm_var]]))
  ref_group <- ref_group %||% lvls(anl[[arm_var]])[1]

  assert_single_value(anl$AVALU, label = sprintf("adam_db$%s$AVALU", dataset))
  timeunit <- unique(anl[["AVALU"]])

  lyt <- ttet01_lyt(
    arm_var = arm_var,
    ref_group = ref_group,
    summarize_event = summarize_event,
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

#' `ttet01` Layout
#'
#' @inheritParams gen_args
#' @param timeunit (string) time unit get from AVALU, by default is "Months"
#'
#' @keywords internal
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
      vars = "IS_EVENT",
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
      summarize_vars("EVNTDESC", split_fun = drop_split_levels, .stats = "count_fraction")
  }

  lyt01 <- lyt01 %>%
    summarize_vars(
      vars = "IS_NOT_EVENT",
      .stats = "count_fraction",
      .labels = c(count_fraction = "Patients without event (%)"),
      nested = FALSE,
      show_labels = "hidden"
    ) %>%
    surv_time(
      vars = "AVAL",
      var_labels = paste0("Time to Event (", timeunit, ")"),
      is_event = "IS_EVENT",
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
        is_event = "IS_EVENT",
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
      is_event = "IS_EVENT",
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
#'
#' @export
#'
ttet01_pre <- function(adam_db, dataset = "adtte",
                       ...) {
  adam_db[[dataset]] <- adam_db[[dataset]] %>%
    mutate(
      AVAL = day2month(.data$AVAL),
      AVALU = "MONTHS",
      IS_EVENT = .data$CNSR == 0,
      IS_NOT_EVENT = .data$CNSR == 1,
      EVNT1 = factor(
        case_when(
          IS_EVENT == TRUE ~ "Patients with event (%)",
          IS_EVENT == FALSE ~ "Patients without event (%)"
        ),
        levels = c("Patients with event (%)", "Patients without event (%)")
      ),
      EVNTDESC = factor(.data$EVNTDESC)
    )

  adam_db
}

#' @describeIn ttet01 Postprocessing
#'
#' @inheritParams gen_args
#'
#'
#' @export
ttet01_post <- function(tlg, prune_0 = TRUE, ...) {
  if (prune_0) {
    tlg <- smart_prune(tlg)
  }
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
