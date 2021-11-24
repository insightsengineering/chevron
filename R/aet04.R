#' AET04 Table 1 (Default) Adverse Events by Highest NCI CTACAE AE Grade Table 1
#'
#' The AET04 table provides an overview of adverse event with the highest NCI CTCAE grade per individual.
#'
#' @inheritParams gen_args
#' @param standard_gradation (`logical`) Whether the standard toxicity groups should be used (`Grade 1-2`, `Grade 3-4`,
#'   `Grade 5`) or the alternative ones (`Grade 1-2`, `Grade 3-5`).
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
#'   (std_filter("aet03_1"))() %>%
#'   (std_mutate("aet03_1"))()
#'
#' aet04_1(db)
#' aet04_1(db, prune_0 = FALSE)
#' aet04_1(db, lbl_overall = "All Patients")
#'
aet04_1 <- function(adam_db,
                    armvar = .study$armvar,
                    lbl_overall = .study$lbl_overall,
                    prune_0 = TRUE,
                    standard_gradation = TRUE,
                    deco = std_deco("AET04"),
                    .study = list(
                      armvar = "ACTARM",
                      lbl_overall = ""
                    )) {

  lbl_AEBODSYS <- var_labels_for(adam_db$adae, "AEBODSYS")
  lbl_AEDECOD <-  var_labels_for(adam_db$adae, "AEDECOD")

  if (standard_gradation == TRUE) {

    gr_grp <- list(
      "- Any Grade -" = c("1", "2", "3", "4", "5"),
      "Grade 1-2" = c("1", "2"),
      "Grade 3-4" = c("3", "4"),
      "Grade 5" = c("5")
    )
  } else {

    gr_grp <- list(
      "- Any Grade -" = c("1", "2", "3", "4", "5"),
      "Grade 1-2" = c("1", "2"),
      "Grade 3-5" = c("3", "4", "5")
    )
  }

  lyt <- aet04_1_lyt(
    armvar = armvar,
    lbl_overall = lbl_overall,
    lbl_AEBODSYS = lbl_AEBODSYS,
    lbl_AEDECOD = lbl_AEDECOD,
    gr_grp = gr_grp,
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
#' @param gr_grp (`list`) putting in correspondence severity levels and labels.
#'
#' @return
#' @export
#'
#' @examples
#' aet04_1_lyt(armvar = "ACTARM")
aet04_1_lyt <- function(armvar = .study$armvar,
                        lbl_overall = .study$lbl_overall,
                        lbl_AEBODSYS = "AEBODSYS",
                        lbl_AEDECOD = "AEDECOD",
                        gr_grp = .study$gr_grp,
                        deco = std_deco("AET04"),
                        .study = list(
                          armvar = "ACTARM",
                          lbl_overall = "",
                          gr_grp = list(
                            "- Any Grade -" = c("1", "2", "3", "4", "5"),
                            "Grade 1-2" = c("1", "2"),
                            "Grade 3-4" = c("3", "4"),
                            "Grade 5" = c("5")
                          )
                        )
                        ) {



  layout_table  <- basic_table_deco(deco)  %>%
    split_cols_by(var = armvar) %>%
    add_colcounts()

  if (!identical(lbl_overall, "")) layout_table <- layout_table %>% add_overall_col(label = lbl_overall)

  layout_table %>%
    summarize_occurrences_by_grade(
      var = "AETOXGR",
      grade_groups = gr_grp
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
      grade_groups = gr_grp,
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
    .labels = "- Any Grade -"
    ) %>%
    count_occurrences_by_grade(
    var = "AETOXGR",
    grade_groups = gr_grp[-1],
    .indent_mods = -1L
    )
}
