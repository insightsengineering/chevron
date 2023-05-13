# cmt02_pt ----

#' @describeIn cmt02_pt Main TLG function
#'
#' @inheritParams gen_args
#' @param medname_var (`string`) variable name medication term.
#' @details
#'  * Data should be filtered for concomitant medication. `(ATIREL == "CONCOMITANT")`.
#'  * Order by decreasing total number of patients with the specific medication.
#'  * Does not include a total column by default.
#'
#' @note
#'  * `adam_db` object must contain an `adcm` table with the columns `"CMDECOD"` and `"CMSEQ"`.
#'
#' @export
#'
cmt02_pt_main <- function(adam_db,
                          arm_var = "ARM",
                          lbl_overall = NULL,
                          medname_var = "CMDECOD",
                          ...) {
  assert_all_tablenames(adam_db, "adsl", "adcm")
  checkmate::assert_string(arm_var)
  checkmate::assert_string(medname_var)
  assert_valid_variable(adam_db$adcm, c(arm_var, medname_var), types = list(c("character", "factor")))
  assert_valid_variable(adam_db$adsl, c("USUBJID", arm_var), types = list(c("character", "factor")))
  assert_valid_variable(adam_db$adcm, c("USUBJID", "CMSEQ"), empty_ok = TRUE, types = list(c("character", "factor")))
  assert_valid_var_pair(adam_db$adsl, adam_db$adcm, arm_var)
  medname_lbl <- var_labels_for(adam_db$adcm, medname_var)

  lyt <- cmt02_pt_lyt(
    arm_var = arm_var,
    lbl_overall = lbl_overall,
    medname_var = medname_var,
    medname_lbl = medname_lbl
  )

  tbl <- build_table(lyt, adam_db$adcm, alt_counts_df = adam_db$adsl)

  tbl
}

#' cmt02_pt Layout
#'
#' @inheritParams gen_args
#'
#' @keywords internal
#'
cmt02_pt_lyt <- function(arm_var,
                         lbl_overall,
                         medname_var,
                         medname_lbl) {
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
    count_occurrences(vars = medname_var, .indent_mods = -1L, drop = FALSE) %>%
    append_topleft(medname_lbl)
}

#' @describeIn cmt02_pt Preprocessing
#'
#' @inheritParams gen_args
#'
#' @export
#'
cmt02_pt_pre <- function(adam_db, ...) {
  adam_db$adcm <- adam_db$adcm %>%
    filter(.data$ANL01FL == "Y") %>%
    mutate(
      CMDECOD = reformat(.data$CMDECOD, nocoding),
      CMSEQ = as.character(.data$CMSEQ)
    )
  adam_db
}

#' @describeIn cmt02_pt Postprocessing
#'
#' @inheritParams gen_args
#'
#' @export
#'
cmt02_pt_post <- function(tlg, medname_var = "CMDECOD", prune_0 = TRUE, ...) {
  tlg <- tlg %>%
    tlg_sort_by_var(
      var = medname_var,
      scorefun = score_occurrences
    )
  if (prune_0) {
    tlg <- smart_prune(tlg)
  }
  std_postprocess(tlg)
}

#' `CMT02_PT` Table 1 (Default) Concomitant Medications by Preferred Name.
#'
#' A concomitant medication table with the
#' number of subjects and the total number of treatments by medication name sorted by frequencies.
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' run(cmt02_pt, syn_data)
cmt02_pt <- chevron_t(
  main = cmt02_pt_main,
  lyt = cmt02_pt_lyt,
  preprocess = cmt02_pt_pre,
  postprocess = cmt02_pt_post,
  adam_datasets = c("adsl", "adcm")
)
