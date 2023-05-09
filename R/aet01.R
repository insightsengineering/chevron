# aet01 ----

#' @describeIn aet01 Main TLG function
#'
#' @inheritParams gen_args
#' @param safety_var (`character`) the safety variables to be summarized.
#' @param lbl_safety_var (`character`) the labels of the safety variables to be summarized. If `NULL`, uses the label
#'   attribute of the columns selected in `safety_var`.
#'
#' @details
#'  * Does not remove rows with zero counts by default.
#'
#' @note
#'  * `adam_db` object must contain an `adsl` table with the `"DTHFL"` and `"DCSREAS"` columns.
#'  * `adam_db` object must contain an `adae` table with the columns passed to `safety_var`.
#'
#' @export
#'
aet01_main <- function(adam_db,
                       arm_var = "ACTARM",
                       lbl_overall = NULL,
                       safety_var = c(
                         "FATAL", "SER", "SERWD", "SERDSM",
                         "RELSER", "WD", "DSM", "REL", "RELWD", "RELDSM", "SEV"
                       ),
                       medconcept_var = NULL,
                       ...) {
  dbsel <- get_db_data(adam_db, "adsl", "adae")
  checkmate::assert_character(safety_var)
  checkmate::assert_character(medconcept_var, null.ok = TRUE)
  assert_colnames(dbsel$adsl, c(arm_var, "DTHFL", "DCSREAS"))
  assert_colnames(dbsel$adae, c(arm_var, safety_var, medconcept_var))
  checkmate::assert_string(lbl_overall, null.ok = TRUE)
  checkmate::assert_string(arm_var)
  assert_valid_var_pair(adam_db$adsl[[arm_var]], adam_db$adae[[arm_var]], sprintf("adsl.%s", arm_var), sprintf("adae.%s", arm_var))
  lbl_safety_var <- var_labels_for(adam_db$adae, safety_var)
  lbl_medconcept_var <- var_labels_for(adam_db$adae, medconcept_var)
  lyts <- aet01_lyt(
    arm_var = arm_var,
    lbl_overall = lbl_overall,
    safety_var = safety_var,
    lbl_safety_var = lbl_safety_var,
    medconcept_var = medconcept_var,
    lbl_medconcept_var = lbl_medconcept_var
  )

  rbind(
    build_table(lyts$ae1, dbsel$adae, alt_counts_df = dbsel$adsl),
    build_table(lyts$adsl, dbsel$adsl, alt_counts_df = dbsel$adsl),
    build_table(lyts$ae2, dbsel$adae, alt_counts_df = dbsel$adsl)
  )
}

#' @describeIn aet01 Layout
#'
#' @inheritParams aet01_main
#' @param lbl_safety_var (`character`) the labels of the safety variables to be summarized.
#'
#' @export
#'
aet01_lyt <- function(arm_var,
                      lbl_overall,
                      safety_var,
                      lbl_safety_var,
                      medconcept_var,
                      lbl_medconcept_var) {
  names(lbl_safety_var) <- safety_var
  if (!is.null(medconcept_var)) {
    names(lbl_medconcept_var) <- medconcept_var
  }
  lyt_base <- basic_table(show_colcounts = TRUE) %>%
    split_cols_by(var = arm_var) %>%
    ifneeded_add_overall_col(lbl_overall)
  lyt_ae1 <- lyt_base %>%
    analyze_num_patients(
      var = "USUBJID",
      .stats = c("unique", "nonunique"),
      .labels = c(
        unique = "Total number of patients with at least one AE",
        nonunique = "Total number of AEs"
      ),
      .formats = list(unique = format_count_fraction_fixed_dp, nonunique = "xx"),
      show_labels = "hidden"
    )
  lyt_adsl <- lyt_base %>%
    count_patients_with_event(
      "USUBJID",
      filters = c("DTHFL" = "Y"),
      denom = "N_col",
      .labels = c(count_fraction = "Total number of deaths"),
      table_names = "TotDeath"
    ) %>%
    count_patients_with_event(
      "USUBJID",
      filters = c("DCSREAS" = "ADVERSE EVENT"),
      denom = "N_col",
      .labels = c(count_fraction = "Total number of patients withdrawn from study due to an AE"),
      table_names = "TotWithdrawal"
    )
  lyt_ae2 <- lyt_base %>%
    count_patients_with_flags(
      "USUBJID",
      flag_variables = lbl_safety_var,
      denom = "N_col",
      var_labels = "Total number of patients with at least one",
      show_labels = "visible",
      table_names = "AllAE",
      .indent_mods = 0L
    )
  if (length(lbl_medconcept_var) > 0) {
    lyt_ae2 <- lyt_ae2 %>%
      count_patients_with_flags(
        "USUBJID",
        flag_variables = lbl_medconcept_var,
        denom = "N_col",
        var_labels = "Total number of patients with at least one",
        show_labels = "visible",
        table_names = "MedConcept",
        .indent_mods = 0L
      )
  }
  return(list(ae1 = lyt_ae1, ae2 = lyt_ae2, adsl = lyt_adsl))
}

#' @describeIn aet01 Preprocessing
#'
#' @inheritParams aet01_main
#'
#' @export
#'
aet01_pre <- function(adam_db, ...) {
  adam_db$adae <- adam_db$adae %>%
    filter(.data$ANL01FL == "Y") %>%
    mutate(
      FATAL = with_label(.data$AESDTH == "Y", "AE with fatal outcome"),
      SER = with_label(.data$AESER == "Y", "Serious AE"),
      SEV = with_label(.data$ASEV == "SEVERE", "Severe AE (at greatest intensity)"),
      REL = with_label(.data$AREL == "Y", "Related AE"),
      WD = with_label(.data$AEACN == "DRUG WITHDRAWN", "AE leading to withdrawal from treatment"),
      DSM = with_label(
        .data$AEACN %in% c("DRUG INTERRUPTED", "DOSE INCREASED", "DOSE REDUCED"),
        "AE leading to dose modification/interruption"
      ),
      SERWD = with_label(.data$SER & .data$WD, "Serious AE leading to withdrawal from treatment"),
      SERDSM = with_label(.data$SER & .data$DSM, "Serious AE leading to dose modification/interruption"),
      RELSER = with_label(.data$SER & .data$REL, "Related Serious AE"),
      RELWD = with_label(.data$REL & .data$WD, "Related AE leading to withdrawal from treatment"),
      RELDSM = with_label(.data$REL & .data$DSM, "Related AE leading to dose modification/interruption"),
      CTC35 = with_label(.data$ATOXGR %in% c("3", "4", "5"), "Grade 3-5 AE"),
      CTC45 = with_label(.data$ATOXGR %in% c("4", "5"), "Grade 4/5 AE")
    )

  adam_db$adsl <- adam_db$adsl %>%
    mutate(DCSREAS = reformat(DCSREAS, missing_rule))

  adam_db
}

#' @describeIn aet01 Postprocessing
#'
#' @inheritParams gen_args
#'
#' @export
aet01_post <- function(tlg, prune_0 = FALSE, ...) {
  if (prune_0) {
    tlg <- smart_prune(tlg)
  }
  std_postprocess(tlg)
}

#' `AET01` Table 1 (Default) Overview of Deaths and Adverse Events Summary Table 1.
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' run(aet01, syn_data, arm_var = "ARM")
aet01 <- chevron_t(
  main = aet01_main,
  preprocess = aet01_pre,
  postprocess = aet01_post,
  adam_datasets = c("adsl", "adae")
)
