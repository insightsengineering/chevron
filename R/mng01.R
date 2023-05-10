# mng01 ----

#' @describeIn mng01 Main TLG Function
#'
#' @details
#'  * No overall value.
#'  * Preprocessing filters for `ANL01FL` in the selected data set.
#'
#' @inheritParams gen_args
#' @param dataset (`string`) the name of a table in the `adam_db` object.
#' @param x_var (`string`) the name of a column in the `dataset` to represent on the x-axis.
#' @param y_var (`string`) the name of the variable to be represented on the y-axis.
#' @param y_name (`string`) the variable name for `y`. Used for plot's subtitle.
#' @param y_unit (`string`) the name of the variable with the units of `y`. Used for plot's subtitle. if `NULL`, only
#'   `y_name` is displayed as subtitle.
#' @param center_fun (`string`) the function to compute the estimate value.
#' @param interval_fun (`string`) the function defining the crossbar range.
#' @param show_table (`flag`) should the summary statistic table be displayed.
#' @param show_n (`flag`) should the number of observation be displayed int the table.
#' @param jitter (`flag`) should data point be slightly spread on the x-axis.
#' @param show_h_grid (`flag`) should horizontal grid be displayed.
#' @param show_v_grid (`flag`) should vertical grid be displayed.
#' @param legend_pos (`string`) the position of the legend.
#' @param line_col (`list`) describing the colors to use for the lines or a named `list` associating values of `arm_var`
#'   with color names.
#'
#' @note
#'  * `adam_db` object must contain the table specified by `dataset` with the columns specified by `x_var`, `y_var`,
#'  `y_name`, `y_unit` and `arm_var`.
#'
#' @return a list of `ggplot` objects.
#' @export
mng01_main <- function(adam_db,
                       dataset = "adlb",
                       x_var = "AVISIT",
                       y_var = "AVAL",
                       y_name = "PARAM",
                       y_unit = NULL,
                       arm_var = "ACTARM",
                       center_fun = "mean",
                       interval_fun = "mean_ci",
                       show_table = TRUE,
                       jitter = TRUE,
                       show_n = TRUE,
                       show_h_grid = TRUE,
                       show_v_grid = FALSE,
                       legend_pos = "top",
                       line_col = as.list(nestcolor::color_palette()),
                       ...) {
  assert_all_tablenames(adam_db, c(dataset, "adsl"))
  checkmate::assert_character(x_var)
  checkmate::assert_string(y_var)
  checkmate::assert_string(y_name)
  checkmate::assert_string(y_unit, null.ok = TRUE)
  checkmate::assert_string(arm_var)
  checkmate::assert_string(center_fun)
  checkmate::assert_string(interval_fun)
  checkmate::assert_names(center_fun, subset.of = c("mean", "median"))
  checkmate::assert_names(interval_fun, subset.of = c("mean_ci", "mean_sei", "mean_sdi", "median_ci", "quantiles", "range"))
  checkmate::assert_flag(show_table)
  checkmate::assert_flag(jitter)
  checkmate::assert_flag(show_n)
  checkmate::assert_flag(show_h_grid)
  checkmate::assert_flag(show_v_grid)
  checkmate::assert_names(legend_pos, subset.of = c("top", "bottom", "right", "left"))
  checkmate::assert_list(line_col, types = "character", null.ok = TRUE)
  assert_valid_variable(adam_db[[dataset]], c(x_var, y_var, y_unit, arm_var))
  assert_valid_variable(adam_db[[dataset]], arm_var)
  assert_valid_variable(adam_db$adsl, c("USUBJID", arm_var))
  assert_valid_variable(adam_db[[dataset]], "USUBJID", empty_ok = TRUE)
  assert_valid_var_pair(adam_db$adsl, adam_db[[dataset]], arm_var)

  df <- adam_db[[dataset]]
  line_col <- unlist(line_col)

  data_ls <- split(df, df$PARAM, drop = TRUE)
  x_var <- paste(x_var, collapse = "_")

  interval_title <- switch(interval_fun,
    "mean_ci" = "95% Confidence Intervals",
    "mean_sei" = "Standard Error",
    "mean_sdi" = "Standard Deviation",
    "median_ci" = "95% Confidence Intervals",
    "quantiles" = "Interquatile Range",
    "range" = "Min-Max Range"
  )

  title <- paste0(
    "Plot of ",
    center_fun,
    " and ",
    interval_title,
    " by ",
    var_labels_for(df, x_var)
  )

  whiskers_fun <- switch(interval_fun,
    "mean_ci" = c("mean_ci_lwr", "mean_ci_upr"),
    "mean_sei" = c("mean_sei_lwr", "mean_sei_upr"),
    "mean_sdi" = c("mean_sdi_lwr", "mean_sdi_upr"),
    "median_ci" = c("median_ci_lwr", "median_ci_upr"),
    "quantiles" = c("quantiles_0.25", "quantile_0.75"),
    "range" = c("min", "max")
  )

  y_unit <- if(is.null(y_unit)) NA else y_unit
  variables <- c(
    x = x_var,
    y = y_var,
    strata = arm_var,
    paramcd = y_name,
    y_unit = y_unit
  )

  n_func <- if (show_n) "n" else NULL

  table <- if (show_table) c(n_func, center_fun, interval_fun) else NULL

  ggtheme <- ggplot2::theme_bw() +
    ggplot2::theme(legend.position = legend_pos) +
    ggplot2::theme(axis.title.x = ggplot2::element_blank())

  ggtheme <- if (!show_v_grid) {
    ggtheme + ggplot2::theme(panel.grid.major.x = ggplot2::element_blank())
  } else {
    ggtheme + ggplot2::theme(panel.grid.major.x = ggplot2::element_line(linewidth = 1))
  }

  ggtheme <- if (!show_h_grid) {
    ggtheme + ggplot2::theme(
      panel.grid.minor.y = ggplot2::element_blank(),
      panel.grid.major.y = ggplot2::element_blank()
    )
  } else {
    ggtheme + ggplot2::theme(
      panel.grid.minor.y = ggplot2::element_line(linewidth = 1),
      panel.grid.major.y = ggplot2::element_line(linewidth = 1)
    )
  }

  if (!is.null(names(line_col))) {
    color_lvl <- sort(unique(df[[arm_var]]))
    col <- line_col[as.character(color_lvl)]

    if (anyNA(col)) {
      missing_col <- setdiff(color_lvl, names(col))
      stop(paste("Missing color matching for", toString(missing_col)))
    }

    col <- unname(col)
  } else {
    col <- line_col
  }

  ret <- lapply(
    data_ls,
    tern::g_lineplot,
    alt_count = adam_db[["adsl"]],
    variables = variables,
    mid = center_fun,
    interval = interval_fun,
    whiskers = whiskers_fun,
    position = ggplot2::position_dodge(width = ifelse(jitter, 0.3, 0)),
    title = title,
    table = table,
    ggtheme = ggtheme,
    col = col,
    subtitle_add_unit = !is.na(y_unit)
  )
  do.call(gg_list, ret)
}

#' @describeIn mng01 Preprocessing
#'
#' @inheritParams mng01_main
#'
#' @export
mng01_pre <- function(adam_db, dataset, x_var = "AVISIT", ...) {
  adam_db[[dataset]] <- adam_db[[dataset]] %>%
    filter(.data$ANL01FL == "Y")

  dunlin::ls_unite(adam_db, dataset, cols = x_var, sep = "_")
}

#' @describeIn mng01 Postprocessing
#'
#' @inheritParams gen_args
#'
mng01_post <- function(tlg, ...) {
  tlg
}

# `mng01` Pipeline ----

#' `MNG01` Mean Plot Graph.
#'
#' Overview of a summary statistics across time and arm for a selected data set.
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' col <- c(
#'   "A: Drug X" = "black",
#'   "B: Placebo" = "blue",
#'   "C: Combination" = "gray"
#' )
#'
#' run(mng01, syn_data, dataset = "adlb", x_var = c("AVISIT", "AVISITN"), line_col = col)
mng01 <- chevron_g(
  main = mng01_main,
  preproces = mng01_pre,
  postprocess = mng01_post,
  adam_datasets = c("adsl", "adlb", "adeg", "advs")
)
