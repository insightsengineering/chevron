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
  checkmate::assert_integerish(precision, lower = 0)

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
      afun = function(x, .var, .spl_context, precision, ...) {
        param_val <- .spl_context$value[1]
        pcs <- precision[param_val]

        # xn <- if (is.na(precision[param_val])) {
        #   ".x" # default value
        # } else if (precision[param_val] == 0) {
        #   "." # no decimal
        # } else {
        #   paste0(".", paste0(rep("x", precision[param_val]), collapse = ""))
        # }
        #
        # n_fmt <- "xx"
        # mean_sd_fmt <- sprintf("xx%s (xx%s)", xn, xn)
        # median_fmt <- sprintf("xx%s", xn)
        # min_max_fmt <- "xx.x - xx.x"
        #
        # n_fun <- as.character(sum(!is.na(x)))
        # mean_sd_fun <- c(mean(x, na.rm = TRUE), sd(x, na.rm = TRUE))
        # median_fun <- median(x, na.rm = TRUE)
        # min_max_fun <- c(min(x), max(x))

        n_fun <- sum(!is.na(x), na.rm = TRUE)

        mean_sd_fun <- c(
          mean(x, na.rm = TRUE),
          sd(x, na.rm = TRUE)
        )

        median_fun <-  median(x, na.rm = TRUE)

        min_max_fun <- c(
          min(x),
          max(x)
        )

        is_baseline <- .spl_context$value[2] == "BASELINE"
        is_chg <- .var == "CHG"

        if (is_baseline && is_chg) {
          n_fun <- mean_sd_fun <- median_fun <- min_max_fun <- NULL
        }

        res <- in_rows(
          "n" = n_fun,
          "Mean (SD)" = mean_sd_fun,
          "Median" = median_fun,
          "Min - Max" = min_max_fun
          # .formats = list(
          #   "n" = "xx",
          #   "Mean (SD)" = "xx (xx%)",
          #   "Median" = "xx",
          #   "Min - Max" = "xx - xx"
          # )
        )

        res <- in_rows(
          "n" = n_fun,
          "Mean (SD)" = mean_sd_fun,
          "Median" = median_fun,
          "Min - Max" = min_max_fun,
          "x" = sum(!is.na(x), na.rm = TRUE),
          .formats = list(
            "n" = "xx",
            "Mean (SD)" = function(x, ...) h_pad_or_round_pct(x, digits = pcs + 1),
            "Median" = function(x, ...) h_pad_or_round(x, digits = pcs),
            "Min - Max" = function(x, ...) h_pad_or_round_sep(x, digits = pcs),
            "x" = function(x, ...) h_pad_or_round(x, digits = 2)
          )
        )

        res

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
#'   "C-Reactive Protein Measurement" = 1,
#'   "Immunoglobulin A Measurement" = 0
#' ))
lbt01_1 <- chevron_t(
  main = lbt01_1_main,
  preprocess = lbt01_1_pre,
  postprocess = lbt01_1_post,
  adam_datasets = c("adlb")
)

# helper ----


#' Padding or Rounding Numbers Error as Percentage
#'
#' @inheritParams h_pad_or_round
#' @param x (`numeric`) representing the main value and its error.
#'
#' @export
#'
#' @examples
#' h_pad_or_round_pct(c(1.11111, 0.5), 3)
h_pad_or_round_pct <- function(x, digits = NA, ...) {

  checkmate::assert_numeric(x, len = 2)

  main <- h_pad_or_round(x[1], digits = digits)
  err  <- h_pad_or_round(x[2], digits = digits)

  paste0(main, " (", err, "%)")
}

#' Padding or Rounding Numbers with Separator
#'
#' @inheritParams h_pad_or_round
#' @param x (`numeric`) to format.
#' @param sep (`string`) separating the formatted values.
#'
#' @export
#'
#' @examples
#' h_pad_or_round_sep(c(1.11111, 2.22222), 3)
h_pad_or_round_sep <- function(x, digits = NA, sep = " - ", ...) {

  checkmate::assert_numeric(x)
  checkmate::assert_string(sep)

  res <- vapply(x, h_pad_or_round, digits = digits, FUN.VALUE = character(1))
  paste(res, collapse = sep)
}

#' Padding or Rounding Numbers
#'
#' @param x (`numeric`) to modify.
#' @param digits (`integer`) number of digits.
#'
#' @export
#'
#' @examples
#' h_pad_or_round(123.1234, 10)
#' h_pad_or_round(123.1234, 1)
#' h_pad_or_round(123, 1)
#' h_pad_or_round(123, 3)
#' h_pad_or_round(123, 0)
h_pad_or_round <- function(n, digits = NA, ...) {

  checkmate::assert_numeric(n, len = 1)
  checkmate::assert_integerish(digits, lower = 0)

  if (is.na(n) || is.na(digits)) return(n)

  n_round <- round(n, digits)
  x <- as.character(n_round)

  main <- gsub("^([-0-9]{0,}).*", "\\1", x)

  dec_pattern <- "\\-?[0-9]{0,}\\.([0-9]{0,})"
  if (grepl(dec_pattern, x)) {
    dec <- gsub(dec_pattern, "\\1", x)
    n_dec <- nchar(dec)
  } else {
    n_dec <- 0
  }

  res <- if (digits == 0) {
    main

  } else if (digits >= n_dec) {
    pad_0 <- paste(rep("0", digits - n_dec), collapse = "")
    dec_point <- if(n_dec == 0) "." else NULL
    paste0(x, dec_point, pad_0)

  } else if (digits < n_dec) {
    tr <- strtrim(dec, digits)
    paste0(main, ".", tr)

  }

  as.character(res)
}
