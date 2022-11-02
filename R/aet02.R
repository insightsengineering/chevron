# aet02_1 ----

#' @describeIn aet02_1 Main TLG function
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
#' @note
#'  * `adam_db` object must contain an `adae` table with the columns `"AEBODSYS"` and `"AEDECOD"`.
#'
#'
#' @export
#'
aet02_1_main <- function(adam_db,
                         lyt_ls = list(aet02_1_lyt),
                         armvar = .study$actualarm,
                         lbl_overall = .study$lbl_overall,
                         prune_0 = TRUE,
                         deco = std_deco("AET02"),
                         .study = list(
                           actualarm = "ACTARM",
                           lbl_overall = NULL
                         ),
                         ...) {
  dbsel <- get_db_data(adam_db, "adsl", "adae")

  assert_colnames(adam_db$adae, c("AEBODSYS", "AEDECOD"))

  lyt <- lyt_ls[[1]](
    armvar = armvar,
    lbl_overall = lbl_overall,
    deco = deco,
    ... = ...
  )

  tbl <- build_table(lyt, dbsel$adae, alt_counts_df = dbsel$adsl)

  if (prune_0) {
    tbl <- smart_prune(tbl)
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

#' @describeIn aet02_1 Layout
#'
#' @inheritParams gen_args
#' @param lbl_aebodsys (`character`) text label for `AEBODSYS`.
#' @param lbl_aedecod (`character`) text label for `AEDECOD`.
#' @param ... not used.
#'
#' @export
#'
aet02_1_lyt <- function(armvar = .study$actualarm,
                        lbl_overall = .study$lbl_overall,
                        lbl_aebodsys = "MedDRA System Organ Class",
                        lbl_aedecod = "MedDRA Preferred Term",
                        deco = std_deco("AET02"),
                        .study = list(
                          actualarm = "ACTARM",
                          lbl_overall = NULL
                        ),
                        ...) {
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

#' @describeIn aet02_1 Preprocessing
#'
#' @inheritParams gen_args
#' @param ... not used.
#'
#' @export
#'
aet02_1_pre <- function(adam_db, ...) {
  checkmate::assert_class(adam_db, "dm")

  aet02_1_check(adam_db, ...)

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

#' @describeIn aet02_1 Checks
#'
#' @inheritParams gen_args
#' @param ... not used.
#'
aet02_1_check <- function(adam_db,
                          req_tables = c("adsl", "adae"),
                          armvar = .study$actualarm,
                          .study = list(
                            actualarm = "ACTARM"
                          ),
                          ...) {
  assert_all_tablenames(adam_db, req_tables)

  msg <- NULL
  msg <- c(msg, check_all_colnames(adam_db$adae, c(armvar, "USUBJID", "AEBODSYS", "AEDECOD")))
  msg <- c(msg, check_all_colnames(adam_db$adsl, c(armvar, "USUBJID")))

  if (is.null(msg)) {
    TRUE
  } else {
    stop(paste(msg, collapse = "\n  "))
  }
}

#' `AET02` Table 1 (Default) Adverse Events by System Organ Class and Preferred Term Table 1
#'
#' The `AET02` table provides an overview of the number of subjects experiencing adverse events and the number of advert
#' events categorized by Body System and Dictionary-Derived Term.
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' run(aet02_1, syn_test_data())
aet02_1 <- chevron_t(
  main = aet02_1_main,
  lyt = aet02_1_lyt,
  preprocess = aet02_1_pre,
  adam_datasets = c("adsl", "adae")
)


# aet02_2 ----

#' @describeIn aet02_2 Main TLG function
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
#' @note
#'  * `adam_db` object must contain an `adae` table with the columns `"AEBODSYS"`, `"AEHLT"` and `"AEDECOD"`.
#'
#'
#' @export
#'
aet02_2_main <- function(adam_db,
                         lyt_ls = list(aet02_2_lyt),
                         armvar = .study$actualarm,
                         lbl_overall = .study$lbl_overall,
                         prune_0 = TRUE,
                         deco = std_deco("AET02"),
                         .study = list(
                           actualarm = "ACTARM",
                           lbl_overall = NULL
                         ),
                         ...) {
  dbsel <- get_db_data(adam_db, "adsl", "adae")

  assert_colnames(adam_db$adae, c("AEBODSYS", "AEDECOD", "AEHLT"))

  lyt <- lyt_ls[[1]](
    armvar = armvar,
    lbl_overall = lbl_overall,
    deco = deco,
    ... = ...
  )

  tbl <- build_table(lyt, dbsel$adae, alt_counts_df = dbsel$adsl)

  if (prune_0) {
    tbl <- smart_prune(tbl)
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

#' @describeIn aet02_2 Layout
#'
#' @inheritParams gen_args
#'
#' @param lbl_aebodsys (`character`) text label for `AEBODSYS`.
#' @param lbl_aehlt (`character`) text label for `AEHLT`.
#' @param lbl_aedecod (`character`) text label for `AEDECOD`.
#' @param ... not used.
#'
#' @export
#'
aet02_2_lyt <- function(armvar = .study$actualarm,
                        lbl_overall = .study$lbl_overall,
                        lbl_aebodsys = "MedDRA System Organ Class",
                        lbl_aehlt = "MedDRA High-Level Term",
                        lbl_aedecod = "MedDRA Preferred Term",
                        deco = std_deco("AET02"),
                        .study = list(
                          actualarm = "ACTARM",
                          lbl_overall = NULL
                        ),
                        ...) {
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

#' @describeIn aet02_2 Preprocessing
#'
#' @inheritParams gen_args
#' @param ... not used.
#'
#' @export
#'
aet02_2_pre <- function(adam_db, ...) {
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

#' `AET02` Table 2 (Supplementary) Adverse Events by System Organ Class, High Level Term and Preferred Term Table 2.
#'
#' The `AET02_2` table provides an overview of the number of patients experiencing adverse events and the number of
#' adverse events categorized by Body System, High Level Term and Dictionary-Derived Term.
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' run(aet02_2, syn_test_data())
aet02_2 <- chevron_t(
  main = aet02_2_main,
  lyt = aet02_2_lyt,
  preprocess = aet02_2_pre,
  adam_datasets = c("adsl", "adae")
)


# aet02_3 ----

#' @describeIn aet02_2 Main TLG function
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
#' @note
#'  * `adam_db` object must contain an `adae` table with the column `"AEDECOD"`.
#'
#' @export
#'
aet02_3_main <- function(adam_db,
                         lyt_ls = list(aet02_3_lyt),
                         armvar = .study$actualarm,
                         lbl_overall = .study$lbl_overall,
                         prune_0 = TRUE,
                         deco = std_deco("AET02"),
                         .study = list(
                           actualarm = "ACTARM",
                           lbl_overall = NULL
                         ),
                         ...) {
  assert_colnames(adam_db$adae, c("AEDECOD"))

  lyt <- lyt_ls[[1]](
    armvar = armvar,
    lbl_overall = lbl_overall,
    deco = deco,
    ... = ...
  )

  tbl_top <- build_table(lyt$lyt_top, adam_db$adae, alt_counts_df = adam_db$adsl)

  tbl_bottom <- build_table(lyt$lyt_bottom, adam_db$adae, alt_counts_df = adam_db$adsl)

  # needed to handle empty adae tables.
  tbl_bottom <- tbl_bottom %>%
    sort_at_path(
      c("DOMAIN", "*", "AEDECOD"),
      scorefun = score_occurrences # score_occurrences
    )

  res <- if (nrow(tbl_bottom) > 0L) {
    rbind(tbl_top, tbl_bottom)
  } else {
    tbl_top
  }

  if (prune_0) {
    trim_rows(res)
  } else {
    res
  }
}

#' @describeIn aet02_3 Layout
#'
#' @inheritParams gen_args
#'
#' @param lbl_aedecod (`character`) text label for `AEDECOD`.
#' @param ... not used.
#'
#' @export
#'
aet02_3_lyt <- function(armvar = .study$actualarm,
                        lbl_overall = .study$lbl_overall,
                        lbl_aedecod = "MedDRA Preferred Term",
                        deco = std_deco("AET02"),
                        .study = list(
                          actualarm = "ACTARM",
                          lbl_overall = NULL
                        ),
                        ...) {
  lyt_top <- basic_table_deco(deco) %>%
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
    append_topleft(lbl_aedecod)

  lyt_bottom <- basic_table_deco(deco) %>%
    split_cols_by(var = armvar) %>%
    add_colcounts() %>%
    ifneeded_add_overall_col(lbl_overall) %>%
    # needed to handle empty df.
    split_rows_by(var = "DOMAIN", split_fun = drop_split_levels, child_labels = "hidden") %>%
    count_occurrences(vars = "AEDECOD", .indent_mods = -2L) %>%
    append_topleft(lbl_aedecod)


  list(lyt_top = lyt_top, lyt_bottom = lyt_bottom)
}

#' @describeIn aet02_3 Preprocessing
#'
#' @inheritParams gen_args
#' @param ... not used.
#'
#' @export
#'
aet02_3_pre <- function(adam_db, ...) {
  checkmate::assert_class(adam_db, "dm")

  adam_db %>%
    dm_zoom_to("adae") %>%
    filter(.data$ANL01FL == "Y") %>%
    dm_update_zoomed() %>%
    dm_zoom_to("adae") %>%
    mutate(
      AEDECOD = tern::explicit_na(tern::sas_na(.data$AEDECOD), label = "No Coding available"),
      DOMAIN = "AE" # necessary to handle empty tables
    ) %>%
    dm_update_zoomed()
}

#' `AET02` Table 3 (Supplementary) Adverse Events by Dictionary-Derived Term Table 3.
#'
#'  The `AET02_3` table provides an overview of the number of patients experiencing adverse events and the number of
#'  adverse events categorized by Dictionary-Derived Term.
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' run(aet02_3, syn_test_data())
aet02_3 <- chevron_t(
  main = aet02_3_main,
  lyt = aet02_3_lyt,
  preprocess = aet02_3_pre,
  adam_datasets = c("adsl", "adae")
)
