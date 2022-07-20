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
#' @export
#'
#' @examples
#' library(dm)
#'
#' db <- syn_test_data() %>%
#'   dm_zoom_to("adeg") %>%
#'   filter(PARAM %in% c("Heart Rate", "QT Duration", "RR Duration")) %>%
#'   dm_update_zoomed() %>%
#'   egt02_1_pre()
#'
#' egt02_1_main(adam_db = db)
egt02_1_main <- function(adam_db,
                         armvar = .study$actualarm,
                         lbl_vs_assessment = "Assessment",
                         lbl_vs_abnormality = "Abnormality",
                         lbl_overall = .study$lbl_overall,
                         prune_0 = FALSE,
                         deco = std_deco("EGT02"),
                         .study = list(
                           actualarm = "ACTARM",
                           lbl_overall = NULL
                         )) {
  dbsel <- get_db_data(adam_db, "adsl", "adeg")

  lyt <- egt02_1_lyt(
    armvar = armvar,
    lbl_vs_assessment = lbl_vs_assessment,
    lbl_vs_abnormality = lbl_vs_abnormality,
    lbl_overall = lbl_overall,
    deco = deco
  )

  tbl <- build_table(lyt, dbsel$adeg, alt_counts_df = dbsel$adsl)

  tbl
}

#' @describeIn egt02_1 Layout
#'
#' @inheritParams gen_args
#' @param lbl_vs_assessment (`character`) the label of the assessment variable.
#' @param lbl_vs_abnormality (`character`) the label of the abnormality variable.
#'
#' @export
#'
#' @examples
#' egt02_1_lyt(
#'   armvar = "ACTARM",
#'   lbl_overall = NULL
#' )
egt02_1_lyt <- function(armvar = .study$actualarm,
                        lbl_vs_assessment = "Assessment",
                        lbl_vs_abnormality = "Abnormality",
                        lbl_overall = .study$lbl_overall,
                        deco = std_deco("EGT02"),
                        .study = list(
                          actualarm = "ACTARM",
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

#' @describeIn egt02_1 Preprocessing
#'
#' @inheritParams gen_args
#' @param ... not used.
#'
#' @export
#'
#' @examples
#' syn_test_data() %>%
#'   egt02_1_pre()
egt02_1_pre <- function(adam_db, ...) {
  checkmate::assert_class(adam_db, "dm")
  adam_db %>%
    dm_zoom_to("adeg") %>%
    filter(.data$ANRIND != "<Missing>") %>%
    filter(.data$ONTRTFL == "Y") %>%
    dm_update_zoomed()
}

#' `EGT02` Table 1 (Default) ECG Abnormalities Table 1.
#'
#' Assessments Outside Normal Limits Regardless of Abnormality at
#' Baseline Table.
#'
#' @include chevron_tlg-S4class.R
#' @export
egt02_1 <- chevron_tlg(egt02_1_main, egt02_1_pre, adam_datasets = c("adsl", "adeg"))


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
#' @export
#'
#' @examples
#' library(dm)
#' library(dplyr)
#'
#' db <- syn_test_data() %>%
#'   dm_zoom_to("adeg") %>%
#'   filter(PARAM %in% c("Heart Rate", "QT Duration", "RR Duration")) %>%
#'   dm_update_zoomed() %>%
#'   egt02_2_pre()
#'
#' egt02_2_main(adam_db = db)
egt02_2_main <- function(adam_db,
                         armvar = .study$actualarm,
                         lbl_vs_assessment = "Assessment",
                         lbl_vs_abnormality = "Abnormality",
                         lbl_overall = .study$lbl_overall,
                         prune_0 = FALSE,
                         deco = std_deco("EGT02_2"),
                         .study = list(
                           actualarm = "ACTARM",
                           lbl_overall = NULL
                         )) {
  dbsel <- get_db_data(adam_db, "adsl", "adeg")

  lyt <- egt02_2_lyt(
    armvar = armvar,
    lbl_vs_assessment = lbl_vs_assessment,
    lbl_vs_abnormality = lbl_vs_abnormality,
    lbl_overall = lbl_overall,
    deco = deco
  )

  tbl <- build_table(lyt, dbsel$adeg, alt_counts_df = dbsel$adsl)

  tbl
}

#' @describeIn egt02_2 Layout
#'
#' @inheritParams gen_args
#' @param lbl_vs_assessment (`character`) the label of the assessment variable.
#' @param lbl_vs_abnormality (`character`) the label of the abnormality variable.
#'
#' @export
#'
#' @examples
#' egt02_2_lyt(
#'   armvar = "ACTARM",
#'   lbl_overall = NULL
#' )
egt02_2_lyt <- function(armvar = .study$actualarm,
                        lbl_vs_assessment = "Assessment",
                        lbl_vs_abnormality = "Abnormality",
                        lbl_overall = .study$lbl_overall,
                        deco = std_deco("EGT02_2"),
                        .study = list(
                          actualarm = "ACTARM",
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
    append_topleft(paste0(" ", lbl_vs_abnormality))
}

#' @describeIn egt02_2 Preprocessing
#'
#' @inheritParams gen_args
#' @param ... not used.
#'
#' @export
#'
#' @examples
#' egt02_2_pre(syn_test_data())
egt02_2_pre <- function(adam_db, ...) {
  checkmate::assert_class(adam_db, "dm")
  adam_db %>%
    dm_zoom_to("adeg") %>%
    filter(.data$ANRIND != "<Missing>") %>%
    filter(.data$ONTRTFL == "Y") %>%
    dm_update_zoomed()
}

#' `EGT02` Table 2 (Supplementary) ECG Abnormalities Table 2.
#'
#' Assessments Outside Normal Limits Among Subject Without
#' Abnormality at Baseline.
#'
#' @include chevron_tlg-S4class.R
#' @export
egt02_2 <- chevron_tlg(egt02_2_main, egt02_2_pre, adam_datasets = c("adsl", "adeg"))
