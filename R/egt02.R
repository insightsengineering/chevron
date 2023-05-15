# egt02 ----

#' @describeIn egt02 Main TLG function
#'
#' @inheritParams gen_args
#'
#' @details
#'   * Only count LOW or HIGH values.
#'   * Results of "LOW LOW" are treated as the same as "LOW", and "HIGH HIGH" the same as "HIGH".
#'   * Does not include a total column by default.
#'   * Does not remove zero-count rows unless overridden with `prune_0 = TRUE`.
#'
#' @note
#'   * `adam_db` object must contain an `adeg` table with the `"PARAM"`, `"ANRIND"` and `"BNRIND"` columns.
#'
#' @export
#'
egt02_1_main <- function(adam_db,
                       arm_var = "ACTARM",
                       lbl_overall = NULL,
                       ...) {

  exclude_base_abn = FALSE

  assert_all_tablenames(adam_db, c("adsl", "adeg"))
  assert_valid_variable(adam_db$adeg, c("PARAM"), types = list(c("character", "factor")), na_ok = FALSE)
  assert_valid_variable(adam_db$adeg, c("ANRIND", "BNRIND"), types = list(c("character", "factor")), na_ok = TRUE)
  checkmate::assert_string(lbl_overall, null.ok = TRUE)
  checkmate::assert_flag(exclude_base_abn)
  assert_valid_var_pair(adam_db$adsl, adam_db$adeg, arm_var)
  assert_valid_variable(adam_db$adeg, "USUBJID", empty_ok = TRUE, types = list(c("character", "factor")))
  assert_valid_variable(adam_db$adsl, c("USUBJID", arm_var), types = list(c("character", "factor")))

  lyt <- egt02_lyt(
    arm_var = arm_var,
    lbl_vs_assessment = "Assessment",
    lbl_vs_abnormality = "Abnormality",
    lbl_overall = lbl_overall,
    exclude_base_abn = exclude_base_abn
  )

  tbl <- build_table(lyt, adam_db$adeg, alt_counts_df = adam_db$adsl)

  tbl
}

#' @describeIn egt02 Layout
#'
#' @inheritParams gen_args
#' @param lbl_vs_assessment (`string`) the label of the assessment variable.
#' @param lbl_vs_abnormality (`string`) the label of the abnormality variable.
#'
#' @export
#'
egt02_lyt <- function(arm_var = "ACTARM",
                      lbl_vs_assessment = "Assessment",
                      lbl_vs_abnormality = "Abnormality",
                      lbl_overall,
                      exclude_base_abn) {
  basic_table(show_colcounts = TRUE) %>%
    split_cols_by(var = arm_var) %>%
    add_colcounts() %>%
    ifneeded_add_overall_col(lbl_overall) %>%
    split_rows_by("PARAM", split_fun = drop_split_levels, label_pos = "topleft", split_label = lbl_vs_assessment) %>%
    count_abnormal(
      "ANRIND",
      abnormal = list(Low = "LOW", High = "HIGH"),
      variables = list(id = "USUBJID", baseline = "BNRIND"),
      exclude_base_abn = exclude_base_abn
    ) %>%
    append_topleft(paste0(" ", lbl_vs_abnormality))
}


#' @describeIn egt02 Preprocessing
#'
#' @inheritParams gen_args
#'
#' @export
#'
egt02_pre <- function(adam_db, ...) {
  assert_all_tablenames(adam_db, c("adsl", "adeg"))

  adam_db$adeg <- adam_db$adeg %>%
    filter(.data$ANRIND != "<Missing>") %>%
    filter(.data$ONTRTFL == "Y")

  adam_db
}

#' @describeIn egt02 Postprocessing
#'
#' @inheritParams gen_args
#'
#' @export
#'
egt02_post <- function(tlg, ...) {
  std_postprocess(tlg)
}

#' `EGT02` ECG Abnormalities Table.
#'
#' ECG Parameters outside Normal Limits Regardless of Abnormality at Baseline Table.
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' run(egt02_1, syn_data)
egt02_1 <- chevron_t(
  main = egt02_1_main,
  preprocess = egt02_pre,
  postprocess = egt02_post,
  adam_datasets = c("adsl", "adeg")
)

# egt02_2 ----

#' @describeIn egt02_2 Main TLG function
#'
#' @inheritParams gen_args
#'
#' @details
#'   * Only count LOW or HIGH values.
#'   * Results of "LOW LOW" are treated as the same as "LOW", and "HIGH HIGH" the same as "HIGH".
#'   * Does not include a total column by default.
#'   * Does not remove zero-count rows unless overridden with `prune_0 = TRUE`.
#'
#' @note
#'   * `adam_db` object must contain an `adeg` table with the `"PARAM"`, `"ANRIND"` and `"BNRIND"` columns.
#'
#' @export
#'
egt02_2_main <- function(adam_db,
                       arm_var = "ACTARM",
                       lbl_overall = NULL,
                       ...) {

  exclude_base_abn = TRUE

  assert_all_tablenames(adam_db, c("adsl", "adeg"))
  assert_valid_variable(adam_db$adeg, c("PARAM"), types = list(c("character", "factor")), na_ok = FALSE)
  assert_valid_variable(adam_db$adeg, c("ANRIND", "BNRIND"), types = list(c("character", "factor")), na_ok = TRUE)
  checkmate::assert_string(lbl_overall, null.ok = TRUE)
  checkmate::assert_flag(exclude_base_abn)
  assert_valid_var_pair(adam_db$adsl, adam_db$adeg, arm_var)
  assert_valid_variable(adam_db$adeg, "USUBJID", empty_ok = TRUE, types = list(c("character", "factor")))
  assert_valid_variable(adam_db$adsl, c("USUBJID", arm_var), types = list(c("character", "factor")))

  lyt <- egt02_lyt(
    arm_var = arm_var,
    lbl_vs_assessment = "Assessment",
    lbl_vs_abnormality = "Abnormality",
    lbl_overall = lbl_overall,
    exclude_base_abn = exclude_base_abn
  )

  tbl <- build_table(lyt, adam_db$adeg, alt_counts_df = adam_db$adsl)

  tbl
}

#' `EGT02_2` ECG Abnormalities Table.
#'
#' ECG Parameters outside Normal Limits Among Patients without Abnormality at Baseline Table.
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' run(egt02_2, syn_data)
egt02_2 <- chevron_t(
  main = egt02_2_main,
  preprocess = egt02_pre,
  postprocess = egt02_post,
  adam_datasets = c("adsl", "adeg")
)
