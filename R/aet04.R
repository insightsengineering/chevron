# aet04 ----

#' @describeIn aet04 Main TLG function
#'
#' @inheritParams gen_args
#' @param grade_groups (`list`) putting in correspondence toxicity grades and labels.
#'
#' @details
#'  * Numbers represent absolute numbers of patients and fraction of `N`, or absolute number of event when specified.
#'  * Remove zero-count rows unless overridden with `prune_0 = FALSE`.
#'  * Events with missing grading values are excluded.
#'  * Split columns by arm, typically `ACTARM`.
#'  * Does not include a total column by default.
#'  * Sort Body System or Organ Class and Dictionary-Derived Term by highest overall frequencies. Analysis Toxicity
#'  Grade is sorted by severity.
#'
#' @note
#'  * `adam_db` object must contain an `adae` table with the columns `"AEBODSYS"`, `"AEDECOD"` and `"ATOXGR"`.
#'
#' @export
#'
aet04_main <- function(adam_db,
                       arm_var = "ACTARM",
                       lbl_overall = NULL,
                       grade_groups = NULL,
                       ...) {
  dbsel <- get_db_data(adam_db, "adsl", "adae")
  checkmate::assert_string(lbl_overall, null.ok = TRUE)
  checkmate::assert_string(arm_var)
  assert_valid_variable(dbsel$adsl, c("USUBJID", arm_var))
  assert_valid_variable(dbsel$adae, c(arm_var, "AEBODSYS", "AEDECOD"))
  assert_valid_variable(dbsel$adae, "USUBJID", empty_ok = TRUE)
  assert_valid_var_pair(adam_db$adsl, adam_db$adae, arm_var)
  assert_valid_var.factor(dbsel$adae$ATOXGR, na_ok = TRUE)

  lbl_aebodsys <- var_labels_for(dbsel$adae, "AEBODSYS")
  lbl_aedecod <- var_labels_for(dbsel$adae, "AEDECOD")

  toxicity_grade <- levels(dbsel$adae[["ATOXGR"]])
  checkmate::assert_list(grade_groups, types = "character", null.ok = TRUE)
  if (is.null(grade_groups)) {
    grade_groups <- list(
      "Grade 1-2" = c("1", "2"),
      "Grade 3-4" = c("3", "4"),
      "Grade 5" = c("5")
    )
  }

  lyt <- aet04_lyt(
    arm_var = arm_var,
    total_var = "TOTAL_VAR",
    lbl_overall = lbl_overall,
    lbl_aebodsys = lbl_aebodsys,
    lbl_aedecod = lbl_aedecod,
    toxicity_grade = toxicity_grade,
    grade_groups = grade_groups
  )
  dbsel$adae$TOTAL_VAR <- "- Any adverse events - "
  tbl <- build_table(lyt, df = dbsel$adae, alt_counts_df = dbsel$adsl)
  tbl
}

#' aet04 Layout
#'
#' @inheritParams gen_args
#'
#' @param lbl_aebodsys (`string`) text label for `AEBODSYS`.
#' @param lbl_aedecod (`string`) text label for `AEDECOD`.
#' @param toxicity_grade (`character`) putting in correspondence toxicity levels.
#' @param grade_groups (`list`) putting in correspondence toxicity grades and labels.
#'
#' @keywords internal
#'
aet04_lyt <- function(arm_var,
                      lbl_overall,
                      lbl_aebodsys,
                      lbl_aedecod,
                      toxicity_grade,
                      grade_groups) {
  all_grade_groups <- c(list(`- Any Grade -` = toxicity_grade), grade_groups)
  combodf <- tibble::tribble(
    ~valname, ~label, ~levelcombo, ~exargs,
    "ALL", "- Any adverse events -", toxicity_grade, list()
  )

  basic_table(show_colcounts = TRUE) %>%
    split_cols_by(var = arm_var) %>%
    ifneeded_add_overall_col(lbl_overall) %>%
    split_rows_by(
      total_var,
      label_pos = "hidden",
      child_labels = "visible",
      indent_mod = -1L
    ) %>%
    summarize_num_patients(
      var = "USUBJID",
      .stats = "unique",
      .labels = "- Any Grade -",
      indent_mod = 7L
    ) %>%
    count_occurrences_by_grade(
      var = "ATOXGR",
      grade_groups = grade_groups,
      .indent_mods = 6L
    ) %>%
    split_rows_by(
      "AEBODSYS",
      child_labels = "visible",
      nested = FALSE,
      split_fun = drop_split_levels,
      label_pos = "topleft",
      split_label = lbl_aebodsys
    ) %>%
    split_rows_by(
      "AEDECOD",
      child_labels = "visible",
      split_fun = add_overall_level("- Overall -", trim = TRUE),
      label_pos = "topleft",
      split_label = lbl_aedecod
    ) %>%
    summarize_num_patients(
      var = "USUBJID",
      .stats = "unique",
      .labels = "- Any Grade -",
      indent_mod = 6L
    ) %>%
    count_occurrences_by_grade(
      var = "ATOXGR",
      grade_groups = grade_groups,
      .indent_mods = 5L
    ) %>%
    append_topleft("                            Grade")
}

#' @describeIn aet04 Preprocessing
#'
#' @inheritParams gen_args
#'
#' @export
#'
aet04_pre <- function(adam_db, ...) {
  atoxgr_lvls <- c("1", "2", "3", "4", "5")
  adam_db$adae <- adam_db$adae %>%
    filter(.data$ANL01FL == "Y") %>%
    mutate(
      AEBODSYS = reformat(.data$AEBODSYS, nocoding),
      AEDECOD = reformat(.data$AEDECOD, nocoding),
      ATOXGR = factor(.data$ATOXGR, levels = atoxgr_lvls)
    )
  adam_db
}

#' @describeIn aet04 Postprocessing
#'
#' @inheritParams gen_args
#'
#' @export
#'
aet04_post <- function(tlg, prune_0 = TRUE, ...) {
  tlg <- tlg %>%
    tlg_sort_by_vars(c("AEBODSYS", "AEDECOD"), score_all_sum, decreasing = TRUE)
  if (prune_0) tlg <- trim_rows(tlg)
  std_postprocess(tlg)
}

#' `AET04` Table 1 (Default) Adverse Events by Highest `NCI` `CTACAE` `AE` Grade Table 1.
#'
#' The `AET04` table provides an
#' overview of adverse event with the highest `NCI` `CTCAE` grade per individual.
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' grade_groups <- list(
#'   "Grade 1-2" = c("1", "2"),
#'   "Grade 3-4" = c("3", "4"),
#'   "Grade 5" = c("5")
#' )
#'
#' grade_groups <- list(
#'   "Grade 1-2" = c("1", "2"),
#'   "Grade 3-5" = c("3", "4", "5")
#' )
#'
#' run(aet04, syn_data, grade_groups = grade_groups)
aet04 <- chevron_t(
  main = aet04_main,
  preprocess = aet04_pre,
  postprocess = aet04_post,
  adam_datasets = c("adsl", "adae")
)


score_all_sum <- function(tt) {
  cleaf <- collect_leaves(tt)[[1]]
  if (NROW(cleaf) == 0) {
    stop("score_all_sum score function used at subtable [", obj_name(tt), "] that has no content.")
  }
  sum(sapply(row_values(cleaf), function(cv) cv[1]))
}
