# pdt02 ----

#' @describeIn pdt02 Main TLG function
#'
#' @inheritParams gen_args
#' @param dvreas_var (`string`) the variable defining the reason for deviation. By default `DVREAS`.
#' @param dvterm_var (`string`) the variable defining the protocol deviation term. By default `DVTERM`.
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
#'  * `adam_db` object must contain an `addv` table with the columns specified in `dvreas_var` and `dvterm_var`.
#'
#' @export
#'
pdt02_main <- function(adam_db,
                       arm_var = "ARM",
                       dvreas_var = "DVREAS",
                       dvterm_var = "DVTERM",
                       lbl_overall = NULL,
                       ...) {
  assert_all_tablenames(adam_db, c("adsl", "addv"))
  checkmate::assert_string(arm_var)
  checkmate::assert_string(dvreas_var)
  checkmate::assert_string(dvterm_var)
  checkmate::assert_string(lbl_overall, null.ok = TRUE)
  assert_valid_variable(adam_db$addv, c(dvreas_var, dvterm_var), types = list(c("character", "factor")))
  assert_valid_variable(adam_db$adsl, c("USUBJID", arm_var), types = list(c("character", "factor")))
  assert_valid_variable(adam_db$addv, "USUBJID", types = list(c("character", "factor")), empty_ok = TRUE)
  assert_valid_var_pair(adam_db$adsl, adam_db$addv, arm_var)

  lbl_dvreas_var <- var_labels_for(adam_db$addv, dvreas_var)
  lbl_dvterm_var <- var_labels_for(adam_db$addv, dvterm_var)
  lbl_overall <- render_safe(lbl_overall)
  lyt <- pdt02_lyt(
    arm_var = arm_var,
    lbl_overall = lbl_overall,
    dvreas_var = dvreas_var,
    lbl_dvreas_var = lbl_dvreas_var,
    dvterm_var = dvterm_var,
    lbl_dvterm_var = lbl_dvterm_var
  )

  tbl <- build_table(lyt, adam_db$addv, alt_counts_df = adam_db$adsl)

  tbl
}

#' `pdt02` Layout
#'
#' @inheritParams gen_args
#' @inheritParams pdt02_main
#' @param lbl_dvreas_var (`string`) label for the variable defining the reason for deviation.
#' @param lbl_dvterm_var (`string`) label for the variable defining the protocol deviation term.
#'
#' @keywords internal
#'
pdt02_lyt <- function(arm_var,
                      lbl_overall,
                      dvreas_var,
                      lbl_dvreas_var,
                      dvterm_var,
                      lbl_dvterm_var) {
  basic_table(show_colcounts = TRUE) %>%
    split_cols_by(var = arm_var) %>%
    ifneeded_add_overall_col(lbl_overall) %>%
    analyze_num_patients(
      vars = "USUBJID",
      .stats = c("unique", "nonunique"),
      .labels = c(
        unique = render_safe(
          "Total number of {patient_label} with at least one major protocol deviation related to epidemic/pandemic"
        ),
        nonunique = "Total number of major protocol deviations related to epidemic/pandemic"
      )
    ) %>%
    split_rows_by(
      dvreas_var,
      nested = FALSE,
      split_fun = drop_split_levels,
      label_pos = "topleft",
      split_label = lbl_dvreas_var
    ) %>%
    summarize_num_patients(
      var = "USUBJID",
      .stats = "unique",
      .labels = NULL
    ) %>%
    count_occurrences(
      vars = dvterm_var,
      id = "USUBJID"
    ) %>%
    append_topleft(paste(" ", lbl_dvterm_var))
}

#' @describeIn pdt02 Preprocessing
#'
#' @inheritParams pdt02_main
#'
#' @export
#'
pdt02_pre <- function(adam_db,
                      ...) {
  adam_db$addv <- adam_db$addv %>%
    mutate(across(all_of(c("DVCAT", "AEPRELFL")), ~ reformat(.x, missing_rule))) %>%
    filter(.data$DVCAT == "MAJOR" & .data$AEPRELFL == "Y") %>%
    mutate(across(all_of(c("DVREAS", "DVTERM")), ~ reformat(.x, nocoding))) %>%
    mutate(
      DVREAS = with_label(.data$DVREAS, "Primary Reason"),
      DVTERM = with_label(.data$DVTERM, "Description")
    )

  adam_db
}

#' @describeIn pdt02 Postprocessing
#'
#' @inheritParams pdt02_main
#' @inheritParams gen_args
#'
#' @export
#'
pdt02_post <- function(tlg, prune_0 = TRUE, dvreas_var = "DVREAS", dvterm_var = "DVTERM", ...) {
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

#' `pdt02` Major Protocol Deviations Related to Epidemic/Pandemic Table.
#'
#' A major protocol deviations
#' table with the number of subjects and the total number of Major Protocol Deviations Related
#' to Epidemic/Pandemic sorted alphabetically and deviations name sorted by frequencies.
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' run(pdt02, syn_data)
pdt02 <- chevron_t(
  main = pdt02_main,
  lyt = pdt02_lyt,
  preprocess = pdt02_pre,
  postprocess = pdt02_post
)
