#' @keywords internal
split_and_summ_num_patients <- function(lyt, var, label, stats, summarize_labels, split_indent, section_div, ...) {
  assert_string(var)
  assert_string(label)
  lyt <- lyt %>%
    split_rows_by(
      var,
      child_labels = "visible",
      nested = TRUE,
      split_fun = rtables::drop_split_levels,
      label_pos = "topleft",
      split_label = label,
      indent_mod = split_indent,
      section_div = section_div
    )
  if (length(stats) > 0) {
    lyt <- lyt %>%
      summarize_num_patients(
        var = "USUBJID",
        .stats = stats,
        .labels = setNames(summarize_labels, stats),
        ...
      )
  }

  lyt
}

#' @keywords internal
get_sort_path <- function(x) {
  assert_character(x, null.ok = TRUE)
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
  assert_character(var)
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
    tryCatch(
      sort_at_path(tt, path, scorefun, ...),
      error = function(e) {
        tt
      }
    )
  } else {
    tt
  }
}

#' @keywords internal
valid_row_path <- function(tlg, row_path) {
  if (nrow(tlg) == 0) {
    return(TRUE)
  }
  rpaths <- lapply(row_paths(tlg), unname)
  non_star <- which(row_path != "*") + 1
  rpaths_choice <- unique(lapply(rpaths, `[`, non_star))
  any(vapply(rpaths_choice, identical, FUN.VALUE = TRUE, y = row_path[non_star - 1]))
}

#' Count patients recursively
#'
#' @param lyt (`PreDataTableLayouts`) `rtable` layout.
#' @param anl_vars Named (`list`) of analysis variables.
#' @param anl_lbls (`character`) of labels.
#' @param lbl_vars Named (`list`) of analysis labels.
#'
#' @keywords internal
count_patients_recursive <- function(lyt, anl_vars, anl_lbls, lbl_vars) {
  assert_list(anl_vars, names = "unique", types = "character")
  assert_character(anl_lbls, min.chars = 1L, len = length(anl_vars))
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
#'
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
#'
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
#'
#' @param lyt (`PreDataTableLayouts`) `rtable` layout.
#' @param var (`string`) of analysis variable.
#' @param level (`string`) level to be displayed.
#' @param detail_vars (`character`) of variables for detail information.
#'
#' @keywords internal
count_or_summarize <- function(lyt, var, level, detail_vars, indent_mod = 0L, ...) {
  assert_string(level)
  if (is.null(detail_vars)) {
    lyt <- lyt %>%
      count_values(
        var,
        values = level,
        table_names = paste(var, level, sep = "_"),
        .formats = list(count_fraction = format_count_fraction_fixed_dp),
        .indent_mods = indent_mod,
        var_labels = paste0(c(var, " variable")),
        parent_name = paste(var, level, sep = "_"),
        ...
      )
  } else {
    lyt <- lyt %>%
      split_rows_by(var,
        split_fun = keep_split_levels(level),
        parent_name = paste(var, level, sep = "_"), indent_mod = indent_mod
      ) %>%
      summarize_row_groups(
        format = format_count_fraction_fixed_dp
      ) %>%
      split_rows_by_recursive(detail_vars[-length(detail_vars)],
        split_fun = drop_split_levels,
        parent_name = paste(var, level, sep = "_")
      ) %>%
      analyze_vars(
        detail_vars[length(detail_vars)],
        .stats = "count_fraction",
        denom = "N_col",
        show_labels = "hidden",
        .formats = list(count_fraction = format_count_fraction_fixed_dp),
        table_names = paste(var, level, length(detail_vars), sep = "_"),
        parent_names = paste(var, level, length(detail_vars), sep = "_"),
        ...
      )
  }
  lyt
}

#' Count or summarize by groups
#'
#' @param lyt (`PreDataTableLayouts`) `rtable` layout.
#' @param row_split_var (`character`) variable to split rows by.
#' @param ... Further arguments for `split_rows_by`
#'
#' @keywords internal
split_rows_by_recursive <- function(lyt, row_split_var, ...) {
  args <- list(...)
  for (i in seq_len(length(row_split_var))) {
    args_i <- lapply(args, obtain_value, index = i)
    lyt <- do_call(
      split_rows_by,
      c(
        list(
          lyt = lyt,
          var = row_split_var
        ),
        args_i
      )
    )
  }

  lyt
}

#' Obtain value from a vector
#'
#' @keywords internal
obtain_value <- function(obj, index) {
  if (is.list(obj)) {
    return(obj[[index]])
  }
  if (is.vector(obj) && length(obj) >= index) {
    return(obj[index])
  }
  obj
}

#' Get page by value
#'
#' @keywords internal
get_page_by <- function(var, vars) {
  assert_character(vars, null.ok = TRUE)
  assert_character(var, null.ok = TRUE, max.len = 1L)
  ret <- rep(FALSE, length(vars))
  if (is.null(var) || length(var) == 0) {
    return(ret)
  }
  index <- match(var, vars)
  assert_int(index, na.ok = TRUE)
  if (is.na(index)) {
    return(ret)
  }
  ret[seq_len(index)] <- TRUE
  ret
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
#' @returns `PreDataTableLayouts` object.
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
#' @returns `rtables` object.
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

#' Count Children
#'
#' @keywords internal
count_children <- function(x) {
  assert_true(rtables::is_rtable(x))
  if (is(x, "ElementaryTable")) {
    return(length(x@children))
  }
  sum(vapply(
    tree_children(x),
    count_children,
    FUN.VALUE = 0
  ))
}

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

split_cols_by_with_overall <- function(lyt, col_var, lbl_overall, ref_group = NULL) {
  if (is.null(col_var)) {
    lyt
  } else {
    split_cols_by(
      lyt, col_var,
      split_fun = if (!is.null(lbl_overall) && !identical(lbl_overall, "")) {
        add_overall_level(lbl_overall, first = FALSE)
      },
      ref_group = ref_group
    )
  }
}

#' Analyze skip baseline
#'
#' @param x value to analyze
#' @param .var variable name.
#' @param .spl_context split context.
#' @param paramcdvar (`string`) name of parameter code.
#' @param visitvar (`string`) name of the visit variable.
#' @param skip Named (`character`) indicating the pairs to skip in analyze.
#' @param .stats (`character`) See `tern::analyze_variables`.
#' @param .labels (`character`) See `tern::analyze_variables`.
#' @param .indent_mods (`integer`) See `tern::analyze_variables`.
#' @param .N_col (`int`) See `tern::analyze_variables`.
#' @param .N_row (`int`) See `tern::analyze_variables`.
#' @param ... additional arguments for `tern::a_summary`.
#' @inheritParams cfbt01_main
#'
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

  fmts <- lapply(.stats, summary_formats, pcs = pcs, ne = NULL)
  names(fmts) <- .stats
  fmts_na <- lapply(.stats, summary_formats, pcs = pcs, ne = tern::default_na_str())
  ret <- tern::a_summary(
    .stats = .stats, .formats = fmts, .labels = .labels, .indent_mods = .indent_mods,
    x = x, .var = .var, .spl_context = .spl_context, .N_col = .N_col, .N_row = .N_row, ...
  )
  for (i in seq_len(length(ret))) {
    attr(ret[[i]], "format_na_str") <- fmts_na[[i]]()
  }

  ret
}

summary_formats <- function(x, pcs, ne = NULL) {
  assert_int(pcs, lower = 0, na.ok = TRUE)
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

#' Analyze with defined precision
#'
#' @param x value to analyze
#' @param .var variable name.
#' @param .spl_context split context.
#' @param precision (named `list` of `integer`) where names of columns found in `.df_row` and the values indicate the
#'   number of digits in statistics for numeric value. If `default` is set, and parameter precision not specified, the
#'   value for `default` will be used. If neither are provided, auto determination is used. See [`tern::format_auto`].
#' @param .stats (named `list` of character)  where names of columns found in `.df_row` and the values indicate the
#'   statistical analysis to perform. If `default` is set, and parameter precision not specified, the
#'   value for `default` will be used.
#' @param .labels (`character`) See `tern::analyze_variables`.
#' @param .indent_mods (`integer`) See `tern::analyze_variables`.
#' @param .N_col (`int`) See `tern::analyze_variables`.
#' @param .N_row (`int`) See `tern::analyze_variables`.
#' @param ... additional arguments for `tern::a_summary`.
#'
#' @keywords internal
afun_p <- function(x,
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
  .stats <- .stats[[.var]] %||% .stats[["default"]] %||% c("n", "mean_sd", "median", "range", "count_fraction")

  # Define precision
  pcs <- precision[[.var]] %||% precision[["default"]]
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

split_fun_map <- function(map) {
  if (is.null(map)) {
    drop_split_levels
  } else {
    trim_levels_to_map(map = map)
  }
}

infer_mapping <- function(map_df, df) {
  assert_data_frame(df)
  vars <- colnames(map_df)
  assert_names(names(df), must.include = vars)
  for (x in vars) {
    if (!test_subset(map_df[[x]], lvls(df[[x]]))) {
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


#' Occurrence Layout
#'
#' @inheritParams gen_args
#' @inheritParams cmt01a_main
#' @param lbl_medname_var (`string`) label for the variable defining the medication name.
#'
#' @keywords internal
occurrence_lyt <- function(arm_var,
                           lbl_overall,
                           row_split_var,
                           lbl_row_split,
                           medname_var,
                           lbl_medname_var,
                           summary_labels,
                           count_by) {
  split_indent <- vapply(c("TOTAL", row_split_var), function(x) {
    if (length(summary_labels[[x]]) > 0L) -1L else 0L
  }, FUN.VALUE = 0L)
  split_indent[1L] <- 0L
  lyt <- basic_table(show_colcounts = TRUE) %>%
    split_cols_by_with_overall(arm_var, lbl_overall)

  if (length(summary_labels$TOTAL) > 0) {
    lyt <- lyt %>%
      analyze_num_patients(
        vars = "USUBJID",
        count_by = count_by,
        .stats = names(summary_labels$TOTAL),
        show_labels = "hidden",
        .labels = render_safe(summary_labels$TOTAL)
      )
  }
  section_divs <- get_section_div()
  for (k in seq_len(length(row_split_var))) {
    lyt <- split_and_summ_num_patients(
      lyt = lyt,
      count_by = count_by,
      var = row_split_var[k],
      label = lbl_row_split[k],
      split_indent = split_indent[k],
      stats = names(summary_labels[[row_split_var[k]]]),
      summarize_labels = render_safe(summary_labels[[row_split_var[k]]]),
      section_div = section_divs[k]
    )
  }

  lyt %>%
    count_occurrences(
      vars = medname_var,
      drop = length(row_split_var) > 0,
      .indent_mods = unname(tail(split_indent, 1L))
    ) %>%
    append_topleft(paste0(stringr::str_dup(" ", 2 * length(row_split_var)), lbl_medname_var))
}
