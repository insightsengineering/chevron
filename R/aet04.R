#' AET04 Table 1 (Default) Adverse Events by Highest NCI CTACAE AE Grade Table 1
#'
#' The AET04 table provides an overview of adverse event with the highest NCI CTCAE grade per individual.
#'
#' @inheritParams gen_args
#' @param group_grades (`list`) putting in correspondence severity levels and labels.
#'
#' @details
#'  * Numbers represent absolute numbers of patients and fraction of `N`, or absolute number of event when specified.
#'  * Remove zero-count rows unless overridden with `prune_0 = FALSE`.
#'  * Split columns by arm, typically `ACTARM`.
#'  * Does not include a total column by default.
#'  * Sort Body System or Organ Class and Dictionary-Derived Term by highest overall frequencies. Analysis Toxicity
#'  Grade is sorted by severity.
#'
#' @importFrom dplyr filter
#' @importFrom magrittr %>%
#'
#' @export
#'
#' @examples
#' library(dm)
#' library(rtables)
#'
#' db <- syn_test_data() %>%
#'    dm_select_tbl(adsl, adae)
#'
#' db <- db %>%
#'   (std_filter_fun("aet03_1"))() %>%
#'   (std_mutate_fun("aet03_1"))()
#'
#' aet04_1(db)
#' aet04_1(db, prune_0 = FALSE)
#' aet04_1(db, lbl_overall = "All Patients")
#'
#' aet04_1(db, group_grades = list(
#'   "Any Grade" = c("1", "2", "3", "4", "5"),
#'   "Grade 1-2" = c("1", "2"),
#'   "Grade 3-5" = c("3", "4", "5")
#' ))
#'
#'
aet04_1 <- function(adam_db,
                    armvar = .study$armvar,
                    group_grades = .study$group_grades,
                    lbl_overall = .study$lbl_overall,
                    prune_0 = TRUE,
                    deco = std_deco("AET04"),
                    .study = list(
                      armvar = "ACTARM",
                      lbl_overall = NULL,
                      group_grades = list("Any Grade" = c("1", "2", "3", "4", "5"),
                                          "Grade 1-2" = c("1", "2"),
                                          "Grade 3-4" = c("3", "4"),
                                          "Grade 5" = c("5"))
                    )
                    ) {

  lbl_AEBODSYS <- var_labels_for(adam_db$adae, "AEBODSYS")
  lbl_AEDECOD <-  var_labels_for(adam_db$adae, "AEDECOD")

  # TODO: check that there are not grades in the data that are not defined in the `group_grades` map

  lyt <- aet04_1_lyt(
    armvar = armvar,
    lbl_overall = lbl_overall,
    lbl_AEBODSYS = lbl_AEBODSYS,
    lbl_AEDECOD = lbl_AEDECOD,
    group_grades = group_grades,
    deco = deco
  )

  tbl <- build_table(
    lyt,
    df = adam_db$adae,
    alt_counts_df = adam_db$adsl
  )

  if (prune_0) tbl <- tbl %>% trim_rows()

  tbl_sorted <- tbl %>%
    sort_at_path(
      path =  c("AEBODSYS"),
      scorefun = cont_n_allcols
    ) %>%
    sort_at_path(
      path = c("AEBODSYS", "*", "AEDECOD"),
      scorefun = cont_n_allcols
    )

  tbl_sorted

}


#' AET04 Layout 1 (Default)
#'
#' @describeIn aet04_1
#'
#' @inheritParams gen_args
#'
#' @param lbl_AEBODSYS (`string`) text label for AEBODSYS.
#' @param lbl_AEDECOD (`string`) text label for AEDECOD.
#' @param group_grades (`list`) putting in correspondence severity levels and labels.
#'
#' @return
#' @export
#'
#' @examples
#' aet04_1_lyt(armvar = "ACTARM")
aet04_1_lyt <- function(armvar = .study$armvar,
                        lbl_AEBODSYS = "AEBODSYS",
                        lbl_AEDECOD = "AEDECOD",
                        group_grades = .study$group_grades,
                        lbl_overall = .study$lbl_overall,
                        deco = std_deco("AET04"),
                        .study = list(
                          armvar = "ACTARM",
                          lbl_overall = NULL,
                          group_grades = list(
                            "Any Grade" = c("1", "2", "3", "4", "5"),
                            "Grade 1-2" = c("1", "2"),
                            "Grade 3-4" = c("3", "4"),
                            "Grade 5" = c("5"))
                        )
                        ) {

  basic_table_deco(deco) %>%
    split_cols_by(var = armvar) %>%
    add_colcounts() %>%
    ifneeded_add_overall_col(lbl_overall) %>%
    summarize_occurrences_by_grade(
      var = "AETOXGR",
      grade_groups = group_grades
    ) %>%
    split_rows_by(
      "AEBODSYS",
      child_labels = "visible",
      nested = FALSE,
      indent_mod = -1L,
      split_fun = drop_split_levels,
      label_pos = "topleft",
      split_label = lbl_AEBODSYS
    ) %>%
    summarize_occurrences_by_grade(
      var = "AETOXGR",
      grade_groups = group_grades,
      .indent_mods = 0L
    ) %>%
    split_rows_by(
      "AEDECOD",
      child_labels = "visible",
      nested = TRUE,
      indent_mod = -1L,
      split_fun = drop_split_levels,
      label_pos = "topleft",
      split_label = lbl_AEDECOD
    ) %>%
    summarize_num_patients(
      var = "USUBJID",
      .stats = "unique",
      .labels = "Any Grade"
    ) %>%
    count_occurrences_by_grade(
      var = "AETOXGR",
      grade_groups = group_grades[-1],
      .indent_mods = -1L
    )
}
