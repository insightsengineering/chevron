# ttet01 ----

#' @describeIn ttet01 Main TLG function
#'
#' @inheritParams gen_args
#' @param dataset (`string`) the name of a table in the `adam_db` object.
#' @param ref_group (`string`) The name of the reference group, the value should
#'  be identical to the values in `arm_var`, if not specified, it will by default
#'  use the first level or value of `arm_var`.
#' @param summarize_event (`flag`) should the event description be displayed, default is TRUE
#' @param perform_analysis (`string`) option to display statistical comparisons using stratified analyses,
#'  or unstratified analyses, or both, e.g. `c("unstrat", "strat")`. Only unstratified will be displayed by default
#' @param strata (`string`) stratification factors, e.g. `strata = c("STRATA1", "STRATA2")`, by default as NULL
#' @param ... Further arguments passed to `control_surv_time()`, `control_coxph()`, `control_survtp()`, and
#'  `surv_timepoint()`. For details, see the documentation in `tern`. Commonly used arguments include `pval_method`,
#'  `conf_level`, `conf_type`, `quantiles`, `ties`, `timepoint`, `method`, etc.
#'
#' @details
#' * No overall value.
#'
#' @export
#'
ttet01_main <- function(adam_db,
                        dataset = "adtte",
                        arm_var = "ARM",
                        lbl_overall = NULL,
                        ref_group = NULL,
                        summarize_event = TRUE,
                        perform_analysis = "unstrat",
                        strata = NULL,
                        ...) {
  assert_string(dataset)
  assert_all_tablenames(adam_db, "adsl", dataset)
  assert_string(arm_var)
  assert_string(lbl_overall, null.ok = TRUE)
  assert_string(ref_group, null.ok = TRUE)
  assert_flag(summarize_event)
  assert_subset(perform_analysis, c("unstrat", "strat"))
  assert_character(
    strata,
    null.ok = !"strat" %in% perform_analysis,
    min.len = as.integer(!"strat" %in% perform_analysis)
  )
  anl <- adam_db[[dataset]]
  assert_single_value(anl$PARAMCD, label = sprintf("adam_db$%s$PARAMCD", dataset))
  df_label <- sprintf("adam_db$%s", dataset)
  assert_valid_variable(adam_db[[dataset]], c("IS_EVENT", "IS_NOT_EVENT"), types = list("logical"), label = df_label)
  assert_valid_variable(adam_db[[dataset]], "AVAL", types = list("numeric"), lower = 0, label = df_label)
  assert_valid_variable(
    adam_db[[dataset]], c("USUBJID", arm_var, "EVNT1", "EVNTDESC", "AVALU"),
    types = list(c("character", "factor")), label = df_label
  )
  assert_subset(ref_group, lvls(adam_db[[dataset]][[arm_var]]))
  ref_group <- ref_group %||% lvls(anl[[arm_var]])[1]
  assert_single_value(anl$AVALU, label = sprintf("adam_db$%s$AVALU", dataset))

  timeunit <- unique(anl[["AVALU"]])
  event_lvls <- lvls(anl$EVNT1)

  control_survt <- execute_with_args(control_surv_time, ...)
  control_coxph <- execute_with_args(control_coxph, ...)
  control_survtp <- execute_with_args(control_surv_timepoint, ...)

  lyt <- ttet01_lyt(
    arm_var = arm_var,
    lbl_overall = lbl_overall,
    ref_group = ref_group,
    summarize_event = summarize_event,
    perform_analysis = perform_analysis,
    strata = strata,
    timeunit = timeunit,
    event_lvls = event_lvls,
    control_survt = control_survt,
    control_coxph = control_coxph,
    control_survtp = control_survtp,
    ...
  )

  tbl <- build_table(lyt, anl)

  tbl
}

#' `ttet01` Layout
#'
#' @inheritParams gen_args
#' @param timeunit (`string`) time unit get from `AVALU`, by default is `"Months"`
#'
#' @keywords internal
#'
ttet01_lyt <- function(arm_var,
                       lbl_overall,
                       ref_group,
                       summarize_event,
                       perform_analysis,
                       strata,
                       timeunit,
                       event_lvls,
                       control_survt,
                       control_coxph,
                       control_survtp,
                       ...) {
  lyt01 <- basic_table(show_colcounts = TRUE) %>%
    split_cols_by(
      var = arm_var, ref_group = ref_group
    ) %>%
    add_colcounts() %>%
    ifneeded_add_overall_col(lbl_overall) %>%
    summarize_vars(
      vars = "IS_EVENT",
      .stats = "count_fraction",
      .labels = c(count_fraction = event_lvls[1])
    )

  if (summarize_event) {
    lyt01 <- lyt01 %>%
      split_rows_by(
        "EVNT1",
        split_label = "Earliest contributing event",
        split_fun = keep_split_levels(event_lvls[1]),
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
      .labels = c(count_fraction = event_lvls[2]),
      nested = FALSE,
      show_labels = "hidden"
    ) %>%
    surv_time(
      vars = "AVAL",
      var_labels = paste0("Time to Event (", timeunit, ")"),
      is_event = "IS_EVENT",
      control = control_survt,
      table_names = "time_to_event"
    )

  for (perform in perform_analysis) {
    lyt01 <- lyt01 %>%
      coxph_pairwise(
        vars = "AVAL",
        is_event = "IS_EVENT",
        var_labels = if (perform == "strat") "Stratified Analysis" else "Unstratified Analysis",
        strat = if (perform == "strat") strata else NULL,
        control = control_coxph,
        table_names = if (perform == "strat") "coxph_stratified" else "coxph_unstratified"
      )
  }

  lyt <- lyt01 %>%
    surv_timepoint(
      vars = "AVAL",
      var_labels = timeunit,
      is_event = "IS_EVENT",
      control = control_survtp,
      .labels = c("pt_at_risk" = render_safe("{Patient_label} remaining at risk")),
      ...
    )

  lyt
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
      AVAL = convert_to_month(.data$AVAL, .data$AVALU),
      AVALU = "MONTHS",
      IS_EVENT = .data$CNSR == 0,
      IS_NOT_EVENT = .data$CNSR == 1,
      EVNT1 = factor(
        case_when(
          IS_EVENT == TRUE ~ render_safe("{Patient_label} with event (%)"),
          IS_EVENT == FALSE ~ render_safe("{Patient_label} without event (%)")
        ),
        levels = render_safe(c("{Patient_label} with event (%)", "{Patient_label} without event (%)"))
      ),
      EVNTDESC = factor(.data$EVNTDESC)
    )

  adam_db
}

#' @describeIn ttet01 Postprocessing
#'
#' @inheritParams gen_args
#'
#' @export
#'
ttet01_post <- function(tlg, prune_0 = TRUE, ...) {
  if (prune_0) {
    tlg <- smart_prune(tlg)
  }
  std_postprocess(tlg)
}

#' `TTET01` Binary Outcomes Summary
#'
#' `TTET01` template may be used to summarize any binary outcome or response variable at
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
#'
#' run(ttet01, syn_data2,
#'   summarize_event = FALSE, perform_analysis = c("unstrat", "strat"),
#'   strata = c("STRATA1", "STRATA2"),
#'   conf_type = "log-log",
#'   time_point = c(6, 12),
#'   method = "both"
#' )
ttet01 <- chevron_t(
  main = ttet01_main,
  preprocess = ttet01_pre,
  postprocess = ttet01_post
)
