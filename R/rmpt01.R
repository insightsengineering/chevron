# rmpt01_1 ----

#' @describeIn rmpt01_1 Main TLG function
#'
#' @inheritParams gen_args
#' @param anl_vars (`character`) the variables to be analyzed.
#'
#' @details
#'   * Person time is the sum of exposure across all patients in unit: days, months, or years (days only at this time).
#'   * Summary statistics are by default based on the number of patients in the corresponding `N` row
#'   (number of non-missing values).
#'   * Does not include a total column by default.
#'   * Does not remove zero-count rows unless overridden with `prune_0 = TRUE`.
#'
#' @note
#'   * `adam_db` object must contain an `adex` table with the `"PARAMCD"`, `"AVAL"` and `"AVALCAT1"` columns.
#'
#' @export
#'
rmpt01_1_main <- function(adam_db,
                          anl_vars = c("AVALCAT1", "AVAL"),
                          lbl_vars = c("Patients", "Person time*"),
                          deco = std_deco("RMPT01"),
                          ...) {
  dbsel <- get_db_data(adam_db, "adsl", "adex")
  assert_colnames(dbsel$adex, anl_vars)

  lyt <- rmpt01_1_lyt(
    anl_vars = anl_vars,
    lbl_vars = lbl_vars,
    deco = deco
  )

  tbl <- build_table(lyt, dbsel$adex, alt_counts_df = dbsel$adsl)
  tbl
}

#' @describeIn rmpt01_1 Layout
#'
#' @inheritParams gen_args
#' @param lbl_vars (`character`) the labels of the patient toll and time variables.
#'
#' @export
#'
rmpt01_1_lyt <- function(anl_vars,
                         lbl_vars,
                         deco) {
  basic_table_deco(deco) %>%
    add_colcounts() %>%
    summarize_patients_exposure_in_cols(
      var = anl_vars[2],
      col_split = TRUE,
      .labels = c(
        n_patients = lbl_vars[1],
        sum_exposure = lbl_vars[2]
      ),
      custom_label = "Total Number of Patients and Person Time"
    ) %>%
    split_rows_by(
      var = anl_vars[1],
      label_pos = "topleft",
      split_label = "Duration of exposure"
    ) %>%
    summarize_patients_exposure_in_cols(
      var = anl_vars[2],
      col_split = FALSE
    )
}

#' @describeIn rmpt01_1 Preprocessing
#'
#' @inheritParams gen_args
#'
#' @export
#'
rmpt01_1_pre <- function(adam_db, anl_vars = c("AVALCAT1", "AVAL"), ...) {
  rmpt01_1_check(adam_db, anl_vars = anl_vars)
  adam_db <- dunlin::log_filter(adam_db, PARAMCD == "TDURD", "adex")
  adam_db$adex[[anl_vars[1]]] <- droplevels(adam_db$adex[[anl_vars[1]]])
  adam_db
}

#' @describeIn rmpt01_1 Checks
#'
#' @inheritParams gen_args
#'
#' @export
#'
rmpt01_1_check <- function(adam_db,
                           anl_vars,
                           req_tables = c("adsl", "adex")) {
  assert_all_tablenames(adam_db, req_tables)

  msg <- NULL

  msg <- c(msg, check_all_colnames(adam_db$adex, c("USUBJID", "PARAMCD", anl_vars)))
  msg <- c(msg, check_all_colnames(adam_db$adsl, c("USUBJID")))

  if (is.null(msg)) {
    TRUE
  } else {
    stop(paste(msg, collapse = "\n  "))
  }
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
#' The `RMPT01` table provides an overview of duration of exposure for SE patients
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
  adam_datasets = c("adsl", "adex")
)
