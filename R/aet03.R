
#' AET03 Table 1 (Default) Advert Events by Greatest Intensity Table 1
#'
#' An adverse events table categorized by System Organ Class, Dictionary-Derived Term  and Greatest intensity.
#'
#' @inheritParams gen_args
#'
#' @details
#'  * Default Adverse Events by Greatest Intensity table
#'  * Numbers represent absolute numbers of patients and fraction of `N`
#'  * Remove zero-count rows unless overridden with `prune_0 = FALSE`.
#'  * Split columns by arm
#'  * Does not include a total column by default
#'  * Sort by Body System or Organ Class (SOC) and Dictionary-Derived Term (PT)
#'
#' @importFrom dplyr filter
#' @importFrom magrittr %>%
#'
#' @export
#'
#' @examples
#'
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
#' aet03_1(db)
#' aet03_1(db, lbl_overall = "All Patients")
#'
aet03_1 <- function(adam_db,
                    armvar = .study$armvar,
                    lbl_overall = .study$lbl_overall,
                    prune_0 = TRUE,
                    deco = std_deco("AET03"),
                    .study = list(
                      armvar = "ACTARM",
                      lbl_overall = NULL
                    )) {


  # specific to AET03: avoid error if some severity levels are not present
  gradation_severity <- levels(adam_db$adae[["AESEV"]])

  lyt <- aet03_1_lyt(
    armvar = armvar,
    lbl_overall = lbl_overall,
    lbl_AEBODSYS = var_labels_for(adam_db$adae, "AEBODSYS"),
    lbl_AEDECOD = var_labels_for(adam_db$adae, "AEDECOD"),
    gradation = gradation_severity,
    deco = deco
  )

  # build table
  tbl <- build_table(
    lyt,
    df = adam_db$adae,
    alt_counts_df = adam_db$adsl
  )

  if (prune_0) tbl <- tbl %>% trim_rows()


  tbl_sorted <- tbl %>%
    # trim_rows() %>%
    sort_at_path(
      path = "AEBODSYS",
      scorefun = cont_n_allcols,
      decreasing = TRUE
    ) %>%
    sort_at_path(
      path = c("AEBODSYS", "*", "AEDECOD"),
      scorefun = cont_n_allcols,
      decreasing = TRUE
    )

    tbl_sorted

}


#' AET03 Layout 1 (Default)
#'
#' @describeIn aet03_1
#'
#' @inheritParams gen_args
#'
#' @param lbl_AEBODSYS (`string`) text label for AEBODSYS.
#' @param lbl_AEDECOD (`string`) text label for AEDECOD.
#' @param gradation (`vector of strings`) describing the severity levels present in the dataset.
#'
#' @return
#' @export
#'
#' @examples
#' aet03_1_lyt(armvar = "ACTARM",
#'  lbl_overall = "",
#'  lbl_AEBODSYS = "Body System or Organ Class",
#'  lbl_AESEV = "Severity/Intensity",
#'  lbl_AEDECOD = "Dictionary-Derived Term",
#'  deco = std_deco("AET03"))
aet03_1_lyt <- function(armvar = .study$armvar,
                        lbl_overall = .study$lbl_overall,
                        lbl_AEBODSYS = "",
                        lbl_AEDECOD = "",
                        gradation = .study$gradation,

                        deco = std_deco("AET03"),
                        .study = list(
                          armvar = "ACTARM",
                          lbl_overall = "",
                          gradation = c("MILD", "MODERATE", "SEVERE", "LIFE THREATENING")
                        )) {

  basic_table_deco(deco) %>%
    split_cols_by(var = armvar) %>%
    add_colcounts() %>%
    ifneeded_add_overall_col(lbl_overall) %>%
    summarize_occurrences_by_grade(
      var = "AESEV",
      grade_groups = list("- Any Intensity -" = gradation
      )
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
      var = "AESEV",
      grade_groups = list("- Any Intensity -" = gradation
      )
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

    summarize_occurrences_by_grade(
      var = "AESEV",
      grade_groups = list("- Any Intensity -" = gradation)
    )

}
