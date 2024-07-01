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
#' @param interval_fun (`string`) the function defining the crossbar range. If `NULL`, no crossbar is displayed.
#' @param jitter (`numeric`) the width of spread for data points on the x-axis; a number from 0 (no `jitter`) to 1 (high
#'   `jitter`), with a default of 0.3 (slight `jitter`).
#' @param line_col (`character`) describing the colors to use for the lines or a named `character` associating values of
#'   `arm_var` with color names.
#' @param line_type (`character`) describing the line type to use for the lines or a named `character` associating values of
#'   `arm_var` with line types.
#' @param ggtheme (`theme`) passed to [tern::g_lineplot()].
#' @param table (`character`) names of the statistics to be displayed in the table. If `NULL`, no table is displayed.
#' @param ... passed to [tern::g_lineplot()].
#' @returns the main function returns a `list` of `ggplot` objects.
#'
#' @note
#'  * `adam_db` object must contain the table specified by `dataset` with the columns specified by `x_var`, `y_var`,
#'  `y_name`, `y_unit` and `arm_var`.
#'
#' @seealso [gg_theme_chevron()], [tern::g_lineplot()].
#'
#' @returns a list of `ggplot` objects.
#'
#' @export
#'
mng01_main <- function(adam_db,
                       dataset = "adlb",
                       x_var = "AVISIT",
                       y_var = "AVAL",
                       y_name = "PARAM",
                       y_unit = NULL,
                       arm_var = "ACTARM",
                       center_fun = "mean",
                       interval_fun = "mean_ci",
                       jitter = 0.3,
                       line_col = nestcolor::color_palette(),
                       line_type = NULL,
                       ggtheme = gg_theme_chevron(),
                       table = c("n", center_fun, interval_fun),
                       ...) {
  center_fun_choice <- c("mean", "median")
  interval_fun_choice <- c("mean_ci", "mean_sei", "mean_sdi", "median_ci", "quantiles", "range")

  assert_all_tablenames(adam_db, c(dataset, "adsl"))
  assert_character(x_var)
  assert_string(y_var)
  assert_string(y_name)
  assert_string(y_unit, null.ok = TRUE)
  assert_string(arm_var)
  assert_string(center_fun)
  assert_string(interval_fun, null.ok = TRUE)
  assert_names(center_fun, subset.of = center_fun_choice)
  assert_choice(interval_fun, interval_fun_choice, null.ok = TRUE)
  assert_number(jitter, lower = 0, upper = 1)
  assert_class(ggtheme, "theme")
  assert_character(line_col, null.ok = TRUE)
  assert_character(line_type, null.ok = TRUE)
  assert_valid_variable(adam_db[[dataset]], x_var)
  assert_valid_variable(adam_db[[dataset]], y_var, types = list(c("numeric")))
  assert_valid_variable(adam_db[[dataset]], y_unit, types = list(c("character", "factor")))
  assert_valid_variable(adam_db[[dataset]], arm_var, types = list(c("character", "factor")), na_ok = FALSE)
  assert_valid_variable(adam_db$adsl, c("USUBJID", arm_var), types = list(c("character", "factor")))
  assert_valid_variable(adam_db[[dataset]], "USUBJID", types = list(c("character", "factor")), empty_ok = TRUE)
  assert_valid_var_pair(adam_db$adsl, adam_db[[dataset]], arm_var)
  assert_subset(table, c("n", center_fun_choice, interval_fun_choice))

  df <- adam_db[[dataset]]

  data_ls <- split(df, df$PARAM, drop = TRUE)
  x_var <- paste(x_var, collapse = "_")

  whiskers_fun <- if (is.null(interval_fun)) {
    NULL
  } else {
    switch(interval_fun,
      "mean_ci" = c("mean_ci_lwr", "mean_ci_upr"),
      "mean_sei" = c("mean_sei_lwr", "mean_sei_upr"),
      "mean_sdi" = c("mean_sdi_lwr", "mean_sdi_upr"),
      "median_ci" = c("median_ci_lwr", "median_ci_upr"),
      "quantiles" = c("quantiles_0.25", "quantile_0.75"),
      "range" = c("min", "max")
    )
  }


  y_unit <- if (is.null(y_unit)) NA else y_unit
  variables <- tern::control_lineplot_vars(
    x = x_var,
    y = y_var,
    group_var = arm_var,
    paramcd = y_name,
    y_unit = y_unit,
    subject_var = "USUBJID"
  )


  arm_lvl <- sort(unique(df[[arm_var]]))
  col <- if (!is.null(names(line_col))) {
    col <- line_col[as.character(arm_lvl)]

    if (anyNA(col)) {
      missing_col <- setdiff(arm_lvl, names(col))
      stop(paste("Missing color matching for", toString(missing_col)))
    }

    unname(col)
  } else {
    line_col
  }

  line_type <- if (!is.null(names(line_type))) {
    tp <- line_type[as.character(arm_lvl)]

    if (anyNA(tp)) {
      missing_tp <- setdiff(arm_lvl, names(tp))
      stop(paste("Missing line type matching for", toString(missing_tp)))
    }

    unname(tp)
  } else {
    line_type
  }




  lapply(
    data_ls,
    tern::g_lineplot,
    alt_counts_df = adam_db[["adsl"]],
    variables = variables,
    mid = center_fun,
    interval = interval_fun,
    whiskers = whiskers_fun,
    position = ggplot2::position_dodge(width = jitter),
    title = NULL,
    table = table,
    ggtheme = ggtheme,
    col = col,
    linetype = line_type,
    subtitle_add_unit = !is.na(y_unit),
    ...
  )
}

#' @describeIn mng01 Preprocessing
#'
#' @inheritParams mng01_main
#' @returns the preprocessing function returns a `list` of `data.frame`.
#' @export
#'
mng01_pre <- function(adam_db, dataset, x_var = "AVISIT", ...) {
  adam_db[[dataset]] <- adam_db[[dataset]] %>%
    filter(.data$ANL01FL == "Y") %>%
    mutate(
      AVISIT = reorder(.data$AVISIT, .data$AVISITN),
      AVISIT = with_label(.data$AVISIT, "Visit")
    )

  if (length(x_var) == 1 && is.numeric(adam_db[[dataset]][[x_var]])) {
    adam_db
  } else {
    dunlin::ls_unite(adam_db, dataset, cols = x_var, sep = "_")
  }
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
#' lt <- c(
#'   "A: Drug X" = "29",
#'   "B: Placebo" = "99",
#'   "C: Combination" = "solid"
#' )
#'
#' run(mng01, syn_data, dataset = "adlb", x_var = c("AVISIT", "AVISITN"), line_col = col, line_type = lt)
mng01 <- chevron_g(
  main = mng01_main,
  preprocess = mng01_pre
)
