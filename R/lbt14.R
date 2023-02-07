# lbt14_1 ----

#' @describeIn lbt14_1 Main TLG function
#'
#' @inheritParams gen_args
#' @param gr_missing how missing baseline grades should be handled. Defaults to `"incl"` to include the `"Missing"`
#' level. Other options are `"excl"` to exclude patients with missing baseline grades and `"gr_0"` to convert missing
#' baseline grades to grade 0.
#' @param title table title to display. Defaults to `"LBT14 - Low Direction"`.
#'
#' @details
#'  * Only the worst grade recorded for each patient is included in the table.
#'  * If no missing baseline lab results, the "Missing" level of `BTOXGR` is excluded.
#'  * Grades 0, 1, 2, 3, and 4 are counted as `"Not Low"`.
#'  * Remove zero-count rows unless overridden with `prune_0 = FALSE`.
#'  * Split columns by arm, typically `ACTARM`.
#'
#' @note
#'   * `adam_db` object must contain an `adlb` table with columns `"USUBJID"`, `"PARAM"`, `"BTOXGR"`, `"ATOXGR"`,
#'   and the column specified by `arm_var`.
#'
#' @export
#'
lbt14_1_main <- function(adam_db,
                         arm_var = "ACTARM",
                         gr_missing = "incl",
                         title = "LBT14 - Low Direction",
                         deco = std_deco("LBT14"),
                         ...) {
  lyt <- lbt14_1_lyt(
    arm_var = arm_var,
    gr_missing = gr_missing,
    title = title,
    deco = deco,
    ... = ...
  )

  tbl <- build_table(lyt, adam_db$adlb, alt_counts_df = adam_db$adsl)

  tbl
}

#' @describeIn lbt14_1 Layout
#'
#' @inheritParams lbt14_1_main
#' @param ... not used.
#'
#' @export
#'
lbt14_1_lyt <- function(arm_var,
                        gr_missing,
                        title,
                        deco,
                        ...) {
  deco$title <- title
  if (gr_missing == "excl") {
    deco$main_footer <- "Patients with missing baseline values are excluded from the analysis."
  } else if (gr_missing == "gr_0") {
    deco$main_footer <- "Patients with missing baseline values are assumed to be Grade 0 at baseline."
  }

  lyt <- basic_table_deco(deco, show_colcounts = TRUE) %>%
    split_cols_by(arm_var) %>%
    split_rows_by(
      "PARAM",
      split_fun = drop_split_levels,
      label_pos = "topleft",
      split_label = "Parameter"
    ) %>%
    split_rows_by(
      "BTOXGR_GRP",
      label_pos = "topleft",
      split_label = "    Baseline NCI-CTCAE Grade",
      indent_mod = 2L
    ) %>%
    summarize_num_patients(var = "USUBJID", .stats = c("unique_count"), unique_count_suffix = FALSE) %>%
    count_occurrences("ATOXGR_GRP", denom = "n", drop = FALSE, .indent_mods = 3L) %>%
    append_topleft("              Post-baseline NCI-CTCAE Grade")
}

#' @describeIn lbt14_1 Preprocessing
#'
#' @inheritParams gen_args
#' @inheritParams lbt14_1_main
#' @param ... not used.
#'
#' @export
#'
lbt14_1_pre <- function(adam_db,
                        gr_missing = "incl",
                        ...) {
  checkmate::assert_class(adam_db, "dm")
  checkmate::assert_choice(gr_missing, c("incl", "excl", "gr_0"))

  lbt14_1_check(adam_db, ...)

  new_format <- list(
    adlb = list(
      BTOXGR = list("<Missing>" = c("", NA, "<Missing>", "No Coding Available")),
      ATOXGR = list("<Missing>" = c("", NA, "<Missing>", "No Coding Available"))
    )
  )

  adam_db <- dunlin::apply_reformat(adam_db, new_format)

  if (gr_missing == "excl") {
    adam_db <- adam_db %>%
      dm_zoom_to("adlb") %>%
      filter(.data$BTOXGR != "<Missing>") %>%
      dm_update_zoomed()
  } else if (gr_missing == "gr_0") {
    adam_db <- adam_db %>%
      dm_zoom_to("adlb") %>%
      mutate(BTOXGR = if (all(adam_db$adlb$BTOXGR == "<Missing>")) factor(BTOXGR, levels = c("0", "<Missing>"))
             else BTOXGR) %>%
      mutate(BTOXGR = forcats::fct_collapse(BTOXGR, "0" = c("0", "<Missing>"))) %>%
      dm_update_zoomed()
  }

  adam_db %>%
    dm_zoom_to("adlb") %>%
    filter(.data$WGRLOFL == "Y") %>%
    dm_update_zoomed() %>%
    dm_zoom_to("adlb") %>%
    mutate(
      ATOXGR_GRP = factor(
        case_when(
          ATOXGR %in% c(0, 1, 2, 3, 4) ~ "Not Low",
          ATOXGR == -1 ~ "1",
          ATOXGR == -2 ~ "2",
          ATOXGR == -3 ~ "3",
          ATOXGR == -4 ~ "4",
          ATOXGR == "<Missing>" ~ "Missing"
        ),
        levels = c("Not Low", "1", "2", "3", "4", "Missing")
      ),
      BTOXGR_GRP = factor(
        case_when(
          BTOXGR %in% c(0, 1, 2, 3, 4) ~ "Not Low",
          BTOXGR == -1 ~ "1",
          BTOXGR == -2 ~ "2",
          BTOXGR == -3 ~ "3",
          BTOXGR == -4 ~ "4",
          BTOXGR == "<Missing>" ~ "Missing"
        ),
        levels = if (gr_missing == "incl" & any(BTOXGR == "<Missing>")) {
          c("Not Low", "1", "2", "3", "4", "Missing")
        } else {
          c("Not Low", "1", "2", "3", "4")
        }
      ),
    ) %>%
    dm_update_zoomed()
}

#' @describeIn lbt14_1 Checks
#'
#' @inheritParams gen_args
#' @param ... not used.
#'
lbt14_1_check <- function(adam_db,
                          req_tables = c("adsl", "adlb"),
                          arm_var = "ACTARM",
                          ...) {
  assert_all_tablenames(adam_db, req_tables)

  msg <- NULL

  adlb_layout_col <- c("USUBJID", "PARAM", "BTOXGR", "ATOXGR")
  adsl_layout_col <- c("USUBJID")

  msg <- c(msg, check_all_colnames(adam_db$adlb, c(arm_var, adlb_layout_col)))
  msg <- c(msg, check_all_colnames(adam_db$adsl, c(adsl_layout_col)))

  if (is.null(msg)) {
    TRUE
  } else {
    stop(paste(msg, collapse = "\n  "))
  }
}

#' @describeIn lbt14_1 Postprocessing
#'
#' @inheritParams gen_args
#' @param ... not used.
#'
#' @export
#'
lbt14_1_post <- function(tlg, prune_0 = TRUE, ...) {
  if (prune_0) tlg <- tlg %>% trim_rows()
  std_postprocess(tlg)
}

#' `LBT14` Table 1 (Low Direction) Laboratory Test Results Shift Table – Highest NCI-CTCAE Grade Post-Baseline by
#' Baseline Grade.
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' run(lbt14_1, syn_data)
lbt14_1 <- chevron_t(
  main = lbt14_1_main,
  preprocess = lbt14_1_pre,
  postprocess = lbt14_1_post,
  adam_datasets = c("adsl", "adlb")
)

# lbt14_2 ----

#' @describeIn lbt14_2 Main TLG function
#'
#' @inheritParams gen_args
#' @param gr_missing how missing baseline grades should be handled. Defaults to `"incl"` to include the `"Missing"`
#' level. Other options are `"excl"` to exclude patients with missing baseline grades and `"gr_0"` to convert missing
#' baseline grades to grade 0.
#' @param title table title to display. Defaults to `"LBT14 - High Direction"`.
#'
#' @details
#'  * Only the worst grade recorded for each patient is included in the table.
#'  * If no missing baseline lab results, the "Missing" level of `BTOXGR` is excluded.
#'  * Grades 0, -1, -2, -3, and -4 are counted as `"Not High"`.
#'  * Remove zero-count rows unless overridden with `prune_0 = FALSE`.
#'  * Split columns by arm, typically `ACTARM`.
#'
#' @note
#'   * `adam_db` object must contain an `adlb` table with columns `"USUBJID"`, `"PARAM"`, `"BTOXGR"`, `"ATOXGR"`,
#'   and the column specified by `arm_var`.
#'
#' @export
#'
lbt14_2_main <- function(adam_db,
                         arm_var = "ACTARM",
                         gr_missing = "incl",
                         title = "LBT14 - High Direction",
                         deco = std_deco("LBT14"),
                         ...) {
  lyt <- lbt14_2_lyt(
    arm_var = arm_var,
    gr_missing = gr_missing,
    title = title,
    deco = deco,
    ... = ...
  )

  tbl <- build_table(lyt, adam_db$adlb, alt_counts_df = adam_db$adsl)

  tbl
}

#' @describeIn lbt14_2 Layout
#'
#' @inheritParams lbt14_2_main
#' @param ... not used.
#'
#' @export
#'
lbt14_2_lyt <- function(arm_var,
                        gr_missing,
                        title,
                        deco,
                        ...) {
  deco$title <- title
  if (gr_missing == "excl") {
    deco$main_footer <- "Patients with missing baseline values are excluded from the analysis."
  } else if (gr_missing == "gr_0") {
    deco$main_footer <- "Patients with missing baseline values are assumed to be Grade 0 at baseline."
  }

  lyt <- basic_table_deco(deco, show_colcounts = TRUE) %>%
    split_cols_by(arm_var) %>%
    split_rows_by(
      "PARAM",
      split_fun = drop_split_levels,
      label_pos = "topleft",
      split_label = "Parameter"
    ) %>%
    split_rows_by(
      "BTOXGR_GRP",
      label_pos = "topleft",
      split_label = "    Baseline NCI-CTCAE Grade",
      indent_mod = 2L
    ) %>%
    summarize_num_patients(var = "USUBJID", .stats = c("unique_count"), unique_count_suffix = FALSE) %>%
    count_occurrences("ATOXGR_GRP", denom = "n", drop = FALSE, .indent_mods = 3L) %>%
    append_topleft("              Post-baseline NCI-CTCAE Grade")
}

#' @describeIn lbt14_2 Preprocessing
#'
#' @inheritParams gen_args
#' @inheritParams lbt14_2_main
#' @param ... not used.
#'
#' @export
#'
lbt14_2_pre <- function(adam_db,
                        gr_missing = "incl",
                        ...) {
  checkmate::assert_class(adam_db, "dm")
  checkmate::assert_choice(gr_missing, c("incl", "excl", "gr_0"))

  lbt14_2_check(adam_db, ...)

  new_format <- list(
    adlb = list(
      BTOXGR = list("<Missing>" = c("", NA, "<Missing>", "No Coding Available")),
      ATOXGR = list("<Missing>" = c("", NA, "<Missing>", "No Coding Available"))
    )
  )

  adam_db <- dunlin::apply_reformat(adam_db, new_format)

  if (gr_missing == "excl") {
    adam_db <- adam_db %>%
      dm_zoom_to("adlb") %>%
      filter(.data$BTOXGR != "<Missing>") %>%
      dm_update_zoomed()
  } else if (gr_missing == "gr_0") {
    adam_db <- adam_db %>%
      dm_zoom_to("adlb") %>%
      mutate(BTOXGR = if (all(adam_db$adlb$BTOXGR == "<Missing>")) factor(BTOXGR, levels = c("0", "<Missing>"))
             else BTOXGR) %>%
      mutate(BTOXGR = forcats::fct_collapse(BTOXGR, "0" = c("0", "<Missing>"))) %>%
      dm_update_zoomed()
  }

  adam_db %>%
    dm_zoom_to("adlb") %>%
    filter(.data$WGRHIFL == "Y") %>%
    dm_update_zoomed() %>%
    dm_zoom_to("adlb") %>%
    mutate(
      ATOXGR_GRP = factor(
        case_when(
          ATOXGR %in% c(0, -1, -2, -3, -4) ~ "Not High",
          ATOXGR == 1 ~ "1",
          ATOXGR == 2 ~ "2",
          ATOXGR == 3 ~ "3",
          ATOXGR == 4 ~ "4",
          ATOXGR == "<Missing>" ~ "Missing"
        ),
        levels = c("Not High", "1", "2", "3", "4", "Missing")
      ),
      BTOXGR_GRP = factor(
        case_when(
          BTOXGR %in% c(0, -1, -2, -3, -4) ~ "Not High",
          BTOXGR == 1 ~ "1",
          BTOXGR == 2 ~ "2",
          BTOXGR == 3 ~ "3",
          BTOXGR == 4 ~ "4",
          BTOXGR == "<Missing>" ~ "Missing"
        ),
        levels = if (gr_missing == "incl" & any(BTOXGR == "<Missing>")) {
          c("Not High", "1", "2", "3", "4", "Missing")
        } else {
          c("Not High", "1", "2", "3", "4")
        }
      )
    ) %>%
    dm_update_zoomed()
}

#' @describeIn lbt14_2 Checks
#'
#' @inheritParams gen_args
#' @param ... not used.
#'
lbt14_2_check <- function(adam_db,
                          req_tables = c("adsl", "adlb"),
                          arm_var = "ACTARM",
                          ...) {
  assert_all_tablenames(adam_db, req_tables)

  msg <- NULL

  adlb_layout_col <- c("USUBJID", "PARAM", "BTOXGR", "ATOXGR")
  adsl_layout_col <- c("USUBJID")

  msg <- c(msg, check_all_colnames(adam_db$adlb, c(arm_var, adlb_layout_col)))
  msg <- c(msg, check_all_colnames(adam_db$adsl, c(adsl_layout_col)))

  if (is.null(msg)) {
    TRUE
  } else {
    stop(paste(msg, collapse = "\n  "))
  }
}

#' @describeIn lbt14_2 Postprocessing
#'
#' @inheritParams gen_args
#' @param ... not used.
#'
#' @export
#'
lbt14_2_post <- function(tlg, prune_0 = TRUE, ...) {
  if (prune_0) tlg <- tlg %>% trim_rows()
  std_postprocess(tlg)
}

#' `LBT14` Table 2 (High Direction) Laboratory Test Results Shift Table – Highest NCI-CTCAE Grade Post-Baseline by
#' Baseline Grade.
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' run(lbt14_2, syn_data)
lbt14_2 <- chevron_t(
  main = lbt14_2_main,
  preprocess = lbt14_2_pre,
  postprocess = lbt14_2_post,
  adam_datasets = c("adlb")
)
