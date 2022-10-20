# cmt01a_1 ----

#' @describeIn cmt01a_1 Main TLG function
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
#' @note
#'  * `adam_db` object must contain an `adcm` table with the columns specified in `medcat_var` and `medname_var` as well
#'  as "CMSEQ".
#'
#' @export
#'
cmt01a_1_main <- function(adam_db,
                          lyt_ls = list(cmt01a_1_lyt),
                          armvar = .study$planarm,
                          medcat_var = "ATC2", # Anatomical therapeutic category
                          lbl_medcat_var = "ATC Class Level 2",
                          medname_var = "CMDECOD",
                          lbl_medname_var = "Other Treatment",
                          lbl_overall = .study$lbl_overall,
                          prune_0 = TRUE,
                          deco = std_deco("CMT01A"),
                          .study = list(
                            planarm = "ARM",
                            lbl_overall = NULL
                          ),
                          ...) {
  assert_colnames(adam_db$adcm, c(medcat_var, medname_var))

  dbsel <- get_db_data(adam_db, "adsl", "adcm")

  lyt <- lyt_ls[[1]](
    armvar = armvar,
    lbl_overall = lbl_overall,
    medcat_var = medcat_var,
    lbl_medcat_var = lbl_medcat_var,
    medname_var = medname_var,
    lbl_medname_var = lbl_medname_var,
    deco = deco,
    ... = ...
  )

  tbl <- build_table(lyt, dbsel$adcm, alt_counts_df = dbsel$adsl)

  if (prune_0) {
    tbl <- smart_prune(tbl)
  }

  tbl_sorted <- tbl %>%
    sort_at_path(
      path = c(medcat_var, "*", medname_var),
      scorefun = score_occurrences
    )

  tbl_sorted
}

#' @describeIn cmt01a_1 Layout
#'
#' @inheritParams gen_args
#' @param medcat_var (`character`) the variable defining the medication category. By default `ATC2`.
#' @param lbl_medcat_var (`character`) the label for the medication category.
#' @param medname_var (`character`) the variable defining the medication name. By default `CMDECOD`.
#' @param lbl_medname_var (`character`) the label for the medication name.
#' @param ... not used.
#'
#' @export
#'
cmt01a_1_lyt <- function(armvar = .study$planarm,
                         lbl_overall = .study$lbl_overall,
                         medcat_var = "ATC2",
                         lbl_medcat_var = "ATC Class Level 2",
                         medname_var = "CMDECOD",
                         lbl_medname_var = "Other Treatment",
                         deco = std_deco("CMT01A"),
                         .study = list(
                           planarm = "ARM",
                           lbl_overall = NULL
                         ),
                         ...) {
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

#' @describeIn cmt01a_1 Preprocessing
#'
#' @inheritParams gen_args
#' @param ... not used.
#'
#' @export
#'
cmt01a_1_pre <- function(adam_db, ...) {
  checkmate::assert_class(adam_db, "dm")

  adam_db %>%
    dm_zoom_to("adcm") %>%
    filter(.data$ANL01FL == "Y") %>%
    dm_update_zoomed() %>%
    dm_zoom_to("adcm") %>%
    mutate(CMSEQ = as.factor(.data$CMSEQ)) %>%
    dm_update_zoomed()
}

#' `CMT01A` Table 1 (Default) Concomitant Medication by Medication Class and Preferred Name.
#'
#' A concomitant medication
#' table with the number of subjects and the total number of treatments by medication class sorted alphabetically and
#' medication name sorted by frequencies.
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' library(magrittr)
#' library(dm)
#'
#' db <- syn_test_data() %>%
#'   dm_zoom_to("adcm") %>%
#'   filter(.data$ATIREL == "CONCOMITANT") %>%
#'   dm_update_zoomed()
#'
#' run(cmt01a_1, db)
cmt01a_1 <- chevron_tlg(cmt01a_1_main, cmt01a_1_lyt, cmt01a_1_pre, adam_datasets = c("adsl", "adcm"))


# cmt01a_2 ----

#' @describeIn cmt01a_2 Main TLG function
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
#' @note
#'  * `adam_db` object must contain an `adcm` table with the columns specified in `medcat_var` and `medname_var` as well
#'  as "CMSEQ".
#'
#' @export
#'
cmt01a_2_main <- function(adam_db,
                          lyt_ls = list(cmt01a_1_lyt),
                          armvar = .study$planarm,
                          medcat_var = "ATC2", # Anatomical therapeutic category
                          lbl_medcat_var = "ATC Class Level 2",
                          medname_var = "CMDECOD",
                          lbl_medname_var = "Other Treatment",
                          lbl_overall = .study$lbl_overall,
                          prune_0 = TRUE,
                          deco = std_deco("CMT01A"),
                          .study = list(
                            planarm = "ARM",
                            lbl_overall = NULL
                          ),
                          ...) {
  assert_colnames(adam_db$adcm, c(medcat_var, medname_var))

  dbsel <- get_db_data(adam_db, "adsl", "adcm")

  # The same layout can be used.
  lyt <- lyt_ls[[1]](
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
    tbl <- smart_prune(tbl)
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

#' @describeIn cmt01a_2 Preprocessing
#'
#' @inheritParams gen_args
#' @param ... not used.
#'
#' @export
#'
cmt01a_2_pre <- function(adam_db, ...) {
  checkmate::assert_class(adam_db, "dm")

  adam_db %>%
    dm_zoom_to("adcm") %>%
    filter(.data$ANL01FL == "Y") %>%
    dm_update_zoomed() %>%
    dm_zoom_to("adcm") %>%
    mutate(CMSEQ = as.factor(.data$CMSEQ)) %>%
    dm_update_zoomed()
}

#' `CMT01A` Table 2 (Supplementary) Concomitant Medication by Medication Class and Preferred Name (Classes sorted by
#' frequency).
#'
#' A concomitant medication table with the number of subjects and the total number of treatments by
#' medication class and medication name sorted by frequencies.
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' library(magrittr)
#' library(dm)
#'
#' db <- syn_test_data() %>%
#'   dm_zoom_to("adcm") %>%
#'   filter(.data$ATIREL == "CONCOMITANT") %>%
#'   dm_update_zoomed()
#'
#' run(cmt01a_2, db)
cmt01a_2 <- chevron_tlg(cmt01a_2_main, cmt01a_1_lyt, cmt01a_2_pre, adam_datasets = c("adsl", "adcm"))


# cmt01a_3 ----

#' @describeIn cmt01a_3 Main TLG function
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
#' @note
#'  * `adam_db` object must contain an `adcm` table with the columns specified in `medcat_var` and `medname_var` as well
#'  as "CMSEQ".
#'
#' @export
#'
cmt01a_3_main <- function(adam_db,
                          lyt_ls = list(cmt01a_3_lyt),
                          armvar = .study$planarm,
                          medcat_var = "ATC2", # Anatomical therapeutic category
                          lbl_medcat_var = "ATC Class Level 2",
                          medname_var = "CMDECOD",
                          lbl_medname_var = "Other Treatment",
                          lbl_overall = .study$lbl_overall,
                          prune_0 = TRUE,
                          deco = std_deco("CMT01A"),
                          .study = list(
                            planarm = "ARM",
                            lbl_overall = NULL
                          ),
                          ...) {
  assert_colnames(adam_db$adcm, c(medcat_var, medname_var))

  dbsel <- get_db_data(adam_db, "adsl", "adcm")

  lyt <- lyt_ls[[1]](
    armvar = armvar,
    lbl_overall = lbl_overall,
    medcat_var = medcat_var,
    lbl_medcat_var = lbl_medcat_var,
    medname_var = medname_var,
    lbl_medname_var = lbl_medname_var,
    deco = deco,
    ... = ...
  )

  tbl <- build_table(lyt, dbsel$adcm, alt_counts_df = dbsel$adsl)

  if (prune_0) {
    tbl <- smart_prune(tbl)
  }

  tbl_sorted <- tbl %>%
    sort_at_path(
      path = c(medcat_var, "*", medname_var),
      scorefun = score_occurrences
    )

  tbl_sorted
}

#' @describeIn cmt01a_3 Layout
#'
#' @inheritParams gen_args
#' @param medcat_var (`character`) the variable defining the medication category. By default `ATC2`.
#' @param lbl_medcat_var (`character`) the label for the medication category.
#' @param medname_var (`character`) the variable defining the medication name. By default `CMDECOD`.
#' @param lbl_medname_var (`character`) the label for the medication name.
#' @param ... not used.
#'
#' @export
#'
cmt01a_3_lyt <- function(armvar = .study$planarm,
                         lbl_overall = .study$lbl_overall,
                         medcat_var = "ATC2",
                         lbl_medcat_var = "ATC Class Level 2",
                         medname_var = "CMDECOD",
                         lbl_medname_var = "Other Treatment",
                         deco = std_deco("CMT01A"),
                         .study = list(
                           planarm = "ARM",
                           lbl_overall = NULL
                         ),
                         ...) {
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

#' @describeIn cmt01a_3 Preprocessing
#'
#' @inheritParams gen_args
#' @param ... not used.
#'
#' @export
#'
cmt01a_3_pre <- function(adam_db, ...) {
  checkmate::assert_class(adam_db, "dm")

  adam_db %>%
    dm_zoom_to("adcm") %>%
    filter(.data$ANL01FL == "Y") %>%
    dm_update_zoomed() %>%
    dm_zoom_to("adcm") %>%
    mutate(CMSEQ = as.factor(.data$CMSEQ)) %>%
    dm_update_zoomed()
}

#' `CMT01A` Table 3 (Supplementary) Concomitant Medication by Medication Class and Preferred Name (Total number of
#' treatments per medication class suppressed).
#'
#' A concomitant medication table with the number of subjects and the total
#' number of treatments by medication class sorted alphabetically and medication name sorted by frequencies presented
#' without the total number of treatments per medication.
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' library(magrittr)
#' library(dm)
#'
#' db <- syn_test_data() %>%
#'   dm_zoom_to("adcm") %>%
#'   filter(.data$ATIREL == "CONCOMITANT") %>%
#'   dm_update_zoomed()
#'
#' run(cmt01a_3, db)
cmt01a_3 <- chevron_tlg(cmt01a_3_main, cmt01a_3_lyt, cmt01a_3_pre, adam_datasets = c("adsl", "adcm"))
