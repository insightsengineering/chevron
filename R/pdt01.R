# pdt01 ----

#' @describeIn pdt01 Main TLG function
#'
#' @inheritParams gen_args
#' @param dvcode_var (`string`) the variable defining the protocol deviation coded term. By default `DVDECOD`.
#' @param lbl_dvcode_var (`string`) label for the variable defining the protocol deviation coded term.
#' @param dvterm_var (`string`) the variable defining the protocol deviation term. By default `DVTERM`.
#' @param lbl_dvterm_var (`string`) label for the variable defining the protocol deviation term.
#'
#' @details
#'  * Data should be filtered for major protocol deviations. `(DVCAT == "MAJOR")`.
#'  * Numbers represent absolute numbers of subjects and fraction of `N`, or absolute numbers when specified.
#'  * Remove zero-count rows unless overridden with `prune_0 = FALSE`.
#'  * Split columns by arm.
#'  * Does not include a total column by default.
#'  * Sort by medication class alphabetically and within medication class by decreasing total number of patients with
#'  the specific medication.
#'
#' @note
#'  * `adam_db` object must contain an `addv` table with the columns specified in `dvcode_var` and `dvterm_var` as well
#'  as `"DVSEQ"`.
#'
#' @export
#'
pdt01_main <- function(adam_db,
                       arm_var = "ARM",
                       dvcode_var = "DVDECOD",
                       lbl_dvcode_var = "Protocol Deviation Coded Term",
                       dvterm_var = "DVTERM",
                       lbl_dvterm_var = "Category",
                       lbl_overall = NULL,
                       ...) {
  assert_all_tablenames(adam_db, c("adsl", "addv"))
  checkmate::assert_string(arm_var)
  checkmate::assert_string(dvcode_var)
  checkmate::assert_string(lbl_dvcode_var)
  checkmate::assert_string(dvterm_var)
  checkmate::assert_string(lbl_dvterm_var)
  checkmate::assert_string(lbl_overall, null.ok = TRUE)
  assert_valid_variable(adam_db$addv, c(dvcode_var, dvterm_var, "DVSEQ"))
  assert_valid_variable(adam_db$adsl, c("USUBJID", arm_var))
  assert_valid_variable(adam_db$addv, "USUBJID", empty_ok = TRUE)
  assert_valid_var_pair(adam_db$adsl, adam_db$addv, arm_var)

  dbsel <- get_db_data(adam_db, "adsl", "addv")

  lyt <- pdt01_lyt(
    arm_var = arm_var,
    lbl_overall = lbl_overall,
    dvcode_var = dvcode_var,
    lbl_dvcode_var = lbl_dvcode_var,
    dvterm_var = dvterm_var,
    lbl_dvterm_var = lbl_dvterm_var
  )

  tbl <- build_table(lyt, dbsel$addv, alt_counts_df = dbsel$adsl)

  tbl
}

#' @describeIn pdt01 Layout
#'
#' @inheritParams gen_args
#' @param dvcode_var (`string`) the variable defining the protocol deviation coded term. By default `DVDECOD`.
#' @param lbl_dvcode_var (`string`) label for the variable defining the protocol deviation coded term.
#' @param dvterm_var (`string`) the variable defining the protocol deviation term. By default `DVTERM`.
#' @param lbl_dvterm_var (`string`) label for the variable defining the protocol deviation term.
#'
#' @export
#'
pdt01_lyt <- function(arm_var,
                      lbl_overall,
                      dvcode_var,
                      lbl_dvcode_var,
                      dvterm_var,
                      lbl_dvterm_var) {
  basic_table(show_colcounts = TRUE) %>%
    split_cols_by(var = arm_var) %>%
    add_colcounts() %>%
    summarize_num_patients(
      var = "USUBJID",
      .stats = c("unique", "nonunique"),
      .labels = c(
        unique = "Total number of patients with at least one major protocol deviation",
        nonunique = "Total number of major protocol deviations"
      ),
      .formats = list(unique = format_count_fraction_fixed_dp)
    ) %>%
    split_rows_by(
      dvcode_var,
      child_labels = "visible",
      nested = FALSE,
      indent_mod = -1L,
      split_fun = drop_split_levels,
      label_pos = "topleft",
      split_label = lbl_dvterm_var
    ) %>%
    count_occurrences(vars = dvterm_var) %>%
    append_topleft(paste0("  Description"))
}

#' @describeIn pdt01 Preprocessing
#'
#' @inheritParams pdt01_main
#'
#' @export
#'
pdt01_pre <- function(adam_db, ...) {
  fmt_ls <- list(
    DVDECOD = rule(
      "No Coding available" = c("", NA)
    ),
    DVTERM = rule(
      "No Coding available" = c("", NA)
    ),
    DVSEQ = rule()
  )

  new_format <- list(addv = fmt_ls)
  reformat(adam_db, new_format, na_last = TRUE)
}

#' @describeIn pdt01 Postprocessing
#'
#' @inheritParams pdt01_main
#' @inheritParams gen_args
#'
#' @export
#'
pdt01_post <- function(tlg, prune_0 = TRUE, dvcode_var = "DVDECOD", dvterm_var = "DVTERM", ...) {
  if (prune_0) {
    tlg <- smart_prune(tlg)
  }

  tbl_sorted <- tlg %>%
    sort_at_path(
      path = c(dvcode_var, "*", dvterm_var),
      scorefun = score_occurrences
    )

  std_postprocess(tbl_sorted)
}

#' `pdt01` Major Protocol Deviations Table.
#'
#' A major protocol deviations
#' table with the number of subjects and the total number of treatments by medication class sorted alphabetically and
#' medication name sorted by frequencies.
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' library(dplyr)
#'
#' proc_data <- syn_data
#' proc_data$addv <- proc_data$addv %>%
#'   filter(DVCAT == "MAJOR")
#'
#' run(pdt01, proc_data)
pdt01 <- chevron_t(
  main = pdt01_main,
  lyt = pdt01_lyt,
  preprocess = pdt01_pre,
  postprocess = pdt01_post,
  adam_datasets = c("adsl", "addv")
)
