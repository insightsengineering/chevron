# ext01_1 ----

#' @describeIn ext01_1 Main TLG function
#'
#' @inheritParams gen_args
#' @param summaryvars (`character`) the name of the variable to be analyzed. By default `"AVAL"`.
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
ext01_1_main <- function(adam_db,
                         lyt_ls = list(ext01_1_lyt),
                         armvar = "ACTARM",
                         summaryvars = "AVAL",
                         lbl_overall = NULL,
                         prune_0 = TRUE,
                         deco = std_deco("EXT01"),
                         ...) {
  assert_colnames(adam_db$adex, summaryvars)

  lyt <- lyt_ls[[1]](
    armvar = armvar,
    summaryvars = summaryvars,
    summaryvars_lbls = var_labels_for(adam_db$adex, summaryvars),
    lbl_overall = lbl_overall,
    deco = deco,
    ... = ...
  )

  tbl <- build_table(lyt, adam_db$adex, adam_db$adsl)

  if (prune_0) tbl <- smart_prune(tbl)

  tbl
}

#' @describeIn ext01_1 Layout
#'
#' @inheritParams gen_args
#'
#' @param summaryvars `(string)` the name of the variable to be analyzed. By default `"AVAL"`.
#' @param summaryvars_lbls `(string)` the label associated with the analyzed variable.
#' @param ... not used.
#'
#' @export
#'
ext01_1_lyt <- function(armvar,
                        summaryvars,
                        summaryvars_lbls ,
                        lbl_overall,
                        deco,
                        ...) {
  basic_table_deco(deco) %>%
    split_cols_by(var = armvar) %>%
    add_colcounts() %>%
    ifneeded_add_overall_col(lbl_overall) %>%
    split_rows_by(
      "PARAM",
      split_fun = drop_split_levels
    ) %>%
    summarize_vars(vars = summaryvars, var_labels = summaryvars_lbls)
}

#' @describeIn ext01_1 Preprocessing
#'
#' @inheritParams gen_args
#' @param paramcd_order (`character`) providing the `PARAMCD` values in the desired order.
#' @param ... not used.
#'
#' @export
#'
ext01_1_pre <- function(adam_db,
                        paramcd_order = c("TNDOSE", "DOSE", "NDOSE", "TDOSE"),
                        ...) {
  checkmate::assert_class(adam_db, "dm")

  db <- adam_db %>%
    dm_zoom_to("adex") %>%
    filter(.data$PARCAT1 == "OVERALL") %>%
    dm_update_zoomed()

  if (nrow(db$adex) > 0L) {
    param_vars <- db$adex %>%
      dplyr::select("PARAM", "PARAMCD") %>%
      dunlin::co_relevels("PARAMCD", "PARAM", paramcd_order)

    db <- db %>%
      dm_zoom_to("adex") %>%
      mutate(PARAM = param_vars$PARAM, PARAMCD = param_vars$PARAMCD) %>%
      dm_update_zoomed()
  }

  db
}

#' EXT01 Table 1 (Default) Exposure Summary Table.
#'
#' The EXT01 table provides an overview of the of the exposure of the
#' patients in terms of Total dose administered or missed, and treatment duration.
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' run(ext01_1, syn_test_data())
ext01_1 <- chevron_tlg(ext01_1_main, ext01_1_lyt, ext01_1_pre, adam_datasets = c("adsl", "adex"))


# ext01_2 ----

#' @describeIn ext01_2 Main TLG function
#'
#' @inheritParams gen_args
#'
#' @details
#'  * Supplementary Exposure table with binning of desired analysis values.
#'  * The `n` row provides the number of non-missing values. The percentages for categorical variables is based on `n`.
#'  The percentages for `Total number of patients with at least one dose modification` are based on the number of
#'  patients in the corresponding analysis population given by `N`.
#'  * Split columns by arm, typically `ACTARM`.
#'  * Does not include a total column by default.
#'  * Sorted by alphabetic order of the `PARAM` value. Transform to factor and re-level for custom order.
#'  * `ANL01FL` is not relevant subset
#'
#' @note
#'   * `adam_db` object must contain an `adex` table with columns specified in `summaryvars`.
#'
#' @export
#'
ext01_2_main <- function(adam_db,
                         lyt_ls = list(ext01_2_lyt),
                         armvar = "ACTARM",
                         lbl_overall = NULL,
                         prune_0 = TRUE,
                         deco = std_deco("EXT01"),
                         ...) {
  summaryvars <- c("AVAL", "AVALCAT1")

  # Provide a clearer error message in the case of missing variable.
  assert_colnames(adam_db$adex, summaryvars)

  lyt <- lyt_ls[[1]](
    armvar = armvar,
    summaryvars = summaryvars,
    summaryvars_lbls = var_labels_for(adam_db$adex, summaryvars),
    lbl_overall = lbl_overall,
    deco = deco,
    ... = ...
  )

  tbl <- build_table(lyt, adam_db$adex, adam_db$adsl)

  if (prune_0) tbl <- smart_prune(tbl)

  tbl
}

#' @describeIn ext01_2 Layout
#'
#' @inheritParams gen_args
#'
#' @param summaryvars (`string`) the name of the variable to be analyzed. By default `"AVAL"`.
#' @param summaryvars_lbls (`string`) the label associated with the analyzed variable.
#' @param ... not used.
#'
#' @export
#'
ext01_2_lyt <- function(armvar ,
                        summaryvars,
                        summaryvars_lbls,
                        lbl_overall,
                        deco = std_deco("EXT01"),
                        ...) {
  basic_table_deco(deco) %>%
    split_cols_by(var = armvar) %>%
    add_colcounts() %>%
    ifneeded_add_overall_col(lbl_overall) %>%
    split_rows_by(
      "PARAM",
      split_fun = NULL
    ) %>%
    summarize_vars(
      vars = summaryvars,
      show_labels = "hidden",
      var_labels = summaryvars_lbls,
      .formats = list(count_fraction = "xx.x (xx.x%)")
    )
}

#' @describeIn ext01_2 Preprocessing
#'
#' @inheritParams gen_args
#' @param show_stats (`vector of character`) providing the name of the parameters whose statistical summary should be
#'   presented. To analyze all, provide `show_stats = "ALL"` (Default), to analyze none, provide `show_stats = ""`.
#'
#' @param show_bins (`vector of character`) providing the name of the parameters whose categorical summary should be
#'   presented. To analyze all, provide `show_bins = "ALL"` (Default), to analyze none, provide `show_bins = ""`.
#' @param ... not used.
#'
#' @export
#'
ext01_2_pre <- function(adam_db,
                        show_stats = c("ALL"),
                        show_bins = c("ALL"),
                        ...) {
  checkmate::assert_class(adam_db, "dm")

  db <- adam_db %>%
    dm_zoom_to("adex") %>%
    filter(.data$PARCAT1 == "OVERALL") %>%
    dm_update_zoomed()

  if (!"ALL" %in% show_stats) {
    db <- db %>%
      dm_zoom_to("adex") %>%
      mutate(AVAL = ifelse(.data$PARAM %in% show_stats, .data$AVAL, NA)) %>%
      dm_update_zoomed()
  }

  if (!"ALL" %in% show_bins) {
    db <- db %>%
      dm_zoom_to("adex") %>%
      mutate(AVALCAT1 = ifelse(.data$PARAM %in% show_bins, .data$AVALCAT1, NA)) %>%
      dm_update_zoomed()
  }

  db
}

#' EXT01 Table 2 (Supplementary) Exposure Summary Table with grouping options
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' run(ext01_2, syn_test_data())
ext01_2 <- chevron_tlg(ext01_2_main, ext01_2_lyt, ext01_2_pre, adam_datasets = c("adsl", "adex"))
