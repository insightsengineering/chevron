
# mng01_1 ----

#' `MNG01` Graph 1 (Default) Mean Plot 1.
#'
#' Overview of a summary statistics across time and arm for a selected parameter and data set.
#'
#' @details
#'  * No overall value.
#'
#' @inheritParams gen_args
#' @param dataset (`character`) the name of the data set to be analyzed.
#' @param xval (`character`) the name of the variable to be represented on the x-axis.
#' @param yval (`character`) the name of the variable to be represented on the y-axis.
#' @param center_fun (`character`) the function to compute the estimate value. One of `mean` or `median`.
#' @param interval_fun (`character`) the function defining the crossbar range. One of `mean_ci`, `mean_sei`, `mean_sdi`,
#'   `median_ci`, `quantiles` or `range`.
#' @param show_n (`logical`) should the number of observation be displayed int the table.
#' @param jitter (`logical`) should data point be slightly spread on the x-axis.
#' @param show_h_grid (`logical`) should horizontal grid be displayed.
#' @param show_v_grid (`logical`) should vertical grid be displayed.
#' @param legend_pos (`character`) the position of the legend. One of `top`, `bottom`, `right`, `left` or `none`.
#'
#' @import ggplot2
#' @import patchwork
#' @importFrom checkmate assert_subset assert_vector assert_flag
#'
#' @return
#' @export
#'
#' @examples
#' library(dm)
#' library(dplyr)
#'
#' db <- chevron::syn_test_data() %>%
#'   dm_zoom_to("adlb") %>%
#'   filter(PARAM == "Immunoglobulin A Measurement") %>%
#'   dm_update_zoomed()
#'
#' db %>% mng01_1(center_fun = "mean",
#'                interval_fun = "mean_sei",
#'                legend_pos = "bottom",
#'                show_n = TRUE,
#'                jitter = FALSE)
mng01_1 <- function(adam_db,
                    dataset = "adlb",
                    xval = "AVISIT",
                    yval = "AVAL",
                    armvar = .study$actualarm,
                    center_fun = c("mean", "median"),
                    interval_fun = c("mean_ci", "mean_sei", "mean_sdi", "median_ci", "quantiles", "range"),
                    jitter = TRUE,
                    show_n = FALSE,
                    show_h_grid = .study$show_h_grid,
                    show_v_grid = .study$show_v_grid,
                    legend_pos = .study$legend_pos,
                    .study = list(
                      actualarm = "ARM",
                      show_h_grid = TRUE,
                      show_v_grid = FALSE,
                      legend_pos = "top"
                    )) {
  center_fun <- match.arg(center_fun)
  interval_fun <- match.arg(interval_fun)

  assert_vector(unique(adam_db[[dataset]]$PARAM), len = 1)
  assert_flag(jitter)
  assert_flag(show_n)

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
    var_labels_for(adam_db[[dataset]], xval)
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
    x = xval,
    y = yval,
    strata = armvar,
    paramcd = "PARAMCD",
    y_unit = "AVALU"
  )

  n_func <- if (show_n) "n" else NULL

  table <- c(
    n_func,
    center_fun,
    interval_fun
  )

  ggtheme <- theme_bw() +
    theme(legend.position = legend_pos) +
    theme(axis.title.x = element_blank())

  if (!show_v_grid) {
    ggtheme <- ggtheme + theme(panel.grid.major.x = element_blank())
  } else {
    ggtheme <- ggtheme + theme(panel.grid.major.x = element_line(size = 1))
  }

  if (!show_h_grid) {
    ggtheme <- ggtheme + theme(
      panel.grid.minor.y = element_blank(),
      panel.grid.major.y = element_blank()
    )
  } else {
    ggtheme <- ggtheme + theme(
      panel.grid.minor.y = element_line(size = 1),
      panel.grid.major.y = element_line(size = 1)
    )
  }

  p <- tern::g_lineplot(
    df = adam_db[[dataset]],
    alt_count = adam_db[["adsl"]],
    variables = variables,
    mid = center_fun,
    interval = interval_fun,
    whiskers = whiskers_fun,
    position = position_dodge(width = ifelse(jitter, 0.3, 0)),
    title = title,
    table = table,
    ggtheme = ggtheme
  )

  p
}
