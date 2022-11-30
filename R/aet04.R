# aet04_1 ----

#' @describeIn aet04_1 Main TLG function
#'
#' @inheritParams gen_args
#' @param group_grades (`list`) putting in correspondence severity levels and labels.
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
#'  * `adam_db` object must contain an `adae` table with the columns `"AETOXGR"`, `"AEBODSYS"` and `"AEDECOD"`.
#'
#' @export
#'
aet04_1_main <- function(adam_db,
                         armvar = "ACTARM",
                         group_grades = NULL,
                         lbl_overall = NULL,
                         deco = std_deco("AET04"),
                         ...) {
  assert_colnames(adam_db$adae, c("AETOXGR", "AEBODSYS", "AEDECOD"))

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
    deco = deco,
    ... = ...
  )

  tbl <- build_table(
    lyt,
    df = adam_db$adae,
    alt_counts_df = adam_db$adsl
  )

  tbl
}

#' @describeIn aet04_1 Layout
#'
#' @inheritParams gen_args
#'
#' @param lbl_aebodsys (`character`) text label for `AEBODSYS`.
#' @param lbl_aedecod (`character`) text label for `AEDECOD`.
#' @param group_grades (`list`) putting in correspondence severity levels and labels.
#' @param ... not used.
#'
#' @export
#'
aet04_1_lyt <- function(armvar,
                        lbl_aebodsys,
                        lbl_aedecod,
                        group_grades,
                        lbl_overall,
                        deco,
                        ...) {
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
      grade_groups = group_grades,
      .formats = c(count_fraction = format_count_fraction)
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
      .indent_mods = 0L,
      .formats = c(count_fraction = format_count_fraction)
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
      AETOXGR = list("No Grading Available" = c("", NA, "<Missing>"))
    )
  )

  adam_db <- dunlin::apply_reformat(adam_db, new_format)

  adam_db %>%
    dm_zoom_to("adae") %>%
    filter(.data$ANL01FL == "Y") %>%
    filter(.data$AETOXGR != "No Grading Available") %>%
    mutate(AETOXGR = droplevels(.data$AETOXGR, "No Grading Available")) %>%
    mutate(AETOXGR = if (length(levels(.data$AETOXGR)) > 0L) .data$AETOXGR else factor(.data$AETOXGR, "Missing")) %>%
    dm_update_zoomed()
}
#' @describeIn aet04_1 Postprocessing
#'
#' @inheritParams gen_args
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
#' group_grades <- list(
#'   "Any Grade" = c("1", "2", "3", "4", "5"),
#'   "Grade 1-2" = c("1", "2"),
#'   "Grade 3-5" = c("3", "4", "5")
#' )
#'
#' run(aet04_1, syn_data, group_grades = group_grades)
aet04_1 <- chevron_t(
  main = aet04_1_main,
  preprocess = aet04_1_pre,
  postprocess = aet04_1_post,
  adam_datasets = c("adsl", "adae")
)
