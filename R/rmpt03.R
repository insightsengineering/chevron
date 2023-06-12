# rmpt03 ----

#' @describeIn rmpt03 Main TLG function
#'
#' @inheritParams gen_args
#' @param summaryvars (`string`) variables to be analyzed. The label attribute of the corresponding columns in `adsl`
#'   table of `adam_db` is used as label.
#' @param show_tot (`flag`) whether to display the cumulative total.
#' @param split_var (`string`) the name of the column that containing variable to split exposure by.
#'
#' @details
#'   * Person time is the sum of exposure across all patients.
#'   * Summary statistics are by default based on the number of patients in the corresponding `N` row
#'   (number of non-missing values).
#'   * Does not remove zero-count rows unless overridden with `prune_0 = TRUE`.
#'
#' @export
#'
rmpt03_main <- function(adam_db,
                        summaryvars = "AGEGR1",
                        show_tot = TRUE,
                        split_var = NULL,
                        ...) {
  assert_all_tablenames(adam_db, c("adsl", "adex"))
  checkmate::assert_string(summaryvars)
  checkmate::assert_flag(show_tot)
  assert_valid_variable(adam_db$adex, summaryvars, types = list("factor", "character"), empty_ok = FALSE)
  assert_valid_variable(adam_db$adex, "SEX", types = list("factor", "character"), empty_ok = FALSE)
  assert_valid_variable(adam_db$adex, "AVAL", types = list("numeric"))
  assert_valid_variable(adam_db$adex, split_var, types = list("factor", "numeric"), empty_ok = TRUE)
  assert_valid_variable(adam_db$adex, "USUBJID", empty_ok = TRUE, types = list(c("character", "factor")))
  assert_valid_variable(adam_db$adsl, "USUBJID", types = list(c("character", "factor")))

  lbl_summaryvars <- var_labels_for(adam_db$adex, summaryvars)

  lyt <- rmpt03_lyt(
    summaryvars = summaryvars,
    lbl_summaryvars = lbl_summaryvars,
    show_tot = show_tot,
    split_var = split_var
  )

  build_table(lyt, df = adam_db$adex, alt_counts_df = adam_db$adsl)
}


#' `rmpt03` Layout
#'
#' @inheritParams gen_args
#' @inheritParams rmpt03_main
#' @param lbl_summaryvars (`character`) label associated with the analyzed variables.
#'
#' @keywords internal
#'
rmpt03_lyt <- function(summaryvars,
                       lbl_summaryvars,
                       show_tot,
                       split_var) {
  lyt <- basic_table(show_colcounts = TRUE) %>%
    split_cols_by("SEX", split_fun = add_overall_level("SEX_ALL", "All Genders")) %>%
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


#' @describeIn rmpt03 Preprocessing
#'
#' @inheritParams gen_args
#'
#' @export
#'
rmpt03_pre <- function(adam_db,
                       ...) {
  adam_db$adex <- adam_db$adex %>%
    filter(.data$PARAMCD == "TDURD")

  adam_db
}

#' @describeIn rmpt03 Postprocessing
#'
#' @inheritParams gen_args
#'
#' @export
#'
rmpt03_post <- function(tlg, prune_0 = FALSE, ...) {
  if (prune_0) {
    tlg <- smart_prune(tlg)
  }
  std_postprocess(tlg)
}

#' `rmpt03`Duration of Exposure for Risk Management Plan Table.
#'
#' The `rmpt03` table provides an overview of duration of exposure.
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' pre_data <- dunlin::propagate(syn_data, "adsl", "AGEGR1", "USUBJID")
#' run(rmpt03, pre_data)
rmpt03 <- chevron_t(
  main = rmpt03_main,
  preprocess = rmpt03_pre,
  postprocess = rmpt03_post,
  adam_datasets = c("adsl", "adex")
)
