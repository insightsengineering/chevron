# cfbt01 ----

#' @describeIn cfbt01 Main TLG function
#'
#' @inheritParams gen_args
#' @param summaryvars (`character`) variables to be analyzed. The label attribute of the corresponding column in
#'   table of `adam_db` is used as label.
#' @param visitvar (`string`) typically one of `"AVISIT"` (Default) or `"ATPTN"` depending on the type of time point
#'   to be displayed
#' @param precision (named `list` of `integer`) where names are values found in the `PARAMCD` column and the the values
#'   indicate the number of digits that should be represented for `min`, `max` and `median`. `Mean` and `sd` are
#'   represented with one more decimal of precision.
#' @param default_precision (`integer`) the default number of digits.
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
#'   * `adam_db` object must contain table named as `dataset` with the columns specified in `summaryvars`.
#'
#' @export
#'
cfbt01_main <- function(adam_db,
                        dataset,
                        arm_var = "ACTARM",
                        row_split_var = NULL,
                        summaryvars = c("AVAL", "CHG"),
                        visitvar = "AVISIT",
                        precision = list(),
                        default_precision = 2,
                        page_var = "PARAMCD",
                        ...) {
  assert_all_tablenames(adam_db, c("adsl", dataset))
  checkmate::assert_string(arm_var)
  checkmate::assert_character(summaryvars, len = 2)
  checkmate::assert_character(row_split_var, null.ok = TRUE)
  checkmate::assert_disjunct(row_split_var, c("PARAMCD", "PARAM", visitvar))
  checkmate::assert_string(visitvar)
  checkmate::assert_string(page_var)
  checkmate::assert_subset(page_var, c(row_split_var, "PARAMCD"))
  df_lbl <- paste0("adam_db$", dataset)
  assert_valid_variable(adam_db[[dataset]], c(summaryvars), types = list("numeric"), empty_ok = TRUE, label = df_lbl)
  assert_valid_variable(
    adam_db[[dataset]], c(visitvar, row_split_var, "PARAM", "PARAMCD"),
    types = list(c("character", "factor")), label = df_lbl
  )
  assert_valid_variable(
    adam_db[[dataset]], "USUBJID",
    types = list(c("character", "factor")), empty_ok = TRUE, label = df_lbl
  )
  assert_valid_variable(adam_db$adsl, "USUBJID", types = list(c("character", "factor")))
  assert_valid_var_pair(adam_db$adsl, adam_db[[dataset]], arm_var)
  checkmate::assert_list(precision, types = "integerish", names = "unique")
  vapply(precision, checkmate::assert_int, FUN.VALUE = numeric(1), lower = 0)
  checkmate::assert_integerish(default_precision, lower = 0)

  lbl_avisit <- var_labels_for(adam_db[[dataset]], visitvar)
  lbl_param <- var_labels_for(adam_db[[dataset]], "PARAM")

  summaryvars_lbls <- var_labels_for(adam_db[[dataset]], summaryvars)
  row_split_lbl <- var_labels_for(adam_db[[dataset]], row_split_var)

  lyt <- cfbt01_lyt(
    arm_var = arm_var,
    summaryvars = summaryvars,
    summaryvars_lbls = summaryvars_lbls,
    row_split_var = row_split_var,
    row_split_lbl = row_split_lbl,
    visitvar = visitvar,
    lbl_avisit = lbl_avisit,
    lbl_param = lbl_param,
    precision = precision,
    default_precision = default_precision,
    page_var = page_var
  )

  tbl <- build_table(
    lyt,
    df = adam_db[[dataset]],
    alt_counts_df = adam_db$adsl
  )

  tbl
}

#' `cfbt01` Layout
#'
#' @inheritParams gen_args
#' @inheritParams cfbt01_main
#'
#' @param summaryvars (`character`) the variables to be analyzed. For this table, `AVAL` and `CHG` by default.
#' @param summaryvars_lbls (`character`) the label of the variables to be analyzed.
#' @param visitvar (`string`) typically one of `"AVISIT"` (Default) or `"ATPTN"` depending on the type of time point
#'   to be displayed.
#' @param lbl_avisit (`string`) label of the `visitvar` variable.
#' @param lbl_param (`string`) label of the `PARAM` variable.
#' @param row_split_lbl (`character`) label of further row splits.
#'
#' @keywords internal
#'
cfbt01_lyt <- function(arm_var,
                       summaryvars,
                       summaryvars_lbls,
                       row_split_var,
                       row_split_lbl,
                       visitvar,
                       lbl_avisit,
                       lbl_param,
                       precision,
                       default_precision,
                       page_var) {
  page_by <- get_page_by(page_var, c(row_split_var, "PARAMCD", visitvar))
  label_pos <- dplyr::if_else(page_by, "hidden", "topleft")
  basic_table(show_colcounts = TRUE) %>%
    split_cols_by(arm_var) %>%
    split_rows_by_recurive(
      row_split_var,
      split_label = row_split_lbl,
      label_pos = head(label_pos, -1L), page_by = head(page_by, -1L)
    ) %>%
    split_rows_by(
      var = "PARAMCD",
      labels_var = "PARAM",
      split_fun = drop_split_levels,
      label_pos = tail(label_pos, 1L),
      split_label = lbl_param,
      page_by = tail(page_by, 1L)
    ) %>%
    split_rows_by(
      visitvar,
      split_fun = drop_split_levels,
      label_pos = "topleft",
      split_label = lbl_avisit
    ) %>%
    split_cols_by_multivar(
      vars = summaryvars,
      varlabels = summaryvars_lbls,
      nested = TRUE
    ) %>%
    analyze_colvars(
      afun = afun_skip_baseline,
      extra_args = list(
        visitvar = visitvar,
        paramcdvar = "PARAMCD",
        skip = c("BASELINE" = summaryvars[2]),
        precision = precision,
        default_precision = default_precision
      )
    )
}

#' @describeIn cfbt01 Preprocessing
#'
#' @inheritParams gen_args
#' @export
#'
cfbt01_pre <- function(adam_db, dataset, ...) {
  adam_db[[dataset]] <- adam_db[[dataset]] %>%
    filter(.data$ANL01FL == "Y") %>%
    mutate(
      AVISIT = reorder(.data$AVISIT, .data$AVISITN),
      AVISIT = with_label(.data$AVISIT, "Analysis Visit"),
      AVAL = with_label(.data$AVAL, "Value at Visit"),
      CHG = with_label(.data$CHG, "Change from \nBaseline")
    )

  adam_db
}

#' @describeIn cfbt01 Postprocessing
#'
#' @inheritParams gen_args
#'
#' @export
cfbt01_post <- function(tlg, prune_0 = TRUE, ...) {
  if (prune_0) {
    tlg <- smart_prune(tlg)
  }
  std_postprocess(tlg)
}
#' `CFBT01` Change from Baseline By Visit Table.
#'
#' The `CFBT01` table provides an
#' overview of the actual values and its change from baseline of each respective arm
#' over the course of the trial.
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' run(cfbt01, syn_data, dataset = "advs")
cfbt01 <- chevron_t(
  main = cfbt01_main,
  preprocess = cfbt01_pre,
  postprocess = cfbt01_post
)
