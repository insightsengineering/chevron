# vst02_1 ----

#' `VST02` Table 1 (Default) Vital Sign Abnormalities Table 1.
#'
#' Assessments Outside Normal Limits Regardless of
#' Abnormality at Baseline Table.
#'
#' @details
#'   * Only count LOW or HIGH values.
#'   * Results of "LOW LOW" are treated as the same as "LOW", and "HIGH HIGH" the same as "HIGH".
#'   * Does not include a total column by default.
#'   * Does not remove zero-count rows unless overridden with `prune_0 = TRUE`.
#'
#' @inheritParams gen_args
#' @param lbl_vs_assessment (`character`) the label of the assessment variable.
#' @param lbl_vs_abnormality (`character`) the label of the abnormality variable.
#'
#' @export
#'
#' @examples
#' library(dm)
#'
#' db <- syn_test_data() %>%
#'   dm_zoom_to("advs") %>%
#'   filter(PARAM %in% c("Temperature")) %>%
#'   dm_update_zoomed() %>%
#'   vst02_1_pre()
#'
<<<<<<< HEAD
#' vst02_1(adam_db = db)
vst02_1 <- function(adam_db,
                    armvar = .study$actualarm,
                    lbl_vs_assessment = "Assessment",
                    lbl_vs_abnormality = "Abnormality",
                    lbl_overall = .study$lbl_overall,
                    prune_0 = FALSE,
                    deco = std_deco("VST02"),
                    .study = list(
                      actualarm = "ACTARM",
                      lbl_overall = NULL
                    )) {
=======
#' vst02_1_main(adam_db = db)
vst02_1_main <- function(adam_db,
                         armvar = .study$actualarm,
                         lbl_vs_assessment = "Assessment",
                         lbl_vs_abnormality = "Abnormality",
                         lbl_overall = .study$lbl_overall,
                         prune_0 = FALSE,
                         deco = std_deco("VST02"),
                         .study = list(
                           actualarm = "ACTARM",
                           lbl_overall = NULL
                         )) {
>>>>>>> origin/main
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

<<<<<<< HEAD
#' @describeIn vst02_1 `vst02_1` Layout
=======
#' @describeIn vst02_1_main `vst02_1` Layout
>>>>>>> origin/main
#'
#' @inheritParams gen_args
#' @param lbl_vs_assessment (`character`) the label of the assessment variable.
#' @param lbl_vs_abnormality (`character`) the label of the abnormality variable.
#'
#' @export
#'
#' @examples
#' vst02_1_lyt(
#'   armvar = "ACTARM",
#'   lbl_overall = NULL
#' )
vst02_1_lyt <- function(armvar = .study$actualarm,
                        lbl_vs_assessment = "Assessment",
                        lbl_vs_abnormality = "Abnormality",
                        lbl_overall = .study$lbl_overall,
                        deco = std_deco("VST02"),
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

<<<<<<< HEAD
#' @describeIn vst02_1 `vst02_1` Preprocessing
#'
#' @inheritParams gen_args
=======
#' @describeIn vst02_1_main `vst02_1` Preprocessing
#'
#' @inheritParams gen_args
#' @param ... not used.
>>>>>>> origin/main
#'
#' @export
#'
#' @examples
<<<<<<< HEAD
#' syn_test_data() %>%
#'   vst02_1_pre()
vst02_1_pre <- function(adam_db) {
=======
#' vst02_1_pre(syn_test_data())
vst02_1_pre <- function(adam_db, ...) {
>>>>>>> origin/main
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

<<<<<<< HEAD
=======
# `VST02_1` Pipeline ----

#' `VST02_1` Pipeline
#'
#' @seealso [vst02_1_main()]
#' @rdname chevron_tlg-class
#' @export
vst02_1 <- chevron_tlg(vst02_1_main, vst02_1_pre, adam_datasets = c("adsl", "advs"))

>>>>>>> origin/main
# vst02_2 ----

#' `VST02` Table 2 (Supplementary) Vital Sign Abnormalities Table 2.
#'
#' Assessments Outside Normal Limits Among Subject
#' Without Abnormality at Baseline.
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
#' @export
#'
#' @examples
#' library(dm)
#'
#' db <- syn_test_data() %>%
#'   dm_zoom_to("advs") %>%
#'   filter(PARAM %in% c("Temperature")) %>%
#'   dm_update_zoomed() %>%
#'   vst02_2_pre()
#'
<<<<<<< HEAD
#' vst02_2(adam_db = db)
vst02_2 <- function(adam_db,
                    armvar = .study$actualarm,
                    lbl_vs_assessment = "Assessment",
                    lbl_vs_abnormality = "Abnormality",
                    lbl_overall = .study$lbl_overall,
                    prune_0 = FALSE,
                    deco = std_deco("VST02_2"),
                    .study = list(
                      actualarm = "ACTARM",
                      lbl_overall = NULL
                    )) {
=======
#' vst02_2_main(adam_db = db)
vst02_2_main <- function(adam_db,
                         armvar = .study$actualarm,
                         lbl_vs_assessment = "Assessment",
                         lbl_vs_abnormality = "Abnormality",
                         lbl_overall = .study$lbl_overall,
                         prune_0 = FALSE,
                         deco = std_deco("VST02_2"),
                         .study = list(
                           actualarm = "ACTARM",
                           lbl_overall = NULL
                         )) {
>>>>>>> origin/main
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

<<<<<<< HEAD
#' @describeIn vst02_2 `vst02_2` Layout
=======
#' @describeIn vst02_2_main `vst02_2` Layout
>>>>>>> origin/main
#'
#' @inheritParams gen_args
#' @param lbl_vs_assessment (`character`) the label of the assessment variable.
#' @param lbl_vs_abnormality (`character`) the label of the abnormality variable.
#'
#' @export
#'
#' @examples
#' vst02_2_lyt(
#'   armvar = "ACTARM",
#'   lbl_overall = NULL
#' )
vst02_2_lyt <- function(armvar = .study$actualarm,
                        lbl_vs_assessment = "Assessment",
                        lbl_vs_abnormality = "Abnormality",
                        lbl_overall = .study$lbl_overall,
                        deco = std_deco("VST02_2"),
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
    append_topleft(paste0("  ", lbl_vs_abnormality))
}

<<<<<<< HEAD
#' @describeIn vst02_2 `vst02_2` Preprocessing
#'
#' @inheritParams gen_args
=======
#' @describeIn vst02_2_main `vst02_2` Preprocessing
#'
#' @inheritParams gen_args
#' @param ... not used.
>>>>>>> origin/main
#'
#' @export
#'
#' @examples
#' syn_test_data() %>%
#'   vst02_2_pre()
<<<<<<< HEAD
vst02_2_pre <- function(adam_db) {
=======
vst02_2_pre <- function(adam_db, ...) {
>>>>>>> origin/main
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
<<<<<<< HEAD
=======

# `VST02_2` Pipeline ----

#' `VST02_2`
#'
#' @seealso [vst02_2_main()]
#' @rdname chevron_tlg-class
#' @export
vst02_2 <- chevron_tlg(vst02_2_main, vst02_2_pre, adam_datasets = c("adsl", "advs"))
>>>>>>> origin/main
