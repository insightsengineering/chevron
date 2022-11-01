# vst02_1 ----

#' @describeIn vst02_1 Main TLG function
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
#'   * `adam_db` object must contain an `advs` table with the `"PARAM"`, `"ANRIND"` and `"BNRIND"` columns.
#'
#' @export
#'
vst02_1_main <- function(adam_db,
                         lyt_ls = list(vst02_1_lyt),
                         armvar = "ACTARM",
                         lbl_vs_assessment = "Assessment",
                         lbl_vs_abnormality = "Abnormality",
                         lbl_overall = NULL,
                         prune_0 = FALSE,
                         deco = std_deco("VST02"),
                         ...) {
  dbsel <- get_db_data(adam_db, "adsl", "advs")

  lyt <- lyt_ls[[1]](
    armvar = armvar,
    lbl_vs_assessment = lbl_vs_assessment,
    lbl_vs_abnormality = lbl_vs_abnormality,
    lbl_overall = lbl_overall,
    deco = deco,
    ... = ...
  )

  tbl <- build_table(lyt, dbsel$advs, alt_counts_df = dbsel$adsl)

  if (prune_0) {
    tbl <- smart_prune(tbl)
  }

  tbl
}

#' @describeIn vst02_1 Layout
#'
#' @inheritParams gen_args
#' @param lbl_vs_assessment (`character`) the label of the assessment variable.
#' @param lbl_vs_abnormality (`character`) the label of the abnormality variable.
#' @param ... not used.
#'
#' @export
#'
vst02_1_lyt <- function(armvar,
                        lbl_vs_assessment,
                        lbl_vs_abnormality,
                        lbl_overall,
                        deco = std_deco("VST02"),
                        ...) {
  basic_table_deco(deco) %>%
    split_cols_by(var = armvar) %>%
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

#' @describeIn vst02_1 Preprocessing
#'
#' @inheritParams gen_args
#' @param ... not used.
#'
#' @export
#'
vst02_1_pre <- function(adam_db, ...) {
  checkmate::assert_class(adam_db, "dm")
  adam_db %>%
    dm_zoom_to("advs") %>%
    filter(.data$ANRIND != "<Missing>") %>%
    filter(.data$ONTRTFL == "Y") %>%
    dm_update_zoomed() %>%
    dm_zoom_to("advs") %>%
    mutate(
      ANRIND = case_when(
        .data$ANRIND == "HIGH HIGH" ~ "HIGH",
        .data$ANRIND == "LOW LOW" ~ "LOW",
        TRUE ~ as.character(.data$ANRIND)
      ),
      BNRIND = case_when(
        .data$BNRIND == "HIGH HIGH" ~ "HIGH",
        .data$BNRIND == "LOW LOW" ~ "LOW",
        TRUE ~ as.character(.data$BNRIND)
      )
    ) %>%
    mutate(
      ANRIND = as.factor(.data$ANRIND),
      BNRIND = as.factor(.data$BNRIND)
    ) %>%
    dm_update_zoomed()
}

#' `VST02` Table 1 (Default) Vital Sign Abnormalities Table 1.
#'
#' Assessments Outside Normal Limits Regardless of
#' Abnormality at Baseline Table.
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' run(vst02_1, syn_test_data())
vst02_1 <- chevron_tlg(vst02_1_main, vst02_1_lyt, vst02_1_pre, adam_datasets = c("adsl", "advs"))


# vst02_2 ----

#' @describeIn vst02_2 Main TLG function
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
#'   * `adam_db` object must contain an `advs` table with the `"PARAM"`, `"ANRIND"` and `"BNRIND"` columns.
#'
#' @export
#'
vst02_2_main <- function(adam_db,
                         lyt_ls = list(vst02_2_lyt),
                         armvar = "ACTARM",
                         lbl_vs_assessment = "Assessment",
                         lbl_vs_abnormality = "Abnormality",
                         lbl_overall = NULL,
                         prune_0 = FALSE,
                         deco = std_deco("VST02_2"),
                         ...) {
  dbsel <- get_db_data(adam_db, "adsl", "advs")

  lyt <- lyt_ls[[1]](
    armvar = armvar,
    lbl_vs_assessment = lbl_vs_assessment,
    lbl_vs_abnormality = lbl_vs_abnormality,
    lbl_overall = lbl_overall,
    deco = deco,
    ... = ...
  )

  tbl <- build_table(lyt, dbsel$advs, alt_counts_df = dbsel$adsl)

  if (prune_0) {
    tbl <- smart_prune(tbl)
  }

  tbl
}

#' @describeIn vst02_2 Layout
#'
#' @inheritParams gen_args
#' @param lbl_vs_assessment (`character`) the label of the assessment variable.
#' @param lbl_vs_abnormality (`character`) the label of the abnormality variable.
#' @param ... not used.
#'
#' @export
#'
vst02_2_lyt <- function(armvar,
                        lbl_vs_assessment ,
                        lbl_vs_abnormality,
                        lbl_overall,
                        deco,
                        ...) {
  basic_table_deco(deco) %>%
    split_cols_by(var = armvar) %>%
    add_colcounts() %>%
    ifneeded_add_overall_col(lbl_overall) %>%
    split_rows_by("PARAM", split_fun = drop_split_levels, label_pos = "topleft", split_label = lbl_vs_assessment) %>%
    count_abnormal(
      "ANRIND",
      abnormal = list(Low = "LOW", High = "HIGH"),
      variables = list(id = "USUBJID", baseline = "BNRIND"),
      exclude_base_abn = TRUE
    ) %>%
    append_topleft(paste0("  ", lbl_vs_abnormality))
}

#' @describeIn vst02_2 Preprocessing
#'
#' @inheritParams gen_args
#' @param ... not used.
#'
#' @export
#'
vst02_2_pre <- function(adam_db, ...) {
  checkmate::assert_class(adam_db, "dm")
  adam_db %>%
    dm_zoom_to("advs") %>%
    filter(.data$ANRIND != "<Missing>") %>%
    filter(.data$ONTRTFL == "Y") %>%
    dm_update_zoomed() %>%
    dm_zoom_to("advs") %>%
    mutate(
      ANRIND = case_when(
        .data$ANRIND == "HIGH HIGH" ~ "HIGH",
        .data$ANRIND == "LOW LOW" ~ "LOW",
        TRUE ~ as.character(.data$ANRIND)
      ),
      BNRIND = case_when(
        .data$BNRIND == "HIGH HIGH" ~ "HIGH",
        .data$BNRIND == "LOW LOW" ~ "LOW",
        TRUE ~ as.character(.data$BNRIND)
      )
    ) %>%
    mutate(
      ANRIND = as.factor(.data$ANRIND),
      BNRIND = as.factor(.data$BNRIND)
    ) %>%
    dm_update_zoomed()
}

#' `VST02` Table 2 (Supplementary) Vital Sign Abnormalities Table 2.
#'
#' Assessments Outside Normal Limits Among Subject
#' Without Abnormality at Baseline.
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' run(vst02_2, syn_test_data())
vst02_2 <- chevron_tlg(vst02_2_main, vst02_2_lyt, vst02_2_pre, adam_datasets = c("adsl", "advs"))
