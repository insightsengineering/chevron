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
#'  * This table follows ADaMIG v1.1.
#'  * Only the worst grade recorded for each patient is included in the table.
#'  * If no missing baseline lab results, the "Missing" level of `BTOXGR` is excluded.
#'  * Grading takes value from -4 to 4, negative value means the abnormality direction is low,
#'  positive value means the abnormality direction is high.
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
                       page_var = "PARAMCD",
                       ...) {
  assert_all_tablenames(adam_db, c("adsl", "adlb"))
  assert_string(arm_var)
  assert_choice(gr_missing, c("incl", "excl", "gr_0"))
  assert_valid_variable(adam_db$adlb, c("ATOXGR", "BTOXGR"), types = list("factor"), na_ok = TRUE)
  assert_valid_variable(adam_db$adlb, c("PARAMCD", "PARAM"), types = list(c("character", "factor")), na_ok = FALSE)
  assert_valid_variable(adam_db$adlb, c("USUBJID"), types = list(c("character", "factor")), empty_ok = TRUE)
  assert_valid_variable(adam_db$adsl, c("USUBJID"), types = list(c("character", "factor")))
  assert_valid_var_pair(adam_db$adsl, adam_db$adlb, arm_var)
  assert_subset(page_var, "PARAMCD")

  lbl_param <- var_labels_for(adam_db$adlb, "PARAM")
  lbl_btoxgr <- var_labels_for(adam_db$adlb, "BTOXGR")
  lyt <- lbt14_lyt(
    arm_var = arm_var,
    page_var = page_var,
    lbl_param = lbl_param,
    lbl_btoxgr = lbl_btoxgr
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
lbt14_lyt <- function(arm_var, page_var, lbl_param, lbl_btoxgr) {
  page_by <- !is.null(page_var)
  label_pos <- ifelse(page_by, "hidden", "topleft")
  basic_table(show_colcounts = TRUE) %>%
    split_cols_by(arm_var) %>%
    split_rows_by(
      var = "PARAMCD",
      labels_var = "PARAM",
      split_fun = drop_split_levels,
      label_pos = label_pos,
      split_label = lbl_param,
      page_by = page_by
    ) %>%
    split_rows_by(
      "BTOXGR",
      label_pos = "topleft",
      split_label = lbl_btoxgr
    ) %>%
    summarize_num_patients(var = "USUBJID", .stats = c("unique_count"), unique_count_suffix = FALSE) %>%
    count_occurrences_by_grade("ATOXGR", denom = "n", drop = FALSE, .indent_mods = 3L) %>%
    append_topleft(paste0(stringr::str_dup(" ", 2L * (5L - page_by)), "Post-baseline NCI-CTCAE Grade"))
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
  assert_choice(gr_missing, c("incl", "excl", "gr_0"))
  assert_choice(direction, c("low", "high"))
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
  postprocess = lbt14_post
)
