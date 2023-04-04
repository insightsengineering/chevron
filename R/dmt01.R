# dmt01_1 ----

#' @describeIn dmt01_1 Main TLG function
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
#'   dmt01_1_pre()
#'
#' dmt01_1_main(db, lbl_overall = NULL)
#' dmt01_1_main(db, summaryvars = c("Age" = "AGE", "Race" = "RACE", "Gender" = "SEX"))
dmt01_1_main <- function(adam_db,
                         arm_var = "ARM",
                         summaryvars = list(
                           "Age (yr)" = "AAGE",
                           "Age group (yr)" = "AGEGR1",
                           "Sex" = "SEX",
                           "Ethnicity" = "ETHNIC",
                           "Race" = "RACE"
                         ),
                         lbl_overall = "All Patients",
                         deco = std_deco("DMT01"),
                         ...) {
  summaryvars <- unlist(summaryvars)
  assert_colnames(adam_db$adsl, summaryvars)

  summaryvars_lbls <- get_labels(adam_db$adsl, summaryvars)

  lyt <- dmt01_1_lyt(
    arm_var = arm_var,
    summaryvars = summaryvars,
    summaryvars_lbls = summaryvars_lbls,
    lbl_overall = lbl_overall,
    deco = deco
  )

  tbl <- build_table(lyt, adam_db$adsl)

  tbl
}

#' @describeIn dmt01_1 Layout
#' @param summaryvars_lbls (`character`) labels corresponding to the analyzed variables.
#'
#' @inheritParams gen_args
#'
#'
#' @export
#'
dmt01_1_lyt <- function(arm_var,
                        summaryvars,
                        summaryvars_lbls,
                        lbl_overall,
                        deco) {
  basic_table_deco(deco) %>%
    split_cols_by(var = arm_var) %>%
    add_colcounts() %>%
    ifneeded_add_overall_col(lbl_overall) %>%
    split_rows_by("DOMAIN", split_fun = drop_split_levels, child_labels = "hidden") %>%
    summarize_vars(
      vars = summaryvars,
      var_labels = summaryvars_lbls,
      .formats = list(count_fraction = format_count_fraction_fixed_dp)
    )
}

#' @describeIn dmt01_1 Preprocessing
#'
#' @inheritParams gen_args
#'
#'
#' @export
#'
#' @examples
#' dmt01_1_pre(syn_data)
dmt01_1_pre <- function(adam_db, ...) {
  assert_all_tablenames(adam_db, c("adsl"))

  adam_db$adsl <- tern::df_explicit_na(adam_db$adsl)

  adam_db$adsl <- adam_db$adsl %>%
    mutate(DOMAIN = "ADSL")

  adam_db
}

#' @describeIn dmt01_1 Postprocessing
#'
#' @inheritParams gen_args
#'
#'
#' @export
dmt01_1_post <- function(tlg, prune_0 = TRUE, ...) {
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
#' run(dmt01_1, syn_data)
dmt01_1 <- chevron_t(
  main = dmt01_1_main,
  preprocess = dmt01_1_pre,
  postprocess = dmt01_1_post,
  adam_datasets = c("adsl")
)
