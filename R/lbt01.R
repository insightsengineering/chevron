# lbt01 ----

#' @describeIn lbt01 Main TLG function
#'
#' @inheritParams gen_args
#' @param summaryvars (`character`) variables to be analyzed. The label attribute of the corresponding column in `adlb`
#'   table of `adam_db` is used as label.
#' @param visitvar (`string`) the type of time point to use. Typically one of `"AVISIT"` (Default) or `"ATPTN"`.
#' @param precision (named `list` of `integer`) where names are values found in the `PARAMCD` column and the the values
#'   indicate the number of digits that should be represented for `min`, `max` and `median`. `Mean` and `sd` are
#'   represented with one more decimal of precision.
#' @param default_precision (`integer`) the default number of digits.
#'
#' @details
#'  * The `Analysis Value` column, displays the number of patients, the mean, standard deviation, median and range of
#'  the analysis value for each visit.
#'  * The `Change from Baseline` column, displays the number of patient and the mean, standard deviation,
#'  median and range of changes relative to the baseline.
#'  * Remove zero-count rows unless overridden with `prune_0 = FALSE`.
#'  * Split columns by arm, typically `ACTARM`.
#'  * Does not include a total column by default.
#'  * Sorted  based on factor level; first by `PARAM` labels in alphabetic order then by chronological time point given
#'  by `AVISIT`. Re-level to customize order.
#'
#' @note
#'   * `adam_db` object must contain an `adlb` table with columns specified in `summaryvars`.
#'
#' @export
#'
lbt01_main <- function(adam_db,
                       arm_var = "ACTARM",
                       summaryvars = c("AVAL", "CHG"),
                       visitvar = "AVISIT",
                       precision = list(),
                       default_precision = 2,
                       ...) {
  assert_all_tablenames(adam_db, c("adsl", "adlb"))
  checkmate::assert_string(arm_var)
  assert_valid_variable(adam_db$adlb, c("PARAM", "PARAMCD"), types = list("character", "factor"), na_ok = FALSE)
  assert_valid_variable(adam_db$adlb, c(summaryvars), types = list("numeric"), na_ok = TRUE, empty_ok = TRUE)
  assert_valid_variable(adam_db$adlb, c(visitvar), types = c("character", "factor"))
  assert_valid_variable(adam_db$adlb, c("USUBJID"), types = list(c("character", "factor")), empty_ok = TRUE)
  assert_valid_variable(adam_db$adsl, c("USUBJID"), types = list(c("character", "factor")))
  assert_valid_var_pair(adam_db$adsl, adam_db$adlb, arm_var)
  checkmate::assert_list(precision, types = "integerish", names = "unique")
  vapply(precision, checkmate::assert_integerish, FUN.VALUE = numeric(1), lower = 0, len = 1)
  checkmate::assert_integerish(default_precision, lower = 0, len = 1)

  lbl_avisit <- var_labels_for(adam_db$adlb, visitvar)
  lbl_param <- var_labels_for(adam_db$adlb, "PARAM")
  summaryvars_lbls <- var_labels_for(adam_db$adlb, summaryvars)

  lyt <- lbt01_lyt(
    arm_var = arm_var,
    summaryvars = summaryvars,
    summaryvars_lbls = summaryvars_lbls,
    visitvar = visitvar,
    lbl_avisit = lbl_avisit,
    lbl_param = lbl_param,
    precision = precision,
    default_precision = default_precision
  )

  tbl <- build_table(lyt, adam_db$adlb)

  tbl
}

#' `lbt01` Layout
#'
#' @inheritParams lbt01_main
#'
#' @param summaryvars (`character`) the variables to be analyzed. For this table, `AVAL` and `CHG` by default.
#' @param summaryvars_lbls (`character`) the label of the variables to be analyzed.
#' @param visitvar (`string`) typically one of `"AVISIT"` (Default) or `"ATPTN"` depending on the type of time point
#'   to be displayed.
#' @param lbl_avisit (`string`) label of the `visitvar` variable.
#' @param lbl_param (`string`) label of the `PARAM` variable.
#'
#'
#' @keywords internal
#'
lbt01_lyt <- function(arm_var,
                      summaryvars,
                      summaryvars_lbls,
                      visitvar,
                      lbl_avisit,
                      lbl_param,
                      precision,
                      default_precision) {
  basic_table(show_colcounts = TRUE) %>%
    split_cols_by(arm_var) %>%
    split_rows_by(
      var = "PARAMCD",
      labels_var = "PARAM",
      split_fun = drop_split_levels,
      label_pos = "hidden",
      split_label = paste(lbl_param)
    ) %>%
    split_rows_by(
      visitvar,
      split_fun = drop_split_levels,
      label_pos = "hidden",
      split_label = lbl_avisit
    ) %>%
    split_cols_by_multivar(
      vars = summaryvars,
      varlabels = summaryvars_lbls,
      nested = TRUE
    ) %>%
    analyze_colvars(
      afun = function(x, .var, .spl_context, precision, default_precision, ...) {
        param_val <- .spl_context$value[which(.spl_context$split == "PARAMCD")]

        pcs <- precision[[param_val]] %||% default_precision

        # Create context dependent function.
        n_fun <- sum(!is.na(x), na.rm = TRUE)
        if (n_fun == 0) {
          mean_sd_fun <- c(NA, NA)
          median_fun <- NA
          min_max_fun <- c(NA, NA)
        } else {
          mean_sd_fun <- c(mean(x, na.rm = TRUE), sd(x, na.rm = TRUE))
          median_fun <- median(x, na.rm = TRUE)
          min_max_fun <- c(min(x), max(x))
        }

        # Identify context-
        is_chg <- .var == "CHG"

        is_baseline <- .spl_context$value[which(.spl_context$split == "AVISIT")] == "BASELINE"

        if (is_baseline && is_chg) {
          n_fun <- mean_sd_fun <- median_fun <- min_max_fun <- NULL
        }

        in_rows(
          "n" = n_fun,
          "Mean (SD)" = mean_sd_fun,
          "Median" = median_fun,
          "Min - Max" = min_max_fun,
          .formats = list(
            "n" = "xx",
            "Mean (SD)" = h_format_dec(format = "%f (%f)", digits = pcs + 1),
            "Median" = h_format_dec(format = "%f", digits = pcs + 1),
            "Min - Max" = h_format_dec(format = "%f - %f", digits = pcs)
          ),
          .format_na_strs = list(
            "n" = "NE",
            "Mean (SD)" = "NE (NE)",
            "Median" = "NE",
            "Min - Max" = "NE - NE"
          )
        )
      },
      extra_args = list(
        precision = precision,
        default_precision = default_precision
      )
    ) %>%
    append_topleft(paste(lbl_param)) %>%
    append_topleft(c(paste(" ", lbl_avisit), " "))
}

#' @describeIn lbt01 Preprocessing
#'
#' @inheritParams gen_args
#'
#' @export
#'
lbt01_pre <- function(adam_db, ...) {
  adam_db$adlb <- adam_db$adlb %>%
    filter(.data$ANL01FL == "Y") %>%
    mutate(
      AVISIT = reorder(.data$AVISIT, .data$AVISITN),
      AVISIT = with_label(.data$AVISIT, "Analysis Visit"),
      AVAL = with_label(.data$AVAL, "Value at Visit"),
      CHG = with_label(.data$CHG, "Change from \nBaseline")
    )

  adam_db
}

#' @describeIn lbt01 Postprocessing
#'
#' @inheritParams gen_args
#'
#' @export
#'
lbt01_post <- function(tlg, prune_0 = TRUE, ...) {
  if (prune_0) tlg <- tlg %>% trim_rows()
  std_postprocess(tlg)
}

#' `LBT01` Laboratory Test Results and Change from Baseline by Visit Table.
#'
#' The `LBT01` table provides an
#' overview of the analysis values and its change from baseline of each respective arm over the course of the trial.
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' run(lbt01, syn_data, precision = list(
#'   "ALT" = 0,
#'   "CRP" = 1
#' ))
lbt01 <- chevron_t(
  main = lbt01_main,
  preprocess = lbt01_pre,
  postprocess = lbt01_post,
  adam_datasets = c("adlb")
)
