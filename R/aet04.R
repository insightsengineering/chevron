# aet04_1 ----

#' @describeIn aet04_1 Main TLG function
#'
#' @inheritParams gen_args
#' @param grade_groups (`list`) putting in correspondence severity levels and labels.
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
                         armvar = "ACTARM",
                         grade_groups = NULL,
                         lbl_overall = NULL,
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

  checkmate::assert_list(grade_groups, types = "character")
  all_grade_groups <- c(list(`Any Grade` = unique(unlist(grade_groups))), grade_groups)
  checkmate::assert(all(dbsel$adae[["ATOXGR"]] %in% all_grade_groups$`Any Grade`))

  lyt <- aet04_1_lyt(
    armvar = armvar,
    lbl_overall = lbl_overall,
    grade_groups = grade_groups,
    all_grade_groups = all_grade_groups,
    deco = deco,
    ... = ...
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
#' @param grade_groups (`list`) putting in correspondence severity levels and labels.
#' @param ... not used.
#'
#' @export
#'
aet04_1_lyt <- function(armvar,
                        lbl_overall,
                        lbl_aebodsys = "MedDRA System Organ Class",
                        lbl_aedecod = "MedDRA Preferred Term",
                        grade_groups,
                        all_grade_groups,
                        deco,
                        ...) {
  basic_table_deco(deco) %>%
    split_cols_by(var = armvar) %>%
    add_colcounts() %>%
    ifneeded_add_overall_col(lbl_overall) %>%
    count_occurrences_by_grade(
      var = "ATOXGR",
      grade_groups = all_grade_groups,
      .formats = c("count_fraction" = format_count_fraction_fixed_dp)
    ) %>%
    split_rows_by(
      "AEBODSYS",
      child_labels = "visible",
      nested = TRUE,
      split_fun = drop_split_levels,
      label_pos = "topleft",
      split_label = lbl_aebodsys
    ) %>%
    summarize_occurrences_by_grade(
      var = "ATOXGR",
      grade_groups = all_grade_groups,
      .formats = c("count_fraction" = format_count_fraction_fixed_dp)
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
      var = "ATOXGR",
      grade_groups = grade_groups,
      .indent_mods = -1L
    )
}

#' @describeIn aet04_1 Preprocessing
#'
#' @inheritParams gen_args
#' @param ... not used.
#'
#' @export
#'
aet04_1_pre <- function(adam_db, ...) {
  checkmate::assert_class(adam_db, "dm")

  new_format <- list(
    adae = list(
      AEBODSYS = list("No Coding Available" = c("", NA, "<Missing>")),
      AEDECOD = list("No Coding Available" = c("", NA, "<Missing>")),
      ATOXGR = list("No Grading Available" = c("", NA, "<Missing>"))
    )
  )

  adam_db <- dunlin::apply_reformat(adam_db, new_format)

  adam_db %>%
    dm_zoom_to("adae") %>%
    filter(.data$ANL01FL == "Y") %>%
    filter(.data$ATOXGR != "No Grading Available") %>%
    mutate(ATOXGR = droplevels(.data$ATOXGR, "No Grading Available")) %>%
    mutate(ATOXGR = if (length(levels(.data$ATOXGR)) > 0L) .data$ATOXGR else factor(.data$ATOXGR, c("1", "2", "3", "4", "5"))) %>%
    dm_update_zoomed()
}

#' @describeIn aet04_1 Postprocessing
#'
#' @inheritParams gen_args
#'
#' @param ... not used.
#'
#' @export
#'
aet04_1_post <- function(tlg, prune_0 = TRUE, ...) {
  if (prune_0) tlg <- tlg %>% trim_rows()

  tbl_sorted <- tlg %>%
    sort_at_path(
      path = c("AEBODSYS"),
      scorefun = cont_n_allcols,
      decreasing = TRUE
    ) %>%
    sort_at_path(
      path = c("AEBODSYS", "*", "AEDECOD"),
      scorefun = cont_n_allcols,
      decreasing = TRUE
    )

  std_postprocess(tbl_sorted)
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
