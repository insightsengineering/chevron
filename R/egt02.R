# egt02_1 ----

#' @describeIn egt02_1 Main TLG function
#'
#' @inheritParams gen_args
#' @param lbl_vs_assessment (`character`) the label of the assessment variable.
#' @param lbl_vs_abnormality (`character`) the label of the abnormality variable.
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
                         lbl_vs_assessment = "Assessment",
                         lbl_vs_abnormality = "Abnormality",
                         lbl_overall = NULL,
                         deco = std_deco("EGT02"),
                         ...) {
  dbsel <- get_db_data(adam_db, "adsl", "adeg")

  lyt <- egt02_1_lyt(
    arm_var = arm_var,
    lbl_vs_assessment = lbl_vs_assessment,
    lbl_vs_abnormality = lbl_vs_abnormality,
    lbl_overall = lbl_overall,
    deco = deco,
    ... = ...
  )

  tbl <- build_table(lyt, dbsel$adeg, alt_counts_df = dbsel$adsl)

  tbl
}

#' @describeIn egt02_1 Layout
#'
#' @inheritParams gen_args
#' @param lbl_vs_assessment (`character`) the label of the assessment variable.
#' @param lbl_vs_abnormality (`character`) the label of the abnormality variable.
#' @param ... not used.
#'
#' @export
#'
egt02_1_lyt <- function(arm_var = "ACTARM",
                        lbl_vs_assessment = "Assessment",
                        lbl_vs_abnormality = "Abnormality",
                        lbl_overall = NULL,
                        deco = std_deco("EGT02"),
                        ...) {
  basic_table_deco(deco) %>%
    split_cols_by(var = arm_var) %>%
    add_colcounts() %>%
    ifneeded_add_overall_col(lbl_overall) %>%
    split_rows_by("PARAM", split_fun = drop_split_levels, label_pos = "topleft", split_label = lbl_vs_assessment) %>%
    count_abnormal(
      "ANRIND",
      abnormal = list(Low = "LOW", High = "HIGH"),
      variables = list(id = "USUBJID", baseline = "BNRIND"),
      exclude_base_abn = FALSE
    ) %>%
    append_topleft(paste0(" ", lbl_vs_abnormality))
}

#' @describeIn egt02_1 Preprocessing
#'
#' @inheritParams gen_args
#' @param ... not used.
#'
#' @export
#'
egt02_1_pre <- function(adam_db, ...) {
  checkmate::assert_class(adam_db, "dm")
  adam_db %>%
    dm_zoom_to("adeg") %>%
    filter(.data$ANRIND != "<Missing>") %>%
    filter(.data$ONTRTFL == "Y") %>%
    dm_update_zoomed()
}

#' @describeIn egt02_1 Postprocessing
#'
#' @inheritParams gen_args
#' @param ... not used.
#'
#' @export
#'
egt02_1_post <- function(tlg, ...) {
  std_postprocess(tlg)
}

#' `EGT02` Table 1 (Default) ECG Abnormalities Table 1.
#'
#' Assessments Outside Normal Limits Regardless of Abnormality at
#' Baseline Table.
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' run(egt02_1, syn_data)
egt02_1 <- chevron_t(
  main = egt02_1_main,
  preprocess = egt02_1_pre,
  postprocess = egt02_1_post,
  adam_datasets = c("adsl", "adeg")
)

# egt02_2 ----

#' @describeIn egt02_2 Main TLG function
#'
#' @inheritParams gen_args
#' @param lbl_vs_assessment (`character`) the label of the assessment variable.
#' @param lbl_vs_abnormality (`character`) the label of the abnormality variable.
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
                         lbl_vs_assessment = "Assessment",
                         lbl_vs_abnormality = "Abnormality",
                         lbl_overall = NULL,
                         deco = std_deco("EGT02_2"),
                         ...) {
  dbsel <- get_db_data(adam_db, "adsl", "adeg")

  lyt <- egt02_2_lyt(
    arm_var = arm_var,
    lbl_vs_assessment = lbl_vs_assessment,
    lbl_vs_abnormality = lbl_vs_abnormality,
    lbl_overall = lbl_overall,
    deco = deco,
    ... = ...
  )

  tbl <- build_table(lyt, dbsel$adeg, alt_counts_df = dbsel$adsl)

  tbl
}

#' @describeIn egt02_2 Layout
#'
#' @inheritParams gen_args
#' @param lbl_vs_assessment (`character`) the label of the assessment variable.
#' @param lbl_vs_abnormality (`character`) the label of the abnormality variable.
#' @param ... not used.
#'
#' @export
#'
egt02_2_lyt <- function(arm_var = "ACTARM",
                        lbl_vs_assessment = "Assessment",
                        lbl_vs_abnormality = "Abnormality",
                        lbl_overall = NULL,
                        deco = std_deco("EGT02_2"),
                        ...) {
  basic_table_deco(deco) %>%
    split_cols_by(var = arm_var) %>%
    add_colcounts() %>%
    ifneeded_add_overall_col(lbl_overall) %>%
    split_rows_by("PARAM", split_fun = drop_split_levels, label_pos = "topleft", split_label = lbl_vs_assessment) %>%
    count_abnormal(
      "ANRIND",
      abnormal = list(Low = "LOW", High = "HIGH"),
      variables = list(id = "USUBJID", baseline = "BNRIND"),
      exclude_base_abn = TRUE
    ) %>%
    append_topleft(paste0(" ", lbl_vs_abnormality))
}

#' @describeIn egt02_2 Preprocessing
#'
#' @inheritParams gen_args
#' @param ... not used.
#'
#' @export
#'
egt02_2_pre <- function(adam_db, ...) {
  checkmate::assert_class(adam_db, "dm")
  adam_db %>%
    dm_zoom_to("adeg") %>%
    filter(.data$ANRIND != "<Missing>") %>%
    filter(.data$ONTRTFL == "Y") %>%
    dm_update_zoomed()
}
#' @describeIn egt02_2 Postprocessing
#'
#' @inheritParams gen_args
#' @param ... not used.
#'
#' @export
egt02_2_post <- function(tlg, ...) {
  std_postprocess(tlg)
}

#' `EGT02` Table 2 (Supplementary) ECG Abnormalities Table 2.
#'
#' Assessments Outside Normal Limits Among Subject Without
#' Abnormality at Baseline.
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' run(egt02_2, syn_data)
egt02_2 <- chevron_t(
  main = egt02_2_main,
  preprocess = egt02_2_pre,
  postprocess = egt02_2_post,
  adam_datasets = c("adsl", "adeg")
)
