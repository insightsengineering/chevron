# pdt01 ----

#' @describeIn pdt01 Main TLG function
#'
#' @inheritParams gen_args
#' @param dvcode_var (`character`) the variable defining the protocol deviation coded term. By default `DVDECOD`.
#' @param lbl_dvcode_var (`character`) label for the variable defining the protocol deviation coded term.
#' @param dvterm_var (`character`) the variable defining the protocol deviation term. By default `DVTERM`.
#' @param lbl_dvterm_var (`character`) label for the variable defining the protocol deviation term.
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
                          armvar = "ARM",
                          dvcode_var = "DVDECOD",
                          lbl_dvcode_var = "Protocol Deviation Coded Term",
                          dvterm_var = "DVTERM",
                          lbl_dvterm_var = "Protocol Deviation Term",
                          lbl_overall = NULL,
                          deco = std_deco("PDT01"),
                          ...) {
  assert_colnames(adam_db$addv, c(dvcode_var, dvterm_var))

  dbsel <- get_db_data(adam_db, "adsl", "addv")

  lyt <- pdt01_lyt(
    armvar = armvar,
    lbl_overall = lbl_overall,
    dvcode_var = dvcode_var,
    lbl_dvcode_var = lbl_dvcode_var,
    dvterm_var = dvterm_var,
    lbl_dvterm_var = lbl_dvterm_var,
    deco = deco,
    ... = ...
  )

  tbl <- build_table(lyt, dbsel$addv, alt_counts_df = dbsel$adsl)

  tbl
}

#' @describeIn pdt01 Layout
#'
#' @inheritParams gen_args
#' @param dvcode_var (`character`) the variable defining the protocol deviation coded term. By default `DVDECOD`.
#' @param lbl_dvcode_var (`character`) label for the variable defining the protocol deviation coded term.
#' @param dvterm_var (`character`) the variable defining the protocol deviation term. By default `DVTERM`.
#' @param lbl_dvterm_var (`character`) label for the variable defining the protocol deviation term.
#' @param ... not used.
#'
#' @export
#'
pdt01_lyt <- function(armvar,
                         lbl_overall,
                         dvcode_var,
                         lbl_dvcode_var,
                         dvterm_var,
                         lbl_dvterm_var,
                         deco,
                         ...) {
  basic_table_deco(deco) %>%
    split_cols_by(var = armvar) %>%
    add_colcounts() %>%
    summarize_num_patients(
      var = "USUBJID",
      .stats = c("unique", "nonunique"),
      .labels = c(
        unique = "Total number of patients with at least one major protocol deviation",
        nonunique = "Total number of major protocol deviations"
      )
    ) %>%
    split_rows_by(
      "DVDECOD",
      child_labels = "visible",
      nested = FALSE,
      indent_mod = -1L,
      split_fun = drop_split_levels,
      label_pos = "topleft",
      split_label = lbl_dvterm_var
    ) %>%
    count_occurrences(vars = "DVTERM") %>%
    append_topleft(paste0("  ", lbl_dvterm_var))
}

#' @describeIn pdt01 Preprocessing
#'
#' @inheritParams pdt01_main
#'
#' @param ... not used.
#'
#' @export
#'
pdt01_pre <- function(adam_db, dvcode_var = "DVDECOD", dvterm_var = "DVTERM", ...) {
  checkmate::assert_class(adam_db, "dm")

  adam_db <- adam_db %>%
    dm_zoom_to("addv") %>%
    mutate(DVSEQ = as.factor(.data$DVSEQ)) %>%
    dm_update_zoomed()

  fmt_ls <- list(
    dvcode_var = list(
      "No Coding available" = c("", NA)
    ),
    dvterm_var = list(
      "No Coding available" = c("", NA)
    )
  )

  names(fmt_ls) <- c(dvcode_var, dvterm_var)
  new_format <- list(addv = fmt_ls)

  dunlin::apply_reformat(adam_db, new_format)
}

#' @describeIn pdt01 Postprocessing
#'
#' @inheritParams pdt01_main
#' @inheritParams gen_args
#'
#' @param ... not used.
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

#' `PDT01` Table 1 (Default) Major Protocol Deviations.
#'
#' A major protocol deviations
#' table with the number of subjects and the total number of treatments by medication class sorted alphabetically and
#' medication name sorted by frequencies.
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' library(magrittr)
#' library(dm)
#'
#' db <- syn_data %>%
#'   dm_zoom_to("addv") %>%
#'   filter(.data$DVCAT == "MAJOR") %>%
#'   dm_update_zoomed()
#'
#' run(pdt01, db)
pdt01 <- chevron_t(
  main = pdt01_main,
  lyt = pdt01_lyt,
  preprocess = pdt01_pre,
  postprocess = pdt01_post,
  adam_datasets = c("adsl", "addv")
)


