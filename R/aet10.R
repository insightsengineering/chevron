# aet10 ----

#' @describeIn aet10 Main TLG function
#'
#' @inheritParams gen_args
#' @param row_split_var (`character`) row split variables.
#'
#' @details
#'  * Numbers represent absolute numbers of subject and fraction of `N`, or absolute number of event when specified.
#'  * Remove zero-count rows unless overridden with `prune_0 = FALSE`.
#'  * Split columns by arm.
#'  * Does not include a total column by default.
#'  * Sort Dictionary-Derived Code (`AEDECOD`) by highest overall frequencies.
#'  * Missing values in `AEDECOD` are labeled by `No Coding available`.
#'
#' @note
#'  * `adam_db` object must contain an `adae` table with the columns `"AEDECOD"`.
#'
#' @export
#'
aet10_main <- function(adam_db,
                       arm_var = "ACTARM",
                       row_split_var = NULL,
                       lbl_overall = NULL,
                       ...) {
  assert_all_tablenames(adam_db, "adsl", "adae")
  checkmate::assert_string(lbl_overall, null.ok = TRUE)
  checkmate::assert_string(arm_var)
  checkmate::assert_character(row_split_var, null.ok = TRUE)
  assert_valid_variable(adam_db$adsl, c("USUBJID", arm_var), types = list(c("character", "factor")))
  assert_valid_variable(adam_db$adae, c(arm_var, row_split_var, "AEDECOD"), types = list(c("character", "factor")))
  assert_valid_variable(adam_db$adae, "USUBJID", empty_ok = TRUE, types = list(c("character", "factor")))
  assert_valid_var_pair(adam_db$adsl, adam_db$adae, arm_var)

  lbl_aedecod <- var_labels_for(adam_db$adae, "AEDECOD")
  lbl_row_split <- var_labels_for(adam_db$adae, row_split_var)

  lyt <- aet10_lyt(
    arm_var = arm_var,
    lbl_overall = lbl_overall,
    lbl_aedecod = lbl_aedecod,
    row_split_var = row_split_var,
    lbl_row_split = lbl_row_split
  )

  tbl <- build_table(lyt, adam_db$adae, alt_counts_df = adam_db$adsl)

  tbl
}

#' `aet10` Layout
#'
#' @inheritParams aet10_main
#' @param lbl_aedecod (`character`) text label for `AEDECOD`.
#' @param lbl_row_split (`character`) label for `row_split_var`.
#' @param lbl_aedecod (`string`) text label for `AEDECOD`.
#' 
#' @keywords internal
#'
aet10_lyt <- function(arm_var,
                      row_split_var,
                      lbl_row_split,
                      lbl_overall,
                      lbl_aedecod) {
  lyt <- basic_table(show_colcounts = TRUE) %>%
    split_cols_by(var = arm_var) %>%
    ifneeded_add_overall_col(lbl_overall)
  for (k in seq_len(length(row_split_var))) {
    lyt <- split_rows_by(
      lyt, var = row_split_var[k], split_label = lbl_row_split[k],
      split_fun = drop_split_levels
    )
  }
  lyt %>%
    count_occurrences(
      vars = "AEDECOD",
      .indent_mods = if (length(row_split_var) > 0) 0L else -1L
    ) %>%
    append_topleft(paste0("\n", lbl_aedecod))
}

#' @describeIn aet10 Preprocessing
#'
#' @inheritParams gen_args
#'
#' @export
#'
aet10_pre <- function(adam_db, ...) {
  adam_db$adae <- adam_db$adae %>%
    filter(.data$ANL01FL == "Y") %>%
    mutate(AEDECOD = reformat(.data$AEDECOD, nocoding))
  return(adam_db)
}

#' @describeIn aet10 Postprocessing
#'
#' @inheritParams aet10_main
#' @param atleast given cut-off in numeric format, default is `0.05`
#'
#' @export
#'
aet10_post <- function(tlg, atleast = 0.05, row_split_var = NULL, ...) {
  checkmate::assert_number(atleast, lower = 0, upper = 1)
  tbl_sorted <- tlg %>%
    valid_sort_at_path(
      path = c(get_sort_path(c(row_split_var, "AEDECOD"))),
      scorefun = score_occurrences
    )

  tlg_prune <- prune_table(
    tt = tbl_sorted,
    prune_func = keep_rows(
      has_fraction_in_any_col(
        atleast = atleast
      )
    )
  )

  std_postprocess(tlg_prune)
}

#' `AET10` Table 1 (Default) Most Common (xx%) Adverse Events Preferred Terms Table 1
#'
#' The `AET10` table Include Adverse Events occurring with user-specified threshold X% in at least
#'  one of the treatment groups. Standard table summarized by preferred term (PT).
#' Order the data by total column frequency from most to least frequently reported PT (regardless of SOC).
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' run(aet10, syn_data)
aet10 <- chevron_t(
  main = aet10_main,
  lyt = aet10_lyt,
  preprocess = aet10_pre,
  postprocess = aet10_post,
  adam_datasets = c("adsl", "adae")
)
