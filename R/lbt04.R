# lbt04 ----

#' @describeIn lbt04 Main TLG function
#'
#' @inheritParams gen_args
#' @param analysis_abn_var (`string`) column describing anomaly magnitude
#' @param baseline_abn_var (`string`) column describing anomaly at baseline.
#' @returns the main function returns an `rtables` object.
#'
#' @details
#'  * Only count LOW or HIGH values.
#'  * Lab test results with missing `analysis_abn_var` values are excluded.
#'  * Split columns by arm, typically `ACTARM`.
#'  * Does not include a total column by default.
#'
#' @note
#'  * `adam_db` object must contain an `adlb` table with columns `"PARCAT1"`, `"PARCAT2"`, `"PARAM"`, `"ANRIND"`,
#'  and column specified by `arm_var`.
#'
#' @export
#'
lbt04_main <- function(adam_db,
                       arm_var = "ACTARM",
                       lbl_overall = NULL,
                       analysis_abn_var = "ANRIND",
                       baseline_abn_var = "BNRIND",
                       row_split_var = "PARCAT1",
                       page_var = tail(row_split_var, 1L),
                       ...) {
  assert_all_tablenames(adam_db, c("adsl", "adlb"))
  assert_string(arm_var)
  assert_string(lbl_overall, null.ok = TRUE)
  assert_string(analysis_abn_var)
  assert_string(baseline_abn_var)
  assert_string(row_split_var)
  assert_valid_variable(
    adam_db$adlb, c("PARAMCD", "PARAM", row_split_var),
    types = list("characater", "factor")
  )
  assert_subset(page_var, row_split_var)
  assert_valid_variable(adam_db$adlb, c("USUBJID"), types = list(c("character", "factor")), empty_ok = TRUE)
  assert_valid_variable(adam_db$adsl, c("USUBJID"), types = list(c("character", "factor")))
  assert_valid_variable(
    adam_db$adlb,
    baseline_abn_var,
    types = list(c("character", "factor")),
    na_ok = TRUE, empty_ok = TRUE, min_chars = 0L
  )
  assert_valid_var_pair(adam_db$adsl, adam_db$adlb, arm_var)

  lbl_overall <- render_safe(lbl_overall)
  lbl_param <- var_labels_for(adam_db$adlb, "PARAM")
  lbl_abn_var <- var_labels_for(adam_db$adlb, analysis_abn_var)
  row_split_lbl <- var_labels_for(adam_db$adlb, row_split_var)

  lyt <- lbt04_lyt(
    arm_var = arm_var,
    lbl_overall = lbl_overall,
    lbl_param = lbl_param,
    lbl_abn_var = lbl_abn_var,
    var_parcat = "PARCAT1",
    var_param = "PARAM",
    row_split_var = row_split_var,
    row_split_lbl = row_split_lbl,
    analysis_abn_var = analysis_abn_var,
    variables = list(id = "USUBJID", baseline = baseline_abn_var),
    page_var = page_var
  )

  tbl <- build_table(lyt, adam_db$adlb, alt_counts_df = adam_db$adsl)

  tbl
}

#' `lbt04` Layout
#'
#' @inheritParams gen_args
#'
#' @param lbl_param (`string`) label of the `PARAM` variable.
#' @param lbl_abn_var (`string`) label of the `analysis_abn_var` variable.
#' @param variables (`list`) see [tern::count_abnormal]
#'
#' @keywords internal
#'
lbt04_lyt <- function(arm_var,
                      lbl_overall,
                      lbl_param,
                      lbl_abn_var,
                      var_parcat,
                      var_param,
                      row_split_var,
                      row_split_lbl,
                      analysis_abn_var,
                      variables,
                      page_var) {
  page_by <- get_page_by(page_var, row_split_var)
  label_pos <- ifelse(page_by, "hidden", "topleft")

  basic_table(show_colcounts = TRUE) %>%
    split_cols_by_with_overall(arm_var, lbl_overall) %>%
    split_rows_by_recursive(
      row_split_var,
      split_label = row_split_lbl,
      label_pos = label_pos,
      page_by = page_by
    ) %>%
    split_rows_by(
      "PARAMCD",
      labels_var = "PARAM",
      split_fun = drop_split_levels,
      label_pos = "topleft",
      split_label = lbl_param,
      indent_mod = 0L
    ) %>%
    count_abnormal(
      var = analysis_abn_var,
      abnormal = list(Low = c("LOW", "LOW LOW"), High = c("HIGH", "HIGH HIGH")),
      exclude_base_abn = TRUE,
      variables = variables,
      .formats = list(fraction = format_fraction_fixed_dp)
    ) %>%
    append_topleft(paste("   ", lbl_abn_var))
}

#' @describeIn lbt04 Preprocessing
#'
#' @inheritParams gen_args
#' @returns the preprocessing function returns a `list` of `data.frame`.
#' @export
#'
lbt04_pre <- function(adam_db, ...) {
  adam_db$adlb <- adam_db$adlb %>%
    filter(
      .data$ONTRTFL == "Y",
      .data$PARCAT2 == "SI",
      !is.na(.data$ANRIND)
    ) %>%
    mutate(
      PARAM = with_label(.data$PARAM, "Laboratory Test"),
      ANRIND = with_label(.data$ANRIND, "Direction of Abnormality")
    ) %>%
    mutate(
      ANRIND = reformat(
        .data$ANRIND,
        rule(
          "HIGH HIGH" = "HIGH HIGH",
          "HIGH" = "HIGH",
          "LOW" = "LOW",
          "LOW LOW" = "LOW LOW",
          "NORMAL" = "NORMAL"
        ),
        .to_NA = NULL
      )
    )

  adam_db
}

#' @describeIn lbt04 Postprocessing
#'
#' @inheritParams gen_args
#' @returns the postprocessing function returns an `rtables` object or an `ElementaryTable` (null report).
#' @export
#'
lbt04_post <- function(tlg, ...) {
  std_postprocess(tlg)
}

#' `LBT04` Laboratory Abnormalities Not Present at Baseline Table.
#'
#' The `LBT04` table provides an
#' overview of laboratory abnormalities not present at baseline.
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' run(lbt04, syn_data)
lbt04 <- chevron_t(
  main = lbt04_main,
  preprocess = lbt04_pre,
  postprocess = lbt04_post
)
