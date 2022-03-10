# CMT01A_1 ----

#' `CMT01A` Table 1 (Default) Concomitant Medication by Medication Class and Preferred Name.
#'
#' A concomitant medication table with the number of subjects and the total number of treatments by medication class
#' sorted alphabetically and medication name sorted by frequencies.
#'
#' @inheritParams gen_args
#' @param medcat_var (`character`) the variable defining the medication category. By default `ATC2`.
#' @param lbl_medcat_var (`character`) label for the variable defining the medication category.
#' @param medname_var (`character`) the variable defining the medication name. By default `CMDECOD`.
#' @param lbl_medname_var (`character`) label for the variable defining the medication name.
#'
#' @details
#'  * Data should be filtered for concomitant medication. `(ATIREL == "CONCOMITANT")`.
#'  * Numbers represent absolute numbers of subjects and fraction of `N`, or absolute numbers when specified.
#'  * Remove zero-count rows unless overridden with `prune_0 = FALSE`.
#'  * Split columns by arm.
#'  * Does not include a total column by default.
#'  * Sort by medication class alphabetically and within medication class by decreasing total number of patients with
#'  the specific medication.
#'
#' @importFrom dplyr filter
#' @importFrom magrittr %>%
#'
#' @export
#'
#' @examples
#' library(dm)
#' library(dplyr)
#'
#' db <- syn_test_data() %>%
#'   dm_zoom_to(adcm) %>%
#'   filter(ATIREL == "CONCOMITANT") %>%
#'   dm_update_zoomed() %>%
#'   preprocess_data("cmt01a_1")
#'
#' cmt01a_1(adam_db = db)
cmt01a_1 <- function(adam_db,
                     armvar = .study$armvar,
                     medcat_var = "ATC2", # Anatomical therapeutic category
                     lbl_medcat_var = "ATC Class Level 2",
                     medname_var = "CMDECOD",
                     lbl_medname_var = "Other Treatment",
                     lbl_overall = .study$lbl_overall,
                     prune_0 = TRUE,
                     deco = std_deco("CMT01A"),
                     .study = list(
                       armvar = "ACTARM",
                       lbl_overall = NULL
                     )) {
  dbsel <- get_db_data(adam_db, "adsl", "adcm")

  lyt <- cmt01a_1_lyt(
    armvar = armvar,
    lbl_overall = lbl_overall,
    medcat_var = medcat_var,
    lbl_medcat_var = lbl_medcat_var,
    medname_var = medname_var,
    lbl_medname_var = lbl_medname_var,
    deco = deco
  )

  tbl <- build_table(lyt, dbsel$adcm, alt_counts_df = dbsel$adsl)

  if (prune_0) {
    tbl <- tbl %>% prune_table()
  }

  tbl_sorted <- tbl %>%
    sort_at_path(
      path = c(medcat_var, "*", medname_var),
      scorefun = score_occurrences
    )

  tbl_sorted
}


#' `CMT01A` Layout 1 (Default)
#'
#' @describeIn cmt01a_1
#'
#' @inheritParams gen_args
#' @param medcat_var (`character`) the variable defining the medication category. By default `ATC2`.
#' @param lbl_medcat_var (`character`) the label for the medication category.
#' @param medname_var (`character`) the variable defining the medication name. By default `CMDECOD`.
#' @param lbl_medname_var (`character`) the label for the medication name.
#'
#' @export
#'
#' @examples
#' cmt01a_1_lyt(
#'   armvar = "ACTARM",
#'   lbl_overall = NULL,
#'   deco = std_deco("CMT01A")
#' )
cmt01a_1_lyt <- function(armvar = .study$armvar,
                         lbl_overall = .study$lbl_overall,
                         medcat_var = "ATC2",
                         lbl_medcat_var = "ATC Class Level 2",
                         medname_var = "CMDECOD",
                         lbl_medname_var = "Other Treatment",
                         deco = std_deco("CMT01A"),
                         .study = list(
                           armvar = "ACTARM",
                           lbl_overall = NULL
                         )) {
  basic_table_deco(deco) %>%
    split_cols_by(var = armvar) %>%
    add_colcounts() %>%
    ifneeded_add_overall_col(lbl_overall) %>%
    summarize_num_patients(
      var = "USUBJID",
      count_by = "CMSEQ",
      .stats = c("unique", "nonunique"),
      .labels = c(
        unique = "Total number of patients with at least one treatment",
        nonunique = "Total number of treatments"
      )
    ) %>%
    split_rows_by(
      medcat_var,
      child_labels = "visible",
      nested = FALSE,
      indent_mod = -1L,
      split_fun = drop_split_levels,
      label_pos = "topleft",
      split_label = lbl_medcat_var
    ) %>%
    summarize_num_patients(
      var = "USUBJID",
      count_by = "CMSEQ",
      .stats = c("unique", "nonunique"),
      .labels = c(
        unique = "Total number of patients with at least one treatment",
        nonunique = "Total number of treatments"
      )
    ) %>%
    count_occurrences(
      vars = medname_var,
      .indent_mods = -1L
    ) %>%
    append_topleft(paste0("  ", lbl_medname_var))
}

# CMT01A_2 ----

#' `CMT01A` Table 2 (Supplementary) Concomitant Medication by Medication Class and Preferred Name (Classes sorted by
#' frequency).
#'
#' A concomitant medication table with the number of subjects and the total number of treatments by medication class and
#' medication name sorted by frequencies.
#'
#' @inheritParams gen_args
#' @param medcat_var (`character`) the variable defining the medication category. By default `ATC2`.
#' @param lbl_medcat_var (`character`) label for the variable defining the medication category.
#' @param medname_var (`character`) the variable defining the medication name. By default `CMDECOD`.
#' @param lbl_medname_var (`character`) label for the variable defining the medication name.
#'
#' @details
#'  * Data should be filtered for concomitant medication. `(ATIREL == "CONCOMITANT")`.
#'  * Numbers represent absolute numbers of subjects and fraction of `N`, or absolute numbers when specified.
#'  * Remove zero-count rows unless overridden with `prune_0 = FALSE`.
#'  * Split columns by arm.
#'  * Does not include a total column by default.
#'  * Sort by medication class frequency and within medication class by decreasing total number of patients with
#'  the specific medication.
#'
#' @importFrom dplyr filter
#' @importFrom magrittr %>%
#'
#' @export
#'
#' @examples
#' library(dm)
#' library(dplyr)
#'
#' db <- syn_test_data() %>%
#'   dm_zoom_to(adcm) %>%
#'   filter(ATIREL == "CONCOMITANT") %>%
#'   dm_update_zoomed() %>%
#'   preprocess_data("cmt01a_2")
#'
#' cmt01a_2(adam_db = db)
cmt01a_2 <- function(adam_db,
                     armvar = .study$armvar,
                     medcat_var = "ATC2", # Anatomical therapeutic category
                     lbl_medcat_var = "ATC Class Level 2",
                     medname_var = "CMDECOD",
                     lbl_medname_var = "Other Treatment",
                     lbl_overall = .study$lbl_overall,
                     prune_0 = TRUE,
                     deco = std_deco("CMT01A"),
                     .study = list(
                       armvar = "ACTARM",
                       lbl_overall = NULL
                     )) {
  dbsel <- get_db_data(adam_db, "adsl", "adcm")

  # The same layout can be used.
  lyt <- cmt01a_1_lyt(
    armvar = armvar,
    lbl_overall = lbl_overall,
    medcat_var = medcat_var,
    lbl_medcat_var = lbl_medcat_var,
    medname_var = medname_var,
    lbl_medname_var = lbl_medname_var,
    deco = deco
  )

  tbl <- build_table(lyt, dbsel$adcm, alt_counts_df = dbsel$adsl)

  if (prune_0) {
    tbl <- tbl %>% prune_table()
  }

  tbl_sorted <- tbl %>%
    sort_at_path(
      medcat_var,
      scorefun = cont_n_onecol(ncol(tbl))
    ) %>%
    sort_at_path(
      path = c(medcat_var, "*", medname_var),
      scorefun = score_occurrences
    )


  tbl_sorted
}

# CMT01A_3 ----

#' `CMT01A` Table 3 (Supplementary) Concomitant Medication by Medication Class and Preferred Name (Total number of
#' treatments per medication class suppressed).
#'
#' A concomitant medication table with the number of subjects and the total number of treatments by medication class
#' sorted alphabetically and medication name sorted by frequencies presented without the total number of treatments per
#' medication.
#'
#' @inheritParams gen_args
#' @param medcat_var (`character`) the variable defining the medication category. By default `ATC2`.
#' @param lbl_medcat_var (`character`) the label for the medication category.
#' @param medname_var (`character`) the variable defining the medication name. By default `CMDECOD`.
#' @param lbl_medname_var (`character`) the label for the medication name.
#'
#' @details
#'  * Data should be filtered for concomitant medication. `(ATIREL == "CONCOMITANT")`.
#'  * Numbers represent absolute numbers of subjects and fraction of `N`, or absolute numbers when specified.
#'  * Remove zero-count rows unless overridden with `prune_0 = FALSE`.
#'  * Split columns by arm.
#'  * Does not include a total column by default.
#'  * Sort by medication class alphabetically and within medication class by decreasing total number of patients with
#'  the specific medication.
#'
#' @importFrom dplyr filter
#' @importFrom magrittr %>%
#'
#' @export
#'
#' @examples
#' library(dm)
#' library(dplyr)
#'
#' db <- syn_test_data() %>%
#'   dm_zoom_to(adcm) %>%
#'   filter(ATIREL == "CONCOMITANT") %>%
#'   dm_update_zoomed() %>%
#'   preprocess_data("cmt01a_3")
#'
#' cmt01a_3(adam_db = db)
cmt01a_3 <- function(adam_db,
                     armvar = .study$armvar,
                     medcat_var = "ATC2", # Anatomical therapeutic category
                     lbl_medcat_var = "ATC Class Level 2",
                     medname_var = "CMDECOD",
                     lbl_medname_var = "Other Treatment",
                     lbl_overall = .study$lbl_overall,
                     prune_0 = TRUE,
                     deco = std_deco("CMT01A"),
                     .study = list(
                       armvar = "ACTARM",
                       lbl_overall = NULL
                     )) {
  dbsel <- get_db_data(adam_db, "adsl", "adcm")

  lyt <- cmt01a_3_lyt(
    armvar = armvar,
    lbl_overall = lbl_overall,
    medcat_var = medcat_var,
    lbl_medcat_var = lbl_medcat_var,
    medname_var = medname_var,
    lbl_medname_var = lbl_medname_var,
    deco = deco
  )

  tbl <- build_table(lyt, dbsel$adcm, alt_counts_df = dbsel$adsl)

  if (prune_0) {
    tbl <- tbl %>% prune_table()
  }

  tbl_sorted <- tbl %>%
    sort_at_path(
      path = c(medcat_var, "*", medname_var),
      scorefun = score_occurrences
    )

  tbl_sorted
}


#' `CMT01A` Layout 3 (Supplementary)
#'
#' @describeIn cmt01a_3
#'
#' @inheritParams gen_args
#' @param medcat_var (`character`) the variable defining the medication category. By default `ATC2`.
#' @param lbl_medcat_var (`character`) the label for the medication category.
#' @param medname_var (`character`) the variable defining the medication name. By default `CMDECOD`.
#' @param lbl_medname_var (`character`) the label for the medication name.
#'
#' @export
#'
#' @examples
#' cmt01a_3_lyt(
#'   armvar = "ACTARM",
#'   lbl_overall = NULL,
#'   deco = std_deco("CMT01A")
#' )
cmt01a_3_lyt <- function(armvar = .study$armvar,
                         lbl_overall = .study$lbl_overall,
                         medcat_var = "ATC2",
                         lbl_medcat_var = "ATC Class Level 2",
                         medname_var = "CMDECOD",
                         lbl_medname_var = "Other Treatment",
                         deco = std_deco("CMT01A"),
                         .study = list(
                           armvar = "ACTARM",
                           lbl_overall = NULL
                         )) {
  basic_table_deco(deco) %>%
    split_cols_by(var = armvar) %>%
    add_colcounts() %>%
    ifneeded_add_overall_col(lbl_overall) %>%
    summarize_num_patients(
      var = "USUBJID",
      count_by = "CMSEQ",
      .stats = c("unique", "nonunique"),
      .labels = c(
        unique = "Total number of patients with at least one treatment",
        nonunique = "Total number of treatments"
      )
    ) %>%
    split_rows_by(
      medcat_var,
      child_labels = "visible",
      nested = FALSE,
      indent_mod = -1L,
      split_fun = drop_split_levels,
      label_pos = "topleft",
      split_label = lbl_medcat_var
    ) %>%
    summarize_num_patients(
      var = "USUBJID",
      count_by = "CMSEQ",
      .stats = c("unique"),
      .labels = c(
        unique = "Total number of patients with at least one treatment"
      )
    ) %>%
    count_occurrences(
      vars = medname_var,
      .indent_mods = -1L
    ) %>%
    append_topleft(paste0("  ", lbl_medname_var))
}
