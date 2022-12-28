# egt03_1 ----

#' @describeIn egt03_1 Main TLG function
#'
#' @inheritParams gen_args
#' @param summaryvars (named vector of `character`) variables to be analyzed. Names are used as subtitles. For values
#'   where no name is provided, the label attribute of the corresponding column in `adeg` table of `adam_db` is used.
#' @param visitvar (`string`) typically one of `"AVISIT"` (Default) or `"ATPTN"` depending on the type of time point to
#'   be displayed
#'
#' @details
#'  * The `Analysis Value` column, displays the number of patients, the mean, standard deviation, median and range of
#'  the analysis value for each visit.
#'  * The `Change from Baseline` column, displays the number of patient and the mean, standard deviation,
#'  median and range of changes relative to the baseline.
#'  * Remove zero-count rows unless overridden with `prune_0 = FALSE`.
#'  * Split columns by arm, typically `ACTARM`.
#'  * Does not include a total column by default.
#'  * Sorted  based on factor level; first by `PARAM` labels in alphabetic order then by chronological time point given
#'  by `AVISIT`. Re-level to customize order.
#'
#' @note
#'  * `adam_db` object must contain an `adeg` table with a `"PARAM"` column as well as columns specified in
#'  `summaryvars` and `visitvar`.
#'
#' @export
#'
egt03_1_main <- function(adam_db,
                         armvar = "ARMCD",
                         summaryvar = c("Baseline Reference Range Indicator" = "BNRIND"),
                         splitvar = c("Analysis Reference Range Indicator" = "ANRIND"),
                         deco = std_deco("EGT03"),
                         ...) {

  # attr(adeg_f_pbmin$ANRIND, "label") <- "Analysis Reference Range Indicator"
  # attr(adeg_f_pbmin$BNRIND, "label") <- "Baseline Reference Range Indicator"
  lbl_armvar <- var_labels_for(adam_db$adeg,  armvar)
  lbl_summaryvar <- get_labels(adam_db$adeg, summaryvar)
  lbl_splitvar <- get_labels(adam_db$adeg, splitvar)

  # obj_label(adeg_f_pbmin$ARMCD)


  lyt <- egt03_1_lyt(
    armvar = armvar,
    splitvar = splitvar,
    summaryvar = summaryvar,
    lbl_armvar = lbl_armvar,
    lbl_splitvar = lbl_splitvar,
    lbl_summaryvar = lbl_summaryvar,
    deco = deco,
    ... = ...
  )

  tbl <- build_table(
    lyt,
    df = adam_db$adeg
  )
}

#' @describeIn egt03_1 Layout
#'
#' @inheritParams gen_args
#'
#' @param summaryvars (`vector of character`) the variables to be analyzed. For this table, `AVAL` and `CHG` by default.
#' @param summaryvars_lbls (`vector of character`) the label of the variables to be analyzed.
#' @param visitvar (`character`) typically one of `"AVISIT"` (Default) or `"ATPTN"` depending on the type of time point
#'   to be displayed.
#' @param lbl_avisit (`character`) label of the `visitvar` variable.
#' @param lbl_param (`character`) label of the `PARAM` variable.
#' @param ... not used.
#'
#' @export
egt03_1_lyt <- function(armvar,
                        splitvar,
                        summaryvar,
                        lbl_armvar,
                        lbl_splitvar,
                        lbl_summaryvars,
                        deco,
                        ...) {


  basic_table_deco(deco) %>%
    split_cols_by("min_label") %>%
    split_cols_by(splitvar) %>%
    split_rows_by(armvar,
                  split_fun = drop_split_levels,
                  label_pos = "topleft",
                  split_label = lbl_armvar) %>% #  obj_label(adeg_f_pbmin$ARMCD)
    add_rowcounts() %>%
    summarize_vars(summaryvar, denom = "N_row", .stats = "count_fraction") #%>%
    # append_varlabels(adeg_f_pbmin, c("BNRIND"), indent = 1L)




}

#' @describeIn egt03_1 Preprocessing
#'
#' @inheritParams gen_args
#' @param ... not used.
#'
#' @export
#'
egt03_1_pre <- function(adam_db, ...) {
  checkmate::assert_class(adam_db, "dm")

  adam_db %>%
    dm_zoom_to("adeg") %>%
    filter(
      PARAMCD == "HR" & # Heart Rate
        SAFFL == "Y" & # "Safety Population Flag"
        ONTRTFL == "Y" & # "On Treatment Record Flag"
        AVISIT == "POST-BASELINE MINIMUM" # "Analysis Visit"
    ) %>%
    mutate(min_label = "Minimum Post-Baseline Assessment") %>%
    mutate(BNRIND = factor(
      BNRIND,
      levels = c("LOW", "NORMAL", "HIGH", "Missing"),
      labels = c("LOW", "NORMAL", "HIGH", "Missing")
    )) %>%
    mutate(ANRIND = factor(
      ANRIND,
      levels = c("LOW", "NORMAL", "HIGH", "Missing"),
      labels = c("LOW", "NORMAL", "HIGH", "Missing")
    )) %>%
    dm_update_zoomed()
}

#' @describeIn egt03_1 Postprocessing
#'
#' @inheritParams gen_args
#' @param ... not used.
#'
#' @export
egt03_1_post <- function(tlg, prune_0 = TRUE, ...) {
  if (prune_0) tlg <- smart_prune(tlg)

  std_postprocess(tlg)
}

#' `EGT03` Table 1 (Default) ECG Assessments and Change from Baseline by Visit Table 1.
#'
#' The `EGT03` table 1 summarizes
#' several electrocardiogram parameters and their evolution throughout the study.
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' db <- syn_data
#' run(egt03_1, db)
#' run(egt03_1, db, summaryvars = c("AVAL", "Change" = "CHG"))
egt03_1 <- chevron_t(
  main = egt03_1_main,
  preprocess = egt03_1_pre,
  postprocess = egt03_1_post,
  adam_datasets = c("adeg")
)
