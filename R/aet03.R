
#' @describeIn aet03_1 `aet03_1` main table
#'
#' `AET03` Table 1 (Default) Advert Events by Greatest Intensity Table 1. An adverse events table categorized by System
#' Organ Class, Dictionary-Derived Term  and Greatest intensity.
#'
#' @inheritParams gen_args
#'
#' @details
#'  * Default Adverse Events by Greatest Intensity table.
#'  * Numbers represent absolute numbers of patients and fraction of `N`.
#'  * Remove zero-count rows unless overridden with `prune_0 = FALSE`.
#'  * Split columns by arm.
#'  * Does not include a total column by default.
#'  * Sort by Body System or Organ Class (`SOC`) and Dictionary-Derived Term (`PT`).
#'
#' @importFrom dplyr filter
#'
#' @export
#'
#' @examples
#' library(dm)
#'
#' db <- syn_test_data() %>%
#'   aet03_1_pre()
#'
#' aet03_1_main(db)
#' aet03_1_main(db, lbl_overall = "All Patients")
aet03_1_main <- function(adam_db,
                         armvar = .study$actualarm,
                         prune_0 = TRUE,
                         lbl_overall = .study$lbl_overall,
                         deco = std_deco("AET03"),
                         .study = list(
                           actualarm = "ACTARM",
                           lbl_overall = NULL
                         )) {


  # specific to AET03: avoid error if some severity levels are not present
  # TODO: rename all gradation to grade or grading (depending on context)
  severity_grade <- levels(adam_db$adae[["AESEV"]])

  lyt <- aet03_1_lyt(
    armvar = armvar,
    lbl_overall = lbl_overall,
    lbl_aebodsys = var_labels_for(adam_db$adae, "AEBODSYS"),
    lbl_aedecod = var_labels_for(adam_db$adae, "AEDECOD"),
    severity_grade = severity_grade,
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

#' @describeIn aet03_1 `aet03_1` Layout
#'
#' @inheritParams gen_args
#'
#' @param lbl_aebodsys (`character`) text label for `AEBODSYS`.
#' @param lbl_aedecod (`character`) text label for `AEDECOD`.
#' @param severity_grade (`vector of character`) describing the severity levels present in the data set.
#'
#' @export
#'
#' @examples
#' aet03_1_lyt(
#'   armvar = "ACTARM",
#'   lbl_aebodsys = "Body System or Organ Class",
#'   lbl_aedecod = "Dictionary-Derived Term",
#'   lbl_overall = NULL,
#'   deco = std_deco("AET03")
#' )
aet03_1_lyt <- function(armvar = .study$actualarm,
                        lbl_aebodsys = "",
                        lbl_aedecod = "",
                        severity_grade = .study$severity_grade,
                        lbl_overall = .study$lbl_overall,
                        deco = std_deco("AET03"),
                        .study = list(
                          actualarm = "ACTARM",
                          lbl_overall = NULL,
                          severity_grade = c("MILD", "MODERATE", "SEVERE", "LIFE THREATENING")
                        )) {
  basic_table_deco(deco) %>%
    split_cols_by(var = armvar) %>%
    add_colcounts() %>%
    ifneeded_add_overall_col(lbl_overall) %>%
    summarize_occurrences_by_grade(
      var = "AESEV",
      grade_groups = list("- Any Intensity -" = severity_grade)
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
      var = "AESEV",
      grade_groups = list("- Any Intensity -" = severity_grade)
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
    summarize_occurrences_by_grade(
      var = "AESEV",
      grade_groups = list("- Any Intensity -" = severity_grade)
    )
}

#' @describeIn aet03_1 `aet03_1` Preprocessing
#'
#' @inheritParams gen_args
#'
#' @export
#'
#' @examples
#' syn_test_data() %>%
#'   aet03_1_pre()
aet03_1_pre <- function(adam_db) {
  checkmate::assert_class(adam_db, "dm")

  adam_db %>%
    dm_zoom_to("adae") %>%
    filter(.data$ANL01FL == "Y") %>%
    dm_update_zoomed()
}

# `AET03_1` Pipeline ----

#' `AET03_1` Pipeline
#'
#' @description `AET03_1` Pipeline of the class `tlg_pipeline_S4`
#'
#' @format a `tlg_pipeline_S4` object with the following slots:
#'   - `main` the `chevron::aet03_1_main` function.
#'   - `preprocess` the  `chevron::aet03_1_pre` function.
#'   - `postprocess` the identity function.
#'   - `check` no checks.
#'   - `adam_datasets` `"adsl"` and `"adae"`.
#'
#' @export
#'
aet03_1 <- tlg_pipeline_S4(aet03_1_main, aet03_1_pre, adam_datasets = c("adsl", "adae"))
