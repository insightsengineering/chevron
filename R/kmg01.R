# kmg01_1 ----

#' @describeIn kmg01_1 Main TLG Function
#'
#' @details
#'  * No overall value.
#'
#' @inheritParams gen_args
#' @param dataset (`string`) the name of a table in the `adam_db` object.
#' @param x_name (`string`) the name of the x-axis.
#' @param y_name (`string`) the name of the x-axis.
#' @param show_statis (`flag`) should the summary statistic table be displayed.
#' @param show_censor (`flag`) should the censor flag be displayed.
#' @param pval_method (`string`) should the censor flag be displayed.
#' @param ties (`string`) should the censor flag be displayed.
#' @param conf_level (`numeric`) should the censor flag be displayed.
#' @param position_coxph (`numeric`) x and y positions for plotting survival::coxph() model.
#' @param position_surv_med (`numeric`) x and y positions for plotting annotation table estimating
#'   median survival time per group.
#' @param line_col (`list`) describing the colors to use for the lines or a named `list`
#'  associating values of `arm_var` with color names.
#'
#' @note
#'  * `adam_db` object must contain the table specified by `dataset` with the columns specified by  `arm_var`.
#'
#' @return a list of `ggplot` objects.
#' @export
kmg01_1_main <- function(adam_db,
                         dataset = "adtte",
                         arm_var = "ARM",
                         x_name = "Time (Days)",
                         y_name = "Survival Probability",
                         show_statis = TRUE,
                         show_censor = TRUE,
                         pval_method = "wald",
                         ties = "exact",
                         conf_level = 0.95,
                         position_coxph = c(0, 0.05),
                         position_surv_med = c(0.9, 0.9),
                         line_col = as.list(nestcolor::color_palette()),
                         ...) {
  anl <- adam_db[[dataset]]
  checkmate::assert_true(length(unique(anl$PARAMCD)) == 1,
    msg = "Only one parameter should be used in the analysis dataset"
  )
  checkmate::assert_string(x_name)
  checkmate::assert_string(y_name)
  checkmate::assert_flag(show_statis)
  checkmate::assert_flag(show_censor)

  line_col <- unlist(line_col)
  checkmate::assert_character(line_col, null.ok = TRUE)

  assert_colnames(adam_db[[dataset]], "AVAL")
  variables <- list(tte = "AVAL", is_event = "is_event", arm = arm_var)


  if (!is.null(names(line_col))) {
    color_lvl <- sort(unique(anl[[arm_var]]))
    col <- line_col[as.character(color_lvl)]

    if (anyNA(col)) {
      missing_col <- setdiff(color_lvl, names(col))
      stop(paste("Missing color matching for", toString(missing_col)))
    }

    col <- unname(col)
  } else {
    col <- line_col
  }

  gkm_plot <- g_km(
    df = anl,
    variables = variables,
    censor_show = show_censor,
    xlab = x_name,
    ylab = y_name,
    annot_surv_med = !show_statis,
    annot_coxph = show_statis,
    control_coxph = control_coxph(pval_method = pval_method, ties = ties, conf_level = conf_level),
    position_coxph = position_coxph,
    position_surv_med = position_surv_med
  )
}

#' @describeIn kmg01_1 Preprocessing
#'
#' @inheritParams kmg01_1_main
#'
#' @export
kmg01_1_pre <- function(adam_db, dataset = "adtte", ...) {
  assert_all_tablenames(adam_db, c("adsl", dataset))
  assert_colnames(adam_db[[dataset]], "CNSR")

  adam_db$adtte <- adam_db$adtte %>%
    mutate(is_event = .data$CNSR == 0)

  adam_db
}

#' @describeIn kmg01_1 Postprocessing
#'
#' @inheritParams gen_args
#'
#' @export
kmg01_1_post <- function(tlg, ...) {
  tlg
}

# `kmg01_1` Pipeline ----

#' `KMG01` Kaplan-Meier Plot 1.
#'
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' library(dplyr)
#' library(dunlin)
#'
#' col <- c(
#'   "A: Drug X" = "black",
#'   "B: Placebo" = "blue",
#'   "C: Combination" = "gray"
#' )
#'
#' syn_data2 <- log_filter(syn_data, PARAMCD == "OS", "adtte")
#' run(kmg01_1, syn_data2, dataset = "adtte", line_col = col)
kmg01_1 <- chevron_g(
  main = kmg01_1_main,
  preproces = kmg01_1_pre,
  postprocess = kmg01_1_post,
  adam_datasets = c("adsl", "adtte")
)
