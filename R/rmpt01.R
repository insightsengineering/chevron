# rmpt01_1 ----

#' @describeIn rmpt01_1 Main TLG function
#'
#' @inheritParams gen_args
#' @param lbl_aval (`string`) the label of the time variable.
#'
#' @details
#'   * Patient time is the sum of exposure across all patients in unit: days, months, or years (days only at this time).
#'   * Summary statistics are by default based on the number of patients in the corresponding `N` row
#'   (number of non-missing values).
#'   * Does not include a total column by default.
#'   * Does not remove zero-count rows unless overridden with `prune_0 = TRUE`.
#'
#' @note
#'   * `adam_db` object must contain an `adex` table with the `"PARAMCD"`, `"AVAL"` and `"AVALU"` columns.
#'
#' @export
#'
rmpt01_1_main <- function(adam_db,
                          arm_var = "ACTARM",
                          lbl_aval = "Duration of exposure",
                          deco = std_deco("RMPT01"),
                          ...) {
  dbsel <- get_db_data(adam_db, "adsl", "adex")
  assert_colnames(dbsel$adex, c("aval_days", "aval_months_cat"))
  checkmate::assert_numeric(dbsel$adex[["aval_days"]], any.missing = FALSE)
  checkmate::assert_class(dbsel$adex[["aval_months_cat"]], "factor", null.ok = FALSE)

  lyt <- rmpt01_1_lyt(
    arm_var = arm_var,
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
                         lbl_aval,
                         deco) {
  basic_table_deco(deco) %>%
    add_colcounts() %>%
    summarize_patients_exposure_in_cols(
      var = "aval_days",
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
      var = "aval_days",
      col_split = FALSE
    )
}

#' @describeIn rmpt01_1 Preprocessing
#'
#' @inheritParams gen_args
#'
#' @export
#'
rmpt01_1_pre <- function(adam_db, arm_var = "ACTARM", ...) {
  rmpt01_1_check(adam_db, arm_var = arm_var)

  new_format <- list(
    adex = list(
      AVALU = rule("<Missing>" = c("", NA, "<Missing>"))
    )
  )
  adam_db <- dunlin::reformat(adam_db, new_format, na_last = TRUE)

  adam_db$adex <- adam_db$adex %>%
    mutate(
      aval_months = case_when(
        .data$AVALU == "DAYS" ~ day2month(.data$AVAL),
        .data$AVALU == "MONTHS" ~ .data$AVAL,
        .data$AVALU == "YEARS" ~ (.data$AVAL) * 12,
        TRUE ~ NA
      ),
      aval_days = case_when(
        .data$AVALU == "DAYS" ~ .data$AVAL,
        .data$AVALU == "MONTHS" ~ (.data$AVAL) * 30.4375,
        .data$AVALU == "YEARS" ~ (.data$AVAL) * 365,
        TRUE ~ NA
      ),
      aval_months_cat = factor(case_when(
        aval_months < 1 ~ "< 1 month",
        aval_months < 3 ~ "1 to <3 months",
        aval_months < 6 ~ "3 to <6 months",
        TRUE ~ ">=6 months"
      ), levels = c("< 1 month", "1 to <3 months", "3 to <6 months", ">=6 months"))
    ) %>%
    filter(
      !is.na(.data$AVAL),
      .data$AVALU != "<Missing>"
    )

  adam_db
}

#' @describeIn rmpt01_1 Checks
#'
#' @inheritParams gen_args
#' @export
rmpt01_1_check <- function(adam_db, arm_var,
                           req_tables = c("adsl", "adex")) {
  assert_all_tablenames(adam_db, req_tables)

  msg <- NULL

  msg <- c(msg, check_all_colnames(adam_db$adex, c(arm_var, "USUBJID", "PARAMCD", "AVAL", "AVALU")))
  msg <- c(msg, check_all_colnames(adam_db$adsl, c(arm_var, "USUBJID")))

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
#' library(dplyr)
#'
#' set.seed(1)
#' proc_data <- syn_data
#' proc_data$adex <- proc_data$adex %>%
#'   group_by(USUBJID) %>%
#'   mutate(
#'     id = seq_along(AVAL),
#'     AVAL = sample(x = seq(1, 200), size = n(), replace = TRUE)
#'   ) %>%
#'   ungroup() %>%
#'   mutate(
#'     PARAMCD = factor(case_when(id == 1 ~ "TDURD", TRUE ~ .data$PARAMCD)),
#'     AVALU = factor(case_when(PARAMCD == "TDURD" ~ "DAYS", TRUE ~ .data$AVALU))
#'   ) %>%
#'   filter(.data$PARAMCD == "TDURD")
#'
#' run(rmpt01_1, proc_data)
rmpt01_1 <- chevron_t(
  main = rmpt01_1_main,
  preprocess = rmpt01_1_pre,
  postprocess = rmpt01_1_post,
  adam_datasets = c("adsl", "adex")
)
