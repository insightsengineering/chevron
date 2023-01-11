# egt05_qtcat_1 ----

#' @describeIn egt05_qtcat_1 Main TLG function
#'
#' @inheritParams gen_args
#' @param visitvar (`string`) typically `"AVISIT"` (Default) or `"ATPTN"`.
#'
#' @details
#'  * The `Value at Visit` column, displays the categories of QT value for patients, "<=450 msec", ">450 to <=480 msec",
#'  ">480 to <= 500 msec", ">500 msec", and "<Missing>" for each visit.
#'  * The `Change from Baseline` column, displays the categories of QT value change from baseline for patients,
#'  "<=30 msec", ">30 to <=60 msec", ">60 msec", and "<Missing>"
#'  * Remove zero-count rows unless overridden with `prune_0 = FALSE`.
#'  * Split columns by arm, typically `ACTARM`.
#'  * Does not include a total column by default.
#'  * Sorted based on factor level; by chronological time point given by one of `"AVISIT"` (Default) or `"ATPTN"`.
#'  Re-level to customize order.
#'
#' @note
#'  * `adam_db` object must contain an `adeg` table with column specified in `visitvar`.
#'  For `"PARAMCD"`, default as 'QT'. If other `PARAMCD` needed, please specify in `paramcdvar`.
#'  For `summaryvars`, if `AVALCAT1` and `CHGCAT1` columns are not existed in input data sets, `AVAL` and `CHG`
#'  columns must be contained to re-derive `AVALCAT1` and `CHGCAT1`.
#'
#' @export
#'
egt05_qtcat_1_main <- function(adam_db,
                               armvar = "ACTARM",
                               summaryvars = c("Value at Visit" = "AVALCAT1", "Change from Baseline" = "CHGCAT1"),
                               lbl_overall = NULL,
                               visitvar = "AVISIT",
                               deco = std_deco("EGT05_QTCAT"),
                               lbl_cat = "Category",
                               lbl_headvisit = "Analysis Visit",
                               ...) {
  lbl_avisit <- var_labels_for(adam_db$adeg, visitvar)

  summaryvars_lbls <- get_labels(adam_db$adeg, summaryvars)

  lyt <- egt05_qtcat_1_lyt(
    armvar = armvar,
    summaryvars = summaryvars,
    summaryvars_lbls = summaryvars_lbls,
    lbl_overall = lbl_overall,
    visitvar = visitvar,
    lbl_avisit = lbl_avisit,
    deco = deco,
    lbl_cat = lbl_cat,
    lbl_headvisit = lbl_headvisit,
    ... = ...
  )

  tbl <- build_table(
    lyt,
    df = adam_db$adeg,
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
#' @param lbl_cat (`character`) label of the Category of `summaryvars` variable. Default as `Category`.
#' @param lbl_headvisit (`character`) label of Visits in the header. Default as `Analysis Visit`.
#' @param ... not used.
#'
#' @export
egt05_qtcat_1_lyt <- function(armvar,
                              summaryvars,
                              summaryvars_lbls,
                              lbl_overall = NULL,
                              visitvar,
                              lbl_avisit,
                              deco,
                              lbl_cat,
                              lbl_headvisit,
                              ...) {

  basic_table_deco(deco) %>%
    split_cols_by(armvar) %>%
    add_colcounts() %>%
    ifneeded_add_overall_col(lbl_overall) %>%
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
    append_topleft(lbl_headvisit) %>%
    append_topleft(paste0("  ", lbl_cat))
}

#' @describeIn egt05_qtcat_1 Preprocessing
#'
#' @inheritParams gen_args
#' @param paramcdvar (`string`) typically `"QT"` (Default).
#'
#' @export
#'
egt05_qtcat_1_pre <- function(adam_db, paramcdvar = "QT", ...) {
  checkmate::assert_class(adam_db, "dm")
  unit <- adam_db$adeg %>% filter(PARAMCD == paramcdvar) %>% select(AVALU) %>% unique()
  unit <- as.character(unit[["AVALU"]])
  adam_db %>%
    dm_zoom_to("adeg") %>%
    filter(
      ANL01FL == "Y",
      PARAMCD == paramcdvar
      ) %>%
    mutate(
      AVALCAT1 = if ("AVALCAT1" %in% colnames(.)) AVALCAT1 else factor(case_when(
        AVAL <= 450 ~ paste0("<=450 ", unit),
        AVAL <= 480 ~ paste0(">450 to <=480 ", unit),
        AVAL <= 500 ~ paste0(">480 to <= 500 ", unit),
        AVAL > 500 ~ paste0(">500 ", unit),
        is.na(AVAL) ~ "<Missing>"
        ),
        levels = c(sprintf(c("<=450 %s", ">450 to <=480 %s", ">480 to <= 500 %s", ">500 %s"), unit), "<missing>")
        )
      ) %>%
    mutate(
      CHGCAT1 = if ("CHGCAT1" %in% colnames(.)) CHGCAT1 else factor(case_when(
        CHG <= 30 ~ paste0("<=30 ", unit),
        CHG <= 60 ~ paste0(">30 to <=60 ", unit),
        CHG > 60 ~ paste0(">60 ", unit),
        is.na(CHG) ~ "<Missing>"
        ),
        levels = c(sprintf(c("<=30 %s", ">30 to <=60 %s", ">60 %s"), unit), "<Missing>")
        )) %>%
    dm_update_zoomed()
  }

#' @describeIn egt05_qtcat_1 Postprocessing
#'
#' @inheritParams gen_args
#' @param ... not used.
#'
#' @export
egt05_qtcat_1_post <- function(tlg, prune_0 = TRUE, ...) {
  if (prune_0) tlg <- smart_prune(tlg)

  std_postprocess(tlg)
}

#' `EGT05_QTCAT` Table 1 (Default) ECG Actual Values and Changes from Baseline by Visit Table 1.
#'
#' The `EGT05_QTCAT` table 1 summarizes
#' several electrocardiogram parameters and their evolution throughout the study.
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
