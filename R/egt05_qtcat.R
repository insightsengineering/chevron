# egt05_qtcat_1 ----

#' @describeIn egt05_qtcat_1 Main TLG function
#'
#' @inheritParams gen_args
#' @param visitvar (`string`) typically `"AVISIT"` (Default) or `"ATPTN"`.
#' @param paramvar (`string`) typically `"QT"` (Default). It should come from `"PARAMCD"`.
#'
#' @details
#'  * The `Value at Visit` column, displays the categories of the specific `"PARAMCD"` value for patients.
#'  * The `Change from Baseline` column, displays the categories of the specific `"PARAMCD"` value
#'  change from baseline for patients.
#'  * Remove zero-count rows unless overridden with `prune_0 = FALSE`.
#'  * Split columns by arm, typically `"ACTARM"`.
#'  * Does not include a total column by default.
#'  * Sorted based on factor level; by chronological time point given by one of `"AVISIT"` (Default) or `"ATPTN"`.
#'  Re-level to customize order.
#'
#' @note
#'  * `adam_db` object must contain an `adeg` table with column specified in `visitvar`.
#'  For `summaryvars`, please make sure `AVALCAT1` and `CHGCAT1` columns existed in input data sets.
#'
#' @export
#'
egt05_qtcat_1_main <- function(adam_db,
                               arm_var = "ACTARM",
                               summaryvars = c("Value at Visit" = "AVALCAT1", "Change from Baseline" = "CHGCAT1"),
                               summaryvars_lbls = get_labels(adam_db$adeg, summaryvars),
                               lbl_overall = NULL,
                               visitvar = "AVISIT",
                               lbl_avisit = var_labels_for(adam_db$adeg, visitvar),
                               paramvar = "QT",
                               lbl_param = var_labels_for(adam_db$adeg, "PARAM"),
                               deco = std_deco("EGT05_QTCAT"),
                               lbl_cat = "Category",
                               lbl_headvisit = "Analysis Visit",
                               ...) {
  lyt <- egt05_qtcat_1_lyt(
    arm_var = arm_var,
    summaryvars = summaryvars,
    summaryvars_lbls = summaryvars_lbls,
    lbl_overall = lbl_overall,
    visitvar = visitvar,
    lbl_avisit = lbl_avisit,
    lbl_param = lbl_param,
    deco = deco,
    lbl_cat = lbl_cat,
    lbl_headvisit = lbl_headvisit
  )

  tbl <- build_table(
    lyt,
    df = adam_db$adeg %>% filter(PARAMCD %in% paramvar),
    alt_counts_df = adam_db$adsl
  )
}

#' @describeIn egt05_qtcat_1 Layout
#'
#' @inheritParams gen_args
#'
#' @param summaryvars (`vector of character`) the variables to be analyzed. `AVALCAT1` and `CHGCAT1` by default.
#' @param summaryvars_lbls (`vector of character`) the label of the variables to be analyzed.
#' @param visitvar (`character`) typically one of `"AVISIT"` (Default) or `"ATPTN"` depending on the type of time point
#'   to be displayed.
#' @param lbl_avisit (`character`) label of the `visitvar` variable.
#' @param lbl_param (`character`) label of the `PARAM` variable.
#' @param lbl_cat (`character`) label of the Category of `summaryvars` variable. Default as `Category`.
#' @param lbl_headvisit (`character`) label of Visits in the header. Default as `Analysis Visit`.
#'
#' @export
egt05_qtcat_1_lyt <- function(arm_var,
                              summaryvars,
                              summaryvars_lbls,
                              lbl_overall = NULL,
                              visitvar,
                              lbl_avisit,
                              lbl_param,
                              deco,
                              lbl_cat,
                              lbl_headvisit) {
  basic_table_deco(deco) %>%
    split_cols_by(arm_var) %>%
    add_colcounts() %>%
    ifneeded_add_overall_col(lbl_overall) %>%
    split_rows_by(
      var = "PARAMCD",
      labels_var = "PARAM",
      split_fun = drop_split_levels,
      label_pos = "hidden",
      split_label = paste(lbl_param)
    ) %>%
    split_rows_by(
      visitvar,
      split_fun = drop_split_levels,
      label_pos = "hidden",
      split_label = lbl_avisit
    ) %>%
    summarize_vars(
      vars = summaryvars,
      var_labels = summaryvars_lbls
    ) %>%
    append_topleft(paste(lbl_param)) %>%
    append_topleft(paste0("  ", lbl_headvisit)) %>%
    append_topleft(paste0("    ", lbl_cat))
}

#' @describeIn egt05_qtcat_1 Preprocessing
#'
#' @inheritParams gen_args
#'
#' @export
#'
egt05_qtcat_1_pre <- function(adam_db, ...) {
  checkmate::assert_class(adam_db, "dm")
  assert_colnames(adam_db$adeg, c("AVALCAT1", "CHGCAT1"))

  adam_db %>%
    dm_zoom_to("adeg") %>%
    filter(
      ANL01FL == "Y"
    ) %>%
    mutate(
      AVALCAT1 = factor(AVALCAT1),
      CHGCAT1 = factor(CHGCAT1)
    ) %>%
    dm_update_zoomed()
}

#' @describeIn egt05_qtcat_1 Postprocessing
#'
#' @inheritParams gen_args
#'
#' @export
egt05_qtcat_1_post <- function(tlg, prune_0 = TRUE, ...) {
  if (prune_0) tlg <- smart_prune(tlg)
  std_postprocess(tlg)
}

#' `EGT05_QTCAT` Table 1 (Default) ECG Actual Values and Changes from Baseline by Visit Table 1.
#'
#' The `EGT05_QTCAT` table 1 summarizes several electrocardiogram parameters and their evolution
#' throughout the study.
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' db <- syn_data
#' run(egt05_qtcat_1, db)
#' run(egt05_qtcat_1, db, summaryvars = c("AVALCAT1", "Change" = "CHGCAT1"))
egt05_qtcat_1 <- chevron_t(
  main = egt05_qtcat_1_main,
  preprocess = egt05_qtcat_1_pre,
  postprocess = egt05_qtcat_1_post,
  adam_datasets = c("adeg")
)
