# vst01 ----

#' @describeIn vst01 Main TLG function
#'
#' @inheritParams gen_args
#' @param summaryvars (`list`) variables to be analyzed. Names are used as subtitles. For values
#'   where no name is provided, the label attribute of the corresponding column in `advs` table of `adam_db` is used.
#' @param visitvar (`string`) typically one of `"AVISIT"` (Default) or `"ATPTN"` depending on the type of time point
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
#' @note
#'   * `adam_db` object must contain an `advs` table with the columns specified in `summaryvars`.
#'
#' @export
#'
vst01_main <- function(adam_db,
                         arm_var = "ACTARM",
                         summaryvars = c("AVAL", "CHG"),
                         visitvar = "AVISIT", # or ATPTN
                         ...) {

  assert_all_tablenames(adam_db, c("adsl", "advs"))
  checkmate::assert_string(arm_var)
  checkmate::assert_character(summaryvars, len = 2)
  checkmate::assert_string(visitvar)
  assert_valid_variable(adam_db$advs, c(summaryvars, visitvar, "PARAM"))
  assert_valid_variable(adam_db$advs, "USUBJID", empty_ok = TRUE)
  assert_valid_variable(adam_db$adsl, "USUBJID")
  assert_valid_var_pair(adam_db$adsl, adam_db$adae, arm_var)

  lbl_avisit <- var_labels_for(adam_db$advs, visitvar)
  lbl_param <- var_labels_for(adam_db$advs, "PARAM")

  summaryvars_lbls <- get_labels(adam_db$advs, summaryvars)

  lyt <- vst01_lyt(
    arm_var = arm_var,
    summaryvars = summaryvars,
    summaryvars_lbls = summaryvars_lbls,
    visitvar = visitvar,
    lbl_avisit = lbl_avisit,
    lbl_param = lbl_param
  )

  tbl <- build_table(
    lyt,
    df = adam_db$advs,
    alt_counts_df = adam_db$adsl
  )

  tbl
}

#' @describeIn vst01 Layout
#'
#' @inheritParams gen_args
#'
#' @param summaryvars (`character`) the variables to be analyzed. For this table, `AVAL` and `CHG` by default.
#' @param summaryvars_lbls (`character`) the label of the variables to be analyzed.
#' @param visitvar (`string`) typically one of `"AVISIT"` (Default) or `"ATPTN"` depending on the type of time point
#'   to be displayed.
#' @param lbl_avisit (`string`) label of the `visitvar` variable.
#' @param lbl_param (`string`) label of the `PARAM` variable.
#'
#' @export
#'
vst01_lyt <- function(arm_var,
                        summaryvars,
                        summaryvars_lbls,
                        visitvar,
                        lbl_avisit,
                        lbl_param) {
  # TODE solve the problem of the overall column
  # remove change from baseline in BASELINE
  # problem with the column count

   basic_table(show_colcounts = TRUE) %>%
    split_cols_by(arm_var) %>%
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

#' @describeIn vst01 Preprocessing
#'
#' @inheritParams gen_args
#' @export
#'
vst01_pre <- function(adam_db, ...) {

  adam_db$advs <- adam_db$advs %>%
    filter(.data$ANL01FL == "Y") %>%
    mutate(
      AVAL = with_label(.data$AVAL, "Value at Visit"),
      CHG = with_label(.data$CHG, "Change from \nBaseline")
    )

  adam_db
}

#' @describeIn vst01 Postprocessing
#'
#' @inheritParams gen_args
#'
#' @export
vst01_post <- function(tlg, prune_0 = TRUE, ...) {
  if (prune_0) tlg <- tlg %>% trim_rows()
  std_postprocess(tlg)
}
#' `VST01` Vital Sign Results and change from Baseline By Visit Table.
#'
#' The `VST01` table provides an
#' overview of the Vital Sign values and its change from baseline of each respective arm
#' over the course of the trial.
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' run(vst01, syn_data)
vst01 <- chevron_t(
  main = vst01_main,
  preprocess = vst01_pre,
  postprocess = vst01_post,
  adam_datasets = c("adsl", "advs")
)
