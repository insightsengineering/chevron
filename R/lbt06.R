# lbt06 ----

#' @describeIn lbt06 Main TLG function
#'
#' @inheritParams gen_args
#' @param arm_var (`string`) the arm variable used for arm splitting.
#' @param paramcd (`string`) the variable for parameter code.
#' @param avisit_var (`string`) the variable for analysis visit.
#' @param anrind_var (`string`) the variable for analysis reference range indicator.
#' @param lbl_paramcd (`string`) text label of the `PARAMCD` variable.
#' @param lbl_avisit (`string`) text label of the `AVISIT` variable.
#' @param lbl_anrind (`string`) text label of the `ANRIND` variable.
#' @param lbl_bnrind (`string`) text label of the `BNRIND` variable.
#'
#' @details
#'  * Only count LOW or HIGH values.
#'  * Lab test results with missing `ANRIND` values are excluded.
#'  * Split columns by arm, typically `ACTARM`.
#'  * Keep zero count rows by default.
#'
#' @note
#'  * `adam_db` object must contain an `adlb` table with columns `"ACTARM"`, `"AVISIT"`,
#'  `"ANRIND"`, `"BNRIND"`, `"ONTRTFL"`, and `"PARCAT2"`.
#'
#' @export
#'
lbt06_main <- function(adam_db,
                       arm_var = "ACTARM",
                       paramcd = NULL,
                       avisit_var = "AVISIT",
                       anrind_var = "ANRIND",
                       lbl_paramcd = "Parameter",
                       lbl_avisit = "Visit",
                       lbl_anrind = "Abnormality at Visit",
                       lbl_bnrind = "Baseline Status",
                       deco = std_deco("LBT06"),
                       ...) {
  assert_all_tablenames(adam_db, "adsl", "adlb")

  checkmate::assert_string(arm_var)
  checkmate::assert_string(paramcd, null.ok = TRUE)
  checkmate::assert_string(avisit_var)
  checkmate::assert_string(anrind_var)

  lyt <- lbt06_lyt(
    arm_var = arm_var,
    paramcd = paramcd,
    avisit_var = avisit_var,
    anrind_var = anrind_var,
    lbl_paramcd = lbl_paramcd,
    lbl_avisit = lbl_avisit,
    lbl_anrind = lbl_anrind,
    lbl_bnrind = lbl_bnrind,
    deco = deco
  )

  tbl <- build_table(lyt, adam_db$adlb, alt_counts_df = adam_db$adsl)

  tbl
}

#' @describeIn lbt06 Layout
#'
#' @inheritParams gen_args
#'
#' @keywords internal
#'
lbt06_lyt <- function(arm_var,
                      paramcd,
                      avisit_var,
                      anrind_var,
                      lbl_paramcd,
                      lbl_avisit,
                      lbl_anrind,
                      lbl_bnrind,
                      deco) {
  basic_table_deco(deco, show_colcounts = TRUE) %>%
    split_cols_by(arm_var) %>%
    ifneeded_split_row(paramcd, lbl_paramcd) %>%
    split_rows_by(
      var = avisit_var,
      split_fun = drop_split_levels,
      label_pos = "topleft",
      split_label = paste(lbl_avisit)
    ) %>%
    count_abnormal_by_baseline(
      var = anrind_var,
      abnormal = c(Low = "LOW", High = "HIGH"),
      .indent_mods = 4L
    ) %>%
    append_topleft(paste("    ", lbl_anrind)) %>%
    append_topleft(paste("            ", lbl_bnrind))
}

#' @describeIn lbt06 Preprocessing
#'
#' @inheritParams gen_args
#'
#' @export
#'
lbt06_pre <- function(adam_db, ...) {
  new_format <- list(
    adlb = list(
      ANRIND = rule("<Missing>" = c("", NA, "<Missing>")),
      BNRIND = rule("<Missing>" = c("", NA, "<Missing>"))
    )
  )

  adam_db <- dunlin::reformat(adam_db, new_format, na_last = TRUE)

  adam_db$adlb <- adam_db$adlb %>%
    filter(
      .data$ONTRTFL == "Y",
      .data$PARCAT2 == "SI"
    )

  adam_db
}

#' @describeIn lbt06 Postprocessing
#'
#' @inheritParams gen_args
#'
#' @export
#'
lbt06_post <- function(tlg, prune_0 = FALSE, ...) {
  if (prune_0) {
    tlg <- smart_prune(tlg)
  }
  std_postprocess(tlg)
}

#' `LBT06` Table 1 (Default) Laboratory Abnormalities by Visit and Baseline Status Table 1.
#'
#' The `LBT06` table produces the standard laboratory abnormalities by visit and
#' baseline status summary.
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' run(lbt06, syn_data)
#'
#' run(lbt06, syn_data, paramcd = "PARAMCD")
lbt06 <- chevron_t(
  main = lbt06_main,
  preprocess = lbt06_pre,
  postprocess = lbt06_post,
  adam_datasets = c("adsl", "adlb")
)
