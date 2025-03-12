# cmt01a ----

#' @describeIn cmt01a Default labels
#' @export
#'
cmt01_label <- c(
  unique = "Total number of {patient_label} with at least one treatment",
  nonunique = "Total number of treatments"
)

#' @describeIn cmt01a Main TLG function
#'
#' @inheritParams gen_args
#' @param row_split_var (`character`) the variable defining the medication category. By default `ATC2`.
#' @param medname_var (`string`) variable name of medical treatment name.
#' @param summary_labels (`list`) of summarize labels. See details.
#' @returns the main function returns an `rtables` object.
#'
#' @details
#'  * Data should be filtered for concomitant medication. `(ATIREL == "CONCOMITANT")`.
#'  * Numbers represent absolute numbers of subjects and fraction of `N`, or absolute numbers when specified.
#'  * Remove zero-count rows unless overridden with `prune_0 = FALSE`.
#'  * Split columns by arm.
#'  * Does not include a total column by default.
#'  * Sort by medication class alphabetically and within medication class by decreasing total number of patients with
#'  the specific medication.
#'  `summary_labels` is used to control the summary for each level. If "all" is used, then each split will have that
#'  summary statistic with the labels. One special case is "TOTAL", this is for the overall population.
#'
#' @note
#'  * `adam_db` object must contain an `adcm` table with the columns specified in `row_split_var` and `medname_var`
#' as well as `"CMSEQ"`.
#'
#' @export
#'
cmt01a_main <- function(adam_db,
                        arm_var = "ARM",
                        lbl_overall = NULL,
                        row_split_var = "ATC2",
                        medname_var = "CMDECOD",
                        summary_labels = setNames(
                          rep(list(cmt01_label), length(row_split_var) + 1L), c("TOTAL", row_split_var)
                        ),
                        ...) {
  assert_all_tablenames(adam_db, "adsl", "adcm")
  assert_string(arm_var)
  assert_string(lbl_overall, null.ok = TRUE)
  assert_character(row_split_var, null.ok = TRUE)
  assert_list(summary_labels)
  assert_subset(names(summary_labels), c("all", "TOTAL", row_split_var))
  assert_subset(
    unique(unlist(lapply(summary_labels, names))),
    c("unique", "nonunique", "unique_count")
  )
  summary_labels <- expand_list(summary_labels, c("TOTAL", row_split_var))
  assert_valid_variable(adam_db$adcm, c(arm_var, row_split_var, medname_var), types = list(c("character", "factor")))
  assert_valid_variable(adam_db$adsl, c("USUBJID", arm_var), types = list(c("character", "factor")))
  assert_valid_variable(adam_db$adcm, c("USUBJID", "CMSEQ"), empty_ok = TRUE, types = list(c("character", "factor")))
  assert_valid_var_pair(adam_db$adsl, adam_db$adcm, arm_var)

  lbl_overall <- render_safe(lbl_overall)
  lbl_row_split <- var_labels_for(adam_db$adcm, row_split_var)
  lbl_medname_var <- var_labels_for(adam_db$adcm, medname_var)

  lyt <- occurrence_lyt(
    arm_var = arm_var,
    lbl_overall = lbl_overall,
    row_split_var = row_split_var,
    lbl_row_split = lbl_row_split,
    medname_var = medname_var,
    lbl_medname_var = lbl_medname_var,
    summary_labels = summary_labels,
    count_by = "CMSEQ"
  )

  tbl <- build_table(lyt, adam_db$adcm, alt_counts_df = adam_db$adsl)

  tbl
}

#' @describeIn cmt01a Preprocessing
#'
#' @inheritParams cmt01a_main
#' @returns the preprocessing function returns a `list` of `data.frame`.
#' @export
#'
cmt01a_pre <- function(adam_db, ...) {
  adam_db$adcm <- adam_db$adcm %>%
    filter(.data$ANL01FL == "Y") %>%
    mutate(
      CMDECOD = with_label(reformat(.data$CMDECOD, nocoding), "Other Treatment"),
      ATC2 = reformat(.data$ATC2, nocoding),
      CMSEQ = as.character(.data$CMSEQ)
    )
  adam_db
}

#' @describeIn cmt01a Postprocessing
#'
#' @inheritParams cmt01a_main
#' @inheritParams gen_args
#' @param sort_by_freq (`flag`) whether to sort medication class by frequency.
#' @returns the postprocessing function returns an `rtables` object or an `ElementaryTable` (null report).
#' @export
#'
cmt01a_post <- function(
    tlg, prune_0 = TRUE,
    sort_by_freq = FALSE, row_split_var = "ATC2",
    medname_var = "CMDECOD", ...) {
  if (sort_by_freq) {
    tlg <- tlg %>%
      tlg_sort_by_var(
        var = row_split_var,
        scorefun = cont_n_allcols
      )
  }
  tlg <- tlg %>%
    tlg_sort_by_var(
      var = c(row_split_var, medname_var),
      scorefun = score_occurrences
    )
  if (prune_0) {
    tlg <- smart_prune(tlg)
  }
  std_postprocessing(tlg)
}

#' `CMT01A` Concomitant Medication by Medication Class and Preferred Name.
#'
#' A concomitant medication
#' table with the number of subjects and the total number of treatments by medication class.
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' library(dplyr)
#'
#' proc_data <- syn_data
#' proc_data$adcm <- proc_data$adcm %>%
#'   filter(ATIREL == "CONCOMITANT")
#'
#' run(cmt01a, proc_data)
cmt01a <- chevron_t(
  main = cmt01a_main,
  preprocess = cmt01a_pre,
  postprocess = cmt01a_post,
  dataset = c("adsl", "adcm")
)
