# mng01_1 ----

#' @describeIn mng01_1 Main TLG Function
#'
#' @details
#'  * No overall value.
#'  * Preprocessing filters for `ANL01FL` in the selected data set.
#'
#' @inheritParams gen_args
#' @param dataset (`string`) the name of a table in the `adam_db` object.
#' @param x_var (`character`) the name of a column in the `dataset` to represent on the x-axis.
#' @param y_var (`string`) the name of the variable to be represented on the y-axis.
#' @param y_name (`string`) the variable name for `y`. Used for plot's subtitle.
#' @param y_unit (`string`) the name of the variable with the units of `y`. Used for plot's subtitle. if `NA`, only
#'   `y_name` is displayed as subtitle.
#' @param center_fun (`string`) the function to compute the estimate value.
#' @param interval_fun (`string`) the function defining the crossbar range.
#' @param show_table (`flag`) should the summary statistic table be displayed.
#' @param show_n (`flag`) should the number of observation be displayed int the table.
#' @param jitter (`flag`) should data point be slightly spread on the x-axis.
#' @param show_h_grid (`flag`) should horizontal grid be displayed.
#' @param show_v_grid (`flag`) should vertical grid be displayed.
#' @param legend_pos (`string`) the position of the legend.
#' @param line_col (`character`) describing the colors to use for the lines or a named `character` vector associating
#'   values of `arm_var` with color names.
#' @param ... not used.
#'
#' @note
#'  * `adam_db` object must contain the table specified by `dataset` with the columns specified by `x_var`, `y_var`,
#'  `y_name`, `y_unit` and `arm_var`.
#'
#' @return a list of `ggplot` objects.
#' @export
mng01_1_main <- function(adam_db,
                         dataset = "adlb",
                         x_var = "AVISIT",
                         y_var = "AVAL",
                         y_name = "PARAM",
                         y_unit = NA,
                         arm_var = "ACTARM",
                         center_fun = c("mean", "median"),
                         interval_fun = c("mean_ci", "mean_sei", "mean_sdi", "median_ci", "quantiles", "range"),
                         show_table = TRUE,
                         jitter = TRUE,
                         show_n = TRUE,
                         show_h_grid = TRUE,
                         show_v_grid = FALSE,
                         legend_pos = "top",
                         line_col = nestcolor::color_palette(),
                         ...) {
  df <- adam_db[[dataset]]

  data_ls <- split(df, df$PARAM, drop = TRUE)
  x_var <- paste(x_var, collapse = "_")

  center_fun <- match.arg(center_fun)
  interval_fun <- match.arg(interval_fun)

  checkmate::assert_flag(show_table)
  checkmate::assert_flag(jitter)
  checkmate::assert_flag(show_n)
  checkmate::assert_flag(show_h_grid)
  checkmate::assert_flag(show_v_grid)
  checkmate::assert_character(line_col, null.ok = TRUE)

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

  lapply(
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
}

#' @describeIn mng01_1 Preprocessing
#'
#' @inheritParams mng01_1_main
#' @param ... not used.
#'
#' @export
mng01_1_pre <- function(adam_db, dataset, x_var = "AVISIT", ...) {
  checkmate::assert_class(adam_db, "dm")

  adam_db <- adam_db %>%
    dm_zoom_to(!!dataset) %>%
    filter(.data$ANL01FL == "Y") %>%
    dm_update_zoomed()

  dunlin::dm_unite(adam_db, dataset, x_var, "_")
}

#' @describeIn mng01_1 Postprocessing
#'
#' @inheritParams gen_args
#' @param ... not used.
#'
mng01_1_post <- function(tlg, ...) {
  tlg
}

# `mng01_1` Pipeline ----

#' `MNG01` Graph 1 (Default) Mean Plot 1.
#'
#' Overview of a summary statistics across time and arm for a selected data set.
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' library(dm)
#' library(dplyr)
#'
#' col <- c(
#'   "A: Drug X" = "black",
#'   "B: Placebo" = "blue",
#'   "C: Combination" = "gray"
#' )
#'
#' run(mng01_1, syn_data, dataset = "adlb", line_col = col)
mng01_1 <- chevron_g(
  main = mng01_1_main,
  preproces = mng01_1_pre,
  postprocess = mng01_1_post,
  adam_datasets = c("adsl", "adlb", "adeg", "advs")
)
