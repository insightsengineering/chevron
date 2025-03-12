# aet02 ----

#' @describeIn aet02 Default labels
#' @export
#'
aet02_label <- c(
  unique = "Total number of {patient_label} with at least one adverse event",
  nonunique = "Total number of events"
)

#' @describeIn aet02 Main TLG function
#'
#' @inheritParams gen_args
#' @param summary_labels (`list`) of summarize labels. See details.
#' @returns the main function returns an `rtables` object.
#'
#' @details
#'  * Numbers represent absolute numbers of subject and fraction of `N`, or absolute number of event when specified.
#'  * Remove zero-count rows unless overridden with `prune_0 = FALSE`.
#'  * Split columns by arm.
#'  * Does not include a total column by default.
#'  * Sort Dictionary-Derived Code (`AEDECOD`) by highest overall frequencies.
#'  * Missing values in `AEBODSYS`, and `AEDECOD` are labeled by `No Coding Available`.
#'  `summary_labels` is used to control the summary for each level. If "all" is used, then each split will have that
#'  summary statistic with the labels. One special case is "TOTAL", this is for the overall population.
#'
#' @note
#'  * `adam_db` object must contain an `adae` table with the columns `"AEBODSYS"` and `"AEDECOD"`.
#'
#' @export
#'
aet02_main <- function(adam_db,
                       arm_var = "ACTARM",
                       row_split_var = "AEBODSYS",
                       lbl_overall = NULL,
                       summary_labels = list(
                         all = aet02_label,
                         TOTAL = c(nonunique = "Overall total number of events")
                       ),
                       ...) {
  assert_all_tablenames(adam_db, "adsl", "adae")
  assert_string(arm_var)
  assert_character(row_split_var, null.ok = TRUE)
  assert_string(lbl_overall, null.ok = TRUE)
  assert_valid_variable(adam_db$adsl, c("USUBJID", arm_var), types = list(c("character", "factor")))
  assert_valid_variable(adam_db$adae, c(arm_var, row_split_var, "AEDECOD"), types = list(c("character", "factor")))
  assert_valid_variable(adam_db$adae, "USUBJID", empty_ok = TRUE, types = list(c("character", "factor")))
  assert_valid_var_pair(adam_db$adsl, adam_db$adae, arm_var)
  assert_list(summary_labels, null.ok = TRUE)
  assert_subset(names(summary_labels), c("all", "TOTAL", row_split_var))
  assert_subset(
    unique(unlist(lapply(summary_labels, names))),
    c("unique", "nonunique", "unique_count")
  )
  summary_labels <- expand_list(summary_labels, c("TOTAL", row_split_var))

  lbl_overall <- render_safe(lbl_overall)
  lbl_row_split <- var_labels_for(adam_db$adae, row_split_var)
  lbl_aedecod <- var_labels_for(adam_db$adae, "AEDECOD")

  lyt <- occurrence_lyt(
    arm_var = arm_var,
    lbl_overall = lbl_overall,
    row_split_var = row_split_var,
    lbl_row_split = lbl_row_split,
    medname_var = "AEDECOD",
    lbl_medname_var = lbl_aedecod,
    summary_labels = summary_labels,
    count_by = NULL
  )

  tbl <- build_table(lyt, adam_db$adae, alt_counts_df = adam_db$adsl)

  tbl
}

#' @describeIn aet02 Preprocessing
#'
#' @inheritParams gen_args
#' @returns the preprocessing function returns a `list` of `data.frame`.
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
#' @returns the postprocessing function returns an `rtables` object or an `ElementaryTable` (null report).
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
  std_postprocessing(tlg)
}

#' `AET02` Table 1 (Default) Adverse Events by System Organ Class and Preferred Term Table 1.
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
  postprocess = aet02_post,
  dataset = c("adsl", "adae")
)
