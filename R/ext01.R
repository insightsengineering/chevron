# ext01 ----

#' @describeIn ext01 Main TLG function
#'
#' @inheritParams gen_args
#' @param summaryvars (`character`) variables to be analyzed. Names are used as subtitles. For values
#'   where no name is provided, the label attribute of the corresponding column in `adex` table of `adam_db` is used.
#'
#' @details
#'  * Default Exposure table
#'  * The `n` row provides the number of non-missing values. The percentages for categorical variables is based on `n`.
#'  The percentages for `Total number of patients with at least one dose modification` are based on the number of
#'  patients in the corresponding analysis population given by `N`.
#'  * Split columns by arm, typically `ACTARM`.
#'  * Does not include a total column by default.
#'  * Sorted by alphabetic order of the `PARAM` value. Transform to factor and re-level for custom order.
#'  * `ANL01FL` is not relevant subset.
#'
#' @note
#'   * `adam_db` object must contain an `adex` table with columns specified in `summaryvars`.
#'
#' @export
#'
ext01_main <- function(adam_db,
                       keep_lvl = "ALL",
                       arm_var = "ACTARM",
                       summaryvars = "AVAL",
                       lbl_overall = NULL,
                       ...) {
  assert_all_tablenames(adam_db, c("adsl", "adex"))
  assert_valid_var(adam_db, "adex", summaryvars)
  checkmate::assert_string(lbl_overall, null.ok = TRUE)
  assert_valid_var_pair(adam_db$adsl, adam_db$adex, arm_var)
  assert_valid_variable(adam_db$adex, "USUBJID", empty_ok = TRUE, types = list(c("character", "factor")))
  assert_valid_variable(adam_db$adsl, c("USUBJID", arm_var), types = list(c("character", "factor")))

  summaryvars_lbls <- get_labels(adam_db$adex, summaryvars)

  lyt <- ext01_lyt(
    arm_var = arm_var,
    summaryvars = summaryvars,
    summaryvars_lbls = summaryvars_lbls,
    lbl_overall = lbl_overall
  )

  tbl <- build_table(lyt, adam_db$adex, adam_db$adsl)

  tbl
}

#' @describeIn ext01 Layout
#'
#' @inheritParams gen_args
#'
#' @param summaryvars `(string)` the name of the variable to be analyzed. By default `"AVAL"`.
#' @param summaryvars_lbls `(string)` the label associated with the analyzed variable.
#'
#'
#' @export
#'
ext01_lyt <- function(arm_var,
                      summaryvars,
                      summaryvars_lbls,
                      lbl_overall) {
  basic_table(show_colcounts = TRUE) %>%
    split_cols_by(var = arm_var) %>%
    add_colcounts() %>%
    ifneeded_add_overall_col(lbl_overall) %>%
    split_rows_by(
      "PARAM",
      split_fun = drop_split_levels
    ) %>%
    summarize_vars(
      vars = summaryvars,
      var_labels = summaryvars_lbls,
      show_labels = "hidden",
      .formats = list(count_fraction = format_count_fraction_fixed_dp)
    )
}

#' @describeIn ext01 Preprocessing
#'
#' @inheritParams gen_args
#' @param paramcd_order (`character`) providing the `PARAMCD` values in the desired order.
#' @param show_stats (`character`) providing the name of the parameters whose statistical summary should be
#'   presented. To analyze all, provide `show_stats = "ALL"` (Default), to analyze none, provide `show_stats = ""`.
#'
#' @param show_bins (`character`) providing the name of the parameters whose categorical summary should be
#'   presented. To analyze all, provide `show_bins = "ALL"` (Default), to analyze none, provide `show_bins = ""`.
#'
#' @export
#'
ext01_pre <- function(adam_db,
                      paramcd_order = c("TNDOSE", "DOSE", "NDOSE", "TDOSE"),
                      show_stats = "ALL",
                      show_bins = "ALL",
                      ...) {
  adam_db$adex <- adam_db$adex %>%
    filter(.data$PARCAT1 == "OVERALL")

  if (nrow(adam_db$adex) > 0L) {
    param_vars <- adam_db$adex %>%
      dplyr::select("PARAM", "PARAMCD") %>%
      dunlin::co_relevels("PARAMCD", "PARAM", paramcd_order)

    adam_db$adex <- adam_db$adex %>%
      mutate(PARAM = param_vars$PARAM, PARAMCD = param_vars$PARAMCD)
  }

  if (!"ALL" %in% show_stats) {
    adam_db$adex <- adam_db$adex %>%
      mutate(AVAL = ifelse(.data$PARAM %in% show_stats, .data$AVAL, NA))
  }

  if (!"ALL" %in% show_bins) {
    adam_db$adex <- adam_db$adex %>%
      mutate(AVALCAT1 = ifelse(.data$PARAM %in% show_bins, .data$AVALCAT1, NA))
  }

  adam_db
}
#' @describeIn ext01 Postprocessing
#'
#' @inheritParams gen_args
#'
#'
#' @export
ext01_post <- function(tlg, prune_0 = TRUE, ...) {
  if (prune_0) tlg <- smart_prune(tlg)
  std_postprocess(tlg)
}

#' EXT01 Exposure Summary Table.
#'
#' The EXT01 table provides an overview of the of the exposure of the
#' patients in terms of Total dose administered or missed, and treatment duration.
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' run(ext01, syn_data)
#' run(ext01, syn_data, summaryvars = c("AVAL", "AVALCAT1"))
ext01 <- chevron_t(
  main = ext01_main,
  preprocess = ext01_pre,
  postprocess = ext01_post,
  adam_datasets = c("adsl", "adex")
)
