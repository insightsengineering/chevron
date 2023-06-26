# rmpt01 ----

#' @describeIn rmpt01 Main TLG function
#'
#' @inheritParams gen_args
#' @param summaryvars (`string`) variables to be analyzed. The label attribute of the corresponding columns in `adex`
#'   table of `adam_db` is used as label.
#' @param show_tot (`flag`) whether to display the cumulative total.
#' @param split_var (`string`) the name of the column that containing variable to split exposure by.
#' @param col_split_var (`string`) additional column splitting variable.
#' @param overall_col_lbl (`string`) name of the overall column. If `NULL`, no overall level is added.
#'
#' @details
#'   * Person time is the sum of exposure across all patients.
#'   * Summary statistics are by default based on the number of patients in the corresponding `N` row
#'   (number of non-missing values).
#'   * Does not remove zero-count rows unless overridden with `prune_0 = TRUE`.
#'
#' @note
#'   * `adam_db` object must contain an `adex` table with `"AVAL"` and the columns specified by `summaryvars`.
#' @export
#'
rmpt01_main <- function(adam_db,
                        summaryvars = "AVALCAT1",
                        show_tot = TRUE,
                        split_var = NULL,
                        col_split_var = NULL,
                        overall_col_lbl = NULL,
                        ...) {
  assert_all_tablenames(adam_db, c("adsl", "adex"))
  checkmate::assert_string(summaryvars)
  checkmate::assert_flag(show_tot)
  checkmate::assert_string(col_split_var, null.ok = TRUE)
  checkmate::assert_string(overall_col_lbl, null.ok = TRUE)
  assert_valid_variable(adam_db$adex, summaryvars, types = list(c("factor", "character")), empty_ok = FALSE)
  assert_valid_variable(adam_db$adex, "AVAL", types = list("numeric"))
  assert_valid_variable(adam_db$adex, split_var, types = list(c("factor", "numeric")), empty_ok = TRUE)
  assert_valid_variable(adam_db$adex, col_split_var, types = list(c("factor", "character")))
  checkmate::assert_string(overall_col_lbl, null.ok = TRUE)

  assert_valid_variable(adam_db$adex, "USUBJID", empty_ok = TRUE, types = list(c("character", "factor")))
  assert_valid_variable(adam_db$adsl, "USUBJID", types = list(c("character", "factor")))

  lbl_summaryvars <- var_labels_for(adam_db$adex, summaryvars)

  lyt <- rmpt01_lyt(
    summaryvars = summaryvars,
    lbl_summaryvars = lbl_summaryvars,
    show_tot = show_tot,
    split_var = split_var,
    col_split_var = col_split_var,
    overall_col_lbl = overall_col_lbl
  )

  build_table(lyt, adam_db$adex, alt_counts_df = adam_db$adsl)
}


#' `rmpt01` Layout
#'
#' @inheritParams gen_args
#' @inheritParams rmpt01_main
#' @param lbl_summaryvars (`character`) label associated with the analyzed variables.
#'
#' @keywords internal
#'
rmpt01_lyt <- function(summaryvars,
                       lbl_summaryvars,
                       show_tot,
                       split_var,
                       col_split_var,
                       overall_col_lbl) {
  lyt <- basic_table(show_colcounts = TRUE) %>%
    ifneeded_split_col(col_split_var, overall_col_lbl) %>%
    split_cols_by_multivar(
      vars = c("AVAL", "AVAL"),
      varlabels = c(n_patients = "Patients", sum_exposure = "Person time"),
      extra_args = list(.stats = c("n_patients", "sum_exposure"))
    ) %>%
    analyze_patients_exposure_in_cols(
      var = summaryvars,
      col_split = FALSE,
      add_total_level = show_tot,
      custom_label = "Total patients number/person time"
    )

  if (!is.null(split_var)) {
    lyt %>%
      split_rows_by(split_var) %>%
      analyze_patients_exposure_in_cols(
        .indent_mods = -1,
        var = summaryvars,
        col_split = FALSE,
        add_total_level = show_tot,
        custom_label = "Total patients number/person time"
      ) %>%
      append_topleft(c("", lbl_summaryvars))
  } else {
    lyt %>%
      append_topleft(c("", lbl_summaryvars))
  }
}

#' @describeIn rmpt01 Preprocessing
#'
#' @inheritParams gen_args
#' @inheritParams rmpt01_main
#'
#' @export
#'
rmpt01_pre <- function(adam_db,
                       summaryvars = "AVALCAT1",
                       ...) {
  adam_db$adex <- adam_db$adex %>%
    filter(.data$PARAMCD == "TDURD")

  adam_db$adex$AVALCAT1 <- droplevels(adam_db$adex$AVALCAT1)

  adam_db$adex <- adam_db$adex %>%
    mutate(
      AVALCAT1 = with_label(.data$AVALCAT1, "Duration of exposure")
    )

  adam_db$adex[[summaryvars]] <- reformat(adam_db$adex[[summaryvars]], missing_rule)
  if (!"<Missing>" %in% adam_db$adex[[summaryvars]] && summaryvars %in% colnames(adam_db$adex)) {
    adam_db$adex[[summaryvars]] <- forcats::fct_drop(adam_db$adex[[summaryvars]], only = "<Missing>")
  }

  adam_db
}

#' @describeIn rmpt01 Postprocessing
#'
#' @inheritParams gen_args
#'
#' @export
#'
rmpt01_post <- function(tlg, prune_0 = FALSE, ...) {
  if (prune_0) {
    tlg <- smart_prune(tlg)
  }
  std_postprocess(tlg)
}

#' `RMPT01`Duration of Exposure for Risk Management Plan Table.
#'
#' The `RMPT01` table provides an overview of duration of exposure.
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' run(rmpt01, syn_data, col_split_var = "SEX")
rmpt01 <- chevron_t(
  main = rmpt01_main,
  preprocess = rmpt01_pre,
  postprocess = rmpt01_post
)
