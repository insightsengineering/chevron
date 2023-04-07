# rmpt01_1 ----

#' @describeIn rmpt01_1 Main TLG function
#'
#' @inheritParams gen_args
#' @param lbl_aval (`string`) the label of the time variable.
#'
#' @details
#'   * Person time is the sum of exposure across all patients in unit: <days, months, or years>.
#'   * Summary statistics are by default based on the number of patients in the
#'   corresponding `N` row (number of non-missing values).
#'   * Does not include a total column by default.
#'   * Does not remove zero-count rows unless overridden with `prune_0 = TRUE`.
#'
#' @note
#'   * `adam_db` object must contain an `adex` table with the `"AVAL"`, `"AVALCAT1"`,
#'   "PARAMCD"`, `PARCAT2`, and `SAFFL` columns.
#'
#' @export
#'
rmpt01_1_main <- function(adam_db,
                          arm_var = "ACTARM",
                          lbl_overall = NULL,
                          lbl_aval = "Duration of exposure",
                          prune_0 = FALSE,
                          deco = std_deco("RMPT01"),
                          ...) {
  dbsel <- get_db_data(adam_db, "adsl", "adex")

  lyt <- rmpt01_1_lyt(
    arm_var = arm_var,
    lbl_overall = lbl_overall,
    lbl_aval = lbl_aval,
    deco = deco
  )

  tbl <- build_table(lyt, dbsel$adex, alt_counts_df = dbsel$adsl)
  tbl
}

#' @describeIn rmpt01_1 Layout
#'
#' @inheritParams gen_args
#' @param lbl_aval (`string`) the label of the time variable.
#'
#' @export
#'
rmpt01_1_lyt <- function(arm_var,
                         lbl_overall,
                         lbl_aval,
                         deco) {
  basic_table_deco(deco) %>%
    split_cols_by(var = arm_var) %>%
    add_colcounts() %>%
    ifneeded_add_overall_col(lbl_overall) %>%
    summarize_patients_exposure_in_cols(
      var = "AVAL",
      col_split = TRUE,
      .labels = c(
        n_patients = "Number of Patients",
        sum_exposure = "Patient Time*"
      ),
      custom_label = "Total Number of Patients and Patient Time"
    ) %>%
    split_rows_by("aval_months_cat",
      label_pos = "topleft",
      split_label = lbl_aval
    ) %>%
    summarize_patients_exposure_in_cols(
      var = "AVAL",
      col_split = FALSE
    )
  append_topleft(paste0(" ", lbl_aval))
}

#' @describeIn rmpt01_1 Preprocessing
#'
#' @inheritParams gen_args
#'
#' @export
#'
rmpt01_1_pre <- function(adam_db, ...) {
  checkmate::assert_class(adam_db, "dm")
  adam_db %>%
    dm_zoom_to("adex") %>%
    filter(
      .data$PARAMCD == "TDURD",
      .data$PARCAT2 == "Drug A",
      .data$SAFFL == "Y"
    ) %>%
    mutate(
      aval_months = day2month(.data$AVAL),
      aval_months_cat = factor(case_when(
        aval_months < 1 ~ "< 1 month",
        aval_months >= 1 & aval_months < 3 ~ "1 to <3 months",
        aval_months >= 3 & aval_months < 6 ~ "3 to <6 months",
        TRUE ~ ">=6 months"
      ), levels = c("< 1 month", "1 to <3 months", "3 to <6 months", ">=6 months"))
    ) %>%
    dm_update_zoomed() %>%
    dm_zoom_to("adsl") %>%
    filter(.data$SAFFL == "Y")
  dm_update_zoomed()
}

#' @describeIn rmpt01_1 Postprocessing
#'
#' @inheritParams gen_args
#'
#' @export
#'
rmpt01_1_post <- function(tlg, prune_0 = FALSE, ...) {
  if (prune_0) {
    tlg <- smart_prune(tlg)
  }
  std_postprocess(tlg)
}

#' `RMPT01` Table 1 (Default) Duration of Exposure for Risk Management Plan Table 1.
#'
#' Duration of Exposure: Safety-Evaluable Patients
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' run(rmpt01_1, syn_data)
rmpt01_1 <- chevron_t(
  main = rmpt01_1_main,
  preprocess = rmpt01_1_pre,
  postprocess = rmpt01_1_post,
  adam_datasets = c("adex", "adsl")
)
