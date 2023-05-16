# kmg01 ----

#' @describeIn kmg01 Main TLG Function
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
#' @param pval_method (`string`) p-value method for testing hazard ratio = 1. One of `"log-rank"`, `"wald"` or
#'   `"likelihood"`.
#' @param ties (`string`) specifying the method for tie handling. One of `"efron"`, `"breslow"` or `"exact"`.
#' @param conf_level (`numeric`) the confidence level.
#' @param position_coxph (`numeric`) x and y positions for plotting survival::coxph() model.
#' @param position_surv_med (`numeric`) x and y positions for plotting annotation table estimating
#'   median survival time per group.
#' @param line_col (`character`) describing the colors to use for the lines or a named `character`
#'  associating values of `arm_var` with color names.
#'
#' @note
#'  * `adam_db` object must contain the table specified by `dataset` with the columns specified by  `arm_var`.
#'
#' @return a list of `ggplot` objects.
#' @export
kmg01_main <- function(adam_db,
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
                       line_col = nestcolor::color_palette(),
                       ...) {
  assert_all_tablenames(adam_db, c("adsl", dataset))
  assert_valid_var(adam_db[[dataset]], "CNSR", types = list("numeric"))
  assert_valid_var(adam_db[[dataset]], "is_event", types = list("logical"))
  assert_valid_var(adam_db[[dataset]], c("PARAMCD", arm_var), types = list(c("character", "factor")), na_ok = FALSE)
  assert_single_value(adam_db[[dataset]]$PARAMCD)
  checkmate::assert_string(x_name)
  checkmate::assert_string(y_name)
  checkmate::assert_flag(show_statis)
  checkmate::assert_flag(show_censor)
  checkmate::assert_choice(pval_method, c("log-rank", "wald", "likelihood"))
  checkmate::assert_choice(ties, c("efron", "breslow", "exact"))
  checkmate::assert_numeric(conf_level, lower = 0, upper = 1)
  checkmate::assert_numeric(position_coxph, len = 2)
  checkmate::assert_numeric(position_surv_med, len = 2)
  assert_valid_var_pair(adam_db$adsl, adam_db[[dataset]], arm_var)
  assert_valid_variable(adam_db[[dataset]], "USUBJID", empty_ok = TRUE, types = list(c("character", "factor")))
  assert_valid_variable(adam_db$adsl, c("USUBJID", arm_var), types = list(c("character", "factor")))

  anl <- adam_db[[dataset]]

  checkmate::assert_character(line_col, null.ok = TRUE)

  assert_colnames(anl, "AVAL")
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

  g_km(
    df = anl,
    variables = variables,
    col = col,
    censor_show = show_censor,
    xlab = x_name,
    ylab = y_name,
    annot_surv_med = !show_statis,
    annot_coxph = show_statis,
    control_coxph_pw = control_coxph(pval_method = pval_method, ties = ties, conf_level = conf_level),
    position_coxph = position_coxph,
    position_surv_med = position_surv_med
  )
}

#' @describeIn kmg01 Preprocessing
#'
#' @inheritParams kmg01_main
#'
#' @export
kmg01_pre <- function(adam_db, dataset = "adtte", ...) {
  adam_db[[dataset]] <- adam_db[[dataset]] %>%
    mutate(is_event = .data$CNSR == 0)

  adam_db
}

#' @describeIn kmg01 Postprocessing
#'
#' @inheritParams gen_args
#'
#' @export
kmg01_post <- function(tlg, ...) {
  tlg
}

# `kmg01` Pipeline ----

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
#' run(kmg01, syn_data2, dataset = "adtte", line_col = col)
#'
#' syn_data3 <- log_filter(syn_data, PARAMCD == "AEREPTTE", "adaette")
#' run(kmg01, syn_data3, dataset = "adaette")
kmg01 <- chevron_g(
  main = kmg01_main,
  preproces = kmg01_pre,
  postprocess = kmg01_post,
  adam_datasets = c("adsl")
)
