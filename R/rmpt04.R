# rmpt04 ----

#' @describeIn rmpt04 Main TLG function
#'
#' @inheritParams gen_args
#' @param summaryvars (`character`) variables to be analyzed. The label attribute of the corresponding columns in `adsl`
#'   table of `adam_db` is used as label.
#' @param show_tot (`flag`) whether to display the cumulative total.
#' @param indication (`string`) the name of the column that containing variable to split exposure by.
#'
#' @export
#'
rmpt04_main <- function(adam_db,
                        summaryvars = "ETHNIC",
                        show_tot = TRUE,
                        indication = NULL,
                        ...) {
  assert_all_tablenames(adam_db, c("adsl", "adex"))
  checkmate::assert_string(summaryvars)
  checkmate::assert_flag(show_tot)
  assert_valid_variable(adam_db$adex, summaryvars, types = list("factor", "character"), empty_ok = FALSE)
  assert_valid_variable(adam_db$adex, "AVAL", types = list("numeric"))
  assert_valid_variable(adam_db$adex, indication, types = list("factor", "numeric"), empty_ok = TRUE)
  assert_valid_variable(adam_db$adex, "USUBJID", empty_ok = TRUE, types = list(c("character", "factor")))
  assert_valid_variable(adam_db$adsl, "USUBJID", types = list(c("character", "factor")))

  lbl_summaryvars <- var_labels_for(adam_db$adsl, summaryvars)

  lyt <- rmpt04_lyt(
    summaryvars = summaryvars,
    lbl_summaryvars = lbl_summaryvars,
    show_tot = show_tot,
    indication = indication
  )

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
                       lbl_summaryvars,
                       show_tot,
                       indication) {
  lyt <- basic_table(show_colcounts = TRUE) %>%
    split_cols_by_multivar(
      vars = c("AVAL", "AVAL"),
      varlabels = c(n_patients = "Patients", sum_exposure = "Person time"),
      extra_args = list(.stats = c("n_patients", "sum_exposure"))
    ) %>%
    analyze_patients_exposure_in_cols(
      var = summaryvars,
      col_split = FALSE,
      add_total_level = show_tot,
      custom_label = "Cumulative total"
    )

  if (!is.null(indication)) {
    lyt %>%
      split_rows_by(indication) %>%
      analyze_patients_exposure_in_cols(
        .indent_mods = -1,
        var = summaryvars,
        col_split = FALSE,
        add_total_level = show_tot,
        custom_label = "Total"
      ) %>%
      append_topleft(c("", lbl_summaryvars))
  } else {
    lyt %>%
      append_topleft(c("", lbl_summaryvars))
  }
}

#' @describeIn rmpt04 Preprocessing
#'
#' @inheritParams gen_args
#'
#' @export
#'
rmpt04_pre <- function(adam_db, ...) {
  adam_db$adex <- adam_db$adex %>%
    filter(.data$PARAMCD == "TDURD") %>%
    mutate(ETHNIC = with_label(.data$ETHNIC, "Ethnicity"))

  adam_db
}

#' @describeIn rmpt04 Postprocessing
#'
#' @inheritParams gen_args
#'
#' @export
#'
rmpt04_post <- function(tlg, prune_0 = TRUE, ...) {
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
#' run(rmpt04, syn_data, show_tot = TRUE, indication = "PARCAT1")
rmpt04 <- chevron_t(
  main = rmpt04_main,
  preprocess = rmpt04_pre,
  postprocess = rmpt04_post,
  adam_datasets = c("adsl", "adex")
)
