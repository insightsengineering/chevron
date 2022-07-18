
#' DMT01 Table 1 (Default) Demographics and Baseline Characteristics Table 1.
#'
#' For each variable, summary statistics are
#' by default based on the number of patients in the corresponding `n` row.
#'
#' @inheritParams gen_args
#' @param summaryvars (`vector of character`) variables summarized in demographic table.
#' Usually a vector containing the following one or more of the following:
#' `AAGE`, `AGEGR1`, `SEX`, `ETHNIC`, `RACE` and by default all of them.
#' @param summaryvars_lbls (`vector of character`) labels corresponding to the analyzed variables.
#'
#' @details
#'  * Information from ADSUB are generally included into ADSL before analysis.
#'  * Default demographic and characteristics table
#'  * If not specified otherwise, numbers represent absolute numbers of patients and fraction of `N`
#'  * Remove zero-count rows
#'  * Split columns by arm (planned or actual / code or description)
#'  * Include a total column by default
#'
#' @export
#'
#' @examples
#' library(dm)
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
                         armvar = .study$planarm,
                         summaryvars = c("AAGE", "AGEGR1", "SEX", "ETHNIC", "RACE"),
                         summaryvars_lbls = var_labels_for(adam_db$adsl, summaryvars),
                         lbl_overall = .study$lbl_overall,
                         prune_0 = TRUE,
                         deco = std_deco("DMT01"),
                         .study = list(
                           planarm = "ARM",
                           lbl_overall = "All Patients"
                         )) {
  assert_colnames(adam_db$adsl, summaryvars)
  checkmate::assert_true(length(summaryvars) == length(summaryvars_lbls))

  lyt <- dmt01_1_lyt(
    armvar = armvar,
    summaryvars = summaryvars,
    summaryvars_lbls = summaryvars_lbls,
    lbl_overall = lbl_overall,
    deco = deco
  )

  tbl <- build_table(lyt, adam_db$adsl)

  if (prune_0) {
    prune_table(tbl)
  } else {
    tbl
  }
}

#' @describeIn dmt01_1_main `dmt01_1` Layout
#'
#' @inheritParams gen_args
#'
#' @param summaryvars (`vector of strings`) variables summarized in demographic table.
#' @param summaryvars_lbls (`vector of strings`) labels corresponding to the analyzed variables.
#'
#' @export
#'
#' @examples
#' dmt01_1_lyt(armvar = "ACTARM")
dmt01_1_lyt <- function(armvar = .study$planarm,
                        summaryvars = .study$summary_demo,
                        summaryvars_lbls = .study$summary_demo_lbl,
                        lbl_overall = .study$lbl_overall,
                        deco = std_deco("DMT01"),
                        .study = list(
                          planarm = "ARM",
                          summary_demo = c(
                            "AAGE", # TODO: revisit
                            "AGEGR1",
                            "SEX",
                            "ETHNIC",
                            "RACE"
                          ),
                          summary_demo_lbl = c(
                            "Age (yr)",
                            "Pooled Age Group 1 (yr)",
                            "SEX",
                            "ETHNIC",
                            "RACE"
                          ),
                          lbl_overall = "All Patients"
                        )) {
  basic_table_deco(deco) %>%
    split_cols_by(var = armvar) %>%
    add_colcounts() %>%
    ifneeded_add_overall_col(lbl_overall) %>%
    summarize_vars(vars = summaryvars, var_labels = summaryvars_lbls)
}

#' @describeIn dmt01_1_main `dmt01_1` Preprocessing
#'
#' @inheritParams gen_args
#' @param ... not used.
#'
#' @export
#'
#' @examples
#' syn_test_data() %>%
#'   dmt01_1_pre()
dmt01_1_pre <- function(adam_db, ...) {
  checkmate::assert_class(adam_db, "dm")
  adsl_lbs <- formatters::var_labels(adam_db$adsl)
  db <- adam_db %>%
    dm_zoom_to("adsl") %>%
    mutate(
      SEX = case_when(.data$SEX == "F" ~ "Female", .data$SEX == "M" ~ "Male", TRUE ~ as.character(.data$SEX)),
      SEX = factor(.data$SEX, levels = c("Female", "Male"))
    ) %>%
    mutate(SEX = formatters::with_label(.data$SEX, adsl_lbs["SEX"])) %>%
    dm_update_zoomed()
  db
}

# `DMT01_1` `chevron_tlg` ----

#' `DMT01_1`
#'
#' @seealso [dmt01_1_main()]
#' @rdname chevron_tlg-class
#' @export
dmt01_1 <- chevron_tlg(dmt01_1_main, dmt01_1_pre, adam_datasets = c("adsl"))
