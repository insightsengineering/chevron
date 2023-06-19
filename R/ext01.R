# ext01 ----

#' @describeIn ext01 Main TLG function
#'
#' @inheritParams gen_args
#' @param summaryvars (`character`) variables to be analyzed. The label attribute of the corresponding column in `adex`
#'   table of `adam_db` is used as label.
#' @param map (`data.frame`) of mapping for split rows.
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
                       arm_var = "ACTARM",
                       summaryvars = "AVAL",
                       row_split_var = "PARCAT2",
                       lbl_overall = NULL,
                       page_var = tail(row_split_var, 1L),
                       map = NULL,
                       ...) {
  assert_all_tablenames(adam_db, c("adsl", "adex"))
  checkmate::assert_string(arm_var)
  checkmate::assert_character(summaryvars)
  checkmate::assert_character(row_split_var, null.ok = TRUE)
  checkmate::assert_data_frame(map, null.ok = TRUE)
  assert_valid_variable(adam_db$adex, colnames(map), types = list(c("character", "factor")))
  if (!is.null(map)) {
    map <- infer_mapping(map, adam_db$adex)
  }
  assert_valid_variable(adam_db$adex, summaryvars, empty_ok = TRUE, na_ok = TRUE)
  assert_valid_variable(
    adam_db$adex, c(row_split_var, "PARAMCD", "PARAM"),
    types = list(c("character", "factor")), empty_ok = TRUE
  )
  checkmate::assert_string(lbl_overall, null.ok = TRUE)
  checkmate::assert_string(page_var)
  checkmate::assert_subset(page_var, c(row_split_var))
  assert_valid_var_pair(adam_db$adsl, adam_db$adex, arm_var)
  assert_valid_variable(adam_db$adex, "USUBJID", empty_ok = TRUE, types = list(c("character", "factor")))
  assert_valid_variable(adam_db$adsl, c("USUBJID", arm_var), types = list(c("character", "factor")))

  summaryvars_lbls <- var_labels_for(adam_db$adex, summaryvars)
  row_split_lbl <- var_labels_for(adam_db$adex, row_split_var)

  lyt <- ext01_lyt(
    arm_var = arm_var,
    summaryvars = summaryvars,
    summaryvars_lbls = summaryvars_lbls,
    row_split_var = row_split_var,
    row_split_lbl = row_split_lbl,
    lbl_overall = lbl_overall,
    page_var = page_var,
    map = map
  )

  tbl <- build_table(lyt, adam_db$adex, adam_db$adsl)

  tbl
}

#' `ext01` Layout
#'
#' @inheritParams gen_args
#'
#' @param summaryvars (`character`) the name of the variable to be analyzed. By default `"AVAL"`.
#' @param summaryvars_lbls (`character`) the label associated with the analyzed variable.
#'
#'
#' @keywords internal
#'
ext01_lyt <- function(arm_var,
                      summaryvars,
                      summaryvars_lbls,
                      row_split_var,
                      row_split_lbl,
                      lbl_overall,
                      page_var,
                      map) {
  page_by <- get_page_by(page_var, c(row_split_var))
  label_pos <- dplyr::if_else(page_by, "hidden", "topleft")
  basic_table(show_colcounts = TRUE) %>%
    split_cols_by(var = arm_var) %>%
    add_colcounts() %>%
    ifneeded_add_overall_col(lbl_overall) %>%
    split_rows_by_recurive(
      row_split_var,
      split_label = row_split_lbl, label_pos = label_pos, page_by = page_by
    ) %>%
    split_rows_by(
      "PARAMCD",
      labels_var = "PARAM",
      split_fun = split_fun_map(map)
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
#' @export
#'
ext01_pre <- function(adam_db,
                      ...) {
  adam_db$adex <- adam_db$adex %>%
    filter(.data$PARCAT1 == "OVERALL") %>%
    filter(.data$PARAMCD %in% c("TNDOSE", "TDOSE", "TDOSINT"))

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

#' `EXT01` Exposure Summary Table.
#'
#' The `EXT01` table provides an overview of the of the exposure of the
#' patients in terms of Total dose administered or missed, and treatment duration.
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' run(ext01, syn_data)
#' run(ext01, syn_data, summaryvars = c("AVAL", "AVALCAT1"), prune_0 = FALSE)
#' levels(syn_data$adex$AVALCAT1) <- c(levels(syn_data$adex$AVALCAT1), "12 months")
#' map <- data.frame(
#'   PARAMCD = "TDURD",
#'   AVALCAT1 = c("< 1 month", "1 to <3 months", ">=6 months", "3 to <6 months", "12 months")
#' )
#' run(ext01, syn_data, summaryvars = c("AVAL", "AVALCAT1"), prune_0 = FALSE, map = map)
ext01 <- chevron_t(
  main = ext01_main,
  preprocess = ext01_pre,
  postprocess = ext01_post
)
