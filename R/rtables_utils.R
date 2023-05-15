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

get_sort_path <- function(x) {
  checkmate::assert_character(x, null.ok = TRUE)
  x2 <- as.character(rbind(x, rep("*", length(x))))
  x2[-length(x2)]
}

tlg_sort_by_vars <- function(tlg, vars, scorefun = cont_n_allcols, ...) {
  purrr::reduce(
    .x = lapply(seq_len(length(vars)), function(i) vars[seq_len(i)]),
    .f = tlg_sort_by_var,
    .init = tlg,
    scorefun = scorefun,
    ...
  )
}

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

valid_sort_at_path <- function(tt, path, scorefun, ...) {
  if (valid_row_path(tt, path)) {
    sort_at_path(tt, path, scorefun, ...)
  } else {
    tt
  }
}

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
#' @param lyt (`PreDataTableLayouts`) rtable layout.
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

score_all_sum <- function(tt) {
  cleaf <- collect_leaves(tt)[[1]]
  if (NROW(cleaf) == 0) {
    stop("score_all_sum score function used at subtable [", obj_name(tt), "] that has no content.")
  }
  sum(sapply(row_values(cleaf), function(cv) cv[1]))
}
