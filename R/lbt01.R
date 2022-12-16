# lbt01_1 ----

#' @describeIn lbt01_1 Main TLG function
#'
#' @inheritParams gen_args
#' @param summaryvars (named vector of `character`) variables to be analyzed. Names are used as subtitles. For values
#'   where no name is provided, the label attribute of the corresponding column in `adlb` table of `adam_db` is used.
#' @param visitvar (`character`) the type of time point to use. Typically one of `"AVISIT"` (Default) or `"ATPTN"`.
#' @param precision (named vector of `integer`) where names are values found in the `PARAM` column and the the values
#'   indicate the number of digits that should be represented for the mean, median and standard deviation (by default,
#'   1).
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
lbt01_1_main <- function(adam_db,
                         armvar = "ACTARM",
                         summaryvars = c("Value at Visit" = "AVAL", "Change from \nBaseline" = "CHG"),
                         visitvar = "AVISIT",
                         precision = integer(),
                         deco = std_deco("LBT01"),
                         ...) {
  assert_colnames(adam_db$adlb, "PARAM")
  assert_colnames(adam_db$adlb, summaryvars)
  assert_colnames(adam_db$adlb, armvar)
  assert_colnames(adam_db$adlb, visitvar)
  checkmate::assert_integerish(precision, lower = 0, upper = 2)

  lbl_avisit <- var_labels_for(adam_db$adlb, visitvar)
  lbl_param <- var_labels_for(adam_db$adlb, "PARAM")

  summaryvars_lbls <- get_labels(adam_db$adlb, summaryvars)

  lyt <- lbt01_1_lyt(
    armvar = armvar,
    summaryvars = summaryvars,
    summaryvars_lbls = summaryvars_lbls,
    visitvar = visitvar,
    lbl_avisit = lbl_avisit,
    lbl_param = lbl_param,
    deco = deco,
    precision = precision,
    ... = ...
  )

  tbl <- build_table(lyt, adam_db$adlb)

  tbl
}

#' @describeIn lbt01_1 Layout
#'
#' @inheritParams lbt01_1_main
#'
#' @param summaryvars (`vector of character`) the variables to be analyzed. For this table, `AVAL` and `CHG` by default.
#' @param summaryvars_lbls (`vector of character`) the label of the variables to be analyzed.
#' @param visitvar (`character`) typically one of `"AVISIT"` (Default) or `"ATPTN"` depending on the type of time point
#'   to be displayed.
#' @param lbl_avisit (`character`) label of the `visitvar` variable.
#' @param lbl_param (`character`) label of the `PARAM` variable.
#' @param ... not used.
#'
#' @export
#'
lbt01_1_lyt <- function(armvar,
                        summaryvars,
                        summaryvars_lbls,
                        visitvar,
                        lbl_avisit,
                        lbl_param,
                        deco,
                        precision = integer(),
                        ...) {
  basic_table_deco(deco) %>%
    split_cols_by(armvar) %>%
    split_rows_by(
      "PARAM",
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
      afun = function(x, .var, .spl_context, precision) {
        param_val <- .spl_context$value[1]

        xn <- if (is.na(precision[param_val])) {
          ".x" # default value
        } else if (precision[param_val] == 0) {
          "." # no decimal
        } else {
          paste0(".", paste0(rep("x", precision[param_val]), collapse = ""))
        }

        n_fmt <- "xx"
        mean_sd_fmt <- sprintf("xx%s (xx%s)", xn, xn)
        median_fmt <- sprintf("xx%s", xn)
        min_max_fmt <- "xx.x - xx.x"

        n_fun <- sum(!is.na(x))
        mean_sd_fun <- c(mean(x, na.rm = TRUE), sd(x, na.rm = TRUE))
        median_fun <- median(x, na.rm = TRUE)
        min_max_fun <- c(min(x), max(x))

        is_baseline <- .spl_context$value[2] == "BASELINE"
        is_chg <- .var == "CHG"

        if (is_baseline && is_chg) {
          n_fun <- mean_sd_fun <- median_fun <- min_max_fun <- NULL
        }

        in_rows(
          "n" = n_fun,
          "Mean (SD)" = mean_sd_fun,
          "Median" = median_fun,
          "Min - Max" = min_max_fun,
          .formats = list(
            "n" = n_fmt,
            "Mean (SD)" = mean_sd_fmt,
            "Median" = median_fmt,
            "Min - Max" = min_max_fmt
          )
        )
      },
      extra_args = list(precision = precision)
    ) %>%
    append_topleft(paste(lbl_param)) %>%
    append_topleft(c(paste(" ", lbl_avisit), " "))
}

#' @describeIn lbt01_1 Preprocessing
#'
#' @inheritParams gen_args
#' @param ... not used.
#'
#' @export
#'
lbt01_1_pre <- function(adam_db, ...) {
  checkmate::assert_class(adam_db, "dm")

  adam_db %>%
    dm_zoom_to("adlb") %>%
    filter(.data$ANL01FL == "Y") %>%
    dm_update_zoomed()
}

#' @describeIn lbt01_1 Postprocessing
#'
#' @inheritParams gen_args
#' @param ... not used.
#'
#' @export
#'
lbt01_1_post <- function(tlg, prune_0 = TRUE, ...) {
  if (prune_0) tlg <- tlg %>% trim_rows()
  std_postprocess(tlg)
}

#' `LBT01` Table 1 (Default) Laboratory Test Results and Change from Baseline by Visit.
#'
#' The `LBT01` table provides an
#' overview of the analysis values and its change from baseline of each respective arm over the course of the trial.
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' run(lbt01_1, syn_data, precision = c(
#'   "Alanine Aminotransferase Measurement" = 2,
#'   "C-Reactive Protein Measurement" = 0,
#'   "Immunoglobulin A Measurement" = 2
#' ))
lbt01_1 <- chevron_t(
  main = lbt01_1_main,
  preprocess = lbt01_1_pre,
  postprocess = lbt01_1_post,
  adam_datasets = c("adlb")
)
