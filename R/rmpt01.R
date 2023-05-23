# rmpt01 ----

#' @describeIn rmpt01 Main TLG function
#'
#' @inheritParams gen_args
#' @param summaryvars (`character`) variables to be analyzed. The label attribute of the corresponding columns in `adex`
#'   table of `adam_db` is used as label.
#' @param parcat (`string`) the name of the variable initiating a new row split.
#'
#' @details
#'   * Person time is the sum of exposure across all patients.
#'   * Summary statistics are by default based on the number of patients in the corresponding `N` row
#'   (number of non-missing values).
#'   * Does not remove zero-count rows unless overridden with `prune_0 = TRUE`.
#'
#' @note
#'   * `adam_db` object must contain an `adex` table with `"PARAMCD"` and the columns specified by `anl_vars` which
#'   is denoted as `c("AVALCAT1", "AVAL")` by default.
#'
#' @export
#'
rmpt01_main <- function(adam_db,
                        summaryvars = c("AVALCAT1", "AVAL"),
                        parcat = NULL,
                        ...) {
  assert_all_tablenames(adam_db, c("adsl", "adex"))
  checkmate::assert_string(parcat, null.ok = TRUE)
  checkmate::assert_character(summaryvars, len = 2L)
  assert_valid_variable(adam_db$adex, summaryvars[1], types = list(c("character", "factor")))
  assert_valid_variable(adam_db$adex, summaryvars[2], types = list("numeric"))
  assert_valid_variable(adam_db$adex, c("USUBJID", "PARAMCD", parcat))
  lbl_parcat <- var_labels_for(adam_db$adex, parcat)
  lbl_summaryvars <- var_labels_for(adam_db$adex, summaryvars)

  lyt <- rmpt01_lyt(
    summaryvars = summaryvars,
    lbl_summaryvars = lbl_summaryvars,
    parcat = parcat,
    lbl_parcat = lbl_parcat
  )

  tbl <- build_table(lyt, adam_db$adex, alt_counts_df = adam_db$adsl)
  tbl
}

#' `rmpt01` Layout
#'
#' @inheritParams gen_args
#' @inheritParams rmpt01_main
#' @param lbl_summaryvars (`character`) label associated with the analyzed variables.
#' @param lbl_parcat (`string`) the label associated with the variable initiating a new row split.
#'
#' @keywords internal
#'
rmpt01_lyt <- function(summaryvars,
                       lbl_summaryvars,
                       parcat,
                       lbl_parcat) {
  basic_table(show_colcounts = TRUE) %>%
    ifneeded_split_row(parcat, lbl_parcat) %>%
    summarize_patients_exposure_in_cols(
      var = summaryvars[2],
      col_split = TRUE,
      .labels = c(
        n_patients = lbl_summaryvars[1],
        sum_exposure = lbl_summaryvars[2]
      ),
      custom_label = "Total Number of Patients and Person Time"
    ) %>%
    analyze_patients_exposure_in_cols(
      var = summaryvars[1],
      ex_var = summaryvars[2],
      col_split = FALSE
    )
}

#' @describeIn rmpt01 Preprocessing
#'
#' @inheritParams gen_args
#'
#' @export
#'
rmpt01_pre <- function(adam_db,
                       parcat = NULL,
                       ...) {
  adam_db$adex <- adam_db$adex %>%
    filter(.data$PARAMCD == "TDURD")

  adam_db$adex$AVALCAT1 <- droplevels(adam_db$adex$AVALCAT1)
  if (!is.null(parcat)) adam_db$adex[[parcat]] <- droplevels(adam_db$adex[[parcat]])

  adam_db$adex <- adam_db$adex %>%
    mutate(
      AVALCAT1 = with_label(.data$AVALCAT1, "Patients"),
      AVAL = with_label(.data$AVAL, "Person time*"),
      PARCAT2 = with_label(.data$PARCAT2, "Parameter Category")
    )

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
#' run(rmpt01, syn_data)
#'
#' run(rmpt01, syn_data, parcat = "PARCAT2")
rmpt01 <- chevron_t(
  main = rmpt01_main,
  preprocess = rmpt01_pre,
  postprocess = rmpt01_post,
  adam_datasets = c("adsl", "adex")
)
