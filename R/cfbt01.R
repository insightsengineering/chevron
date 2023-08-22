# cfbt01 ----

#' @describeIn cfbt01 Main TLG function
#'
#' @inheritParams gen_args
#' @param summaryvars (`character`) variables to be analyzed. The label attribute of the corresponding column in
#'   table of `adam_db` is used as label.
#' @param visitvar (`string`) typically one of `"AVISIT"` or user-defined visit incorporating `"ATPT"`.
#' @param precision (named `list` of `integer`) where names are values found in the `PARAMCD` column and the the values
#'   indicate the number of digits in statistics. If `default` is set, and parameter precision not specified,
#'   the value for `default` will be used.
#' @param .stats (`character`) statistics names, see `tern::summarize_vars()`.
#' @param skip Named (`list`) of visit values that need to be inhibited.
#' @param ... additional arguments like `.indent_mods`, `.labels`.
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
                        lbl_overall = NULL,
                        row_split_var = NULL,
                        summaryvars = c("AVAL", "CHG"),
                        visitvar = "AVISIT",
                        precision = list(default = 2L),
                        page_var = "PARAMCD",
                        .stats = c("n", "mean_sd", "median", "range"),
                        skip = list(CHG = "BASELINE"),
                        ...) {
  assert_all_tablenames(adam_db, c("adsl", dataset))
  assert_string(arm_var)
  assert_string(lbl_overall, null.ok = TRUE)
  assert_character(summaryvars, max.len = 2L, min.len = 1L)
  assert_character(row_split_var, null.ok = TRUE)
  assert_disjunct(row_split_var, c("PARAMCD", "PARAM", visitvar))
  assert_string(visitvar)
  assert_string(page_var, null.ok = TRUE)
  assert_subset(page_var, c(row_split_var, "PARAMCD"))
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
  assert_list(precision, types = "integerish", names = "unique")

  vapply(precision, assert_int, FUN.VALUE = numeric(1), lower = 0)
  all_stats <- c(
    "n", "sum", "mean", "sd", "se", "mean_sd", "mean_se", "mean_ci", "mean_sei",
    "mean_sdi", "mean_pval", "median", "mad", "median_ci", "quantiles", "iqr", "range",
    "cv", "min", "max", "median_range", "geom_mean", "geom_cv"
  )
  assert_subset(.stats, all_stats)

  lbl_overall <- lbl_overall <- render_safe(lbl_overall)
  lbl_avisit <- var_labels_for(adam_db[[dataset]], visitvar)
  lbl_param <- var_labels_for(adam_db[[dataset]], "PARAM")

  summaryvars_lbls <- var_labels_for(adam_db[[dataset]], summaryvars)
  row_split_lbl <- var_labels_for(adam_db[[dataset]], row_split_var)

  lyt <- cfbt01_lyt(
    arm_var = arm_var,
    lbl_overall = lbl_overall,
    lbl_avisit = lbl_avisit,
    lbl_param = lbl_param,
    summaryvars = summaryvars,
    summaryvars_lbls = summaryvars_lbls,
    row_split_var = row_split_var,
    row_split_lbl = row_split_lbl,
    visitvar = visitvar,
    precision = precision,
    .stats = .stats,
    page_var = page_var,
    skip = skip,
    ...
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
#' @param lbl_avisit (`string`) label of the `visitvar` variable.
#' @param lbl_param (`string`) label of the `PARAM` variable.
#' @param summaryvars (`character`) the variables to be analyzed. For this table, `AVAL` and `CHG` by default.
#' @param summaryvars_lbls (`character`) the label of the variables to be analyzed.
#' @param row_split_lbl (`character`) label of further row splits.
#' @param visitvar (`string`) typically one of `"AVISIT"` or user-defined visit incorporating `"ATPT"`.
#'
#' @keywords internal
#'
cfbt01_lyt <- function(arm_var,
                       lbl_overall,
                       lbl_avisit,
                       lbl_param,
                       summaryvars,
                       summaryvars_lbls,
                       row_split_var,
                       row_split_lbl,
                       visitvar,
                       precision,
                       page_var,
                       .stats,
                       skip,
                       ...) {
  page_by <- get_page_by(page_var, c(row_split_var, "PARAMCD"))
  label_pos <- ifelse(page_by, "hidden", "topleft")
  basic_table(show_colcounts = TRUE) %>%
    split_cols_by(var = arm_var, split_fun = split_cols_by_with_overall(lbl_overall)) %>%
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
      afun = afun_skip,
      extra_args = list(
        visitvar = visitvar,
        paramcdvar = "PARAMCD",
        skip = skip,
        precision = precision,
        .stats = .stats,
        ...
      )
    )
}

#' @describeIn cfbt01 Preprocessing
#'
#' @inheritParams gen_args
#'
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
#' library(dunlin)
#'
#' proc_data <- log_filter(
#'   syn_data,
#'   PARAMCD %in% c("DIABP", "SYSBP"), "advs"
#' )
#' run(cfbt01, proc_data, dataset = "advs")
cfbt01 <- chevron_t(
  main = cfbt01_main,
  preprocess = cfbt01_pre,
  postprocess = cfbt01_post
)
