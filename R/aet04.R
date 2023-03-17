# aet04_1 ----

#' @describeIn aet04_1 Main TLG function
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
aet04_1_main <- function(adam_db,
                         arm_var = "ACTARM",
                         lbl_overall = NULL,
                         lbl_aebodsys = "MedDRA System Organ Class",
                         lbl_aedecod = "MedDRA Preferred Term",
                         grade_groups = NULL,
                         deco = std_deco("AET04"),
                         ...) {
  dbsel <- get_db_data(adam_db, "adsl", "adae")
  assert_colnames(dbsel$adae, c("AEBODSYS", "AEDECOD", "ATOXGR"))

  if (is.null(grade_groups)) {
    grade_groups <- list(
      "Grade 1-2" = c("1", "2"),
      "Grade 3-4" = c("3", "4"),
      "Grade 5" = c("5")
    )
  }

  checkmate::assert_factor(dbsel$adae[["ATOXGR"]], any.missing = FALSE)
  toxicity_grade <- levels(dbsel$adae[["ATOXGR"]])

  checkmate::assert_list(grade_groups, types = "character")

  lyt <- aet04_1_lyt(
    arm_var = arm_var,
    lbl_overall = lbl_overall,
    lbl_aebodsys = lbl_aebodsys,
    lbl_aedecod = lbl_aedecod,
    toxicity_grade = toxicity_grade,
    grade_groups = grade_groups,
    deco = deco
  )

  tbl <- build_table(lyt, df = dbsel$adae, alt_counts_df = dbsel$adsl)

  tbl
}

#' @describeIn aet04_1 Layout
#'
#' @inheritParams gen_args
#'
#' @param lbl_aebodsys (`character`) text label for `AEBODSYS`.
#' @param lbl_aedecod (`character`) text label for `AEDECOD`.
#' @param toxicity_grade (`vector of character`) putting in correspondence toxicity levels.
#' @param grade_groups (`list`) putting in correspondence toxicity grades and labels.
#'
#' @export
#'
aet04_1_lyt <- function(arm_var,
                        lbl_overall,
                        lbl_aebodsys,
                        lbl_aedecod,
                        toxicity_grade,
                        grade_groups,
                        deco) {
  all_grade_groups <- c(list(`- Any Grade -` = toxicity_grade), grade_groups)
  combodf <- tibble::tribble(
    ~valname, ~label, ~levelcombo, ~exargs,
    "ALL", "- Any adverse events -", toxicity_grade, list()
  )

  basic_table_deco(deco, show_colcounts = TRUE) %>%
    split_cols_by(var = arm_var) %>%
    ifneeded_add_overall_col(lbl_overall) %>%
    split_rows_by(
      "ATOXGR",
      child_labels = "visible",
      split_fun = add_combo_levels(combodf, keep_levels = "ALL")
    ) %>%
    summarize_occurrences_by_grade(
      var = "ATOXGR",
      grade_groups = all_grade_groups,
      .indent_mods = 13L
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

#' @describeIn aet04_1 Preprocessing
#'
#' @inheritParams gen_args
#'
#' @export
#'
aet04_1_pre <- function(adam_db, ...) {
  checkmate::assert_class(adam_db, "dm")

  new_format <- list(
    adae = list(
      AEBODSYS = rule("No Coding Available" = c("", NA, "<Missing>")),
      AEDECOD = rule("No Coding Available" = c("", NA, "<Missing>")),
      ATOXGR = rule("No Grading Available" = c("", NA, "<Missing>"))
    )
  )

  adam_db <- dunlin::reformat(adam_db, new_format, na_last = TRUE)

  adam_db %>%
    dm_zoom_to("adae") %>%
    filter(.data$ANL01FL == "Y") %>%
    filter(.data$ATOXGR != "No Grading Available") %>%
    mutate(ATOXGR = factor(.data$ATOXGR,
      levels = setdiff(levels(.data$ATOXGR), "No Grading Available")
    )) %>%
    dm_update_zoomed()
}

#' @describeIn aet04_1 Postprocessing
#'
#' @inheritParams gen_args
#'
#' @export
#'
aet04_1_post <- function(tlg, prune_0 = TRUE, ...) {
  if (prune_0) tlg <- trim_rows(tlg)
  tbl_empty <- all(lapply(row_paths(tlg), `[[`, 3) == "ALL")
  if (!tbl_empty) {
    score_all_sum <- function(tt) {
      cleaf <- collect_leaves(tt)[[1]]
      if (NROW(cleaf) == 0) {
        stop("score_all_sum score function used at subtable [", obj_name(tt), "] that has no content.")
      }
      sum(sapply(row_values(cleaf), function(cv) cv[1]))
    }

    tlg <- tlg %>%
      sort_at_path(
        path = c("AEBODSYS"),
        scorefun = score_all_sum,
        decreasing = TRUE
      ) %>%
      sort_at_path(
        path = c("AEBODSYS", "*", "AEDECOD"),
        scorefun = score_all_sum,
        decreasing = TRUE
      )
  } else {
    tlg <- null_report
  }

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
#' run(aet04_1, syn_data, grade_groups = grade_groups)
aet04_1 <- chevron_t(
  main = aet04_1_main,
  preprocess = aet04_1_pre,
  postprocess = aet04_1_post,
  adam_datasets = c("adsl", "adae")
)
