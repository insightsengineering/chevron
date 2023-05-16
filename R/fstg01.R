# fstg01 ----

#' @describeIn fstg01 Main TLG Function
#'
#' @details
#'  * No overall value.
#'  * Keep zero count rows by default.
#'
#' @inheritParams gen_args
#' @param dataset (`string`) the name of a table in the `adam_db` object.
#' @param col_x (`string`) column index with estimator.
#' @param col_ci (`string`) column index with confidence intervals.
#' @param vline (`numeric`) x coordinate for vertical line.
#' @param forest_header (`character`) text displayed to the left and right of vline, respectively.
#' @param xlim (`character`) limits for x axis.
#' @param logx (`flag`) shows the x-values on logarithm scale.
#' @param x_at (`character`) x-tick locations.
#' @param col_symbol_size (`numeric`) is used to determine relative size for estimator plot symbol.
#' @param line_col (`character`) describes the colors to use for the lines or a named `character`
#'  associating values of `arm_var` with color names.
#'
#' @note
#'  * `adam_db` object must contain the table specified by `dataset` with the columns specified by  `arm_var`.
#'
#' @return a list of `ggplot` objects.
#' @export
fstg01_main <- function(adam_db,
                        dataset = "adrs",
                        arm_var = "ARM",
                        col_x = attr(tbl, "col_x"),
                        col_ci = attr(tbl, "col_ci"),
                        vline = 1,
                        forest_header = attr(tbl, "forest_header"),
                        xlim = c(0.1, 10),
                        logx = TRUE,
                        x_at = c(0.1, 1, 10),
                        width_row_names = NULL,
                        width_columns = NULL,
                        width_forest = grid::unit(1, "null"),
                        col_symbol_size = attr(tbl, "col_symbol_size"),
                        col = getOption("ggplot2.discrete.colour")[1],
                        draw = TRUE,
                        newpage = TRUE,
                        line_col = nestcolor::color_palette(),
                        ...) {
  assert_all_tablenames(adam_db, c("adsl", dataset))

  args <- list(...)
  control_args <- c("conf_level", "method")
  control <- do.call(control_coxreg, args[intersect(names(args), control_args)])
  variables <- list(
    rsp = rsp,
    arm = arm_var,
    arm = arm_var,
    subgroups = subgroups,
    strata_var = strata_var
  )

  df <- extract_rsp_subgroups(
    variables = variables,
    data = adam_db[[dataset]],
    control = control
  )

  result <- basic_table() %>%
    tabulate_rsp_subgroups(df, vars = c("n_tot", "n", "n_rsp", "prop", "or", "ci"))

  checkmate::assert_character(line_col, null.ok = TRUE)

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

  g_forest(
    tbl = result,
    col_x = col_x,
    col_ci = coi_ci,
    vline = vline,
    forest_header = forest_header,
    xlim = c(0.1, 10),
    logx = TRUE,
    x_at = c(0.1, 1, 10),
    width_row_names = NULL,
    width_columns = NULL,
    width_forest = grid::unit(1, "null"),
    col_symbol_size = attr(tbl, "col_symbol_size"),
    col = getOption("ggplot2.discrete.colour")[1],
    draw = TRUE,
    newpage = TRUE
  )
}

#' @describeIn fstg01 Preprocessing
#'
#' @inheritParams fstg01_main
#'
#' @export
fstg01_pre <- function(adam_db, dataset = "adrs", ...) {
  adam_db[[dataset]] <- adam_db[[dataset]] %>%
    mutate(is_rsp = .data$AVALC %in% rsp)

  adam_db
}

#' @describeIn fstg01 Postprocessing
#'
#' @inheritParams gen_args
#'
#' @export
fstg01_post <- function(tlg, ...) {
  tlg
}

# `fstg01` Pipeline ----

#' `FSTG01` Subgroup Analysis of Best Overall Response.
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' library(dplyr)
#' library(dunlin)
#'
#' col <- c(
#'   "Overall" = "blue"
#' )
#'
#' proc_data <- log_filter(syn_data, PARAMCD == "OVRINV", "adrs")
#' run(fstg01, proc_data, dataset = "adrs", line_col = col)
#'
#' proc_data <- log_filter(syn_data, PARAMCD == "BESRSPI", "adrs")
#' run(fstg01, proc_data,
#'   rsp = c("CR", "PR"), subgroups = c("SEX", "AGEGR1", "RACE"),
#'   strata = c("STRATA2"), conf_level = 0.90, dataset = "adrs"
#' )
fstg01 <- chevron_g(
  main = fstg01_main,
  preproces = fstg01_pre,
  postprocess = fstg01_post,
  adam_datasets = c("adsl")
)
