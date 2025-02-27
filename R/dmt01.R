# dmt01 ----

#' @describeIn dmt01 Main TLG function
#'
#' @inheritParams gen_args
#' @param summaryvars (`character`) variables summarized in demographic table. The label attribute of the corresponding
#'   column in `adsl` table of `adam_db` is used as label.
#' @param stats (named `list` of character)  where names are `strings` found in `summaryvars` and the values indicate
#' the statistical analysis to perform. If `default` is set, and parameter precision not specified, the
#'   value for `default` will be used.
#' @param precision (named `list` of `integer`) where names are `strings` found in `summaryvars` and the values indicate
#'   the number of digits in statistics for numeric variables. If `default` is set, and parameter precision not
#'   specified, the value for `default` will be used. If neither are provided, auto determination is used. See
#'   [`tern::format_auto`].
#' @returns the main function returns an `rtables` object.
#'
#' @details
#'  * Information from `ADSUB` are generally included into `ADSL` before analysis.
#'  * Default demographic and characteristics table
#'  * If not specified otherwise, numbers represent absolute numbers of patients and fraction of `N`
#'  * Remove zero-count rows
#'  * Split columns by arm (planned or actual / code or description)
#'  * Include a total column by default
#'
#' @note
#'  * `adam_db` object must contain an `adsl` table with the columns specified in `summaryvars`.
#'
#' @export
#'
dmt01_main <- function(adam_db,
                       arm_var = "ARM",
                       lbl_overall = "All {Patient_label}",
                       summaryvars = c(
                         "AAGE",
                         "AGEGR1",
                         "SEX",
                         "ETHNIC",
                         "RACE"
                       ),
                       stats = list(default = c("n", "mean_sd", "median", "range", "count_fraction")),
                       precision = list(),
                       ...) {
  assert_string(arm_var)
  assert_string(lbl_overall, null.ok = TRUE)
  assert_character(summaryvars, null.ok = TRUE)
  assert_valid_variable(adam_db$adsl, summaryvars, na_ok = TRUE)
  assert_valid_variable(adam_db$adsl, summaryvars, types = list(c("numeric", "factor", "logical")))
  assert_valid_variable(adam_db$adsl, c("USUBJID", arm_var), types = list(c("character", "factor")))
  assert_list(stats, types = "character")
  assert_list(precision, types = "integerish", names = "unique")

  lbl_overall <- render_safe(lbl_overall)
  summaryvars_lbls <- var_labels_for(adam_db$adsl, summaryvars)

  lyt <- dmt01_lyt(
    arm_var = arm_var,
    lbl_overall = lbl_overall,
    summaryvars = summaryvars,
    summaryvars_lbls = summaryvars_lbls,
    stats = stats,
    precision = precision
  )

  tbl <- build_table(lyt, adam_db$adsl)

  tbl
}

#' `dmt01` Layout
#' @param summaryvars_lbls (`character`) labels corresponding to the analyzed variables.
#'
#' @inheritParams gen_args
#' @returns a `PreDataTableLayouts` object.
#' @keywords internal
#'
dmt01_lyt <- function(arm_var,
                      lbl_overall,
                      summaryvars,
                      summaryvars_lbls,
                      stats,
                      precision) {
  basic_table(show_colcounts = TRUE) %>%
    split_cols_by_with_overall(arm_var, lbl_overall) %>%
    analyze(
      vars = summaryvars,
      var_labels = summaryvars_lbls,
      afun = afun_p,
      extra_args = list(
        precision = precision,
        .stats = stats
      ),
      show_labels = "visible"
    )
}

#' @describeIn dmt01 Preprocessing
#'
#' @inheritParams gen_args
#' @returns the preprocessing function returns a `list` of `data.frame`.
#' @export
#'
dmt01_pre <- function(adam_db, ...) {
  adam_db$adsl <- adam_db$adsl %>%
    mutate(SEX = reformat(.data$SEX, rule(Male = "M", Female = "F")))
  adam_db
}

#' @describeIn dmt01 Postprocessing
#'
#' @inheritParams gen_args
#' @returns the postprocessing function returns an `rtables` object or an `ElementaryTable` (null report).
#' @export
#'
dmt01_post <- function(tlg, prune_0 = TRUE, ...) {
  if (prune_0) {
    tlg <- smart_prune(tlg)
  }
  std_postprocessing(tlg)
}

#' `DMT01` Table 1 (Default) Demographics and Baseline Characteristics Table 1.
#'
#' For each variable, summary statistics are
#' by default based on the number of patients in the corresponding `n` row.
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' run(dmt01, syn_data)
dmt01 <- chevron_t(
  main = dmt01_main,
  preprocess = dmt01_pre,
  postprocess = dmt01_post
)
