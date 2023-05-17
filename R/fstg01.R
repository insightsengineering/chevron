# fstg01 ----

#' @describeIn fstg01 Main TLG Function
#'
#' @details
#'  * No overall value.
#'  * Keep zero count rows by default.
#'
#' @inheritParams gen_args
#' @param dataset (`string`) the name of a table in the `adam_db` object.
#' @param ... Further arguments passed to `g_forest` and `extract_rsp_subgroups`. For details, see
#' the documentation in `tern`.
#' Commonly used arguments include `col_symbol_size`, `col`, `vline`, `groups_lists`, `conf_level`,
#' `method`, `label_all`, etc.
#'
#' @note
#'  * `adam_db` object must contain the table specified by `dataset` with the columns specified by  `arm_var`.
#'
#' @return a list of `ggplot` objects.
#' @export
fstg01_main <- function(adam_db,
                        dataset = "adrs",
                        arm_var = "ARM",
                        rsp_var = "is_rsp",
                        subgroups = c("SEX", "AGEGR1", "RACE"),
                        strata_var = NULL,
                        ...) {
  assert_all_tablenames(adam_db, c("adsl", dataset))

  variables <- list(
    rsp = rsp_var,
    arm = arm_var,
    subgroups = subgroups,
    strata_var = strata_var
  )

  args <- list(...)
  control_cox <- execute_with_args(extract_rsp_subgroups, ...)

  df <- extract_rsp_subgroups(
    variables = variables,
    data = adam_db[[dataset]],
    conf_level = .9
  )

  result <- basic_table() %>%
    tabulate_rsp_subgroups(df, vars = c("n_tot", "n", "n_rsp", "prop", "or", "ci"))

  g_forest(
    tbl = result
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
#' col <- c("Overall" = "blue")
#'
#' pre_data <- log_filter(syn_data, ARM %in% c("A: Drug X", "B: Placebo"), "adrs")
#' pre_data$adrs <- pre_data$adrs %>% droplevels()
#'
#' proc_data <- log_filter(pre_data, PARAMCD == "OVRINV", "adrs")
#' run(fstg01, proc_data, dataset = "adrs", line_col = col)
#'
#' proc_data <- log_filter(pre_data, PARAMCD == "BESRSPI", "adrs")
#' run(fstg01, proc_data,
#'   rsp = c("CR", "PR"), subgroups = c("SEX", "AGEGR1", "RACE"),
#'   strata = c("STRATA2"), conf_level = 0.90, dataset = "adrs"
#' )
fstg01 <- chevron_g(
  main = fstg01_main,
  preproces = fstg01_pre,
  postprocess = fstg01_post,
  adam_datasets = c("adsl", "adrs")
)
