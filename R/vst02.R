# vst02_1 ----

#' @describeIn vst02_1 Main TLG function
#'
#' @inheritParams gen_args
#' @param exclude_base_abn (`flag`) whether baseline abnormality should be excluded.
#' @returns the main function returns an `rtables` object.
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
                         arm_var = "ACTARM",
                         lbl_overall = NULL,
                         exclude_base_abn = FALSE,
                         ...) {
  assert_all_tablenames(adam_db, "adsl", "advs")
  assert_string(arm_var)
  assert_string(lbl_overall, null.ok = TRUE)
  assert_flag(exclude_base_abn)
  assert_valid_variable(adam_db$advs, c(arm_var, "PARAM", "ANRIND", "BNRIND"), types = list(c("character", "factor")))
  assert_valid_variable(adam_db$adsl, c("USUBJID", arm_var), types = list(c("character", "factor")))
  assert_valid_variable(adam_db$advs, "USUBJID", empty_ok = TRUE, types = list(c("character", "factor")))
  assert_valid_var_pair(adam_db$adsl, adam_db$advs, arm_var)

  lbl_overall <- render_safe(lbl_overall)
  lbl_vs_assessment <- var_labels_for(adam_db$advs, "PARAM")
  lbl_vs_abnormality <- var_labels_for(adam_db$advs, "ANRIND")

  lyt <- vst02_lyt(
    arm_var = arm_var,
    lbl_overall = lbl_overall,
    exclude_base_abn = exclude_base_abn,
    lbl_vs_assessment = lbl_vs_assessment,
    lbl_vs_abnormality = lbl_vs_abnormality
  )

  tbl <- build_table(lyt, adam_db$advs, alt_counts_df = adam_db$adsl)

  tbl
}

#' `vst02_1` Layout
#'
#' @inheritParams gen_args
#' @param lbl_vs_assessment (`string`) the label of the assessment variable.
#' @param lbl_vs_abnormality (`string`) the label of the abnormality variable.
#' @param exclude_base_abn (`flag`) whether to exclude subjects with baseline abnormality from numerator and
#'   denominator.
#'
#' @keywords internal
#'
vst02_lyt <- function(arm_var,
                      lbl_overall,
                      exclude_base_abn,
                      lbl_vs_assessment,
                      lbl_vs_abnormality) {
  basic_table(show_colcounts = TRUE) %>%
    split_cols_by_with_overall(arm_var, lbl_overall) %>%
    split_rows_by("PARAM", split_fun = drop_split_levels, label_pos = "topleft", split_label = lbl_vs_assessment) %>%
    count_abnormal(
      "ANRIND",
      abnormal = list(Low = "LOW", High = "HIGH"),
      variables = list(id = "USUBJID", baseline = "BNRIND"),
      exclude_base_abn = exclude_base_abn
    ) %>%
    append_topleft(paste0(" ", lbl_vs_abnormality))
}

#' @describeIn vst02_1 Preprocessing
#'
#' @inheritParams gen_args
#' @returns the preprocessing function returns a `list` of `data.frame`.
#' @export
#'
vst02_pre <- function(adam_db, ...) {
  high_low_format <- rule(
    HIGH = c("HIGH HIGH", "HIGH"),
    LOW = c("LOW LOW", "LOW")
  )

  adam_db$advs <- adam_db$advs %>%
    filter(.data$ONTRTFL == "Y") %>%
    mutate(
      PARAM = with_label(.data$PARAM, "Assessment"),
      ANRIND = with_label(reformat(.data$ANRIND, high_low_format), "Abnormality"),
      BNRIND = reformat(.data$BNRIND, high_low_format)
    )

  adam_db
}

#' @describeIn vst02_1 Postprocessing
#'
#' @inheritParams gen_args
#' @returns the postprocessing function returns an `rtables` object or an `ElementaryTable` (null report).
#' @export
#'
vst02_post <- function(tlg, prune_0 = FALSE, ...) {
  if (prune_0) {
    tlg <- smart_prune(tlg)
  }
  std_postprocessing(tlg)
}

#' `VST02` Vital Sign Abnormalities Table.
#'
#' Vital Sign Parameters outside Normal Limits Regardless of Abnormality at Baseline.
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' run(vst02_1, syn_data)
vst02_1 <- chevron_t(
  main = vst02_1_main,
  preprocess = vst02_pre,
  postprocess = vst02_post,
  dataset = c("adsl", "advs")
)

# vst02_2 ----

#' @describeIn vst02_2 Main TLG function
#'
#' @inherit vst02_1_main
#'
#' @export
#'
vst02_2_main <- modify_default_args(vst02_1_main, exclude_base_abn = TRUE)
#' `VST02` Vital Sign Abnormalities Table.
#'
#' Vital Sign Parameters outside Normal Limits Among Patients without Abnormality at Baseline.
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' run(vst02_2, syn_data)
vst02_2 <- chevron_t(
  main = vst02_2_main,
  preprocess = vst02_pre,
  postprocess = vst02_post,
  dataset = c("adsl", "advs")
)
