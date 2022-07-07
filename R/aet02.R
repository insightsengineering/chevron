#' `AET02` Table 1 (Default) Adverse Events by System Organ Class and Preferred Term Table 1
#'
#' The `AET02` table provides an overview of the number of subjects experiencing adverse events and the number of advert
#' events categorized by Body System and Dictionary-Derived Term.
#'
#' @inheritParams gen_args
#'
#' @details
#'  * Numbers represent absolute numbers of subject and fraction of `N`, or absolute number of event when specified.
#'  * Remove zero-count rows unless overridden with `prune_0 = FALSE`.
#'  * Split columns by arm.
#'  * Does not include a total column by default.
#'  * Sort Dictionary-Derived Code (`AEDECOD`) by highest overall frequencies.
#'  * Missing values in `AEBODSYS`, and `AEDECOD` are labeled by `No Coding available`.
#'
#' @importFrom dplyr filter
#'
#' @export
#'
#' @examples
#' library(dm)
#'
#' db <- syn_test_data() %>%
#'   aet02_1_pre()
#'
#' aet02_1(adam_db = db) %>% head(15)
#'
#' # Additional Examples
#' db_s <- db %>%
#'   dm_filter(adsl, SEX == "F")
#'
#' aet02_1(adam_db = db_s) %>% head()
#'
#' # alternatively adam_db also accepts a names list
#' aet02_1(adam_db = list(adsl = db$adsl, adae = db$adae)) %>% head()
#'
#' aet02_1(db, lbl_overall = "All Patients") %>% head()
aet02_1 <- function(adam_db,
                    armvar = .study$actualarm,
                    lbl_overall = .study$lbl_overall,
                    prune_0 = TRUE,
                    deco = std_deco("AET02"),
                    .study = list(
                      actualarm = "ACTARM",
                      lbl_overall = NULL
                    )) {
  dbsel <- get_db_data(adam_db, "adsl", "adae")

  lyt <- aet02_1_lyt(
    armvar = armvar,
    lbl_overall = lbl_overall,
    deco = deco
  )

  tbl <- build_table(lyt, dbsel$adae, alt_counts_df = dbsel$adsl)

  if (prune_0) {
    tbl <- prune_table(tbl)
  }

  tbl_sorted <- tbl %>%
    sort_at_path(
      path = c("AEBODSYS"),
      scorefun = cont_n_allcols
    ) %>%
    sort_at_path(
      path = c("AEBODSYS", "*", "AEDECOD"),
      scorefun = score_occurrences
    )

  tbl_sorted
}

#' @describeIn aet02_1 `aet02_1` Layout
#'
#' @inheritParams gen_args
#' @param lbl_aebodsys (`character`) text label for `AEBODSYS`.
#' @param lbl_aedecod (`character`) text label for `AEDECOD`.
#'
#' @export
#'
#' @examples
#' aet02_1_lyt(
#'   armvar = "ACTARM",
#'   lbl_overall = NULL,
#'   deco = std_deco("AET02")
#' )
aet02_1_lyt <- function(armvar = .study$actualarm,
                        lbl_overall = .study$lbl_overall,
                        lbl_aebodsys = "MedDRA System Organ Class",
                        lbl_aedecod = "MedDRA Preferred Term",
                        deco = std_deco("AET02"),
                        .study = list(
                          actualarm = "ACTARM",
                          lbl_overall = NULL
                        )) {
  basic_table_deco(deco) %>%
    split_cols_by(var = armvar) %>%
    add_colcounts() %>%
    ifneeded_add_overall_col(lbl_overall) %>%
    summarize_num_patients(
      var = "USUBJID",
      .stats = c("unique", "nonunique"),
      .labels = c(
        unique = "Total number of patients with at least one adverse event",
        nonunique = "Overall total number of events"
      )
    ) %>%
    split_rows_by(
      "AEBODSYS",
      child_labels = "visible",
      labels_var = "AEBODSYS",
      nested = FALSE,
      indent_mod = -1L,
      split_fun = drop_split_levels,
      label_pos = "topleft",
      split_label = lbl_aebodsys
    ) %>%
    summarize_num_patients(
      var = "USUBJID",
      .stats = c("unique", "nonunique"),
      .labels = c(
        unique = "Total number of patients with at least one adverse event",
        nonunique = "Total number of events"
      )
    ) %>%
    count_occurrences(
      vars = "AEDECOD",
      .indent_mods = -1L
    ) %>%
    append_topleft(paste0("  ", lbl_aedecod))
}

#' @describeIn aet02_1 `aet02_1` Preprocessing
#'
#' @inheritParams gen_args
#'
#' @export
#'
#' @examples
#' syn_test_data() %>%
#'   aet02_1_pre()
aet02_1_pre <- function(adam_db) {
  checkmate::assert_class(adam_db, "dm")

  adam_db %>%
    dm_zoom_to("adae") %>%
    filter(.data$ANL01FL == "Y") %>%
    dm_update_zoomed() %>%
    dm_zoom_to("adae") %>%
    mutate(
      AEBODSYS = tern::explicit_na(tern::sas_na(.data$AEBODSYS), label = "No Coding available"),
      AEDECOD = tern::explicit_na(tern::sas_na(.data$AEDECOD), label = "No Coding available")
    ) %>%
    dm_update_zoomed()
}

# Version2 ----

#' `AET02` Table 2 (Supplementary) Adverse Events by System Organ Class, High Level Term and Preferred Term Table 2
#'
#' The `AET02_2` table provides an overview of the number of patients experiencing adverse events and the number of
#' adverse events categorized by Body System, High Level Term and Dictionary-Derived Term.
#'
#' @inheritParams gen_args
#'
#' @details
#'  * Numbers represent absolute numbers of patients and fraction of `N`, or absolute number of event when specified.
#'  * Remove zero-count rows unless overridden with `prune_0 = FALSE`.
#'  * Split columns by arm.
#'  * Does not include a total column by default.
#'  * Sort Body System or Organ Class, High Level Term and Dictionary-Derived Term hierarchically by highest overall
#'  frequencies.
#'  * Missing values of `AEBODSYS`, `AEHLT` and `AEDECOD` in `adae` are labeled by `No Coding available`.
#'
#' @importFrom dplyr filter
#'
#' @export
#'
#' @examples
#' library(dm)
#'
#' db <- syn_test_data() %>%
#'   aet02_2_pre()
#'
#' aet02_2(db) %>% head(15)
#'
#' # Additional Examples
#' aet02_2(db, lbl_overall = "All Patients") %>% head()
aet02_2 <- function(adam_db,
                    armvar = .study$actualarm,
                    lbl_overall = .study$lbl_overall,
                    prune_0 = TRUE,
                    deco = std_deco("AET02"),
                    .study = list(
                      actualarm = "ACTARM",
                      lbl_overall = NULL
                    )) {
  dbsel <- get_db_data(adam_db, "adsl", "adae")

  lyt <- aet02_2_lyt(
    armvar = armvar,
    lbl_overall = lbl_overall,
    deco = deco
  )

  tbl <- build_table(lyt, dbsel$adae, alt_counts_df = dbsel$adsl)

  if (prune_0) {
    tbl <- prune_table(tbl)
  }

  tbl_sorted <- tbl %>%
    sort_at_path(
      path = c("AEBODSYS"),
      scorefun = cont_n_allcols
    ) %>%
    sort_at_path(
      path = c("AEBODSYS", "*", "AEHLT"),
      scorefun = cont_n_allcols
    ) %>%
    sort_at_path(
      path = c("AEBODSYS", "*", "AEHLT", "*", "AEDECOD"),
      scorefun = score_occurrences
    )

  tbl_sorted
}

#' @describeIn aet02_2 `aet02_2` Layout
#'
#' @inheritParams gen_args
#'
#' @param lbl_aebodsys (`character`) text label for `AEBODSYS`.
#' @param lbl_aehlt (`character`) text label for `AEHLT`.
#' @param lbl_aedecod (`character`) text label for `AEDECOD`.
#'
#' @export
#'
#' @examples
#' aet02_2_lyt(
#'   armvar = "ACTARM",
#'   lbl_overall = NULL,
#'   lbl_aebodsys = "Body System or Organ Class",
#'   lbl_aehlt = "High Level Term",
#'   lbl_aedecod = "Dictionary-Derived Term",
#'   deco = std_deco("AET02")
#' )
aet02_2_lyt <- function(armvar = .study$actualarm,
                        lbl_overall = .study$lbl_overall,
                        lbl_aebodsys = "MedDRA System Organ Class",
                        lbl_aehlt = "MedDRA High-Level Term",
                        lbl_aedecod = "MedDRA Preferred Term",
                        deco = std_deco("AET02"),
                        .study = list(
                          actualarm = "ACTARM",
                          lbl_overall = NULL
                        )) {
  basic_table_deco(deco) %>%
    split_cols_by(var = armvar) %>%
    add_colcounts() %>%
    ifneeded_add_overall_col(lbl_overall) %>%
    summarize_num_patients(
      var = "USUBJID",
      .stats = c("unique", "nonunique"),
      .labels = c(
        unique = "Total number of patients with at least one adverse event",
        nonunique = "Overall total number of events"
      )
    ) %>%
    split_rows_by(
      "AEBODSYS",
      child_labels = "visible",
      labels_var = "AEBODSYS",
      nested = FALSE,
      indent_mod = -1L,
      split_fun = drop_split_levels,
      label_pos = "topleft",
      split_label = lbl_aebodsys
    ) %>%
    summarize_num_patients(
      var = "USUBJID",
      .stats = c("unique", "nonunique"),
      .labels = c(
        unique = "Total number of patients with at least one adverse event",
        nonunique = "Total number of events"
      )
    ) %>%
    split_rows_by(
      "AEHLT",
      child_labels = "visible",
      indent_mod = -1L,
      split_fun = drop_split_levels,
      label_pos = "topleft",
      split_label = lbl_aehlt
    ) %>%
    summarize_num_patients(
      var = "USUBJID",
      .stats = c("unique", "nonunique"),
      .labels = c(
        unique = "Total number of patients with at least one adverse event",
        nonunique = "Total number of events"
      )
    ) %>%
    count_occurrences(
      vars = "AEDECOD",
      .indent_mods = -1L
    ) %>%
    append_topleft(paste0("    ", lbl_aedecod))
}

#' @describeIn aet02_2 `aet02_2` Preprocessing
#'
#' @inheritParams gen_args
#'
#' @export
#'
#' @examples
#' syn_test_data() %>%
#'   aet02_2_pre()
aet02_2_pre <- function(adam_db) {
  checkmate::assert_class(adam_db, "dm")

  adam_db %>%
    dm_zoom_to("adae") %>%
    filter(.data$ANL01FL == "Y") %>%
    dm_update_zoomed() %>%
    dm_zoom_to("adae") %>%
    mutate(
      AEBODSYS = tern::explicit_na(tern::sas_na(.data$AEBODSYS), label = "No Coding available"),
      AEHLT = tern::explicit_na(tern::sas_na(.data$AEHLT), label = "No Coding available"),
      AEDECOD = tern::explicit_na(tern::sas_na(.data$AEDECOD), label = "No Coding available")
    ) %>%
    dm_update_zoomed()
}

# Version 3 ----

#' `AET02` Table 3 (Supplementary) Adverse Events by Dictionary-Derived Term Table 3
#'
#' The `AET02_3` table provides an overview of the number of patients experiencing adverse events and the number of
#' adverse events categorized by Dictionary-Derived Term.
#'
#' @inheritParams gen_args
#'
#' @details
#'  * Numbers represent absolute numbers of patients and fraction of `N`, or absolute number of event when specified.
#'  * Remove zero-count rows unless overridden with `prune_0 = FALSE`.
#'  * Split columns by arm.
#'  * Does not include a total column by default.
#'  * Sort Dictionary-Derived Code by highest overall frequencies.
#'  * Missing values of `AEDECOD` in `aead` are labeled by `No Coding available`.
#'
#' @importFrom dplyr filter
#'
#' @export
#'
#' @examples
#' library(dm)
#'
#' db <- syn_test_data() %>%
#'   aet02_3_pre()
#'
#' aet02_3(adam_db = db) %>% head()
#'
#' aet02_3(db, lbl_overall = "All Patients") %>% head()
aet02_3 <- function(adam_db,
                    armvar = .study$actualarm,
                    lbl_overall = .study$lbl_overall,
                    prune_0 = TRUE,
                    deco = std_deco("AET02"),
                    .study = list(
                      actualarm = "ACTARM",
                      lbl_overall = NULL
                    )) {
  lyt <- aet02_3_lyt(
    armvar = armvar,
    lbl_overall = lbl_overall,
    deco = deco
  )

  tbl <- build_table(lyt, adam_db$adae, alt_counts_df = adam_db$adsl)

  if (prune_0) {
    tbl <- prune_table(tbl)
  }

  tbl_sorted <- tbl %>%
    sort_at_path(
      "AEDECOD",
      scorefun = score_occurrences
    )

  tbl_sorted
}

#' @describeIn aet02_3 `aet02_3` Layout
#'
#' @inheritParams gen_args
#'
#' @param lbl_aedecod (`character`) text label for `AEDECOD`.
#'
#' @export
#'
#' @examples
#' aet02_3_lyt(
#'   armvar = "ACTARM",
#'   lbl_overall = NULL,
#'   lbl_aedecod = "Dictionary-Derived Term",
#'   deco = std_deco("AET02")
#' )
aet02_3_lyt <- function(armvar = .study$actualarm,
                        lbl_overall = .study$lbl_overall,
                        lbl_aedecod = "MedDRA Preferred Term",
                        deco = std_deco("AET02"),
                        .study = list(
                          actualarm = "ACTARM",
                          lbl_overall = NULL
                        )) {
  basic_table_deco(deco) %>%
    split_cols_by(var = armvar) %>%
    add_colcounts() %>%
    ifneeded_add_overall_col(lbl_overall) %>%
    summarize_num_patients(
      var = "USUBJID",
      .stats = c("unique", "nonunique"),
      .labels = c(
        unique = "Total number of patients with at least one adverse event",
        nonunique = "Total number of events"
      )
    ) %>%
    count_occurrences(vars = "AEDECOD", .indent_mods = -2L) %>%
    append_topleft(lbl_aedecod)
}

#' @describeIn aet02_3 `aet02_3` Preprocessing
#'
#' @inheritParams gen_args
#'
#' @export
#'
#' @examples
#' syn_test_data() %>%
#'   aet02_3_pre()
aet02_3_pre <- function(adam_db) {
  checkmate::assert_class(adam_db, "dm")

  adam_db %>%
    dm_zoom_to("adae") %>%
    filter(.data$ANL01FL == "Y") %>%
    dm_update_zoomed() %>%
    dm_zoom_to("adae") %>%
    mutate(
      AEDECOD = tern::explicit_na(tern::sas_na(.data$AEDECOD), label = "No Coding available")
    ) %>%
    dm_update_zoomed()
}
