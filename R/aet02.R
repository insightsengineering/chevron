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
                         arm_var = "ACTARM",
                         lbl_overall = NULL,
                         lbl_aebodsys = "MedDRA System Organ Class",
                         lbl_aedecod = "MedDRA Preferred Term",
                         deco = std_deco("AET02"),
                         ...) {
  dbsel <- get_db_data(adam_db, "adsl", "adae")
  assert_colnames(dbsel$adae, c("AEBODSYS", "AEDECOD"))

  lyt <- aet02_1_lyt(
    arm_var = arm_var,
    lbl_overall = lbl_overall,
    lbl_aebodsys = lbl_aebodsys,
    lbl_aedecod = lbl_aedecod,
    deco = deco
  )

  tbl <- build_table(lyt, dbsel$adae, alt_counts_df = dbsel$adsl)

  tbl
}

#' @describeIn aet02_1 Layout
#'
#' @inheritParams gen_args
#' @param lbl_aebodsys (`string`) text label for `AEBODSYS`.
#' @param lbl_aedecod (`string`) text label for `AEDECOD`.
#'
#' @export
#'
aet02_1_lyt <- function(arm_var,
                        lbl_overall,
                        lbl_aebodsys,
                        lbl_aedecod,
                        deco) {
  basic_table_deco(deco) %>%
    split_cols_by(var = arm_var) %>%
    add_colcounts() %>%
    ifneeded_add_overall_col(lbl_overall) %>%
    analyze_num_patients(
      vars = "USUBJID",
      .stats = c("unique", "nonunique"),
      .labels = c(
        unique = "Total number of patients with at least one adverse event",
        nonunique = "Overall total number of events"
      )
    ) %>%
    split_rows_by(
      "AEBODSYS",
      child_labels = "visible",
      nested = FALSE,
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
#'
#' @export
#'
aet02_1_pre <- function(adam_db, arm_var, ...) {
  assert_all_tablenames(adam_db, c("adsl", "adae"))
  aet02_1_check(adam_db, arm_var = arm_var)
  new_format <- list(
    adae = list(
      AEBODSYS = rule("No Coding available" = c("", NA, "<Missing>")),
      AEDECOD = rule("No Coding available" = c("", NA, "<Missing>"))
    )
  )
  adam_db <- dunlin::reformat(adam_db, new_format, na_last = TRUE)

  adam_db$adae <- adam_db$adae %>%
    filter(.data$ANL01FL == "Y")

  adam_db
}

#' @describeIn aet02_1 Checks
#'
#' @inheritParams gen_args
#' @export
aet02_1_check <- function(adam_db,
                          req_tables = c("adsl", "adae"),
                          arm_var = "ACTARM") {
  assert_all_tablenames(adam_db, req_tables)

  msg <- NULL
  msg <- c(msg, check_all_colnames(adam_db$adae, c(arm_var, "USUBJID", "AEBODSYS", "AEDECOD")))
  msg <- c(msg, check_all_colnames(adam_db$adsl, c(arm_var, "USUBJID")))

  if (is.null(msg)) {
    TRUE
  } else {
    stop(paste(msg, collapse = "\n  "))
  }
}

#' @describeIn aet02_1 Postprocessing
#'
#' @inheritParams gen_args
#'
#' @export
#'
aet02_1_post <- function(tlg, prune_0 = TRUE, ...) {
  if (prune_0) {
    tlg <- smart_prune(tlg)
  }

  tbl_sorted <- tlg %>%
    sort_at_path(
      path = c("AEBODSYS"),
      scorefun = cont_n_allcols
    ) %>%
    sort_at_path(
      path = c("AEBODSYS", "*", "AEDECOD"),
      scorefun = score_occurrences
    )

  std_postprocess(tbl_sorted)
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
#' run(aet02_1, syn_data)
aet02_1 <- chevron_t(
  main = aet02_1_main,
  preprocess = aet02_1_pre,
  postprocess = aet02_1_post,
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
#'  * Missing values of `AEBODSYS`, `AEDECOD` and `AEHLT` in `adae` are labeled by `No Coding available`.
#'
#' @note
#'  * `adam_db` object must contain an `adae` table with the columns `"AEBODSYS"`, `"AEHLT"` and `"AEDECOD"`.
#'
#'
#' @export
#'
aet02_2_main <- function(adam_db,
                         arm_var = "ACTARM",
                         lbl_overall = NULL,
                         lbl_aebodsys = "MedDRA System Organ Class",
                         lbl_aedecod = "MedDRA Preferred Term",
                         lbl_aehlt = "MedDRA High-Level Term",
                         deco = std_deco("AET02"),
                         ...) {
  dbsel <- get_db_data(adam_db, "adsl", "adae")
  assert_colnames(dbsel$adae, c("AEBODSYS", "AEDECOD", "AEHLT"))

  lyt <- aet02_2_lyt(
    arm_var = arm_var,
    lbl_overall = lbl_overall,
    lbl_aebodsys = lbl_aebodsys,
    lbl_aedecod = lbl_aedecod,
    lbl_aehlt = lbl_aehlt,
    deco = deco
  )

  tbl <- build_table(lyt, dbsel$adae, alt_counts_df = dbsel$adsl)

  tbl
}

#' @describeIn aet02_2 Layout
#'
#' @inheritParams gen_args
#'
#' @param lbl_aebodsys (`character`) text label for `AEBODSYS`.
#' @param lbl_aehlt (`character`) text label for `AEHLT`.
#' @param lbl_aedecod (`character`) text label for `AEDECOD`.
#'
#' @export
#'
aet02_2_lyt <- function(arm_var,
                        lbl_overall = NULL,
                        lbl_aebodsys,
                        lbl_aedecod,
                        lbl_aehlt,
                        deco) {
  basic_table_deco(deco) %>%
    split_cols_by(var = arm_var) %>%
    add_colcounts() %>%
    ifneeded_add_overall_col(lbl_overall) %>%
    analyze_num_patients(
      vars = "USUBJID",
      .stats = c("unique", "nonunique"),
      .labels = c(
        unique = "Total number of patients with at least one adverse event",
        nonunique = "Overall total number of events"
      )
    ) %>%
    split_rows_by(
      "AEBODSYS",
      child_labels = "visible",
      nested = FALSE,
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
      nested = TRUE,
      split_fun = drop_split_levels,
      indent_mod = -1L,
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
      .indent_mods = c(count_fraction = -1L)
    ) %>%
    append_topleft(paste0("    ", lbl_aedecod))
}

#' @describeIn aet02_2 Preprocessing
#'
#' @inheritParams gen_args
#'
#' @export
#'
aet02_2_pre <- function(adam_db, ...) {
  assert_all_tablenames(adam_db, c("adsl", "adae"))
  checkmate::assert_list(adam_db, types = "list")
  assert_colnames(adam_db$adae, c("AEBODSYS", "AEHLT", "AEDECOD"))

  new_format <- list(
    adae = list(
      AEBODSYS = rule("No Coding available" = c("", NA, "<Missing>")),
      AEDECOD = rule("No Coding available" = c("", NA, "<Missing>")),
      AEHLT = rule("No Coding available" = c("", NA, "<Missing>"))
    )
  )
  adam_db <- dunlin::reformat(adam_db, new_format, na_last = TRUE)

  adam_db$adae <- adam_db$adae %>%
    filter(.data$ANL01FL == "Y")

  adam_db
}

#' @describeIn aet02_2 Postprocessing
#'
#' @inheritParams gen_args
#'
#' @export
aet02_2_post <- function(tlg, prune_0 = TRUE, ...) {
  if (prune_0) {
    tlg <- smart_prune(tlg)
  }

  tbl_sorted <- tlg %>%
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

  std_postprocess(tbl_sorted)
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
#' run(aet02_2, syn_data)
aet02_2 <- chevron_t(
  main = aet02_2_main,
  preprocess = aet02_2_pre,
  postprocess = aet02_2_post,
  adam_datasets = c("adsl", "adae")
)


# aet02_3 ----
#' @describeIn aet02_3 Main TLG function
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
                         arm_var = "ACTARM",
                         lbl_overall = NULL,
                         lbl_aedecod = "MedDRA Preferred Term",
                         deco = std_deco("AET02"),
                         ...) {
  dbsel <- get_db_data(adam_db, "adsl", "adae")
  assert_colnames(dbsel$adae, c("AEDECOD"))

  lyt <- aet02_3_lyt(
    arm_var = arm_var,
    lbl_overall = lbl_overall,
    lbl_aedecod = lbl_aedecod,
    deco = deco
  )

  tbl_top <- build_table(lyt$lyt_top, dbsel$adae, alt_counts_df = dbsel$adsl)

  tbl_bottom <- build_table(lyt$lyt_bottom, dbsel$adae, alt_counts_df = dbsel$adsl)

  list(tbl_top, tbl_bottom)
}

#' @describeIn aet02_3 Layout
#'
#' @inheritParams gen_args
#'
#' @param lbl_aedecod (`character`) text label for `AEDECOD`.
#'
#' @export
#'
aet02_3_lyt <- function(arm_var,
                        lbl_overall,
                        lbl_aedecod,
                        deco) {
  lyt_top <- basic_table_deco(deco) %>%
    split_cols_by(var = arm_var) %>%
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
    split_cols_by(var = arm_var) %>%
    add_colcounts() %>%
    ifneeded_add_overall_col(lbl_overall) %>%
    # needed to handle empty df.
    split_rows_by(
      var = "DOMAIN",
      split_fun = drop_split_levels,
      child_labels = "hidden"
    ) %>%
    count_occurrences(
      vars = "AEDECOD",
      .indent_mods = -2L
    ) %>%
    append_topleft(lbl_aedecod)

  list(lyt_top = lyt_top, lyt_bottom = lyt_bottom)
}

#' @describeIn aet02_3 Preprocessing
#'
#' @inheritParams gen_args
#'
#' @export
#'
aet02_3_pre <- function(adam_db, ...) {
  assert_all_tablenames(adam_db, c("adsl", "adae"))
  assert_colnames(adam_db$adae, c("AEDECOD"))

  new_format <- list(
    adae = list(
      AEDECOD = rule("No Coding available" = c("", NA, "<Missing>"))
    )
  )
  adam_db <- dunlin::reformat(adam_db, new_format, na_last = TRUE)

  adam_db$adae <- adam_db$adae %>%
    filter(.data$ANL01FL == "Y") %>%
    mutate(
      DOMAIN = "AE" # necessary to handle empty tables
    )

  adam_db
}

#' @describeIn aet02_3 Postprocessing
#'
#' @inheritParams gen_args
#'
#' @export
#'
aet02_3_post <- function(tlg, prune_0 = TRUE, ...) {
  tbl_top <- tlg[[1]]
  tbl_bottom <- tlg[[2]]
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
    res <- trim_rows(res)
  }

  std_postprocess(res)
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
#' run(aet02_3, syn_data)
aet02_3 <- chevron_t(
  main = aet02_3_main,
  preprocess = aet02_3_pre,
  postprocess = aet02_3_post,
  adam_datasets = c("adsl", "adae")
)
