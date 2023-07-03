# cmt01a ----

#' @describeIn cmt01a Main TLG function
#'
#' @inheritParams gen_args
#' @param incl_n_treatment (`flag`) include total number of treatments per medication.
#' @param row_split_var (`character`) the variable defining the medication category. By default `ATC2`.
#' @param medname_var (`string`) variable name of medical treatment name.
#'
#' @details
#'  * Data should be filtered for concomitant medication. `(ATIREL == "CONCOMITANT")`.
#'  * Numbers represent absolute numbers of subjects and fraction of `N`, or absolute numbers when specified.
#'  * Remove zero-count rows unless overridden with `prune_0 = FALSE`.
#'  * Split columns by arm.
#'  * Does not include a total column by default.
#'  * Sort by medication class alphabetically and within medication class by decreasing total number of patients with
#'  the specific medication.
#'
#' @note
#'  * `adam_db` object must contain an `adcm` table with the columns specified in `row_split_var` and `medname_var`
#' as well as `"CMSEQ"`.
#'
#' @export
#'
cmt01a_main <- function(adam_db,
                        arm_var = "ARM",
                        incl_n_treatment = TRUE,
                        row_split_var = "ATC2",
                        medname_var = "CMDECOD",
                        lbl_overall = NULL,
                        ...) {
  assert_all_tablenames(adam_db, "adsl", "adcm")
  checkmate::assert_string(arm_var)
  checkmate::assert_flag(incl_n_treatment)
  checkmate::assert_character(row_split_var, null.ok = TRUE)
  assert_valid_variable(adam_db$adcm, c(arm_var, row_split_var, medname_var), types = list(c("character", "factor")))
  assert_valid_variable(adam_db$adsl, c("USUBJID", arm_var), types = list(c("character", "factor")))
  assert_valid_variable(adam_db$adcm, c("USUBJID", "CMSEQ"), empty_ok = TRUE, types = list(c("character", "factor")))
  assert_valid_var_pair(adam_db$adsl, adam_db$adcm, arm_var)

  lbl_row_split <- var_labels_for(adam_db$adcm, row_split_var)
  lbl_medname_var <- var_labels_for(adam_db$adcm, medname_var)

  lyt <- cmt01a_lyt(
    arm_var = arm_var,
    incl_n_treatment = incl_n_treatment,
    lbl_overall = lbl_overall,
    row_split_var = row_split_var,
    lbl_row_split = lbl_row_split,
    medname_var = medname_var,
    lbl_medname_var = lbl_medname_var
  )

  tbl <- build_table(lyt, adam_db$adcm, alt_counts_df = adam_db$adsl)

  tbl
}

#' `cmt01a` Layout
#'
#' @inheritParams gen_args
#' @inheritParams cmt01a_main
#' @param lbl_medname_var (`string`) label for the variable defining the medication name.
#' @keywords internal
#'
cmt01a_lyt <- function(arm_var,
                       lbl_overall,
                       incl_n_treatment = TRUE,
                       row_split_var,
                       lbl_row_split,
                       medname_var,
                       lbl_medname_var) {
  if (incl_n_treatment) {
    stats <- c("unique", "nonunique")
    labels <- c(
      render_safe("Total number of {patient_label} with at least one treatment"),
      "Total number of treatments"
    )
  } else {
    stats <- c("unique")
    labels <- c(
      render_safe("Total number of {patient_label} with at least one treatment")
    )
  }
  lyt <- basic_table() %>%
    split_cols_by(var = arm_var) %>%
    add_colcounts() %>%
    ifneeded_add_overall_col(lbl_overall) %>%
    analyze_num_patients(
      vars = "USUBJID",
      count_by = "CMSEQ",
      .stats = c("unique", "nonunique"),
      show_labels = "hidden",
      .labels = c(
        unique = render_safe("Total number of {patient_label} with at least one treatment"),
        nonunique = "Total number of treatments"
      )
    )
  for (k in seq_len(length(row_split_var))) {
    lyt <- split_and_summ_num_patients(lyt, row_split_var[k], lbl_row_split[k], stats, labels, count_by = "CMSEQ")
  }
  lyt %>%
    count_occurrences(
      vars = medname_var,
      drop = length(row_split_var) > 0,
      .indent_mods = -1L
    ) %>%
    append_topleft(paste0(stringr::str_dup(" ", 2 * length(row_split_var)), lbl_medname_var))
}

#' @describeIn cmt01a Preprocessing
#'
#' @inheritParams cmt01a_main
#'
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
#'
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
  std_postprocess(tlg)
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
  lyt = cmt01a_lyt,
  preprocess = cmt01a_pre,
  postprocess = cmt01a_post
)
