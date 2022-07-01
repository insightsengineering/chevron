# EXT01_1 ----

#' @describeIn ext01_1 `ext01_1` main function
#'
#' EXT01 Table 1 (Default) Exposure Summary Table. The EXT01 table provides an overview of the of the exposure of the
#' patients in terms of Total dose administered or missed, and treatment duration.
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
#'  * `ANL01FL` is not relevant subset
#'
#' @export
#'
#' @examples
#' library(dm)
#'
#' db <- syn_test_data() %>%
#'   ext01_1_pre()
#'
#' ext01_1_main(db)
ext01_1_main <- function(adam_db,
                         armvar = .study$actualarm,
                         summaryvars = "AVAL",
                         lbl_overall = .study$lbl_overall,
                         prune_0 = TRUE,
                         deco = std_deco("EXT01"),
                         .study = list(
                           actualarm = "ACTARM",
                           lbl_overall = NULL
                         )) {
  assert_colnames(adam_db$adex, summaryvars)

  lyt <- ext01_1_lyt(
    armvar = armvar,
    summaryvars = summaryvars,
    summaryvars_lbls = var_labels_for(adam_db$adex, summaryvars),
    lbl_overall = lbl_overall,
    deco = deco
  )

  tbl <- build_table(lyt, adam_db$adex, adam_db$adsl)

  if (prune_0) tbl <- prune_table(tbl)

  tbl
}

#' @describeIn ext01_1 `ext01_1` Layout
#'
#' @inheritParams gen_args
#'
#' @param summaryvars `(string)` the name of the variable to be analyzed. By default `"AVAL"`.
#' @param summaryvars_lbls `(string)` the label associated with the analyzed variable.
#'
#' @export
#'
ext01_1_lyt <- function(armvar = .study$actualarm,
                        summaryvars = .study$analysis_var,
                        summaryvars_lbls = .study$lbl_analysis_var,
                        lbl_overall = .study$lbl_overall,
                        deco = std_deco("EXT01"),
                        .study = list(
                          actualarm = "ACTARM",
                          lbl_overall = NULL,
                          analysis_var = "AVAL",
                          lbl_analysis_var = "Analysis Value"
                        )) {
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

#' @describeIn ext01_1 `ext01_1` Preprocessing
#'
#' @inheritParams gen_args
#' @param paramcd_order (`character`) providing the `PARAMCD` values in the desired order.
#' @param ... not used.
#'
#' @export
#'
#' @examples
#' syn_test_data() %>%
#'   ext01_1_pre()
ext01_1_pre <- function(adam_db,
                        paramcd_order = .study$paramcd_order,
                        .study = list(paramcd_order = c("TNDOSE", "DOSE", "NDOSE", "TDOSE")),
                        ...) {
  checkmate::assert_class(adam_db, "dm")

  db <- adam_db %>%
    dm_zoom_to("adex") %>%
    filter(.data$PARCAT1 == "OVERALL") %>%
    dm_update_zoomed()

  param_vars <- db$adex %>%
    select(.data$PARAM, .data$PARAMCD) %>%
    reorder_levels_params(paramcd_levels = paramcd_order)

  db %>%
    dm_zoom_to("adex") %>%
    mutate(PARAM = param_vars$PARAM, PARAMCD = param_vars$PARAMCD) %>%
    dm_update_zoomed()
}

# `EXT01_1` Pipeline ----

#' `EXT01_1` Pipeline
#'
#' @description `EXT01_1` Pipeline of the class `tlg_pipeline_s4`
#'
#' @format a `tlg_pipeline_s4` object with the following slots:
#'   - `main` the `chevron::ext01_1_main` function.
#'   - `preprocess` the  `chevron::ext01_1_pre` function.
#'   - `postprocess` the identity function.
#'   - `check` no checks.
#'   - `adam_datasets` `"adsl"` and `"adex"`.
#'
#' @export
#'
ext01_1 <- tlg_pipeline_s4(ext01_1_main, ext01_1_pre, adam_datasets = c("adsl", "adex"))

# EXT01_2 ----

#' @describeIn ext01_2 `ext01_2` main function
#'
#' EXT01 Table 2 (Supplementary) Exposure Summary Table with grouping options
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
#' @export
#'
#' @examples
#' library(dm)
#'
#' db <- syn_test_data() %>%
#'   ext01_2_pre()
#'
#' ext01_2_main(db)
ext01_2_main <- function(adam_db,
                         armvar = .study$actualarm,
                         lbl_overall = .study$lbl_overall,
                         prune_0 = TRUE,
                         deco = std_deco("EXT01"),
                         .study = list(
                           actualarm = "ACTARM",
                           lbl_overall = NULL
                         )) {
  summaryvars <- c("AVAL", "AVALCAT1")

  # Provide a clearer error message in the case of missing variable.
  assert_colnames(adam_db$adex, summaryvars)

  lyt <- ext01_2_lyt(
    armvar = armvar,
    summaryvars = summaryvars,
    summaryvars_lbls = var_labels_for(adam_db$adex, summaryvars),
    lbl_overall = lbl_overall,
    deco = deco
  )

  tbl <- build_table(lyt, adam_db$adex, adam_db$adsl)

  if (prune_0) tbl <- prune_table(tbl)

  tbl
}

#' @describeIn ext01_2 `ext01_2` Layout
#'
#' @inheritParams gen_args
#'
#' @param summaryvars (`string`) the name of the variable to be analyzed. By default `"AVAL"`.
#' @param summaryvars_lbls (`string`) the label associated with the analyzed variable.
#'
#' @export
#'
ext01_2_lyt <- function(armvar = .study$actualarm,
                        summaryvars = c("AVAL", "AVALCAT1"),
                        summaryvars_lbls = c("Summary", "Categories"),
                        lbl_overall = .study$lbl_overall,
                        deco = std_deco("EXT01"),
                        .study = list(
                          actualarm = "ACTARM",
                          lbl_overall = NULL
                        )) {
  basic_table_deco(deco) %>%
    split_cols_by(var = armvar) %>%
    add_colcounts() %>%
    ifneeded_add_overall_col(lbl_overall) %>%
    split_rows_by(
      "PARAM",
      split_fun = NULL
    ) %>%
    summarize_vars(vars = summaryvars, show_labels = "hidden", var_labels = summaryvars_lbls)
}

#' @describeIn ext01_2 `ext01_2` Preprocessing
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
#' @examples
#' syn_test_data() %>%
#'   ext01_2_pre()
ext01_2_pre <- function(adam_db,
                        show_stats = .study$show_cont_stats,
                        show_bins = .study$show_cat_stats,
                        .study = list(
                          show_cont_stats = c("ALL"),
                          show_cat_stats = c("ALL")
                        ),
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

# `EXT01_2` Pipeline ----

#' `EXT01_2` Pipeline
#'
#' @description `EXT01_2` Pipeline of the class `tlg_pipeline_s4`
#'
#' @format a `tlg_pipeline_s4` object with the following slots:
#'   - `main` the `chevron::ext01_2_main` function.
#'   - `preprocess` the  `chevron::ext01_2_pre` function.
#'   - `postprocess` the identity function.
#'   - `check` no checks.
#'   - `adam_datasets` `"adsl"` and `"adex"`.
#'
#' @export
#'
ext01_2 <- tlg_pipeline_s4(ext01_2_main, ext01_2_pre, adam_datasets = c("adsl", "adex"))
