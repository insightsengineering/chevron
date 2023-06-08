# egt03 ----
#' @describeIn egt03 Main TLG function
#'
#' @param arm_var (`character`) the arm variables used for row split, typically `"ACTARMCD"`.
#' @param summaryvar (`character`) variables to be analyzed, typically `"BNRIND"`. Labels of the corresponding columns
#'   are used as subtitles.
#' @param splitvar (`character`) variables to be analyzed, typically `"ANRIND"`. Labels of the corresponding columns are
#'   used as subtitles.
#'
#' @details
#'  * ADEG data are subsetted to contain only "POST-BASELINE MINIMUM" visit
#'  * the number of patients by baseline assessment and minimum post-baseline assessment.
#'  * Percentages are based on the total number of patients in a treatment group.
#'  * Split columns by Analysis Reference Range Indicator, typically `ANRIND`.
#'  * Does not include a total column by default.
#'  * Sorted  based on factor level.
#'
#' @note
#'  * `adam_db` object must contain an `adeg` table with a `"ACTARMCD"` column as well as columns specified in
#'  `summaryvar` and `splitvar`.
#'
#' @export
#'
egt03_main <- function(adam_db,
                       arm_var = "ACTARMCD",
                       summaryvar = "BNRIND",
                       splitvar = "ANRIND",
                       visit_var = "AVISIT",
                       ...) {
  assert_all_tablenames(adam_db, c("adsl", "adeg"))
  checkmate::assert_string(summaryvar)
  assert_valid_variable(adam_db$adeg, summaryvar, types = list("character", "factor"))
  checkmate::assert_string(splitvar)
  assert_valid_variable(adam_db$adeg, c("PARAMCD", splitvar), types = list("character", "factor"))
  assert_single_value(adam_db$adeg[[visit_var]])
  assert_valid_var_pair(adam_db$adsl, adam_db$adeg, arm_var)
  assert_valid_variable(adam_db$adeg, "USUBJID", empty_ok = TRUE, types = list(c("character", "factor")))
  assert_valid_variable(adam_db$adsl, c("USUBJID", arm_var), types = list(c("character", "factor")))
  assert_single_value(adam_db$adeg$PARAMCD)
  lbl_armvar <- var_labels_for(adam_db$adeg, arm_var)
  lbl_summaryvars <- var_labels_for(adam_db$adeg, summaryvar)
  lbl_splitvar <- var_labels_for(adam_db$adeg, splitvar)

  lyt <- egt03_lyt(
    arm_var = arm_var,
    splitvar = splitvar,
    summaryvar = summaryvar,
    lbl_armvar = lbl_armvar,
    lbl_summaryvars = lbl_summaryvars
  )
  adam_db$adeg$SPLIT_LABEL <- factor(rep(lbl_splitvar, nrow(adam_db$adeg)), levels = lbl_splitvar)
  tbl <- build_table(
    lyt,
    df = adam_db$adeg
  )

  return(tbl)
}


#' `egt03` Layout
#'
#' @inheritParams gen_args
#' @inheritParams egt03_main
#'
#' @param lbl_armvar (`string`) label of the `arm_var` variable.
#' @param lbl_summaryvars (`string`) label of the `summaryvar` variable.
#'
#' @keywords internal
egt03_lyt <- function(arm_var,
                      splitvar,
                      summaryvar,
                      lbl_armvar,
                      lbl_summaryvars) {
  indent <- 1L
  space <- paste(rep(" ", indent * 2), collapse = "")
  lbl_summaryvars <- paste0(space, lbl_summaryvars)

  basic_table(show_colcounts = FALSE) %>%
    split_cols_by("SPLIT_LABEL") %>%
    split_cols_by(splitvar) %>%
    split_rows_by(arm_var,
      split_fun = drop_split_levels,
      label_pos = "topleft",
      split_label = lbl_armvar
    ) %>%
    add_rowcounts() %>%
    summarize_vars(summaryvar, denom = "N_row", .stats = "count_fraction") %>%
    append_topleft(lbl_summaryvars)
}

#' @describeIn egt03 Preprocessing
#'
#' @inheritParams gen_args
#' @inheritParams egt03_main
#'
#' @export
egt03_pre <- function(adam_db, ...) {
  adam_db$adeg <- adam_db$adeg %>%
    filter(
      .data$AVISIT == "POST-BASELINE MINIMUM"
    ) %>%
    mutate(BNRIND = factor(
      .data$BNRIND,
      levels = c("LOW", "NORMAL", "HIGH", "Missing"),
      labels = c("LOW", "NORMAL", "HIGH", "Missing")
    )) %>%
    mutate(ANRIND = factor(
      .data$ANRIND,
      levels = c("LOW", "NORMAL", "HIGH", "Missing"),
      labels = c("LOW", "NORMAL", "HIGH", "Missing")
    )) %>%
    mutate(
      BNRIND = with_label(.data$BNRIND, "Baseline Reference Range Indicator"),
      ANRIND = with_label(.data$ANRIND, "Minimum Post-Baseline Assessment")
    )

  adam_db
}

#' @describeIn egt03 Postprocessing
#'
#' @inheritParams gen_args
#'
#' @export
egt03_post <- function(tlg, prune_0 = FALSE, ...) {
  if (prune_0) tlg <- smart_prune(tlg)

  std_postprocess(tlg)
}

#' `EGT03` Shift Table of ECG Interval Data - Baseline versus Minimum or Maximum Post-Baseline
#'
#' The `EGT03` Table entries provide the number of patients by baseline assessment and minimum or maximum post-baseline
#' assessment. Percentages are based on the total number of patients in a treatment group. Baseline is the patient's
#' last observation prior to initiation of study drug.
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' library(dunlin)
#' proc_data <- log_filter(syn_data, PARAMCD == "HR", "adeg")
#' run(egt03, proc_data)
egt03 <- chevron_t(
  main = egt03_main,
  preprocess = egt03_pre,
  postprocess = egt03_post,
  adam_datasets = c("adsl", "adeg")
)
