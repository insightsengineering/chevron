#' EXT01 Table 1 (Default) Exposure Summary Table
#'
#' The EXT01 table provides an overview of the of the exposure of the patients in terms of Total dose administered or
#' missed, and treatment duration.
#'
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
#'
#' library(dm)
#'
#' db <- syn_test_data() %>%
#'   preprocess_data("ext01_1")
#'
#' ext01_1(db)
ext01_1 <- function(adam_db,
                    armvar = .study$armvar,
                    summaryvars = "AVAL",
                    lbl_overall = .study$lbl_overall,
                    prune_0 = TRUE,
                    deco = std_deco("EXT01"),
                    .study = list(
                      armvar = "ACTARM",
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

  if (prune_0) tbl <- tbl %>% prune_table()

  tbl
}

#' EXT01 Layout 1 (Default)
#'
#' @describeIn ext01_1
#'
#' @inheritParams gen_args
#'
#' @param summaryvars `(string)` the name of the variable to be analyzed. By default `"AVAL"`.
#' @param summaryvars_lbls `(string)` the label associated with the analyzed variable.
#'
#' @export
#'
ext01_1_lyt <- function(armvar = .study$armvar,
                        summaryvars = .study$analysis_var,
                        summaryvars_lbls = .study$lbl_analysis_var,
                        lbl_overall = .study$lbl_overall,
                        deco = std_deco("EXT01"),
                        .study = list(
                          armvar = "ACTARM",
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


# Version 2 ----

#' EXT01 Table 2 (Supplementary) Exposure Summary Table with grouping options
#'
#' @inheritParams gen_args
#'
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
#' library(dplyr)
#'
#' db <- syn_test_data() %>%
#'   preprocess_data("ext01_2")
#'
#' ext01_2(db)
ext01_2 <- function(adam_db,
                    armvar = .study$armvar,
                    lbl_overall = .study$lbl_overall,
                    prune_0 = TRUE,
                    deco = std_deco("EXT01"),
                    .study = list(
                      armvar = "ACTARM",
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

  if (prune_0) tbl <- tbl %>% prune_table()

  tbl
}


#' EXT01 Layout 2 (Supplementary)
#'
#' @describeIn ext01_2
#'
#' @inheritParams gen_args
#'
#' @param summaryvars (`string`) the name of the variable to be analyzed. By default `"AVAL"`.
#' @param summaryvars_lbls (`string`) the label associated with the analyzed variable.
#'
#' @export
#'
ext01_2_lyt <- function(armvar = .study$armvar,
                        summaryvars = c("AVAL", "AVALCAT1"),
                        summaryvars_lbls = c("Summary", "Categories"),
                        lbl_overall = .study$lbl_overall,
                        deco = std_deco("EXT01"),
                        .study = list(
                          armvar = "ACTARM",
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
