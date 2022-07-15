
# mng01_1 ----

#' `MNG01` Graph 1 (Default) Mean Plot 1.
#'
#' Overview of a summary statistics across time and arm for a selected data set.
#'
#' @details
#'  * No overall value.
#'
#' @inheritParams gen_args
#' @param x (`string`) the name of the variable to be represented on the x-axis.
#' @param y (`string`) the name of the variable to be represented on the y-axis.
#' @param y_name (`string`) the variable name for `y`. Used for plot's subtitle.
#' @param y_unit (`string`) the name of the variable with the units of `y`. Used for plot's subtitle.
#' @param center_fun (`string`) the function to compute the estimate value.
#' @param interval_fun (`string`) the function defining the crossbar range.
#' @param show_n (`flag`) should the number of observation be displayed int the table.
#' @param jitter (`flag`) should data point be slightly spread on the x-axis.
#' @param show_h_grid (`flag`) should horizontal grid be displayed.
#' @param show_v_grid (`flag`) should vertical grid be displayed.
#' @param legend_pos (`string`) the position of the legend.
#' @param line_col (`character`) describing the colors to use for the lines or a named `character` vector associating
#'   values of `armvar` with color names.
#' @param ... not used.
#'
#' @return a list of `ggplot` objects.
#' @export
#'
#' @examples
#' library(dm)
#' library(dplyr)
#'
#' db <- chevron::syn_test_data() %>%
#'   mng01_1_pre(param = "Alanine Aminotransferase Measurement")
#'
#' db %>% mng01_1_main(
#'   center_fun = "mean",
#'   interval_fun = "mean_sei",
#'   legend_pos = "bottom",
#'   show_n = TRUE,
#'   show_h_grid = FALSE,
#'   show_v_grid = FALSE,
#'   jitter = TRUE,
#'   line_col = c(
#'     "A: Drug X" = "#008080",
#'     "B: Placebo" = "#9b2525",
#'     "C: Combination" = "#ffa41c",
#'     "D: Something" = "#ffa41c"
#'   )
#' )
mng01_1_main <- function(adam_db,
                         dataset = "adlb",
                         x = "AVISIT",
                         y = "AVAL",
                         y_name = "PARAM",
                         y_unit = "AVALU",
                         armvar = .study$actualarm,
                         center_fun = c("mean", "median"),
                         interval_fun = c("mean_ci", "mean_sei", "mean_sdi", "median_ci", "quantiles", "range"),
                         jitter = TRUE,
                         show_n = TRUE,
                         show_h_grid = .study$show_h_grid,
                         show_v_grid = .study$show_v_grid,
                         legend_pos = .study$legend_pos,
                         line_col = .study$color_dict,
                         .study = list(
                           actualarm = "ACTARM",
                           show_h_grid = TRUE,
                           show_v_grid = FALSE,
                           legend_pos = "top",
                           color_dict = getOption("tern.color")
                         ),
                         ...) {

  #should it do all tables?

  data_ls <- split(adam_db[[dataset]], adam_db[[dataset]]$PARAM)

  lapply(
    data_ls,
    mng01_1_lyt,
    alt_count = adam_db[["adsl"]],
    x = x,
    y = y,
    y_name = y_name,
    y_unit = y_unit,
    armvar = armvar,
    center_fun = center_fun,
    interval_fun = interval_fun,
    jitter = jitter,
    show_n = show_n,
    show_h_grid = show_h_grid,
    show_v_grid = show_v_grid,
    legend_pos = legend_pos,
    line_col = line_col
  )
}


#' @describeIn mng01_1_main `mng01_1` Graph Layout
#'
#' @inheritParams mng01_1_main
#' @param df (`dataframe`) data set containing all analysis variables.
#' @param alt_count (`dataframe`) data set that will be used (only) to counts objects in strata.
#'
#' @export
mng01_1_lyt <- function(df,
                        alt_count,
                         x = "AVISIT",
                         y = "AVAL",
                         y_name = "PARAM",
                         y_unit = "AVALU",
                         armvar = .study$actualarm,
                         center_fun = c("mean", "median"),
                         interval_fun = c("mean_ci", "mean_sei", "mean_sdi", "median_ci", "quantiles", "range"),
                         jitter = TRUE,
                         show_n = TRUE,
                         show_h_grid = .study$show_h_grid,
                         show_v_grid = .study$show_v_grid,
                         legend_pos = .study$legend_pos,
                         line_col = .study$color_dict,
                         .study = list(
                           actualarm = "ACTARM",
                           show_h_grid = TRUE,
                           show_v_grid = FALSE,
                           legend_pos = "top",
                           color_dict = getOption("tern.color")
                         )
                        ) {
  center_fun <- match.arg(center_fun)
  interval_fun <- match.arg(interval_fun)

  checkmate::assert_vector(unique(df$PARAM), len = 1)
  checkmate::assert_flag(jitter)
  checkmate::assert_flag(show_n)
  checkmate::assert_flag(show_h_grid)
  checkmate::assert_flag(show_v_grid)
  checkmate::assert_character(line_col)

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
    var_labels_for(df, x)
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
    x = x,
    y = y,
    strata = armvar,
    paramcd = y_name,
    y_unit = y_unit
  )

  n_func <- if (show_n) "n" else NULL

  table <- c(
    n_func,
    center_fun,
    interval_fun
  )

  ggtheme <- ggplot2::theme_bw() +
    ggplot2::theme(legend.position = legend_pos) +
    ggplot2::theme(axis.title.x = ggplot2::element_blank())

  if (!show_v_grid) {
    ggtheme <- ggtheme + ggplot2::theme(panel.grid.major.x = ggplot2::element_blank())
  } else {
    ggtheme <- ggtheme + ggplot2::theme(panel.grid.major.x = ggplot2::element_line(size = 1))
  }

  if (!show_h_grid) {
    ggtheme <- ggtheme + ggplot2::theme(
      panel.grid.minor.y = ggplot2::element_blank(),
      panel.grid.major.y = ggplot2::element_blank()
    )
  } else {
    ggtheme <- ggtheme + ggplot2::theme(
      panel.grid.minor.y = ggplot2::element_line(size = 1),
      panel.grid.major.y = ggplot2::element_line(size = 1)
    )
  }


  if (checkmate::check_names(line_col)) {
    color_lvl <- sort(unique(df[[armvar]]))
    col <- line_col[color_lvl]

    if (anyNA(col)) {
      missing_col <- setdiff(color_lvl, names(col))
      stop(paste("Missing color matching for", toString(missing_col)))
    }

    col <- unname(col)
  } else {
    col <- line_col
  }

  p <- tern::g_lineplot(
    df = df,
    alt_count = alt_count,
    variables = variables,
    mid = center_fun,
    interval = interval_fun,
    whiskers = whiskers_fun,
    position = ggplot2::position_dodge(width = ifelse(jitter, 0.3, 0)),
    title = title,
    table = table,
    ggtheme = ggtheme,
    col = col
  )

  p
}

#' @describeIn mng01_1_main `mng01_1` Preprocessing
#'
#' @inheritParams gen_args
#' @param ... not used.
#'
#' @export
#'
#' @examples
#' mng01_1_pre(syn_test_data())
mng01_1_pre <- function(adam_db, ...) {
  checkmate::assert_class(adam_db, "dm")
  adam_db
}


# `mng01_1` Pipeline ----

#' @seealso [mng01_1_main()]
#' @rdname chevron_tlg-class
#' @export
mng01_1 <- chevron_tlg(mng01_1_main, mng01_1_pre, adam_datasets = c("adsl", "adlb", "adeg", "advs"))
