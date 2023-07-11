#' @keywords internal
split_and_summ_num_patients <- function(lyt, var, label, stats, summarize_labels, ...) {
  checkmate::assert_string(var)
  checkmate::assert_string(label)
  lyt %>%
    split_rows_by(
      var,
      child_labels = "visible",
      nested = TRUE,
      split_fun = rtables::drop_split_levels,
      label_pos = "topleft",
      split_label = label
    ) %>%
    summarize_num_patients(
      var = "USUBJID",
      .stats = stats,
      .labels = setNames(summarize_labels, stats),
      ...
    )
}
#' @keywords internal
get_sort_path <- function(x) {
  checkmate::assert_character(x, null.ok = TRUE)
  x2 <- as.character(rbind(x, rep("*", length(x))))
  x2[-length(x2)]
}
#' @keywords internal
tlg_sort_by_vars <- function(tlg, vars, scorefun = cont_n_allcols, ...) {
  purrr::reduce(
    .x = lapply(seq_len(length(vars)), function(i) vars[seq_len(i)]),
    .f = tlg_sort_by_var,
    .init = tlg,
    scorefun = scorefun,
    ...
  )
}
#' @keywords internal
tlg_sort_by_var <- function(tlg, var, scorefun = cont_n_allcols, ...) {
  checkmate::assert_character(var)
  if (length(var) == 0) {
    return(tlg)
  }
  var_path <- get_sort_path(var)
  tlg %>%
    valid_sort_at_path(
      path = var_path,
      scorefun = scorefun,
      ...
    )
}
#' @keywords internal
valid_sort_at_path <- function(tt, path, scorefun, ...) {
  if (valid_row_path(tt, path)) {
    sort_at_path(tt, path, scorefun, ...)
  } else {
    tt
  }
}
#' @keywords internal
valid_row_path <- function(tlg, row_path) {
  if (nrow(tlg) == 0) {
    return(TRUE)
  }
  rpaths <- row_paths(tlg)
  non_star <- which(row_path != "*") + 1
  rpaths_choice <- unique(lapply(rpaths, `[`, non_star))
  any(vapply(rpaths_choice, identical, FUN.VALUE = TRUE, y = row_path[non_star - 1]))
}

#' Count patients recursively
#' @param lyt (`PreDataTableLayouts`) `rtable` layout.
#' @param anl_vars Named (`list`) of analysis variables.
#' @param anl_lbls (`character`) of labels.
#' @param lbl_vars Named (`list`) of analysis labels.
#' @keywords internal
count_patients_recursive <- function(lyt, anl_vars, anl_lbls, lbl_vars) {
  checkmate::assert_list(anl_vars, names = "unique", types = "character")
  checkmate::assert_character(anl_lbls, min.chars = 1L, len = length(anl_vars))
  nms <- names(anl_vars)
  for (k in seq_len(length(anl_vars))) {
    lyt <- lyt %>%
      count_patients_with_flags(
        var = "USUBJID",
        flag_variables = setNames(lbl_vars[[k]], anl_vars[[k]]),
        denom = "N_col",
        var_labels = anl_lbls[k],
        show_labels = "visible",
        table_names = nms[k],
        .indent_mods = 0L
      )
  }
  lyt
}
#' @keywords internal
score_all_sum <- function(tt) {
  cleaf <- collect_leaves(tt)[[1]]
  if (NROW(cleaf) == 0) {
    stop("score_all_sum score function used at subtable [", obj_name(tt), "] that has no content.")
  }
  sum(sapply(row_values(cleaf), function(cv) cv[1]))
}
#' @keywords internal
summarize_row <- function(lyt, vars, afun, ...) {
  summarize_row_groups(lyt = lyt, var = vars, cfun = afun, ...)
}

#' Summary factor allowing NA
#' @param x (`factor`) input.
#' @param denom (`string`) denominator choice.
#' @param .N_row (`integer`) number of rows in row-split dataset.
#' @param .N_col (`integer`) number of rows in column-split dataset.
#' @param ... Not used
#' @keywords internal
s_summary_na <- function(x, labelstr, denom = c("n", "N_row", "N_col"), .N_row, .N_col, ...) { # nolint
  denom <- match.arg(denom)
  y <- list()
  y$n <- length(x)
  y$count <- as.list(table(x, useNA = "no"))
  dn <- switch(denom,
    n = length(x),
    N_row = .N_row,
    N_col = .N_col
  )
  y$count_fraction <- lapply(y$count, function(x) {
    c(x, ifelse(dn > 0, x / dn, 0))
  })
  y$n_blq <- sum(grepl("BLQ|LTR|<[1-9]", x))
  y
}
#' Summarize variables allow `NA`
#' @keywords internal
summarize_vars_allow_na <- function(
    lyt, vars, var_labels = vars,
    nested = TRUE, ..., show_labels = "default", table_names = vars,
    section_div = NA_character_, .stats = c("n", "count_fraction"),
    .formats = list(count_fraction = format_count_fraction_fixed_dp), .labels = NULL, .indent_mods = NULL, inclNAs = TRUE) { # nolint
  afun <- make_afun(s_summary_na, .stats, .formats, .labels, .indent_mods, .ungroup_stats = c("count_fraction"))
  analyze(
    lyt = lyt, vars = vars, var_labels = var_labels,
    afun = afun, nested = nested, extra_args = list(...),
    inclNAs = inclNAs, show_labels = show_labels, table_names = table_names,
    section_div = section_div
  )
}

#' Count or summarize by groups
#' @param lyt (`PreDataTableLayouts`) `rtable` layout.
#' @param var (`string`) of analysis variable.
#' @param level (`string`) level to be displayed.
#' @param detail_vars (`character`) of variables for detail information.
#' @keywords internal
count_or_summarize <- function(lyt, var, level, detail_vars, indent_mod = 0L, ...) {
  checkmate::assert_string(level)
  if (is.null(detail_vars)) {
    lyt <- lyt %>%
      count_values(
        var,
        values = level,
        table_names = paste(var, level, sep = "_"),
        .formats = list(count_fraction = format_count_fraction_fixed_dp),
        .indent_mods = indent_mod,
        ...
      )
  } else {
    lyt <- lyt %>%
      split_rows_by(var, split_fun = keep_split_levels(level), indent_mod = indent_mod) %>%
      summarize_row_groups(
        format = format_count_fraction_fixed_dp
      ) %>%
      split_rows_by_recurive(detail_vars[-length(detail_vars)], split_fun = drop_split_levels) %>%
      summarize_vars(
        detail_vars[length(detail_vars)],
        .stats = "count_fraction",
        denom = "N_col",
        show_labels = "hidden",
        .formats = list(count_fraction = format_count_fraction_fixed_dp),
        ...
      )
  }
  lyt
}

#' Count or summarize by groups
#' @param lyt (`PreDataTableLayouts`) `rtable` layout.
#' @param row_split_var (`character`) variable to split rows by.
#' @param ... Further arguments for `split_rows_by`
#' @keywords internal
split_rows_by_recurive <- function(lyt, row_split_var, ...) {
  args <- list(...)
  for (i in seq_len(length(row_split_var))) {
    args_i <- lapply(args, obtain_value, index = i)
    lyt <- do_call(
      split_rows_by,
      c(
        list(
          lyt = lyt,
          row_split_var
        ),
        args_i
      )
    )
  }
  lyt
}

#' Obtain value from a vector
#' @keywords internal
obtain_value <- function(obj, index) {
  if (is.list(obj)) {
    return(obj[[index]])
  }
  if (is.vector(obj) && length(obj) >= index) {
    return(obj[index])
  }
  return(obj)
}

#' Get page by value
#' @keywords internal
get_page_by <- function(var, vars) {
  checkmate::assert_character(vars, null.ok = TRUE)
  checkmate::assert_character(var, null.ok = TRUE, max.len = 1L)
  ret <- rep(FALSE, length(vars))
  if (is.null(var) || length(var) == 0) {
    return(ret)
  }
  index <- match(var, vars)
  checkmate::assert_int(index, na.ok = TRUE)
  if (is.na(index)) {
    return(ret)
  }
  ret[seq_len(index)] <- TRUE
  return(ret)
}

#' Proportion layout
#'
#' @inheritParams rspt01_main
#' @param lyt layout created by `rtables`
#'
#' @keywords internal
proportion_lyt <- function(lyt, arm_var, methods, strata, conf_level, odds_ratio = TRUE, rsp_var = "IS_RSP") {
  non_stratified <- length(strata) == 0L
  lyt <- lyt %>%
    estimate_proportion_diff(
      vars = rsp_var,
      show_labels = "visible",
      var_labels = if (non_stratified) "Unstratified Analysis" else "Stratified Analysis",
      conf_level = conf_level,
      method = if (non_stratified) {
        methods[["diff_conf_method"]] %||% "waldcc"
      } else {
        methods[["strat_diff_conf_method"]] %||% "cmh"
      },
      variables = list(strata = strata),
      table_names = if (non_stratified) "est_prop_diff" else "est_prop_diff_strat"
    ) %>%
    test_proportion_diff(
      vars = rsp_var,
      method = if (non_stratified) {
        methods[["diff_pval_method"]] %||% "chisq"
      } else {
        methods[["strat_diff_pval_method"]] %||% "cmh"
      },
      variables = list(strata = strata),
      table_names = if (non_stratified) "test_prop_diff" else "test_prop_diff_strat"
    )

  if (odds_ratio) {
    lyt <- lyt %>%
      estimate_odds_ratio(
        vars = rsp_var,
        variables = if (non_stratified) list(strata = strata, arm = arm_var),
        table_names = if (non_stratified) "est_or" else "est_or_strat"
      )
  }

  lyt
}

#' Helper function to add a row split if specified
#'
#' @param lyt (`PreDataTableLayouts`) object.
#' @param var (`string`) the name of the variable initiating a new row split.
#' @param lbl_var (`string`)the label of the variable `var`.
#'
#' @keywords internal
#'
#' @return `PreDataTableLayouts` object.
#'
ifneeded_split_row <- function(lyt, var, lbl_var) {
  if (is.null(var)) {
    lyt
  } else {
    split_rows_by(lyt, var,
      label_pos = "topleft",
      split_label = lbl_var
    )
  }
}

#' Helper function to add a column split if specified
#'
#' @param lyt (`rtables`) object.
#' @param var (`string`) the name of the variable initiating a new column split.
#' @param ... Additional arguments for `split_cols_by`.
#'
#' @keywords internal
#'
#' @return `rtables` object.
#'
ifneeded_split_col <- function(lyt, var, ...) {
  if (is.null(var)) {
    lyt
  } else {
    split_cols_by(
      lyt = lyt,
      var = var,
      ...
    )
  }
}

#' Create a Null Report
#' @rdname report_null
#' @aliases null_report
#' @param tlg (`TableTree`) object.
#' @param ... not used. Important to be used directly as post processing function.
#'
#' @export
#'
#' @return original `TableTree` or a null report if no observation are found in the table.
#'
report_null <- function(tlg, ...) {
  checkmate::assert_true(is.null(tlg) || rtables::is_rtable(tlg))

  if (is.null(tlg) || nrow(tlg) == 0L) {
    null_report
  } else {
    tlg
  }
}

#' @export
#' @rdname report_null
null_report <- rtables::rtable(
  header = "",
  rrow("", "Null Report: No observations met the reporting criteria for inclusion in this output.")
)

#' @export
#' @rdname report_null
null_listing <- rlistings::as_listing(
  df = data.frame(x = formatters::with_label(
    "Null Report: No observations met the reporting criteria for inclusion in this output.", ""
  ))
)

has_overall_col <- function(lbl_overall) {
  !is.null(lbl_overall) && !identical(lbl_overall, "")
}

ifneeded_add_overall_col <- function(lyt, lbl_overall) {
  if (has_overall_col(lbl_overall)) {
    add_overall_col(lyt, label = lbl_overall)
  } else {
    lyt
  }
}

#' Analyze skip baseline
#' @param x value to analyze
#' @param .var variable name.
#' @param .spl_context split context.
#' @param paramcdvar (`string`) name of parameter code.
#' @param visitvar (`string`) name of the visit variable.
#' @param skip Named (`character`) indicating the pairs to skip in analyze.
#' @param .stats (`character`) See `tern::summarize_variables`.
#' @param .label (`character`) See `tern::summarize_variables`.
#' @param .indent_mods (`integer`) See `tern::summarize_variables`.
#' @param .N_col (`int`) See `tern::summarize_variables`.
#' @param .N_row (`int`) See `tern::summarize_variables`.
#' @param ... additional arguments for `tern::create_afun_summary`.
#' @inheritParams cfbt01_main
#' @keywords internal
afun_skip <- function(
    x, .var, .spl_context, paramcdvar, visitvar, skip,
    precision, .stats, .labels = NULL, .indent_mods = NULL, .N_col, .N_row, ...) { # nolint
  param_val <- .spl_context$value[which(.spl_context$split == paramcdvar)]
  # Identify context
  split_level <- .spl_context$value[which(.spl_context$split == visitvar)]
  pcs <- if (.var %in% names(skip) && split_level %in% skip[[.var]]) {
    NA
  } else {
    precision[[param_val]] %||% precision[["default"]] %||% 2
  }

  fmts <- lapply(.stats, summary_formats, pcs = pcs, FALSE)
  names(fmts) <- .stats
  fmts_na <- lapply(.stats, summary_formats, pcs = pcs, ne = TRUE)
  ret <- tern::create_afun_summary(
    .stats, fmts, .labels, .indent_mods
  )(x = x, .var = .var, .spl_context = .spl_context, .N_col = .N_col, .N_row = .N_row, ...)
  for (i in seq_len(length(ret))) {
    attr(ret[[i]], "format_na_str") <- fmts_na[[i]]()
  }
  ret
}

summary_formats <- function(x, pcs, ne = FALSE) {
  checkmate::assert_int(pcs, lower = 0, na.ok = TRUE)
  switch(x,
    n = h_format_dec(format = "%s", digits = pcs - pcs, ne = ne),
    min = ,
    max = ,
    sum = h_format_dec(format = "%s", digits = pcs, ne = ne),
    mean = ,
    sd = ,
    median = ,
    mad = ,
    iqr = ,
    cv = ,
    geom_mean = ,
    geom_cv = ,
    se = h_format_dec(format = "%s", digits = pcs + 1, ne = ne),
    mean_sd = ,
    mean_se = h_format_dec(format = "%s (%s)", digits = rep(pcs + 1, 2), ne = ne),
    mean_ci = ,
    mean_sei = ,
    median_ci = ,
    mean_sdi = h_format_dec(format = "(%s, %s)", digits = rep(pcs + 1, 2), ne = ne),
    mean_pval = h_format_dec(format = "%s", digits = 2, ne = ne),
    quantiles = h_format_dec(format = "(%s - %s)", digits = rep(pcs + 1, 2), ne = ne),
    range = h_format_dec(format = "%s - %s", digits = rep(pcs, 2), ne = ne),
    median_range = h_format_dec(format = "%s (%s - %s)", digits = c(pcs, pcs + 1, pcs + 1), ne = ne)
  )
}

split_fun_map <- function(map) {
  if (is.null(map)) {
    drop_split_levels
  } else {
    trim_levels_to_map(map = map)
  }
}

infer_mapping <- function(map_df, df) {
  checkmate::assert_data_frame(df)
  vars <- colnames(map_df)
  checkmate::assert_names(names(df), must.include = vars)
  for (x in vars) {
    if (!checkmate::test_subset(map_df[[x]], lvls(df[[x]]))) {
      rlang::abort(
        paste0(
          "Provided map should only contain valid levels in dataset in variable ", x,
          ". Consider convert ", x, " to factor first and add",
          toString(setdiff(map_df[[x]], lvls(df[[x]]))), "levels to it."
        )
      )
    }
  }
  res <- df[vars] %>%
    unique() %>%
    arrange(across(everything())) %>%
    mutate(across(everything(), as.character))
  if (!is.null(map_df)) {
    dplyr::full_join(map_df, res, by = colnames(map_df))[vars]
  } else {
    res
  }
}