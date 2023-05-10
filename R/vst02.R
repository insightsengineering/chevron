# vst02 ----

#' @describeIn vst02 Main TLG function
#'
#' @inheritParams gen_args
#' @param exclude_base_abn (`flag`) whether to exclude subjects with baseline abnormality.
#' @param lbl_vs_assessment (`string`) the label of the assessment variable.
#' @param lbl_vs_abnormality (`string`) the label of the abnormality variable.
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
vst02_main <- function(adam_db,
                       arm_var = "ACTARM",
                       exclude_base_abn = FALSE,
                       lbl_vs_assessment = "Assessment",
                       lbl_vs_abnormality = "Abnormality",
                       lbl_overall = NULL,
                       prune_0 = FALSE,
                       ...) {
  assert_all_tablenames(adam_db, c("adsl", "advs"))
  assert_valid_var_pair(
    adam_db$adsl[[arm_var]],
    adam_db$advs[[arm_var]],
    sprintf("adsl.%s", arm_var),
    sprintf("advs.%s", arm_var)
  )
  checkmate::assert_flag(exclude_base_abn)
  checkmate::assert_string(lbl_vs_assessment)
  checkmate::assert_string(lbl_vs_abnormality)
  checkmate::assert_string(lbl_overall, null.ok = TRUE)
  checkmate::assert_flag(prune_0)
  assert_colnames(adam_db$adsl, c(arm_var))
  assert_colnames(adam_db$advs, c(arm_var, "PARAM", "ANRIND", "BNRIND"))



  lyt <- vst02_lyt(
    arm_var = arm_var,
    exclude_base_abn = exclude_base_abn,
    lbl_vs_assessment = lbl_vs_assessment,
    lbl_vs_abnormality = lbl_vs_abnormality,
    lbl_overall = lbl_overall
  )

  tbl <- build_table(lyt, adam_db$advs, alt_counts_df = adam_db$adsl)
  tbl
}

#' @describeIn vst02 Layout
#'
#' @inheritParams gen_args
#' @param lbl_vs_assessment (`string`) the label of the assessment variable.
#' @param lbl_vs_abnormality (`string`) the label of the abnormality variable.
#'
#' @export
#'
vst02_lyt <- function(arm_var,
                      exclude_base_abn,
                      lbl_vs_assessment,
                      lbl_vs_abnormality,
                      lbl_overall) {
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

#' @describeIn vst02 Preprocessing
#'
#' @inheritParams gen_args
#'
#' @export
#'
vst02_pre <- function(adam_db, ...) {
  adam_db$advs <- adam_db$advs %>%
    filter(.data$ANRIND != "<Missing>") %>%
    filter(.data$ONTRTFL == "Y") %>%
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
    )

  adam_db
}

#' @describeIn vst02 Postprocessing
#'
#' @inheritParams gen_args
#'
#' @export
#'
vst02_post <- function(tlg, prune_0 = FALSE, ...) {
  if (prune_0) {
    tlg <- smart_prune(tlg)
  }
  std_postprocess(tlg)
}

#' `VST02` Vital Sign Abnormalities Table.
#'
#' Assessments Outside Normal Limits.
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' run(vst02_1, syn_data)
vst02 <- chevron_t(
  main = vst02_main,
  preprocess = vst02_pre,
  postprocess = vst02_post,
  adam_datasets = c("adsl", "advs")
)
