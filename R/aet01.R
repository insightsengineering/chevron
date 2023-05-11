# aet01 ----

#' @describeIn aet01 Main TLG function
#'
#' @inheritParams gen_args
#' @param anl_vars Named (`list`) of (`character`) variables the safety variables to be summarized.
#'
#' @details
#'  * Does not remove rows with zero counts by default.
#'
#' @note
#'  * `adam_db` object must contain an `adsl` table with the `"DTHFL"` and `"DCSREAS"` columns.
#'  * `adam_db` object must contain an `adae` table with the columns passed to `anl_vars`.
#'
#' @export
#'
aet01_main <- function(adam_db,
                       arm_var = "ACTARM",
                       lbl_overall = NULL,
                       anl_vars = list(
                         safety_var = c(
                           "FATAL", "SER", "SERWD", "SERDSM",
                           "RELSER", "WD", "DSM", "REL", "RELWD", "RELDSM", "SEV"
                         )
                       ),
                       anl_lbls = "Total Number of Patients with at Least One",
                       ...) {
  assert_all_tablenames(adam_db, "adsl", "adae")
  checkmate::assert_string(arm_var)
  checkmate::assert_list(anl_vars, types = "character", names = "unique")
  checkmate::assert_character(anl_lbls, min.chars = 1L)
  checkmate::assert_string(lbl_overall, null.ok = TRUE)
  assert_valid_variable(adam_db$adsl, c("USUBJID", arm_var, "DTHFL", "DCSREAS"), types = list(c("character", "factor")))
  assert_valid_variable(adam_db$adae, c(arm_var), types = list(c("character", "factor")))
  assert_valid_variable(adam_db$adae, "USUBJID", empty_ok = TRUE, types = list(c("character", "factor")))
  assert_valid_variable(adam_db$adae, unlist(anl_vars), types = list("logical"), na_ok = TRUE, empty_ok = TRUE)
  assert_valid_var_pair(adam_db$adsl, adam_db$adae, arm_var)
  lbl_vars <- lapply(
    anl_vars,
    var_labels_for,
    df = adam_db$adae
  )
  if (length(anl_lbls) == 1) {
    anl_lbls <- rep(anl_lbls, length(anl_vars))
  }
  lyts <- aet01_lyt(
    arm_var = arm_var,
    lbl_overall = lbl_overall,
    anl_vars = anl_vars,
    anl_lbls = anl_lbls,
    lbl_vars = lbl_vars
  )

  rbind(
    build_table(lyts$ae1, adam_db$adae, alt_counts_df = adam_db$adsl),
    build_table(lyts$adsl, adam_db$adsl, alt_counts_df = adam_db$adsl),
    build_table(lyts$ae2, adam_db$adae, alt_counts_df = adam_db$adsl)
  )
}

#' aet01 Layout
#'
#' @inheritParams aet01_main
#' @param anl_vars Named (`list`) of analysis variables.
#' @param anl_lbls (`character`) of labels.
#' @param lbl_vars Named (`list`) of analysis labels.
#' @keywords internal
#'
aet01_lyt <- function(arm_var,
                      lbl_overall,
                      anl_vars,
                      anl_lbls,
                      lbl_vars) {
  lyt_base <- basic_table(show_colcounts = TRUE) %>%
    split_cols_by(var = arm_var) %>%
    ifneeded_add_overall_col(lbl_overall)
  lyt_ae1 <- lyt_base %>%
    analyze_num_patients(
      vars = "USUBJID",
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
    count_patients_recursive(
      anl_vars = anl_vars,
      anl_lbls = anl_lbls,
      lbl_vars = lbl_vars
    )
  return(list(ae1 = lyt_ae1, ae2 = lyt_ae2, adsl = lyt_adsl))
}

#' Counte patients recusively
#' @param lyt (`PreDataTableLayouts`) rtable layout.
#' @param anl_vars Named (`list`) of analysis variables.
#' @param anl_lbls (`character`) of labels.
#' @param lbl_vars Named (`list`) of analysis labels.
#' @keywords internal
count_patients_recursive <- function(lyt, anl_vars, anl_lbls, lbl_vars) {
  checkmate::assert_list(anl_vars, names = "unique", types = "character")
  checkmate::assert_character(anl_lbls, min.chars = 1L, len = length(anl_vars))
  nms <- names(anl_vars)
  for (k in seq_len(length(anl_vars))) {
    lyt <- lyt %>%
      count_patients_with_flags(
        var = "USUBJID",
        flag_variables = setNames(lbl_vars[[k]], anl_vars[[k]]),
        denom = "N_col",
        var_labels = anl_lbls[k],
        show_labels = "visible",
        table_names = nms[k],
        .indent_mods = 0L
      )
  }
  lyt
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
    mutate(DCSREAS = reformat(.data$DCSREAS, missing_rule))

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
