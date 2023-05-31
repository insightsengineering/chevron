# rmpt04 ----

#' @describeIn rmpt04 Main TLG function
#'
#' @inheritParams gen_args
#' @param summaryvars (`character`) variables to be analyzed. The label attribute of the corresponding columns in `adsl`
#'   table of `adam_db` is used as label.
#'
#' @export
#'
rmpt04_main <- function(adam_db,
                        summaryvars = "ETHNIC",
                        ...) {

  assert_all_tablenames(adam_db, c("adsl", "adex"))
  checkmate::assert_string(summaryvars)
  assert_valid_variable(adam_db$adsl, summaryvars, types = list("factor"))
  assert_valid_variable(adam_db$adex, "AVAL", types = list("numeric"))

  lbl_summaryvars <- var_labels_for(adam_db$adsl, summaryvars)

  lyt <- rmpt04_lyt(summaryvars, lbl_summaryvars)

  build_table(lyt, df = adam_db$adex, alt_counts_df = adam_db$adsl)
}

#' `rmpt04` Layout
#'
#' @inheritParams gen_args
#' @inheritParams rmpt04_main
#' @param lbl_summaryvars (`string`) label associated with the analyzed variable.
#'
#' @keywords internal
#'
rmpt04_lyt <- function(summaryvars,
                       lbl_summaryvars) {

  basic_table(show_colcounts = TRUE) %>%
    summarize_patients_exposure_in_cols(
      var = "AVAL",
      col_split = TRUE,
      .labels = c(n_patients = "Number of Patients",
                  sum_exposure = "Patient Time*"),
      custom_label = "Total Number of Patients and Patient Time"
    ) %>%
    analyze_patients_exposure_in_cols(
      var = summaryvars,
      col_split = FALSE
    ) %>%
    append_topleft(c("", lbl_summaryvars))
}

#' @describeIn rmpt04 Preprocessing
#'
#' @inheritParams gen_args
#'
#' @export
#'
rmpt04_pre <- function(adam_db, ...) {

  adam_db$adex <- adam_db$adex %>%
    filter(.data$PARAMCD == "TDURD")

  adam_db$adsl <- adam_db$adsl %>%
    mutate(ETHNIC = with_label(.data$ETHNIC, "Ethnicity"))

  adam_db
}

#' @describeIn rmpt04 Postprocessing
#'
#' @inheritParams gen_args
#'
#' @export
#'
rmpt04_post <- function(tlg, prune_0 = FALSE, ...) {
  if (prune_0) {
    tlg <- smart_prune(tlg)
  }
  std_postprocess(tlg)
}

#' `RMPT04`Extent of Exposure by Ethnic Origin for Risk Management Plan Table.
#'
#' The `RMPT04` table provides an overview of duration of exposure extent.
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' run(rmpt04, syn_data)
rmpt04 <- chevron_t(
  main = rmpt04_main,
  preprocess = rmpt04_pre,
  postprocess = rmpt04_post,
  adam_datasets = c("adsl", "adex")
)
