# pdt02_1 ----

#' @describeIn pdt02_1 Main TLG function
#'
#' @inheritParams gen_args
#' @param dvreas_var (`character`) the variable defining the reason for deviation. By default `DVREAS`.
#' @param lbl_dvreas_var (`character`) label for the variable defining the reason for deviation.
#' @param dvterm_var (`character`) the variable defining the protocol deviation term. By default `DVTERM`.
#' @param lbl_dvterm_var (`character`) label for the variable defining the protocol deviation term.
#'
#' @details
#'  * Data should be filtered for major protocol deviations related to epidemic/pandemic.
#'  `(AEPRELFL == "Y" & DVCAT == "MAJOR")`.
#'  * Numbers represent absolute numbers of subjects and fraction of `N`, or absolute numbers when specified.
#'  * Remove zero-count rows unless overridden with `prune_0 = FALSE`.
#'  * Split columns by arm.
#'  * Does not include a total column by default.
#'  * Sort by deviation reason alphabetically and within deviation reason by decreasing total number of patients with
#'  the specific deviation term.
#'
#' @note
#'  * `adam_db` object must contain an `addv` table with the columns specified in `dvreas_var` and `dvterm_var` as well
#'  as `"DVSEQ"`.
#'
#' @export
#'
pdt02_1_main <- function(adam_db,
                         armvar = "ARM",
                         dvreas_var = "DVREAS",
                         lbl_dvreas_var = "Primary Reason",
                         dvterm_var = "DVTERM",
                         lbl_dvterm_var = "Description",
                         lbl_overall = NULL,
                         deco = std_deco("pdt02_1"),
                         ...) {
  assert_colnames(adam_db$addv, c(dvreas_var, dvterm_var))

  dbsel <- get_db_data(adam_db, "adsl", "addv")

  lyt <- pdt02_1_lyt(
    armvar = armvar,
    lbl_overall = lbl_overall,
    dvreas_var = dvreas_var,
    lbl_dvreas_var = lbl_dvreas_var,
    dvterm_var = dvterm_var,
    lbl_dvterm_var = lbl_dvterm_var,
    deco = deco,
    ... = ...
  )

  tbl <- build_table(lyt, dbsel$addv, alt_counts_df = dbsel$adsl)

  tbl
}

#' @describeIn pdt02_1 Layout
#'
#' @inheritParams gen_args
#' @param dvreas_var (`character`) the variable defining the reason for deviation. By default `DVREAS`.
#' @param lbl_dvreas_var (`character`) label for the variable defining the reason for deviation.
#' @param dvterm_var (`character`) the variable defining the protocol deviation term. By default `DVTERM`.
#' @param lbl_dvterm_var (`character`) label for the variable defining the protocol deviation term.
#' @param ... not used.
#'
#' @export
#'
pdt02_1_lyt <- function(armvar,
                        lbl_overall,
                        dvreas_var,
                        lbl_dvreas_var,
                        dvterm_var,
                        lbl_dvterm_var,
                        deco,
                        ...) {
  basic_table_deco(deco) %>%
    split_cols_by(var = armvar) %>%
    ifneeded_add_overall_col(lbl_overall) %>%
    add_colcounts() %>%
    summarize_num_patients(
      var = "USUBJID",
      .stats = c("unique", "nonunique"),
      .labels = c(
        unique = "Total number of patients with at least one major protocol deviation related to epidemic/pandemic",
        nonunique = "Total number of major protocol deviations related to epidemic/pandemic"
      ),
      .formats = list(unique = format_count_fraction_fixed_dp)
    ) %>%
    split_rows_by(
      dvreas_var,
      nested = FALSE,
      indent_mod = -1L,
      split_fun = drop_split_levels,
      label_pos = "topleft",
      split_label = lbl_dvreas_var
    ) %>%
    summarize_num_patients(
      var = "USUBJID",
      .stats = c("unique_count")
    ) %>%
    count_occurrences(vars = dvterm_var) %>%
    append_topleft(paste(" ", lbl_dvterm_var))
}

#' @describeIn pdt02_1 Preprocessing
#'
#' @inheritParams pdt02_1_main
#'
#' @param ... not used.
#'
#' @export
#'
pdt02_1_pre <- function(adam_db, dvreas_var = "DVREAS", dvterm_var = "DVTERM", ...) {
  checkmate::assert_class(adam_db, "dm")

  adam_db <- adam_db %>%
    dm_zoom_to("addv") %>%
    filter(.data$DVCAT == "MAJOR" & .data$AEPRELFL == "Y") %>%
    mutate(DVSEQ = as.factor(.data$DVSEQ)) %>%
    dm_update_zoomed()

  fmt_ls <- list(
    dvreas_var = list(
      "No Coding available" = c("", NA)
    ),
    dvterm_var = list(
      "No Coding available" = c("", NA)
    )
  )

  names(fmt_ls) <- c(dvreas_var, dvterm_var)
  new_format <- list(addv = fmt_ls)

  dunlin::apply_reformat(adam_db, new_format)
}

#' @describeIn pdt02_1 Postprocessing
#'
#' @inheritParams pdt02_1_main
#' @inheritParams gen_args
#'
#' @param ... not used.
#'
#' @export
#'
pdt02_1_post <- function(tlg, prune_0 = TRUE, dvreas_var = "DVREAS", dvterm_var = "DVTERM", ...) {
  if (prune_0) {
    tlg <- smart_prune(tlg)
  }

  tbl_sorted <- tlg %>%
    sort_at_path(
      path = c(dvreas_var, "*", dvterm_var),
      scorefun = score_occurrences
    )

  std_postprocess(tbl_sorted)
}

#' `pdt02_1` Table 1 (Default) Major Protocol Deviations Related to Epidemic/Pandemic.
#'
#' A major protocol deviations
#' table with the number of subjects and the total number of Major Protocol Deviations Related
#' to Epidemic/Pandemic sorted alphabetically and deviations name sorted by frequencies.
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' run(pdt02_1, syn_data)
pdt02_1 <- chevron_t(
  main = pdt02_1_main,
  lyt = pdt02_1_lyt,
  preprocess = pdt02_1_pre,
  postprocess = pdt02_1_post,
  adam_datasets = c("adsl", "addv")
)
