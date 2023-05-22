# fstg01 ----

#' @describeIn fstg01 Main TLG Function
#'
#' @details
#'  * No overall value.
#'  * Keep zero count rows by default.
#'
#' @inheritParams gen_args
#' @param dataset (`string`) the name of a table in the `adam_db` object.
#' @param arm_var (`string`) the arm variable name used for group splitting.
#' @param rsp_var (`string`) the response variable name to flag whether each subject is a binary response or not.
#' @param subgroups (`character`) the subgroups variable name to list baseline risk factors.
#' @param strata_var (`character`) required if stratified analysis is performed.
#' @param ... Further arguments passed to `g_forest` and `extract_rsp_subgroups` (a wrapper for
#' `h_odds_ratio_subgroups_df` and `h_proportion_subgroups_df`). For details, see the documentation in `tern`.
#' Commonly used arguments include `col_symbol_size`, `col`, `vline`, `groups_lists`, `conf_level`,
#' `method`, `label_all`, etc.
#'
#' @note
#'  * `adam_db` object must contain the table specified by `dataset` with `"PARAMCD"`, `"ARM"`,
#'  `"AVALC"`, and the columns specified by `subgroups` which is denoted as
#'  `c("SEX", "AGEGR1", "RACE")` by default. The column specified by `response` has the default value
#'  `c("CR", "PR")`.
#'
#' @return a `gTree` object.
#' @export
fstg01_main <- function(adam_db,
                        dataset = "adrs",
                        arm_var = "ARM",
                        rsp_var = "is_rsp",
                        subgroups = c("SEX", "AGEGR1", "RACE"),
                        strata_var = NULL,
                        ...) {
  assert_all_tablenames(adam_db, c("adsl", dataset))
  df_lbl <- paste0("adam_db$", dataset)
  checkmate::assert_string(arm_var)
  checkmate::assert_string(rsp_var)
  checkmate::assert_character(subgroups, null.ok = TRUE)
  checkmate::assert_character(strata_var, null.ok = TRUE)
  assert_valid_variable(adam_db[[dataset]], arm_var, types = list("factor"), n.levels = 2, label = df_lbl)
  assert_valid_variable(adam_db[[dataset]], c("USUBJID", "PARAMCD"),
    types = list(c("character", "factor")),
    label = df_lbl
  )
  assert_valid_variable(adam_db[[dataset]], rsp_var, types = list("logical"), label = df_lbl)
  assert_valid_variable(adam_db[[dataset]], c(subgroups, strata_var),
    types = list(c("factor")), na_ok = TRUE,
    label = df_lbl
  )
  assert_single_value(adam_db[[dataset]]$PARAMCD, label = df_lbl)

  variables <- list(
    arm = arm_var,
    rsp = rsp_var,
    subgroups = subgroups,
    strata_var = strata_var
  )

  df <- execute_with_args(extract_rsp_subgroups,
    variables = variables,
    data = adam_db[[dataset]],
    ...
  )

  result <- basic_table() %>%
    tabulate_rsp_subgroups(df, vars = c("n_tot", "n", "n_rsp", "prop", "or", "ci"))

  execute_with_args(
    g_forest,
    tbl = result,
    ...
  )
}

#' @describeIn fstg01 Preprocessing
#'
#' @inheritParams fstg01_main
#' @param response (`character`) the response variable name(s).
#'
#' @export
fstg01_pre <- function(adam_db, ...) {
  adam_db$adrs <- adam_db$adrs %>%
    mutate(
      ARM = droplevels(.data$ARM),
      is_rsp = .data$AVALC %in% c("CR", "PR")
    )
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
#' proc_data <- log_filter(
#'   syn_data,
#'   PARAMCD == "OVRINV" & ARM %in% c("A: Drug X", "B: Placebo"), "adrs"
#' )
#' run(fstg01, proc_data, response = c("CR", "PR"), dataset = "adrs")
#'
#' proc_data <- log_filter(
#'   syn_data,
#'   PARAMCD == "BESRSPI" & ARM %in% c("A: Drug X", "B: Placebo"), "adrs"
#' )
#' run(fstg01, proc_data,
#'   response = c("CR"), subgroups = c("SEX", "AGEGR1", "RACE"),
#'   conf_level = 0.90, dataset = "adrs"
#' )
fstg01 <- chevron_g(
  main = fstg01_main,
  preproces = fstg01_pre,
  postprocess = fstg01_post,
  adam_datasets = c("adsl", "adrs")
)
