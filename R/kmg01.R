# kmg01 ----

#' @describeIn kmg01 Main TLG Function
#'
#' @details
#'  * No overall value.
#'
#' @inheritParams gen_args
#' @param dataset (`string`) the name of a table in the `adam_db` object.
#' @param strata (`character`) the variable name of stratification variables.
#' @param strat (`character`) `r lifecycle::badge("deprecated")`; for backwards compatibility only.
#' Use `strata` instead.
#' @param ... Further arguments passed to `g_km` and `control_coxph`. For details, see
#' the documentation in `tern`.
#' Commonly used arguments include `col`, `pval_method`, `ties`, `conf_level`, `conf_type`,
#' `annot_coxph`, `annot_stats`, etc.
#' @returns the main function returns a `gTree` object.
#'
#' @note
#'  * `adam_db` object must contain the table specified by `dataset` with the columns specified by  `arm_var`.
#'
#' @returns a `gTree` object.
#' @export
kmg01_main <- function(adam_db,
                       dataset = "adtte",
                       arm_var = "ARM",
                       strata = NULL,
                       strat = lifecycle::deprecated(),
                       ...) {
  assert_all_tablenames(adam_db, c("adsl", dataset))
  df_lbl <- paste0("adam_db$", dataset)
  assert_valid_variable(adam_db[[dataset]], "AVAL", types = list("numeric"), lower = 0, label = df_lbl)
  assert_valid_variable(adam_db[[dataset]], "IS_EVENT", types = list("logical"), label = df_lbl)
  if (lifecycle::is_present(strat)) {
    lifecycle::deprecate_warn(
      when = "0.2.6",
      what = "kmg01_main(strat)",
      with = "km01_main(strata)"
    )
    strata <- strat
  }
  assert_valid_variable(adam_db[[dataset]], strata, types = list(c("character", "factor")), label = df_lbl)
  assert_valid_variable(
    adam_db[[dataset]],
    c("PARAMCD", arm_var),
    types = list(c("character", "factor")),
    na_ok = FALSE,
    label = df_lbl
  )
  assert_single_value(adam_db[[dataset]]$PARAMCD, label = paste0(df_lbl, "$PARAMCD"))
  assert_valid_variable(adam_db[[dataset]], "USUBJID", empty_ok = TRUE, types = list(c("character", "factor")))
  variables <- list(tte = "AVAL", is_event = "IS_EVENT", arm = arm_var, strata = strata)
  control_cox <- execute_with_args(control_coxph, ...)
  control_surv <- execute_with_args(control_surv_timepoint, ...)
  execute_with_args(
    g_km,
    df = adam_db[[dataset]],
    variables = variables,
    control_surv = control_surv,
    control_coxph_pw = control_cox,
    ...
  )
}

#' @describeIn kmg01 Preprocessing
#'
#' @inheritParams kmg01_main
#' @returns the preprocessing function returns a `list` of `data.frame`.
#' @export
kmg01_pre <- function(adam_db, dataset = "adtte", ...) {
  adam_db[[dataset]] <- adam_db[[dataset]] %>%
    mutate(IS_EVENT = .data$CNSR == 0)

  adam_db
}

# `kmg01` Pipeline ----

#' `KMG01` Kaplan-Meier Plot 1.
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
#' pre_data <- log_filter(syn_data, PARAMCD == "OS", "adtte")
#' run(kmg01, pre_data, dataset = "adtte", col = col)
kmg01 <- chevron_g(
  main = kmg01_main,
  preprocess = kmg01_pre,
  dataset = c("adsl", "adtte")
)
