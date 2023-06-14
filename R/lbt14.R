# lbt14 ----

#' @describeIn lbt14 Main TLG function
#'
#' @inheritParams gen_args
#' @param gr_missing (`string`) how missing baseline grades should be handled. Defaults to `"incl"` to include the
#'   `"Missing"`
#' level. Other options are `"excl"` to exclude patients with missing baseline grades and `"gr_0"` to convert missing
#' baseline grades to grade 0.
#' @param direction (`string`) one of `"high"` or `"low"` indicating which shift direction should be detailed.
#'
#' @details
#'  * Only the worst grade recorded for each patient is included in the table.
#'  * If no missing baseline lab results, the "Missing" level of `BTOXGR` is excluded.
#'  * Grades 0, 1, 2, 3, and 4 are counted as `"Not Low"` when `direction = "low"`. Conversely, when `direction =
#'  "high"`, Grades 0, -1, -2, -3, and -4 are counted as `"Not High".
#'  * Remove zero-count rows unless overridden with `prune_0 = FALSE`.
#'  * Split columns by arm, typically `ACTARM`.
#'
#' @note
#'   * `adam_db` object must contain an `adlb` table with columns `"USUBJID"`, `"PARAM"`, `"BTOXGR"`, `"ATOXGR"`,
#'   and the column specified by `arm_var`.
#'
#' @export
#'
lbt14_main <- function(adam_db,
                       arm_var = "ACTARM",
                       gr_missing = "incl",
                       ...) {
  assert_all_tablenames(adam_db, c("adsl", "adlb"))
  checkmate::assert_string(arm_var)
  checkmate::assert_choice(gr_missing, c("incl", "excl", "gr_0"))
  assert_valid_variable(adam_db$adlb, c("ATOXGR", "BTOXGR"), types = list("factor"), na_ok = TRUE)
  assert_valid_variable(adam_db$adlb, c("PARAM"), types = list(c("character", "factor")), na_ok = FALSE)
  assert_valid_variable(adam_db$adlb, c("USUBJID"), types = list(c("character", "factor")), empty_ok = TRUE)
  assert_valid_variable(adam_db$adsl, c("USUBJID"), types = list(c("character", "factor")))
  assert_valid_var_pair(adam_db$adsl, adam_db$adlb, arm_var)

  lyt <- lbt14_lyt(
    arm_var = arm_var
  )

  tbl <- build_table(lyt, adam_db$adlb, alt_counts_df = adam_db$adsl)

  tbl
}

#' `lbt14` Layout
#'
#' @inheritParams lbt14_main
#'
#' @keywords internal
#'
lbt14_lyt <- function(arm_var) {
  basic_table(show_colcounts = TRUE) %>%
    split_cols_by(arm_var) %>%
    split_rows_by(
      "PARAM",
      split_fun = drop_split_levels,
      label_pos = "topleft",
      split_label = "Parameter"
    ) %>%
    split_rows_by(
      "BTOXGR",
      label_pos = "topleft",
      split_label = "    Baseline NCI-CTCAE Grade",
      indent_mod = 2L
    ) %>%
    summarize_num_patients(var = "USUBJID", .stats = c("unique_count"), unique_count_suffix = FALSE) %>%
    count_occurrences_by_grade("ATOXGR", denom = "n", drop = FALSE, .indent_mods = 3L) %>%
    append_topleft("              Post-baseline NCI-CTCAE Grade")
}

#' @describeIn lbt14 Preprocessing
#'
#' @inheritParams gen_args
#' @inheritParams lbt14_main
#'
#' @export
#'
lbt14_pre <- function(adam_db,
                      gr_missing = "incl",
                      direction = "low",
                      ...) {
  checkmate::assert_choice(gr_missing, c("incl", "excl", "gr_0"))
  checkmate::assert_choice(direction, c("low", "high"))
  if (direction == "high") {
    adam_db$adlb <- adam_db$adlb %>%
      filter(.data$WGRHIFL == "Y") %>%
      h_adsl_adlb_merge_using_worst_flag(
        adsl = adam_db$adsl,
        worst_flag = c("WGRHIFL" = "Y")
      )
  } else {
    adam_db$adlb <- adam_db$adlb %>%
      filter(.data$WGRLOFL == "Y") %>%
      h_adsl_adlb_merge_using_worst_flag(
        adsl = adam_db$adsl,
        worst_flag = c("WGRLOFL" = "Y")
      )
  }
  adam_db$adlb <- adam_db$adlb %>%
    mutate(
      across(all_of(c("BTOXGR", "ATOXGR")), ~ forcats::fct_na_level_to_value(.x, "<Missing>"))
    )

  grade_rule <- get_grade_rule(direction, gr_missing)
  adam_db$adlb <- adam_db$adlb %>%
    mutate(
      across(all_of(c("BTOXGR", "ATOXGR")), ~ reformat(.x, grade_rule))
    )
  adam_db
}

#' @describeIn lbt14 Postprocessing
#'
#' @inheritParams gen_args
#'
#' @export
#'
lbt14_post <- function(tlg, prune_0 = TRUE, ...) {
  if (prune_0) tlg <- tlg %>% trim_rows()
  std_postprocess(tlg)
}

#' `LBT14` Laboratory Test Results Shift Table – Highest `NCI-CTCAE` Grade Post-Baseline by
#' Baseline Grade (Low or High Direction).
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' run(lbt14, syn_data)
lbt14 <- chevron_t(
  main = lbt14_main,
  preprocess = lbt14_pre,
  postprocess = lbt14_post,
  adam_datasets = c("adsl", "adlb")
)
