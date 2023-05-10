# cmt01a ----

#' @describeIn cmt01a Main TLG function
#'
#' @inheritParams gen_args
#' @param incl_n_treatment (`flag`) include total number of treatments per medication.
#' @param medcat_var (`string`) the variable defining the medication category. By default `ATC2`.
#' @param lbl_medcat_var (`string`) label for the variable defining the medication category.
#' @param medname_var (`string`) the variable defining the medication name. By default `CMDECOD`.
#' @param lbl_medname_var (`string`) label for the variable defining the medication name.
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
#'  * `adam_db` object must contain an `adcm` table with the columns specified in `medcat_var` and `medname_var` as well
#'  as `"CMSEQ"`.
#'
#' @export
#'
cmt01a_main <- function(adam_db,
                        arm_var = "ARM",
                        incl_n_treatment = TRUE,
                        medcat_var = "ATC2",
                        lbl_medcat_var = "ATC Class Level 2",
                        medname_var = "CMDECOD",
                        lbl_medname_var = "Other Treatment",
                        lbl_overall = NULL,
                        ...) {
  checkmate::assert_string(arm_var)
  checkmate::assert_flag(incl_n_treatment)
  checkmate::assert_string(medcat_var)
  checkmate::assert_string(lbl_medcat_var)
  checkmate::assert_string(medname_var)
  checkmate::assert_string(lbl_medname_var)
  assert_colnames(adam_db$adcm, c(medcat_var, medname_var, "CMSEQ"))
  assert_valid_var_pair(
    adam_db$adsl[[arm_var]],
    adam_db$adcm[[arm_var]],
    sprintf("adsl.%s", arm_var),
    sprintf("adcm.%s", arm_var)
  )

  dbsel <- get_db_data(adam_db, "adsl", "adcm")

  lyt <- cmt01a_lyt(
    arm_var = arm_var,
    incl_n_treatment = incl_n_treatment,
    lbl_overall = lbl_overall,
    medcat_var = medcat_var,
    lbl_medcat_var = lbl_medcat_var,
    medname_var = medname_var,
    lbl_medname_var = lbl_medname_varo
  )

  tbl <- build_table(lyt, dbsel$adcm, alt_counts_df = dbsel$adsl)

  tbl
}

#' @describeIn cmt01a Layout
#'
#' @inheritParams gen_args
#' @inheritParams cmt01a_main
#'
#' @export
#'
cmt01a_lyt <- function(arm_var,
                       lbl_overall,
                       incl_n_treatment = TRUE,
                       medcat_var,
                       lbl_medcat_var,
                       medname_var,
                       lbl_medname_var) {
  if (incl_n_treatment) {
    stats <- c("unique", "nonunique")
    labels <- c(
      unique = "Total number of patients with at least one treatment",
      nonunique = "Total number of treatments"
    )
  }


  basic_table() %>%
    split_cols_by(var = arm_var) %>%
    add_colcounts() %>%
    ifneeded_add_overall_col(lbl_overall) %>%
    summarize_num_patients(
      var = "USUBJID",
      count_by = "CMSEQ",
      .stats = c("unique", "nonunique"),
      .labels = c(
        unique = "Total number of patients with at least one treatment",
        nonunique = "Total number of treatments"
      )
    ) %>%
    split_rows_by(
      medcat_var,
      child_labels = "visible",
      nested = FALSE,
      indent_mod = -1L,
      split_fun = drop_split_levels,
      label_pos = "topleft",
      split_label = lbl_medcat_var
    ) %>%
    summarize_num_patients(
      var = "USUBJID",
      count_by = "CMSEQ",
      .stats = stats,
      .labels = labels
    ) %>%
    count_occurrences(
      vars = medname_var,
      .indent_mods = -1L
    ) %>%
    append_topleft(paste0("  ", lbl_medname_var))
}

#' @describeIn cmt01a Preprocessing
#'
#' @inheritParams cmt01a_main
#'
#' @export
#'
cmt01a_pre <- function(adam_db, ...) {
  assert_all_tablenames(adam_db, c("adsl", "adcm"))

  adam_db$adcm <- adam_db$adcm %>%
    filter(.data$ANL01FL == "Y") %>%
    mutate(CMSEQ = as.character(.data$CMSEQ))

  adam_db$adcm <- adam_db$adcm %>%
    mutate(
      ATC2 = with_label(.data$ATC2, "ATC Class Level 2"),
      CMDECOD = with_label(.data$CMDECOD, "Other Treatment")
    )

  fmt_ls <- list(
    ATC2 = rule(
      "No Coding available" = c("", NA)
    ),
    CMDECOD = rule(
      "No Coding available" = c("", NA)
    ),
    CMSEQ = rule()
  )

  new_format <- list(adcm = fmt_ls)

  reformat(adam_db, new_format, na_last = TRUE)
}

#' @describeIn cmt01a Postprocessing
#'
#' @inheritParams cmt01a_main
#' @inheritParams gen_args
#' @param sort_by_freq (`flag`) whether to sort medication class by frequency.
#'
#' @export
#'
cmt01a_post <- function(tlg, prune_0 = TRUE, sort_by_freq = FALSE, medcat_var = "ATC2", medname_var = "CMDECOD", ...) {
  if (prune_0) {
    tlg <- smart_prune(tlg)
  }

  if (sort_by_freq) {
    tlg <- tlg %>%
      sort_at_path(
        medcat_var,
        scorefun = cont_n_onecol(ncol(tlg))
      )
  }

  tbl_sorted <- tlg %>%
    sort_at_path(
      path = c(medcat_var, "*", medname_var),
      scorefun = score_occurrences
    )

  std_postprocess(tbl_sorted)
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
  postprocess = cmt01a_post,
  adam_datasets = c("adsl", "adcm")
)
