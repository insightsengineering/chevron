# lbt06 ----

#' @describeIn lbt06 Main TLG function
#'
#' @inheritParams gen_args
#' @param arm_var (`string`) the arm variable used for arm splitting.
#' @param paramcd (`string`) the variable for parameter code.
#' @param visit_var (`string`) the variable for analysis visit.
#' @param anrind_var (`string`) the variable for analysis reference range indicator.
#' @param bnrind_var (`string`) the variable for baseline reference range indicator.
#'
#' @details
#'  * Only count LOW or HIGH values.
#'  * Lab test results with missing `ANRIND` values are excluded.
#'  * Split columns by arm, typically `ACTARM`.
#'  * Keep zero count rows by default.
#'
#' @note
#'  * `adam_db` object must contain an `adlb` table with columns `"AVISIT"`, `"ANRIND"`, `"BNRIND"`,
#'  `"ONTRTFL"`, and `"PARCAT2"`, and column specified by `arm_var`.
#'
#' @export
#'
lbt06_main <- function(adam_db,
                       arm_var = "ACTARM",
                       paramcd = "PARAMCD",
                       visit_var = "AVISIT",
                       anrind_var = "ANRIND",
                       bnrind_var = "BNRIND",
                       ...) {
  assert_all_tablenames(adam_db, c("adsl", "adlb"))
  checkmate::assert_string(arm_var)
  checkmate::assert_string(paramcd, null.ok = TRUE)
  checkmate::assert_string(visit_var)
  checkmate::assert_string(anrind_var)
  checkmate::assert_string(bnrind_var)

  assert_valid_variable(adam_db$adlb, c(arm_var, visit_var), types = list("characater", "factor"))
  assert_valid_variable(adam_db$adlb, c(paramcd, "ANRIND", "BNRIND"), na_ok = TRUE, empty_ok = TRUE, min_chars = 0L)
  assert_valid_variable(adam_db$adlb, c("USUBJID"), types = list(c("character", "factor")), empty_ok = TRUE)
  assert_valid_variable(adam_db$adsl, c("USUBJID"), types = list(c("character", "factor")))
  assert_valid_var_pair(adam_db$adsl, adam_db$adlb, arm_var)

  lbl_paramcd <- var_labels_for(adam_db$adlb, "PARAMCD")
  lbl_visit <- var_labels_for(adam_db$adlb, "AVISIT")
  lbl_anrind <- var_labels_for(adam_db$adlb, "ANRIND")
  lbl_bnrind <- var_labels_for(adam_db$adlb, "BNRIND")

  lyt <- lbt06_lyt(
    arm_var = arm_var,
    paramcd = paramcd,
    visit_var = visit_var,
    anrind_var = anrind_var,
    lbl_paramcd = lbl_paramcd,
    lbl_visit = lbl_visit,
    lbl_anrind = lbl_anrind,
    lbl_bnrind = lbl_bnrind
  )

  tbl <- build_table(lyt, adam_db$adlb, alt_counts_df = adam_db$adsl)

  tbl
}

#' `lbt06` Layout
#'
#' @inheritParams gen_args
#'
#' @inheritParams gen_args
#' @param lbl_paramcd (`string`) text label of the `PARAMCD` variable.
#' @param lbl_visit (`string`) text label of the `AVISIT` variable.
#' @param lbl_anrind (`string`) text label of the `ANRIND` variable.
#' @param lbl_bnrind (`string`) text label of the `BNRIND` variable.
#'
#' @keywords internal
#'
lbt06_lyt <- function(arm_var,
                      paramcd,
                      visit_var,
                      anrind_var,
                      lbl_paramcd,
                      lbl_visit,
                      lbl_anrind,
                      lbl_bnrind) {
  basic_table(show_colcounts = TRUE) %>%
    split_cols_by(arm_var) %>%
    ifneeded_split_row(paramcd, lbl_paramcd) %>%
    split_rows_by(
      var = visit_var,
      split_fun = drop_split_levels,
      label_pos = "topleft",
      split_label = paste(lbl_visit)
    ) %>%
    count_abnormal_by_baseline(
      var = anrind_var,
      abnormal = c(Low = "LOW", High = "HIGH"),
      .indent_mods = 4L
    ) %>%
    append_topleft(paste("    ", lbl_anrind)) %>%
    append_topleft(paste("            ", lbl_bnrind))
}

#' @describeIn lbt06 Preprocessing
#'
#' @inheritParams gen_args
#'
#' @export
#'
lbt06_pre <- function(adam_db, ...) {
  adam_db$adlb <- adam_db$adlb %>%
    filter(
      .data$ONTRTFL == "Y",
      .data$PARCAT2 == "SI"
    ) %>%
    mutate(
      ANRIND = reformat(.data$ANRIND, rule("<Missing>" = c("", NA, "<Missing>")), na_last = TRUE),
      BNRIND = reformat(.data$BNRIND, rule("<Missing>" = c("", NA, "<Missing>")), na_last = TRUE),
      AVISIT = with_label(.data$AVISIT, "Visit"),
      ANRIND = with_label(.data$ANRIND, "Abnormality at Visit"),
      BNRIND = with_label(.data$BNRIND, "Baseline Status")
    )

  adam_db
}

#' @describeIn lbt06 Postprocessing
#'
#' @inheritParams gen_args
#'
#' @export
#'
lbt06_post <- function(tlg, prune_0 = FALSE, ...) {
  if (prune_0) {
    tlg <- smart_prune(tlg)
  }
  std_postprocess(tlg)
}

#' `LBT06` Table 1 (Default) Laboratory Abnormalities by Visit and Baseline Status Table 1.
#'
#' The `LBT06` table produces the standard laboratory abnormalities by visit and
#' baseline status summary.
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' run(lbt06, syn_data)
lbt06 <- chevron_t(
  main = lbt06_main,
  preprocess = lbt06_pre,
  postprocess = lbt06_post,
  adam_datasets = c("adsl", "adlb")
)
