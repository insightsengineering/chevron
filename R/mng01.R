
# mng01_1 ----

#' `MNG01` Graph 1 (Default) Mean Plot 1.
#'
#' Overview of the mean across BDS structure data set.
#'
#' @details
#'  * No overall value.
#'
#' @inheritParams gen_args
#' @param dataset (`character`) the name of the data set to be analyzed.
#' @param lbl_safety_var (`character`) the labels of the safety variables to be summarized.
#' @param xval (`character`) the name of the variable to be represented on the x-axis.
#' @param yval (`character`) the name of the variable to be represented on the y-axis.
#' @param center_fun (`character`) the function defining the value to be displayed.
#' @param error_fun (`character`) the function defining the error range.
#' @param show_h_grid (`logical`) should horizontal grid be displayed.
#' @param show_v_grid (`logical`) should vertical grid be displayed.
#' @param legend_pos (`character`) the position of the legend. One of `top`, `bottom`, `right`, `left` or `none`.
#'
#' @import ggplot2
#' @import patchwork
#' @importFrom checkmate assert_subset
#'
#' @return
#' @export
#'
#' @examples
#' library(dm)
#' library(dplyr)
#'
#' db <- syn_test_data() %>%
#'   dm_zoom_to("adlb") %>%
#'   filter(PARAM == "Immunoglobulin A Measurement") %>%
#'   dm_update_zoomed()
#'
#' db %>% mng01_1(error_fun = "sd")
#' db %>% mng01_1(error_fun = "se", show_h_grid = FALSE, show_v_grid = FALSE)
#' db %>% mng01_1(error_fun = "ci95", legend_pos = "right")
#' db %>% mng01_1(center_fun = "median", error_fun = "IQR")
mng01_1 <- function(adam_db,
                    dataset = "adlb",
                    xval = "AVISIT",
                    yval = "AVAL",
                    armvar = .study$actualarm,
                    center_fun = "mean",
                    error_fun = "sd",
                    show_h_grid = .study$show_h_grid,
                    show_v_grid = .study$show_v_grid,
                    legend_pos = .study$legend_pos,
                    .study = list(
                      actualarm = "ARM",
                      show_h_grid = TRUE,
                      show_v_grid = FALSE,
                      legend_pos = "top"
                    )) {
  assert_subset(center_fun, c("mean", "median"))
  assert_subset(error_fun, c("sd", "se", "ci95", "IQR"))
  assert_vector(unique(adam_db[[dataset]]$PARAM), len = 1)

  # put in preprocess
  analysis_var <- unique(adam_db[[dataset]]$PARAM)

  xval_sym <- sym(xval)
  yval_sym <- sym(yval)
  armvar_sym <- sym(armvar)

  se <- function(x) {
    sd(x) / length(x)
  }

  # some statisticians should look at it.
  ci95 <- function(x) {
    alpha <- 0.05
    degrees_freedom <- length(x) - 1
    t.score <- qt(p = alpha / 2, df = degrees_freedom, lower.tail = F)
    t.score * se(x)
  }

  center_func <- match.fun(center_fun)

  error_func <- switch(
    error_fun,
    sd = sd,
    se = se,
    ci95 = ci95,
    IQR = IQR
  )

  if (error_fun == "IQR") {
    data <- adam_db[[dataset]] %>%
      group_by(!!xval_sym, !!armvar_sym) %>%
      summarize(
        center = center_func(!!yval_sym),
        upper = quantile(!!yval_sym, 0.75),
        lower = quantile(!!yval_sym, 0.25),
        range = abs(upper - lower)
      )
  } else {
    data <- adam_db[[dataset]] %>%
      group_by(!!xval_sym, !!armvar_sym) %>%
      summarize(
        center = center_func(!!yval_sym),
        upper = center + error_func(!!yval_sym),
        lower = center - error_func(!!yval_sym),
        range = abs(upper - lower),
        n = n()
      )
  }

  p1 <- data %>%
    ggplot(aes(
      x = !!xval_sym,
      y = center,
      ymin = lower,
      ymax = upper,
      group = !!armvar_sym,
      colour = !!armvar_sym,
      lty = !!armvar_sym
    )) +
    geom_point(position = position_dodge(width = 0.3)) +
    geom_line(position = position_dodge(width = 0.3)) +
    geom_errorbar(position = position_dodge(width = 0.3), width = 0.1) +
    theme_bw() +
    labs(
      title = analysis_var,
      subtitle = paste0(center_fun, "±", error_fun),
      x = "",
      y = ""
    )

  if (!show_v_grid) {
    p1 <- p1 + theme(panel.grid.major.x = element_blank())
  }

  if (!show_h_grid) {
    p1 <- p1 + theme(
      panel.grid.minor.y = element_blank(),
      panel.grid.major.y = element_blank()
      )
  }

  p1 <- p1 + theme(legend.position = legend_pos)

  p2 <- data %>%
    ggplot(aes(
      x = !!xval_sym,
      y = !!armvar_sym,
      col = !!armvar_sym,
      label = paste0(round(center, 1), "±", round(range, 2))
    )) +
    geom_label(size = 3, fill = "white",  label.size = NA) +
    theme_minimal() +
    scale_y_discrete(limits = rev) +
    labs(y = "") +
    theme(legend.position = "none") +
    theme(axis.title.y = element_text(angle = 0, vjust = 0.5))

  p1 / p2 + plot_layout(heights = c(5, 2))
}
