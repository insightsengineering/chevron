#' VST01 Table 1 (Default) Vital Sign Results and change from Baseline By Visit Tble 1
#'
#' The VST01 table provides an overview of the Vital Sign values and its change from baseline of each respective arm
#' over the course of the trial.
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
#'  by `AVISIT`. Re-level to customize order
#'
#' @importFrom dplyr filter
#'
#' @export
#'
#' @examples
#' library(scda)
#' library(dplyr)
#' sd <- synthetic_cdisc_data("rcd_2021_03_22")
#' adsl <- sd$adsl
#' advs <- sd$advs %>%
#'  mutate(ANL01FL = 'Y')
#'
#' vst01_1(adsl, advs)
#'
#' vst01_1(adsl, advs, summaryvars_lbls = c("Value at Visit", "Change from Baseline"))
#'
vst01_1 <- function(adsl, advs,
                    armvar = .study$armvar,
                    summaryvars = .study$evo_vars,
                    summaryvars_lbls = var_labels_for(advs, summaryvars),
                    visitvar = "AVISIT", # or ATPTN
                    prune_0 = TRUE,
                    deco = std_deco("VST01"),
                    .study = list(
                      armvar = "ACTARM",
                      evo_vars = c("AVAL", "CHG")
                    )) {

  advs <- advs %>%
    filter(bol_YN(ANL01FL))

  lbl_AVISIT <- var_labels_for(advs, visitvar)
  lbl_PARAM <- var_labels_for(advs, "PARAM")

  lyt <- vst01_1_lyt(
    armvar = armvar,
    summaryvars = summaryvars,
    summaryvars_lbls = summaryvars_lbls,
    visitvar = visitvar,
    lbl_AVISIT = lbl_AVISIT,
    lbl_PARAM = lbl_PARAM,
    deco = deco
  )

  tbl <- build_table(
    lyt,
    df = advs,
    alt_counts_df = adsl
  )

  if (prune_0) tbl <- tbl %>% trim_rows()

  tbl

}

#' LBT01 Layout 1 (Default)
#'
#' @describeIn vst01_1
#'
#' @inheritParams gen_args
#'
#' @param summaryvars (`vector of string`) the variables to be analyzed. For this table, `AVAL` and `CHG` by default.
#' @param summaryvars_lbls (`vector of string`) the label of the variables to be analyzed.
#' @param visitvar (`string`) typically one of `"AVISIT"` (Default) or `"ATPTN"` depending on the type of time point to
#'   be displayed.
#' @param lbl_AVISIT (`string`) label of the `visitvar` variable.
#' @param lbl_PARAM (`string`) label of the `PARAM` variable.
#'
#' @return
#' @export
vst01_1_lyt <- function(armvar = .study$armvar,
                        summaryvars = .study$evo_vars,
                        summaryvars_lbls = .study$evo_vars_lbls,
                        visitvar = .study$visitvar,
                        lbl_AVISIT = "",
                        lbl_PARAM = "",
                        deco = std_deco("EGT01"),
                        .study = list(
                          armvar = "ACTARM",
                          evo_vars = c("AVAL", "CHG"),
                          evo_vars_lbls = c("Analysis \nValue", "Change from \nBaseline"),
                          visitvar = "AVISIT"
                        )
) {


  # TODE solve the problem of the overall column
  # remove change from baseline in BASELINE

  basic_table(title = deco$title, subtitles = deco$subtitles, main_footer = deco$main_footer)  %>%
    split_cols_by(armvar) %>%
    add_colcounts() %>%
    split_rows_by(
      "PARAM",
      split_fun = drop_split_levels,
      label_pos = "hidden",
      split_label = paste(lbl_PARAM)
    ) %>%
    split_rows_by(
      visitvar,
      split_fun = drop_split_levels,
      label_pos = "hidden",
      split_label = lbl_AVISIT
    ) %>%
    split_cols_by_multivar(
      vars = summaryvars,
      varlabels = summaryvars_lbls,
      nested = TRUE
    ) %>%
    summarize_colvars() %>%
    append_topleft(paste(lbl_PARAM)) %>%
    append_topleft(paste(" ", lbl_AVISIT))

}
