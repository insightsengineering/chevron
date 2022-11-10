# egt01_1 ----

#' @describeIn egt01_1 Main TLG function
#'
#' @inheritParams gen_args
#' @param summaryvars (`vector of string`) the variables to be analyzed. For this table, `AVAL` and `CHG` by default.
#' @param summaryvars_lbls (`vector of string`) the label of the variables to be analyzed.
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
egt01_1_main <- function(adam_db,
                         armvar = "ACTARM",
                         summaryvars = c("AVAL", "CHG"),
                         summaryvars_lbls = c("Value at Visit", "Change from \nBaseline"),
                         visitvar = "AVISIT", # or ATPTN
                         deco = std_deco("EGT01"),
                         ...) {
  lbl_avisit <- var_labels_for(adam_db$adeg, visitvar)
  lbl_param <- var_labels_for(adam_db$adeg, "PARAM")

  summaryvars_lbls <- if (is.null(summaryvars_lbls)) {
    var_labels_for(adam_db$adeg, summaryvars)
  } else {
    summaryvars_lbls
  }

  lyt <- egt01_1_lyt(
    armvar = armvar,
    summaryvars = summaryvars,
    summaryvars_lbls = summaryvars_lbls,
    visitvar = visitvar,
    lbl_avisit = lbl_avisit,
    lbl_param = lbl_param,
    deco = deco,
    ... = ...
  )

  tbl <- build_table(
    lyt,
    df = adam_db$adeg
  )
}

#' @describeIn egt01_1 Layout
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
egt01_1_lyt <- function(armvar,
                        summaryvars,
                        summaryvars_lbls,
                        visitvar,
                        lbl_avisit,
                        lbl_param,
                        deco,
                        ...) {
  # TODE solve the problem of the overall column
  # remove change from baseline in BASELINE

  basic_table_deco(deco) %>%
    split_cols_by(armvar) %>%
    split_rows_by(
      "PARAM",
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
    split_cols_by_multivar(
      vars = summaryvars,
      varlabels = summaryvars_lbls,
      nested = TRUE
    ) %>%
    summarize_colvars() %>%
    append_topleft(paste(lbl_param)) %>%
    append_topleft(c(paste(" ", lbl_avisit), " "))
}

#' @describeIn egt01_1 Preprocessing
#'
#' @inheritParams gen_args
#' @param ... not used.
#'
#' @export
#'
egt01_1_pre <- function(adam_db, ...) {
  checkmate::assert_class(adam_db, "dm")

  adam_db %>%
    dm_zoom_to("adeg") %>%
    filter(.data$ANL01FL == "Y") %>%
    dm_update_zoomed()
}

#' @describeIn egt01_1 Postprocessing
#'
#' @inheritParams gen_args
#' @param ... not used.
#'
#' @export
egt01_1_post <- function(tlg, prune_0 = TRUE, ...) {
  if (prune_0) tlg <- smart_prune(tlg)

  report_null(tlg)
}

#' `EGT01` Table 1 (Default) ECG Assessments and Change from Baseline by Visit Table 1.
#'
#' The `EGT01` table 1 summarizes
#' several electrocardiogram parameters and their evolution throughout the study.
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' db <- syn_data
#' run(egt01_1, db)
#' run(egt01_1, db, summaryvars_lbls = c("Value at Visit", "Change from Baseline"))
egt01_1 <- chevron_t(
  main = egt01_1_main,
  preprocess = egt01_1_pre,
  postprocess = egt01_1_post,
  adam_datasets = c("adeg")
)
