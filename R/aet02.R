# aet02 ----

#' @describeIn aet02 Main TLG function
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
#'  * Missing values in `AEBODSYS`, and `AEDECOD` are labeled by `No Coding Available`.
#'
#' @note
#'  * `adam_db` object must contain an `adae` table with the columns `"AEBODSYS"` and `"AEDECOD"`.
#'
#'
#' @export
#'
aet02_main <- function(adam_db,
                       arm_var = "ACTARM",
                       row_split_var = "AEBODSYS",
                       lbl_overall = NULL,
                       ...) {
  assert_all_tablenames(adam_db, "adsl", "adae")
  checkmate::assert_character(row_split_var, null.ok = TRUE)
  checkmate::assert_string(lbl_overall, null.ok = TRUE)
  checkmate::assert_string(arm_var)
  assert_valid_variable(adam_db$adsl, c("USUBJID", arm_var), types = list(c("character", "factor")))
  assert_valid_variable(adam_db$adae, c(arm_var, row_split_var, "AEDECOD"), types = list(c("character", "factor")))
  assert_valid_variable(adam_db$adae, "USUBJID", empty_ok = TRUE, types = list(c("character", "factor")))
  assert_valid_var_pair(adam_db$adsl, adam_db$adae, arm_var)

  lbl_row_split <- var_labels_for(adam_db$adae, row_split_var)
  lbl_aedecod <- var_labels_for(adam_db$adae, "AEDECOD")
  lbl_overall <- render_safe(lbl_overall)
  lyt <- aet02_lyt(
    arm_var = arm_var,
    lbl_overall = lbl_overall,
    row_split_var = row_split_var,
    lbl_row_split = lbl_row_split,
    lbl_aedecod = lbl_aedecod
  )

  tbl <- build_table(lyt, adam_db$adae, alt_counts_df = adam_db$adsl)

  tbl
}

#' `aet02` Layout
#'
#' @inheritParams aet02_main
#' @param lbl_row_split (`character`) label for `row_split_var`.
#' @param lbl_aedecod (`string`) text label for `AEDECOD`.
#'
#' @keywords internal
#'
aet02_lyt <- function(arm_var,
                      lbl_overall,
                      row_split_var,
                      lbl_row_split,
                      lbl_aedecod) {
  lyt <- basic_table(show_colcounts = TRUE) %>%
    split_cols_by(var = arm_var) %>%
    ifneeded_add_overall_col(lbl_overall) %>%
    analyze_num_patients(
      vars = "USUBJID",
      .stats = c("unique", "nonunique"),
      show_labels = "hidden",
      .labels = c(
        unique = render_safe("Total number of {patient_label} with at least one adverse event"),
        nonunique = "Overall total number of events"
      )
    )
  for (k in seq_len(length(row_split_var))) {
    lyt <- split_and_summ_num_patients(lyt, row_split_var[k], lbl_row_split[k],
      stats = c("unique", "nonunique"),
      summarize_labels = render_safe(
        c("Total number of {patient_label} with at least one adverse event", "Total number of events")
      )
    )
  }
  lyt %>%
    count_occurrences(
      vars = "AEDECOD",
      drop = length(row_split_var) > 0,
      .indent_mods = -1L
    ) %>%
    append_topleft(paste0(stringr::str_dup(" ", 2 * length(row_split_var)), lbl_aedecod))
}

#' @describeIn aet02 Preprocessing
#'
#' @inheritParams gen_args
#'
#' @export
#'
aet02_pre <- function(adam_db, row_split_var = "AEBODSYS", ...) {
  adam_db$adae <- adam_db$adae %>%
    filter(.data$ANL01FL == "Y") %>%
    mutate(AEDECOD = reformat(.data$AEDECOD, nocoding)) %>%
    mutate(across(all_of(row_split_var), ~ reformat(.x, nocoding)))

  adam_db
}

#' @describeIn aet02 Postprocessing
#'
#' @inheritParams gen_args
#'
#' @export
#'
aet02_post <- function(tlg, row_split_var = "AEBODSYS", prune_0 = TRUE, ...) {
  tlg <- tlg %>%
    tlg_sort_by_vars(row_split_var, cont_n_allcols) %>%
    valid_sort_at_path(
      path = c(get_sort_path(c(row_split_var, "AEDECOD"))),
      scorefun = score_occurrences
    )
  if (prune_0) {
    tlg <- smart_prune(tlg)
  }
  std_postprocess(tlg)
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
#' run(aet02, syn_data)
aet02 <- chevron_t(
  main = aet02_main,
  preprocess = aet02_pre,
  postprocess = aet02_post
)
