
#' `AET04` Table 1 (Default) Adverse Events by Highest NCI CTACAE AE Grade Table 1.
#' The `AET04` table provides an
#' overview of adverse event with the highest NCI CTCAE grade per individual.
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
#' @export
#'
#' @examples
#' library(dm)
#'
#' db <- syn_test_data() %>%
#'   aet04_1_pre()
#'
#' aet04_1_main(db)
#'
#' aet04_1_main(
#'   db,
#'   prune_0 = FALSE,
#'   lbl_overall = "All Patients",
#'   group_grades = list(
#'     "Any Grade" = c("1", "2", "3", "4", "5"),
#'     "Grade 1-2" = c("1", "2"),
#'     "Grade 3-5" = c("3", "4", "5")
#'   )
#' )
aet04_1_main <- function(adam_db,
                         armvar = .study$actualarm,
                         group_grades = .study$group_grades,
                         lbl_overall = .study$lbl_overall,
                         prune_0 = TRUE,
                         deco = std_deco("AET04"),
                         .study = list(
                           actualarm = "ACTARM",
                           lbl_overall = NULL,
                           group_grades = NULL
                         )) {
  lbl_aebodsys <- var_labels_for(adam_db$adae, "AEBODSYS")
  lbl_aedecod <- var_labels_for(adam_db$adae, "AEDECOD")

  # TODO: check that there are not grades in the data that are not defined in the `group_grades` map
  if (is.null(group_grades)) {
    group_grades <- list(
      "Any Grade" = c("1", "2", "3", "4", "5"),
      "Grade 1-2" = c("1", "2"),
      "Grade 3-4" = c("3", "4"),
      "Grade 5" = c("5")
    )
  }

  lyt <- aet04_1_lyt(
    armvar = armvar,
    lbl_overall = lbl_overall,
    lbl_aebodsys = lbl_aebodsys,
    lbl_aedecod = lbl_aedecod,
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
      path = c("AEBODSYS"),
      scorefun = cont_n_allcols
    ) %>%
    sort_at_path(
      path = c("AEBODSYS", "*", "AEDECOD"),
      scorefun = cont_n_allcols
    )

  tbl_sorted
}

#' @describeIn aet04_1_main `aet04_1` Layout
#'
#' @inheritParams gen_args
#'
#' @param lbl_aebodsys (`character`) text label for `AEBODSYS`.
#' @param lbl_aedecod (`character`) text label for `AEDECOD`.
#' @param group_grades (`list`) putting in correspondence severity levels and labels.
#'
#' @export
#'
#' @examples
#' aet04_1_lyt(armvar = "ACTARM")
aet04_1_lyt <- function(armvar = .study$actualarm,
                        lbl_aebodsys = "AEBODSYS",
                        lbl_aedecod = "AEDECOD",
                        group_grades = .study$group_grades,
                        lbl_overall = .study$lbl_overall,
                        deco = std_deco("AET04"),
                        .study = list(
                          actualarm = "ACTARM",
                          lbl_overall = NULL,
                          group_grades = NULL
                        )) {
  if (is.null(group_grades)) {
    group_grades <- list(
      "Any Grade" = c("1", "2", "3", "4", "5"),
      "Grade 1-2" = c("1", "2"),
      "Grade 3-4" = c("3", "4"),
      "Grade 5" = c("5")
    )
  }

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
      split_label = lbl_aebodsys
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
      split_label = lbl_aedecod
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

#' @describeIn aet04_1_main `aet04_1` Preprocessing
#'
#' @inheritParams gen_args
#'
#' @export
#'
#' @examples
#' syn_test_data() %>%
#'   aet04_1_pre()
aet04_1_pre <- function(adam_db) {
  checkmate::assert_class(adam_db, "dm")

  adam_db %>%
    dm_zoom_to("adae") %>%
    filter(.data$ANL01FL == "Y") %>%
    dm_update_zoomed()
}

# `AET04_1` Pipeline ----

#' `AET04_1`
#'
#' @seealso [aet04_1_main()]
#' @rdname chevron_tlg-class
#' @export
aet04_1 <- chevron_tlg(aet04_1_main, aet04_1_pre, adam_datasets = c("adsl", "adae"))
