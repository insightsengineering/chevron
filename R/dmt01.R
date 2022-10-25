# dmt01_1 ----

#' @describeIn dmt01_1 Main TLG function
#'
#' @inheritParams gen_args
#' @param summaryvars (`vector of character`) variables summarized in demographic table.
#' Usually a vector containing the following one or more of the following:
#' `AAGE`, `AGEGR1`, `SEX`, `ETHNIC`, `RACE` and by default all of them.
#' @param summaryvars_lbls (`vector of character`) labels corresponding to the analyzed variables.
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
#' library(dm)
#' library(magrittr)
#'
#' db <- syn_test_data() %>%
#'   dmt01_1_pre()
#'
#' dmt01_1_main(db, summaryvars = c("AGE", "RACE", "SEX"), lbl_overall = NULL)
#' dmt01_1_main(db,
#'   summaryvars = c("AGE", "RACE", "SEX"),
#'   summaryvars_lbls = c("Age (yr)", "Race", "Sex")
#' )
dmt01_1_main <- function(adam_db,
                         lyt_ls = list(dmt01_1_lyt),
                         armvar = .study$planarm,
                         summaryvars = .study$demo_vars,
                         summaryvars_lbls = .study$demo_vars_lbls,
                         lbl_overall = .study$lbl_overall,
                         prune_0 = TRUE,
                         deco = std_deco("DMT01"),
                         .study = list(
                           planarm = "ARM",
                           demo_vars = c("AGE", "SEX", "COUNTRY", "RACE"),
                           demo_vars_lbls = NULL,
                           lbl_overall = "All Patients"
                         ),
                         ...) {
  assert_colnames(adam_db$adsl, summaryvars)

  summaryvars_lbls <- if (is.null(summaryvars_lbls)) {
    var_labels_for(adam_db$adsl, summaryvars)
  } else {
    summaryvars_lbls
  }

  checkmate::assert_true(length(summaryvars) == length(summaryvars_lbls))

  lyt <- lyt_ls[[1]](
    armvar = armvar,
    summaryvars = summaryvars,
    summaryvars_lbls = summaryvars_lbls,
    lbl_overall = lbl_overall,
    deco = deco
  )

  tbl <- build_table(lyt, adam_db$adsl)

  if (prune_0) {
    smart_prune(tbl)
  } else {
    tbl
  }
}

#' @describeIn dmt01_1 Layout
#'
#' @inheritParams gen_args
#'
#' @param demo_vars (`vector of strings`) variables summarized in demographic table.
#' @param demo_vars_lbls (`vector of strings`) labels corresponding to the analyzed variables.
#' @param ... not used.
#'
#' @export
#'
#' @examples
#' dmt01_1_lyt(armvar = "ACTARM")
dmt01_1_lyt <- function(armvar = .study$planarm,
                        summaryvars = .study$demo_vars,
                        summaryvars_lbls = .study$demo_vars_lbl,
                        lbl_overall = .study$lbl_overall,
                        deco = std_deco("DMT01"),
                        .study = list(
                          planarm = "ARM",
                          demo_vars = c(
                            "AAGE", # TODO: revisit
                            "AGEGR1",
                            "SEX",
                            "ETHNIC",
                            "RACE"
                          ),
                          demo_vars_lbl = c(
                            "Age (yr)",
                            "Pooled Age Group 1 (yr)",
                            "SEX",
                            "ETHNIC",
                            "RACE"
                          ),
                          lbl_overall = "All Patients"
                        ),
                        ...) {
  basic_table_deco(deco) %>%
    split_cols_by(var = armvar) %>%
    add_colcounts() %>%
    ifneeded_add_overall_col(lbl_overall) %>%
    split_rows_by("DOMAIN", split_fun = drop_split_levels, child_labels = "hidden") %>%
    summarize_vars(
      vars = summaryvars,
      var_labels = summaryvars_lbls,
      .formats = list(count_fraction = "xx.x (xx.x%)")
    )
}

#' @describeIn dmt01_1 Preprocessing
#'
#' @inheritParams gen_args
#' @param ... not used.
#'
#' @export
#'
#' @examples
#' dmt01_1_pre(syn_test_data())
dmt01_1_pre <- function(adam_db, ...) {
  checkmate::assert_class(adam_db, "dm")

  new_format <- list(
    adsl = list(
      SEX = list(
        "Female" = "F",
        "Male" = "M"
      )
    )
  )

  adam_db <- dunlin::apply_reformat(adam_db, new_format)

  adam_db <- dunlin::dm_explicit_na(adam_db)

  db <- adam_db %>%
    dm_zoom_to("adsl") %>%
    mutate(DOMAIN = "ADSL") %>%
    dm_update_zoomed()
  db
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
#' run(dmt01_1, syn_test_data(), summaryvars = c("AGE", "RACE", "SEX"))
dmt01_1 <- chevron_tlg(dmt01_1_main, dmt01_1_lyt, dmt01_1_pre, adam_datasets = c("adsl"))
