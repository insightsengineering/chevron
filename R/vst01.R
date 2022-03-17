#' `VST01` Table 1 (Default) Vital Sign Results and change from Baseline By Visit Table 1
#'
#' The `VST01` table provides an overview of the Vital Sign values and its change from baseline of each respective arm
#' over the course of the trial.
#'
#' @inheritParams gen_args
#' @param summaryvars (`vector of character`) the variables to be analyzed. For this table, `AVAL` and `CHG` by default.
#' @param summaryvars_lbls (`vector of character`) the label of the variables to be analyzed.
#' @param visitvar (`character`) typically one of `"AVISIT"` (Default) or `"ATPTN"` depending on the type of time point
#'   to be displayed
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
#'  by `AVISIT`. Re-level to customize order
#'
#' @importFrom dplyr filter
#'
#' @export
#'
#' @examples
#' library(dm)
#'
#' db <- syn_test_data() %>%
#'   preprocess_data("vst01_1")
#'
#' vst01_1(db)
#' vst01_1(db, summaryvars_lbls = c("Value at Visit", "Change from Baseline"))
vst01_1 <- function(adam_db,
                    armvar = .study$actarm,
                    summaryvars = .study$evo_vars,
                    summaryvars_lbls = var_labels_for(adam_db$advs, summaryvars),
                    visitvar = "AVISIT", # or ATPTN
                    prune_0 = TRUE,
                    deco = std_deco("VST01"),
                    .study = list(
                      actarm = "ACTARM",
                      evo_vars = c("AVAL", "CHG")
                    )) {
  lbl_avisit <- var_labels_for(adam_db$advs, visitvar)
  lbl_param <- var_labels_for(adam_db$advs, "PARAM")

  lyt <- vst01_1_lyt(
    armvar = armvar,
    summaryvars = summaryvars,
    summaryvars_lbls = summaryvars_lbls,
    visitvar = visitvar,
    lbl_avisit = lbl_avisit,
    lbl_param = lbl_param,
    deco = deco
  )

  tbl <- build_table(
    lyt,
    df = adam_db$advs,
    alt_counts_df = adam_db$adsl
  )

  if (prune_0) tbl <- tbl %>% trim_rows()

  tbl
}

#' `VST01` Layout 1 (Default)
#'
#' @describeIn vst01_1
#'
#' @inheritParams gen_args
#'
#' @param summaryvars (`vector of character`) the variables to be analyzed. For this table, `AVAL` and `CHG` by default.
#' @param summaryvars_lbls (`vector of character`) the label of the variables to be analyzed.
#' @param visitvar (`character`) typically one of `"AVISIT"` (Default) or `"ATPTN"` depending on the type of time point
#'   to be displayed.
#' @param lbl_avisit (`character`) label of the `visitvar` variable.
#' @param lbl_param (`character`) label of the `PARAM` variable.
#'
#' @return
#' @export
vst01_1_lyt <- function(armvar = .study$actarm,
                        summaryvars = .study$evo_vars,
                        summaryvars_lbls = .study$evo_vars_lbls,
                        visitvar = .study$visitvar,
                        lbl_avisit = "",
                        lbl_param = "",
                        deco = std_deco("VST01"),
                        .study = list(
                          actarm = "ACTARM",
                          evo_vars = c("AVAL", "CHG"),
                          evo_vars_lbls = c("Analysis \nValue", "Change from \nBaseline"),
                          visitvar = "AVISIT"
                        )) {


  # TODE solve the problem of the overall column
  # remove change from baseline in BASELINE
  # problem with the column count

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
    append_topleft(paste(" ", lbl_avisit))
}
