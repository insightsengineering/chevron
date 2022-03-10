# vst02_1 ----


#' `VST02` Table 1 (Default) Vital Sign Abnormalities Table 1
#'
#' Assessments Outside Normal Limits Regardless of Abnormality at Baseline Table.
#'
#' @details
#'   * Only count LOW or HIGH values.
#'   * Results of "LOW LOW" are treated as the same as "LOW", and "HIGH HIGH" the same as "HIGH".
#'   * Does not include a total column by default.
#'   * Does not remove zero-count rows unless overridden with `prune_0 = TRUE`.
#'
#'
#' @inheritParams gen_args
#' @param lbl_vs_assessment (`character`) the label of the assessment variable.
#' @param lbl_vs_abnormality (`character`) the label of the abnormality variable.
#'
#' @return
#' @export
#'
#' @examples
#' library(dm)
#' library(dplyr)
#'
#' db <- syn_test_data() %>%
#'   preprocess_data("vst02_1")
#'
#' vst02_1(adam_db = db)
#'
vst02_1 <- function(adam_db,
                    armvar = .study$armvar,
                    lbl_vs_assessment = "Assessment",
                    lbl_vs_abnormality = "Abnormality",
                    lbl_overall = .study$lbl_overall,
                    prune_0 = FALSE,
                    deco = std_deco("VST02"),
                    .study = list(
                      armvar = "ARM",
                      lbl_overall = NULL
                    )) {

  dbsel <- get_db_data(adam_db, "adsl", "advs")

  lyt <- vst02_1_lyt(
    armvar = armvar,
    lbl_vs_assessment = lbl_vs_assessment,
    lbl_vs_abnormality = lbl_vs_abnormality,
    lbl_overall = lbl_overall,
    deco = deco
  )

  tbl <- build_table(lyt, dbsel$advs, alt_counts_df = dbsel$adsl)

  tbl
}


#' `VST02` Layout 1 (Default)
#'
#' @describeIn vst02_1
#'
#'
#' @inheritParams gen_args
#' @param lbl_vs_assessment (`character`) the label of the assessment variable.
#' @param lbl_vs_abnormality (`character`) the label of the abnormality variable.
#'
#' @return
#' @export
#'
#' @examples
#' vst02_1_lyt(
#'   armvar = "ACTARM",
#'   lbl_overall = NULL
#' )
#'
vst02_1_lyt <- function(armvar = .study$armvar,
                        lbl_vs_assessment = "Assessment",
                        lbl_vs_abnormality = "Abnormality",
                        lbl_overall = .study$lbl_overall,
                        deco = std_deco("VST02"),
                        .study = list(
                          armvar = "ACTARM",
                          lbl_overall = NULL
                        )) {

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

# vst02_2 ----

#' `VST02` Table 2 (Supplementary) Vital Sign Abnormalities Table 2
#'
#' Assessments Outside Normal Limits Among Subject Without Abnormality at Baseline.
#'
#' @details
#'   *
#'   * Only count LOW or HIGH values.
#'   * Results of "LOW LOW" are treated as the same as "LOW", and "HIGH HIGH" the same as "HIGH".
#'   * Does not include a total column by default.
#'   * Does not remove zero-count rows unless overridden with `prune_0 = TRUE`.
#'
#'
#' @inheritParams gen_args
#' @param lbl_vs_assessment (`character`) the label of the assessment variable.
#' @param lbl_vs_abnormality (`character`) the label of the abnormality variable.
#'
#' @return
#' @export
#'
#' @examples
#' library(dm)
#' library(dplyr)
#'
#' db <- syn_test_data() %>%
#'   preprocess_data("vst02_2")
#'
#' vst02_2(adam_db = db)
#'
vst02_2 <- function(adam_db,
                    armvar = .study$armvar,
                    lbl_vs_assessment = "Assessment",
                    lbl_vs_abnormality = "Abnormality",
                    lbl_overall = .study$lbl_overall,
                    prune_0 = FALSE,
                    deco = std_deco("VST02_2"),
                    .study = list(
                      armvar = "ARM",
                      lbl_overall = NULL
                    )) {

  dbsel <- get_db_data(adam_db, "adsl", "advs")

  lyt <- vst02_2_lyt(
    armvar = armvar,
    lbl_vs_assessment = lbl_vs_assessment,
    lbl_vs_abnormality = lbl_vs_abnormality,
    lbl_overall = lbl_overall,
    deco = deco
  )

  tbl <- build_table(lyt, dbsel$advs, alt_counts_df = dbsel$adsl)

  tbl
}

#' `VST02` Layout 2 (Supplementary)
#'
#' @describeIn vst02_2
#'
#'
#' @inheritParams gen_args
#' @param lbl_vs_assessment (`character`) the label of the assessment variable.
#' @param lbl_vs_abnormality (`character`) the label of the abnormality variable.
#'
#' @return
#' @export
#'
#' @examples
#' vst02_2_lyt(
#'   armvar = "ACTARM",
#'   lbl_overall = NULL
#' )
#'
vst02_2_lyt <- function(armvar = .study$armvar,
                        lbl_vs_assessment = "Assessment",
                        lbl_vs_abnormality = "Abnormality",
                        lbl_overall = .study$lbl_overall,
                        deco = std_deco("VST02_2"),
                        .study = list(
                          armvar = "ACTARM",
                          lbl_overall = NULL
                        )) {

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
