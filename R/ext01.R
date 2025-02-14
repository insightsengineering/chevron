# ext01 ----

#' @describeIn ext01 Main TLG function
#'
#' @inheritParams gen_args
#' @param summaryvars (`character`) variables to be analyzed. The label attribute of the corresponding column in `adex`
#'   table of `adam_db` is used as label.
#' @param map (`data.frame`) of mapping for split rows.
#' @param stats (`list`)
#' @returns the main function returns an `rtables` object.
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
                       lbl_overall = NULL,
                       summaryvars = "AVAL",
                       row_split_var = "PARCAT2",
                       page_var = NULL,
                       map = NULL,
                       stats = list(default = c("n", "mean_sd", "median", "range", "count_fraction")),
                       precision = list(default = 0),
                       ...) {
  assert_all_tablenames(adam_db, c("adsl", "adex"))
  assert_string(arm_var)
  assert_string(lbl_overall, null.ok = TRUE)
  assert_character(summaryvars)
  assert_character(row_split_var, null.ok = TRUE)
  assert_string(page_var, null.ok = TRUE)
  assert_data_frame(map, null.ok = TRUE)
  assert_valid_var_pair(adam_db$adsl, adam_db$adex, arm_var)
  assert_valid_variable(adam_db$adex, "USUBJID", empty_ok = TRUE, types = list(c("character", "factor")))
  assert_valid_variable(adam_db$adsl, c("USUBJID", arm_var), types = list(c("character", "factor")))
  assert_valid_variable(adam_db$adex, summaryvars, empty_ok = TRUE, na_ok = TRUE)
  assert_valid_variable(
    adam_db$adex, c(row_split_var, "PARAMCD", "PARAM"),
    types = list(c("character", "factor")), empty_ok = TRUE
  )
  assert_valid_variable(adam_db$adex, colnames(map), types = list(c("character", "factor")))
  if (!is.null(map)) {
    map <- infer_mapping(map, adam_db$adex)
  }
  assert_subset(page_var, c(row_split_var))

  lbl_overall <- render_safe(lbl_overall)
  summaryvars_lbls <- var_labels_for(adam_db$adex, summaryvars)
  row_split_lbl <- var_labels_for(adam_db$adex, row_split_var)

  lyt <- ext01_lyt(
    arm_var = arm_var,
    lbl_overall = lbl_overall,
    summaryvars = summaryvars,
    summaryvars_lbls = summaryvars_lbls,
    row_split_var = row_split_var,
    row_split_lbl = row_split_lbl,
    page_var = page_var,
    map = map,
    stats = stats,
    precision = precision
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
#' @returns a `PreDataTableLayouts` object.
#'
#' @keywords internal
#'
ext01_lyt <- function(arm_var,
                      lbl_overall,
                      summaryvars,
                      summaryvars_lbls,
                      row_split_var,
                      row_split_lbl,
                      page_var,
                      map,
                      stats = list(default = c("n", "mean_sd", "median", "range", "count_fraction")),
                      precision = list()) {
  page_by <- get_page_by(page_var, c(row_split_var))
  label_pos <- ifelse(page_by, "hidden", "topleft")
  basic_table(show_colcounts = TRUE) %>%
    split_cols_by_with_overall(arm_var, lbl_overall) %>%
    split_rows_by_recursive(
      row_split_var,
      split_label = row_split_lbl, label_pos = label_pos, page_by = page_by
    ) %>%
    split_rows_by(
      "PARAMCD",
      labels_var = "PARAM",
      split_fun = split_fun_map(map)
    ) %>%
    analyze(
      vars = summaryvars,
      var_labels = summaryvars_lbls,
      show_labels = "hidden",
      afun = afun_ext01,
        extra_args = list(
          precision = precision,
          .stats = stats
        ),
      section_div = " "
    )

    # analyze_vars(
    #   vars = summaryvars,
    #   var_labels = summaryvars_lbls,
    #   show_labels = "hidden",
    #   .formats = list(count_fraction = format_count_fraction_fixed_dp)
    # )
}

#' @describeIn ext01 Preprocessing
#'
#' @inheritParams gen_args
#' @returns the preprocessing function returns a `list` of `data.frame`.
#'
#' @export
#'
ext01_pre <- function(adam_db,
                      ...) {
  adam_db$adex <- adam_db$adex %>%
    filter(.data$PARCAT1 == "OVERALL") %>%
    filter(.data$PARAMCD %in% c("TDURD", "TDOSE"))

  adam_db
}

#' @describeIn ext01 Postprocessing
#'
#' @inheritParams gen_args
#' @returns the postprocessing function returns an `rtables` object or an `ElementaryTable` (null report).
#' @export
#'
ext01_post <- function(tlg, prune_0 = TRUE, ...) {
  if (prune_0) tlg <- smart_prune(tlg)
  std_postprocessing(tlg)
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
#'
#' run(ext01, syn_data, summaryvars = c("AVAL", "AVALCAT1"), prune_0 = FALSE)
#'
#' levels(syn_data$adex$AVALCAT1) <- c(levels(syn_data$adex$AVALCAT1), "12 months")
#' map <- data.frame(
#'   PARAMCD = "TDURD",
#'   AVALCAT1 = c("< 1 month", "1 to <3 months", ">=6 months", "3 to <6 months", "12 months")
#' )
#' run(
#'   ext01,
#'   syn_data,
#'   summaryvars = c("AVAL", "AVALCAT1"),
#'   prune_0 = FALSE,
#'   map = map,
#'   precision = list(TDOSE = 4, default = 4),
#'   stats = list(TDURD = "n", default = c("n", "count_fraction"))
#' )
ext01 <- chevron_t(
  main = ext01_main,
  preprocess = ext01_pre,
  postprocess = ext01_post
)


# helper function ----

afun_ext01 <- function(x,
                   .N_col, # nolint
                   .spl_context,
                   precision,
                   .N_row, # nolint
                   .var = NULL,
                   .df_row = NULL,
                   .stats = NULL,
                   .labels = NULL,
                   .indent_mods = NULL,
                   ...) {

  context_parameter <- .spl_context %>%
    filter(split == "PARAMCD") %>%
    pull(value)

  .stats <- .stats[[context_parameter]] %||% .stats[["default"]] %||% c("n", "mean_sd", "median", "range", "count_fraction")

  # Define precision
  pcs <- precision[[context_parameter]] %||% precision[["default"]]
  fmts <- if (is.null(pcs) && length(x) > 0) {
    lapply(.stats, function(.s) format_auto(dt_var = as.numeric(x), x_stat = .s))
  } else {
    # Define an arbitrary precision if unavailable and unable to compute it.
    pcs <- pcs %||% 2
    lapply(.stats, summary_formats, pcs = pcs, ne = NULL)
  }
  names(fmts) <- .stats

  if ("n" %in% .stats) fmts$n <- "xx"
  if ("count_fraction" %in% .stats) fmts$count_fraction <- format_count_fraction_fixed_dp

  tern::a_summary(
    .stats = .stats, .formats = fmts, .labels = .labels, .indent_mods = .indent_mods,
    x = x, .var = .var, .spl_context = .spl_context, .N_col = .N_col, .N_row = .N_row, ...
  )
}


