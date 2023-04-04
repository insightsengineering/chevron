# pdt01_1 ----

#' @describeIn pdt01_1 Main TLG function
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
pdt01_1_main <- function(adam_db,
                         arm_var = "ARM",
                         dvcode_var = "DVDECOD",
                         lbl_dvcode_var = "Protocol Deviation Coded Term",
                         dvterm_var = "DVTERM",
                         lbl_dvterm_var = "Category",
                         lbl_overall = NULL,
                         deco = std_deco("pdt01_1"),
                         ...) {
  assert_colnames(adam_db$addv, c(dvcode_var, dvterm_var))

  dbsel <- get_db_data(adam_db, "adsl", "addv")

  lyt <- pdt01_1_lyt(
    arm_var = arm_var,
    lbl_overall = lbl_overall,
    dvcode_var = dvcode_var,
    lbl_dvcode_var = lbl_dvcode_var,
    dvterm_var = dvterm_var,
    lbl_dvterm_var = lbl_dvterm_var,
    deco = deco
  )

  tbl <- build_table(lyt, dbsel$addv, alt_counts_df = dbsel$adsl)

  tbl
}

#' @describeIn pdt01_1 Layout
#'
#' @inheritParams gen_args
#' @param dvcode_var (`string`) the variable defining the protocol deviation coded term. By default `DVDECOD`.
#' @param lbl_dvcode_var (`string`) label for the variable defining the protocol deviation coded term.
#' @param dvterm_var (`string`) the variable defining the protocol deviation term. By default `DVTERM`.
#' @param lbl_dvterm_var (`string`) label for the variable defining the protocol deviation term.
#'
#' @export
#'
pdt01_1_lyt <- function(arm_var,
                        lbl_overall,
                        dvcode_var,
                        lbl_dvcode_var,
                        dvterm_var,
                        lbl_dvterm_var,
                        deco) {
  basic_table_deco(deco) %>%
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

#' @describeIn pdt01_1 Preprocessing
#'
#' @inheritParams pdt01_1_main
#'
#' @export
#'
pdt01_1_pre <- function(adam_db, dvcode_var = "DVDECOD", dvterm_var = "DVTERM", ...) {
  assert_all_tablenames(adam_db, c("adsl", "addv"))

  fmt_ls <- list(
    dvcode_var = rule(
      "No Coding available" = c("", NA)
    ),
    dvterm_var = rule(
      "No Coding available" = c("", NA)
    ),
    DVSEQ = rule()
  )

  names(fmt_ls) <- c(dvcode_var, dvterm_var, "DVSEQ")
  new_format <- list(addv = fmt_ls)

  dunlin::reformat(adam_db, new_format, na_last = TRUE)
}

#' @describeIn pdt01_1 Postprocessing
#'
#' @inheritParams pdt01_1_main
#' @inheritParams gen_args
#'
#' @export
#'
pdt01_1_post <- function(tlg, prune_0 = TRUE, dvcode_var = "DVDECOD", dvterm_var = "DVTERM", ...) {
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

#' `pdt01_1` Table 1 (Default) Major Protocol Deviations.
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
#' run(pdt01_1, proc_data)
pdt01_1 <- chevron_t(
  main = pdt01_1_main,
  lyt = pdt01_1_lyt,
  preprocess = pdt01_1_pre,
  postprocess = pdt01_1_post,
  adam_datasets = c("adsl", "addv")
)
