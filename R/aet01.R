#' AET01 Table 1 (Default) Safety Summary Table 1
#'
#'
#'
#' @inheritParams gen_args
#'
#' @importFrom magrittr %>%
#'
#' @export
#'
#' @examples
#' library(scda)
#' library(dplyr)
#' sd <- synthetic_cdisc_data("rcd_2021_03_22")
#' adsl <- sd$adsl
#' adae <- sd$adae %>%
#'  mutate(ANL01FL = 'Y')
#'
#' adsl <- df_explicit_na(adsl)
#' adae <- df_explicit_na(
#'  adae,
#'   omit_columns = c("SMQ01NAM", "SMQ01SC", "SMQ02NAM", "SMQ02SC", "CQ01NAM", "STUDYID", "USUBJID")
#' )
#'
#' set.seed(99)
#'
#' adae <- adae %>%
#'   mutate(
#'     AEDECOD = as.character(AEDECOD),
#'     AESDTH = sample(c("N", "Y"), size = nrow(adae), replace = TRUE, prob = c(0.99, 0.01)),
#'     AEACN = sample(
#'       c("DOSE NOT CHANGED", "DOSE INCREASED", "DRUG INTERRUPTED", "DRUG WITHDRAWN"),
#'       size = nrow(adae),
#'       replace = TRUE, prob = c(0.68, 0.02, 0.25, 0.05)
#'     ),
#'     FATAL = AESDTH == "Y",
#'     SER = AESER == "Y",
#'     SERWD = AESER == "Y" & AEACN == "DRUG WITHDRAWN",
#'     SERDSM = AESER == "Y" & AEACN %in% c("DRUG INTERRUPTED", "DOSE INCREASED", "DOSE REDUCED"),
#'     RELSER = AESER == "Y" & AEREL == "Y",
#'     WD = AEACN == "DRUG WITHDRAWN",
#'     DSM = AEACN %in% c("DRUG INTERRUPTED", "DOSE INCREASED", "DOSE REDUCED"),
#'     REL = AEREL == "Y",
#'     RELWD = AEREL == "Y" & AEACN == "DRUG WITHDRAWN",
#'     RELDSM = AEREL == "Y" & AEACN %in% c("DRUG INTERRUPTED", "DOSE INCREASED", "DOSE REDUCED"),
#'     CTC35 = AETOXGR %in% c("3", "4", "5"),
#'     CTC45 = AETOXGR %in% c("4", "5"),
#'     SMQ01 = SMQ01NAM != "",
#'     SMQ02 = SMQ02NAM != "",
#'     CQ01 = CQ01NAM != "",
#'     USUBJID_AESEQ = paste(USUBJID, AESEQ, sep = "@@") # Create unique ID per AE in dataset.
#'   ) %>%
#'   var_relabel(
#'     AEDECOD = "Dictionary-Derived Term",
#'     AESDTH = "Results in Death",
#'     AEACN = "Action Taken with Study Treatment",
#'     FATAL = "AE with fatal outcome",
#'     SER = "Serious AE",
#'     SERWD = "Serious AE leading to withdrawal from treatment",
#'     SERDSM = "Serious AE leading to dose modification/interruption",
#'     RELSER = "Related Serious AE",
#'     WD = "AE leading to withdrawal from treatment",
#'     DSM = "AE leading to dose modification/interruption",
#'     REL = "Related AE",
#'     RELWD = "Related AE leading to withdrawal from treatment",
#'     RELDSM = "Related AE leading to dose modification/interruption",
#'     CTC35 = "Grade 3-5 AE",
#'     CTC45 = "Grade 4/5 AE",
#'     SMQ01 =  aesi_label(adae$SMQ01NAM, adae$SMQ01SC),
#'     SMQ02 = aesi_label(adae$SMQ02NAM, adae$SMQ02SC),
#'     CQ01 = aesi_label(adae$CQ01NAM)
#'   )
#'
#'
#' aet01_1(adsl, adae)
#'
aet01_1 <- function(
  adsl, adae,
  armvar = .study$armvar,
  lbl_overall = .study$lbl_overall,
  deco = std_deco("AET01"),
  .study = list(
    armvar = "ACTARM",
    totals_for = c("DTHFL", "DCSREAS"),
    lbl_overall = NULL
  )
) {

  aesi_vars <- c("FATAL", "SER", "SERWD", "SERDSM", "RELSER", "WD", "DSM", "REL", "RELWD", "RELDSM", "CTC35")

  # Layout for variables from adsl dataset.
  lyt_adsl <- basic_table() %>%
    split_cols_by(armvar) %>%
    add_colcounts() %>% # todo
    count_values(
      "DTHFL",
      values = "Y",
      .labels = c(count_fraction = "Total number of deaths"),
      denom = "N_col"
    ) %>%
    count_values(
      "DCSREAS",
      values = "ADVERSE EVENT",
      .labels = c(count_fraction = "Total number of patients withdrawn from study due to an AE"),
      denom = "N_col"
    )

  result_adsl <- build_table(lyt_adsl, df = adsl, alt_counts_df = adsl)

  # Layout for variables from adae dataset.

  lyt_adae <- basic_table() %>%
    split_cols_by(armvar) %>%
    add_colcounts() %>%
    count_patients_with_event(
      vars = "USUBJID",
      filters = c("STUDYID" = as.character(unique(adae$STUDYID))),
      denom = "N_col",
      .labels = c(count_fraction = "Total number of patients with at least one adverse event")
    ) %>%
    count_values(
      "STUDYID",
      values = as.character(unique(adae$STUDYID)),
      .stats = "count",
      .labels = c(count = "Total AEs"),
      table_names = "total_aes"
    ) %>%
    count_patients_with_flags(
      "USUBJID",
      flag_variables = var_labels(adae[, aesi_vars]),
      .indent_mods = 1L
    )

  result_adae <- build_table(lyt_adae, df = adae, alt_counts_df = adsl)
  #result_adae <- insert_rrow(result_adae, rrow("Total number of patients with at least one"), at = 3) #nolint

  # Combine tables.
  col_info(result_adsl) <- col_info(result_adae)
  result <- rbind(
    result_adae[1:2, ],
    result_adsl,
    result_adae[3:nrow(result_adae), ]
  )

  result <- set_decoration(result, deco)

  result

}
