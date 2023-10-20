# fstg02 ----

#' @describeIn fstg02 Main TLG Function
#'
#' @details
#'  * No overall value.
#'  * Keep zero count rows by default.
#'
#' @inheritParams gen_args
#' @param dataset (`string`) the name of a table in the `adam_db` object.
#' @param arm_var (`string`) the arm variable name used for group splitting.
#' @param subgroups (`character`) the subgroups variable name to list baseline risk factors.
#' @param strata_var (`character`) required if stratified analysis is performed.
#' @param stat_var (`character`) the names of statistics to be reported in `tabulate_survival_subgroups`.
#' @param ... Further arguments passed to `g_forest` and `extract_rsp_subgroups` (a wrapper for
#'  `h_odds_ratio_subgroups_df` and `h_proportion_subgroups_df`). For details, see the documentation in `tern`.
#'  Commonly used arguments include `gp`, `col_symbol_size`, `col`, `vline`, `groups_lists`, `conf_level`,
#'  `method`, `label_all`, etc.
#'
#' @note
#'  * `adam_db` object must contain the table specified by `dataset` with `"PARAMCD"`, `"ARM"`,
#'  `"AVAL"`, `"AVALU"`, `"CNSR"`, and the columns specified by `subgroups` which is denoted as
#'  `c("SEX", "AGEGR1", "RACE")` by default.
#'  * If the plot is too large to be rendered in the output, please refer to `FSTG01`.
#'
#' @return a `gTree` object.
#'
#' @export
#'
fstg02_main <- function(adam_db,
                        dataset = "adtte",
                        arm_var = "ARM",
                        subgroups = c("SEX", "AGEGR1", "RACE"),
                        strata_var = NULL,
                        stat_var = c("n_tot", "n", "median", "hr", "ci"),
                        ...) {
  assert_all_tablenames(adam_db, c("adsl", dataset))
  df_lbl <- paste0("adam_db$", dataset)
  assert_string(arm_var)
  assert_character(subgroups, null.ok = TRUE)
  assert_character(strata_var, null.ok = TRUE)
  assert_character(stat_var, null.ok = TRUE)
  assert_valid_variable(adam_db[[dataset]], arm_var, types = list("factor"), n.levels = 2, label = df_lbl)
  assert_valid_variable(adam_db[[dataset]], c("USUBJID", "PARAMCD", "AVALU"),
    types = list(c("character", "factor")),
    label = df_lbl
  )
  assert_valid_variable(adam_db[[dataset]], "AVAL", types = list("numeric"), lower = 0, label = df_lbl)
  assert_valid_variable(adam_db[[dataset]], "IS_EVENT", types = list("logical"), label = df_lbl)
  assert_valid_variable(adam_db[[dataset]], c(subgroups, strata_var),
    types = list(c("factor")), na_ok = TRUE,
    label = df_lbl
  )
  assert_single_value(adam_db[[dataset]]$PARAMCD, label = df_lbl)
  assert_single_value(adam_db[[dataset]]$AVALU, label = df_lbl)

  timeunit <- unique(adam_db[[dataset]]$AVALU)

  variables <- list(
    arm = arm_var,
    tte = "AVAL",
    is_event = "IS_EVENT",
    subgroups = subgroups,
    strata_var = strata_var
  )

  df <- execute_with_args(extract_survival_subgroups,
    variables = variables,
    data = adam_db[[dataset]],
    ...
  )
  result <- basic_table() %>%
    tabulate_survival_subgroups(df, vars = stat_var, time_unit = timeunit)
  execute_with_args(
    g_forest,
    tbl = result,
    ...,
    gp = grid::gpar(fontsize = 7),
    draw = FALSE
  )
}

#' @describeIn fstg02 Preprocessing
#'
#' @inheritParams fstg02_main
#'
#' @export
#'
fstg02_pre <- function(adam_db, ...) {
  adam_db$adtte <- adam_db$adtte %>%
    mutate(
      ARM = droplevels(.data$ARM),
      AVAL = convert_to_month(.data$AVAL, .data$AVALU),
      AVALU = "MONTHS",
      IS_EVENT = .data$CNSR == 0
    )
  adam_db
}

# `fstg02` Pipeline ----

#' `FSTG02` Subgroup Analysis of Survival Duration.
#'
#' The template produces the subgroup analysis of survival duration graphic.
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' library(dplyr)
#' library(dunlin)
#'
#' proc_data <- log_filter(
#'   syn_data,
#'   PARAMCD == "OS" & ARM %in% c("A: Drug X", "B: Placebo"), "adtte"
#' )
#' run(fstg02, proc_data,
#'   subgroups = c("SEX", "AGEGR1", "RACE"),
#'   conf_level = 0.90, dataset = "adtte"
#' )
fstg02 <- chevron_g(
  main = fstg02_main,
  preprocess = fstg02_pre
)
