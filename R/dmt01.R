# dmt01 ----

#' @describeIn dmt01 Main TLG function
#'
#' @inheritParams gen_args
#' @param summaryvars (`list`) variables summarized in demographic table. Names are used as
#'   subtitles. For values where no name is provided, the label attribute of the corresponding column in `adsl` table of
#'   `adam_db` is used.
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
#' @examples
#' library(magrittr)
#'
#' db <- syn_data %>%
#'   dmt01_pre()
#'
#' dmt01_main(db, lbl_overall = NULL)
#' dmt01_main(db, summaryvars = c("AGE", "RACE", "SEX"))
dmt01_main <- function(adam_db,
                       arm_var = "ARM",
                       summaryvars = c(
                         "AAGE",
                         "AGEGR1",
                         "SEX",
                         "ETHNIC",
                         "RACE"
                       ),
                       lbl_overall = "All Patients",
                       ...) {
  assert_colnames(adam_db$adsl, c(arm_var, summaryvars))

  summaryvars_lbls <- var_labels_for(adam_db$adsl, summaryvars)
  lapply(
    summaryvars,
    function(i) {
      assert_valid_var(adam_db$adsl[[i]], sprintf("adsl.%s", i))
    }
  )

  lyt <- dmt01_lyt(
    arm_var = arm_var,
    summaryvars = summaryvars,
    summaryvars_lbls = summaryvars_lbls,
    lbl_overall = lbl_overall
  )

  tbl <- build_table(lyt, adam_db$adsl)

  tbl
}

#' @describeIn dmt01 Layout
#' @param summaryvars_lbls (`character`) labels corresponding to the analyzed variables.
#'
#' @inheritParams gen_args
#'
#'
#' @export
#'
dmt01_lyt <- function(arm_var,
                      summaryvars,
                      summaryvars_lbls,
                      lbl_overall) {
  basic_table() %>%
    split_cols_by(var = arm_var) %>%
    add_colcounts() %>%
    ifneeded_add_overall_col(lbl_overall) %>%
    summarize_vars(
      vars = summaryvars,
      var_labels = summaryvars_lbls,
      .formats = list(count_fraction = format_count_fraction_fixed_dp)
    )
}

#' @describeIn dmt01 Preprocessing
#'
#' @inheritParams gen_args
#'
#'
#' @export
#'
#' @examples
#' dmt01_pre(syn_data)
dmt01_pre <- function(adam_db, ...) {
  adam_db$adsl <- adam_db$adsl %>%
    mutate(SEX = reformat(SEX, rule(Male = "M", Female = "F")))
  adam_db
}

#' @describeIn dmt01 Postprocessing
#'
#' @inheritParams gen_args
#'
#'
#' @export
dmt01_post <- function(tlg, prune_0 = TRUE, ...) {
  if (prune_0) {
    tlg <- smart_prune(tlg)
  }
  std_postprocess(tlg)
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
  postprocess = dmt01_post,
  adam_datasets = c("adsl")
)
