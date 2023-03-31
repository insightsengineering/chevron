# aet01_1 ----

#' @describeIn aet01_1 Main TLG function
#'
#' @inheritParams gen_args
#' @param safety_var (`list`) the safety variables to be summarized.
#' @param lbl_safety_var (`list`) the labels of the safety variables to be summarized. If `NULL`, uses the label
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
aet01_1_main <- function(adam_db,
                         arm_var = "ACTARM",
                         lbl_overall = NULL,
                         deco = std_deco("AET01"),
                         safety_var = list(
                           "FATAL", "SER", "SERWD", "SERDSM",
                           "RELSER", "WD", "DSM", "REL", "RELWD", "RELDSM", "SEV"
                         ),
                         lbl_safety_var = NULL,
                         ...) {
  dbsel <- get_db_data(adam_db, "adsl", "adae")
  checkmate::assert_list(safety_var, types = "character")
  safety_var <- unlist(safety_var)
  checkmate::assert_list(lbl_safety_var, types = "character", null.ok = TRUE)
  lbl_safety_var <- unlist(lbl_safety_var)
  checkmate::assert_character(lbl_safety_var, len = length(safety_var), null.ok = TRUE)
  assert_colnames(dbsel$adsl, c("DTHFL", "DCSREAS"))
  assert_colnames(dbsel$adae, safety_var)

  lbl_safety_var <- if (is.null(lbl_safety_var)) {
    var_labels_for(adam_db$adae, safety_var)
  } else {
    lbl_safety_var
  }

  lyt <- aet01_1_lyt(
    arm_var = arm_var,
    lbl_overall = lbl_overall,
    deco = deco,
    safety_var = safety_var,
    lbl_safety_var = lbl_safety_var
  )

  tbl_adae <- build_table(lyt$lyt_adae, dbsel$adae, alt_counts_df = dbsel$adsl)
  tbl_adsl <- build_table(lyt$lyt_adsl, dbsel$adsl)

  col_info(tbl_adsl) <- col_info(tbl_adae)

  tbl <- rbind(
    tbl_adae[1:2, ],
    tbl_adsl,
    tbl_adae[3:nrow(tbl_adae), ]
  )

  return(tbl)
}

#' @describeIn aet01_1 Layout
#'
#' @inheritParams aet01_1_main
#' @param lbl_safety_var (`character`) the labels of the safety variables to be summarized.
#'
#' @export
#'
aet01_1_lyt <- function(arm_var,
                        lbl_overall,
                        deco,
                        safety_var,
                        lbl_safety_var) {
  names(lbl_safety_var) <- safety_var

  lyt_adae <- basic_table_deco(deco) %>%
    split_cols_by(var = arm_var) %>%
    add_colcounts() %>%
    ifneeded_add_overall_col(lbl_overall) %>%
    summarize_num_patients(
      var = "USUBJID",
      .stats = c("unique", "nonunique"),
      .labels = c(
        unique = "Total number of patients with at least one AE",
        nonunique = "Total number of AEs"
      ),
      .formats = list(unique = format_count_fraction_fixed_dp, nonunique = "xx")
    ) %>%
    count_patients_with_flags(
      "USUBJID",
      flag_variables = lbl_safety_var,
      denom = "N_col",
      var_labels = "Total number of patients with at least one",
      show_labels = "visible",
      table_names = "AllAE",
      .indent_mods = 0L
    )

  lyt_adsl <- basic_table_deco(deco) %>%
    split_cols_by(var = arm_var) %>%
    add_colcounts() %>%
    ifneeded_add_overall_col(lbl_overall) %>%
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

  list(lyt_adae = lyt_adae, lyt_adsl = lyt_adsl)
}

#' @describeIn aet01_1 Preprocessing
#'
#' @inheritParams aet01_1_main
#'
#' @export
#'
aet01_1_pre <- function(adam_db,
                        req_tables = c("adsl", "adae"),
                        arm_var = "ACTARM",
                        safety_var = list(
                          "FATAL", "SER", "SERWD", "SERDSM",
                          "RELSER", "WD", "DSM", "REL", "RELWD", "RELDSM", "SEV"
                        ),
                        ...) {
  checkmate::assert_list(adam_db, types = "data.frame")
  checkmate::assert_list(safety_var, types = "character")
  safety_var <- unlist(safety_var)
  aet01_1_check(adam_db, req_tables = req_tables, arm_var = arm_var, safety_var = safety_var)

  adam_db$adae <- adam_db$adae %>%
    filter(.data$ANL01FL == "Y") %>%
    mutate(
      FATAL = .data$AESDTH == "Y",
      SER = .data$AESER == "Y",
      SERWD = (.data$AESER == "Y" & .data$AEACN == "DRUG WITHDRAWN"),
      SERDSM = (.data$AESER == "Y" & .data$AEACN %in% c("DRUG INTERRUPTED", "DOSE INCREASED", "DOSE REDUCED")),
      RELSER = (.data$AESER == "Y" & .data$AREL == "Y"),
      WD = .data$AEACN == "DRUG WITHDRAWN",
      DSM = .data$AEACN %in% c("DRUG INTERRUPTED", "DOSE INCREASED", "DOSE REDUCED"),
      REL = .data$AREL == "Y",
      RELWD = (.data$AREL == "Y" & .data$AEACN == "DRUG WITHDRAWN"),
      RELDSM = (.data$AREL == "Y" & .data$AEACN %in% c("DRUG INTERRUPTED", "DOSE INCREASED", "DOSE REDUCED")),
      CTC35 = if ("ATOXGR" %in% colnames(.)) .data$ATOXGR %in% c("3", "4", "5"),
      CTC45 = if ("ATOXGR" %in% colnames(.)) .data$ATOXGR %in% c("4", "5"),
      SEV = if ("ASEV" %in% colnames(.)) .data$ASEV == "SEVERE",
      SMQ01 = if ("SMQ01NAM" %in% colnames(.)) .data$SMQ01NAM != "",
      SMQ02 = if ("SMQ02NAM" %in% colnames(.)) .data$SMQ02NAM != "",
      CQ01 = if ("CQ01NAM" %in% colnames(.)) .data$CQ01NAM != ""
    ) %>%
    mutate(
      AEDECOD = formatters::with_label(.data$AEDECOD, "Dictionary-Derived Term"),
      AESDTH = formatters::with_label(.data$AESDTH, "Results in Death"),
      AEACN = formatters::with_label(.data$AEACN, "Action Taken with Study Treatment"),
      FATAL = formatters::with_label(.data$FATAL, "AE with fatal outcome"),
      SER = formatters::with_label(.data$SER, "Serious AE"),
      SEV = if ("SEV" %in% colnames(.)) formatters::with_label(.data$SEV, "Severe AE (at greatest intensity)"),
      SERWD = formatters::with_label(.data$SERWD, "Serious AE leading to withdrawal from treatment"),
      SERDSM = formatters::with_label(.data$SERDSM, "Serious AE leading to dose modification/interruption"),
      RELSER = formatters::with_label(.data$RELSER, "Related Serious AE"),
      WD = formatters::with_label(.data$WD, "AE leading to withdrawal from treatment"),
      DSM = formatters::with_label(.data$DSM, "AE leading to dose modification/interruption"),
      REL = formatters::with_label(.data$REL, "Related AE"),
      RELWD = formatters::with_label(.data$RELWD, "Related AE leading to withdrawal from treatment"),
      RELDSM = formatters::with_label(.data$RELDSM, "Related AE leading to dose modification/interruption"),
      CTC35 = if ("CTC35" %in% colnames(.)) formatters::with_label(.data$CTC35, "Grade 3-5 AE"),
      CTC45 = if ("CTC45" %in% colnames(.)) formatters::with_label(.data$CTC45, "Grade 4/5 AE")
    )

  missing_rule <- rule("<Missing>" = c("", NA))

  new_format <- list(
    adsl = list(
      DCSREAS = missing_rule
    )
  )

  adam_db <- dunlin::reformat(adam_db, new_format, na_last = TRUE)

  adam_db
}

#' @describeIn aet01_1 Checks
#'
#' @inheritParams gen_args
#'
aet01_1_check <- function(adam_db,
                          req_tables = c("adsl", "adae"),
                          arm_var = "ACTARM",
                          safety_var = c(
                            "FATAL", "SER", "SERWD", "SERDSM",
                            "RELSER", "WD", "DSM", "REL", "RELWD", "RELDSM", "SEV"
                          )) {
  assert_all_tablenames(adam_db, req_tables)

  msg <- NULL

  corresponding_col <- list(
    FATAL = "AESDTH",
    SER = "AESER",
    SERWD = c("AESER", "AEACN"),
    SERDSM = c("AESER", "AEACN"),
    RELSER = c("AESER", "AREL"),
    WD = "AEACN",
    DSM = "AEACN",
    REL = "AREL",
    RELWD = c("AREL", "AEACN"),
    RELDSM = c("AREL", "AEACN"),
    CTC35 = "ATOXGR",
    CTC45 = "ATOXGR",
    SEV = "ASEV",
    SMQ01 = "SMQ01NAM",
    SMQ02 = "SMQ02NAM",
    CQ01 = "CQ01NAM"
  )

  native_col <- setdiff(c(arm_var, safety_var), names(corresponding_col))
  new_col <- unique(unlist(corresponding_col[c(arm_var, safety_var)]))
  adae_layout_col <- "USUBJID"
  adsl_layout_col <- c("USUBJID", "DTHFL", "DCSREAS")

  msg <- c(msg, check_all_colnames(adam_db$adae, c(native_col, new_col, adae_layout_col)))
  msg <- c(msg, check_all_colnames(adam_db$adsl, c(arm_var, adsl_layout_col)))

  if (is.null(msg)) {
    TRUE
  } else {
    stop(paste(msg, collapse = "\n  "))
  }
}

#' @describeIn aet01_1 Postprocessing
#'
#' @inheritParams gen_args
#'
#' @export
aet01_post <- function(tlg, prune_0 = FALSE, deco = std_deco("AET01"), ...) {
  tbl <- set_decoration(tlg, deco)
  if (prune_0) {
    tbl <- smart_prune(tbl)
  }
  std_postprocess(tbl)
}

#' `AET01` Table 1 (Default) Overview of Deaths and Adverse Events Summary Table 1.
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' run(aet01_1, syn_data, arm_var = "ARM")
aet01_1 <- chevron_t(
  main = aet01_1_main,
  preprocess = aet01_1_pre,
  postprocess = aet01_post,
  adam_datasets = c("adsl", "adae")
)



# aet01_2 ----

#' @describeIn aet01_2 Main TLG function
#'
#'
#' @inheritParams gen_args
#' @param safety_var (`character`) the safety variables to be summarized.
#' @param lbl_safety_var (`character`) the labels of the safety variables to be summarized. If `NULL`, uses the label
#'   attribute of the columns selected in `safety_var`.
#' @param medconcept_var (`character`) the medical concept variables to be summarized.
#' @param lbl_medconcept_var (`character`) the label of the medical concept variables to be summarized. If `NULL`, uses
#'   the label attribute of the columns selected in `medconcept_var`.
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
aet01_2_main <- function(adam_db,
                         arm_var = "ACTARM",
                         lbl_overall = NULL,
                         deco = std_deco("AET01"),
                         safety_var = list(
                           "FATAL", "SER", "SERWD", "SERDSM",
                           "RELSER", "WD", "DSM", "REL", "RELWD", "RELDSM", "SEV"
                         ),
                         lbl_safety_var = NULL,
                         medconcept_var = list("SMQ01", "SMQ02", "CQ01"),
                         lbl_medconcept_var = NULL,
                         ...) {
  checkmate::assert_list(safety_var, types = "character")
  safety_var <- unlist(safety_var)
  checkmate::assert_list(lbl_safety_var, types = "character", null.ok = TRUE)
  safety_var <- unlist(safety_var)
  checkmate::assert_character(lbl_safety_var, len = length(safety_var), null.ok = TRUE)

  checkmate::assert_list(medconcept_var, types = "character")
  medconcept_var <- unlist(medconcept_var)
  checkmate::assert_list(lbl_medconcept_var, types = "character", null.ok = TRUE)
  lbl_medconcept_var <- unlist(lbl_medconcept_var)
  checkmate::assert_character(lbl_medconcept_var, len = length(medconcept_var), null.ok = TRUE)

  dbsel <- get_db_data(adam_db, "adsl", "adae")

  assert_colnames(dbsel$adsl, c("DTHFL", "DCSREAS"))
  assert_colnames(dbsel$adae, c(safety_var, medconcept_var))

  lbl_safety_var <- if (is.null(lbl_safety_var)) {
    var_labels_for(adam_db$adae, safety_var)
  } else {
    lbl_safety_var
  }

  lbl_medconcept_var <- if (is.null(lbl_medconcept_var)) {
    var_labels_for(adam_db$adae, medconcept_var)
  } else {
    lbl_medconcept_var
  }

  lyt <- aet01_2_lyt(
    arm_var = arm_var,
    lbl_overall = lbl_overall,
    deco = deco,
    safety_var = safety_var,
    lbl_safety_var = lbl_safety_var,
    medconcept_var = medconcept_var,
    lbl_medconcept_var = lbl_medconcept_var
  )

  tbl_adae <- build_table(lyt$lyt_adae, dbsel$adae, alt_counts_df = dbsel$adsl)
  tbl_adsl <- build_table(lyt$lyt_adsl, dbsel$adsl)

  col_info(tbl_adsl) <- col_info(tbl_adae)

  tbl <- rbind(
    tbl_adae[1:2, ],
    tbl_adsl,
    tbl_adae[3:nrow(tbl_adae), ]
  )

  tbl
}

#' @describeIn aet01_2 Layout
#'
#' @inheritParams aet01_2_main
#' @param lbl_safety_var (`character`) the labels of the safety variables to be summarized.
#' @param lbl_medconcept_var (`character`) the label of the medical concept variables to be summarized.
#'
#' @export
#'
aet01_2_lyt <- function(arm_var,
                        lbl_overall,
                        deco,
                        safety_var,
                        lbl_safety_var,
                        medconcept_var,
                        lbl_medconcept_var) {
  names(lbl_safety_var) <- safety_var
  names(lbl_medconcept_var) <- medconcept_var

  lyt_adae <- basic_table_deco(deco) %>%
    split_cols_by(var = arm_var) %>%
    add_colcounts() %>%
    ifneeded_add_overall_col(lbl_overall) %>%
    summarize_num_patients(
      var = "USUBJID",
      .stats = c("unique", "nonunique"),
      .labels = c(
        unique = "Total number of patients with at least one AE",
        nonunique = "Total number of AEs"
      ),
      .formats = list(unique = format_count_fraction_fixed_dp, nonunique = "xx")
    ) %>%
    count_patients_with_flags(
      "USUBJID",
      flag_variables = lbl_safety_var,
      denom = "N_col",
      var_labels = "Total number of patients with at least one",
      show_labels = "visible",
      table_names = "AllAE",
      .indent_mods = 0L
    ) %>%
    count_patients_with_flags(
      "USUBJID",
      flag_variables = lbl_medconcept_var,
      denom = "N_col",
      var_labels = "Total number of patients with at least one",
      show_labels = "visible",
      table_names = "MedConcept",
      .indent_mods = 0L
    )

  lyt_adsl <- basic_table_deco(deco) %>%
    split_cols_by(var = arm_var) %>%
    add_colcounts() %>%
    ifneeded_add_overall_col(lbl_overall) %>%
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

  list(lyt_adae = lyt_adae, lyt_adsl = lyt_adsl)
}

#' @describeIn aet01_2 Preprocessing
#'
#' @inheritParams gen_args
#'
#' @export
#'
aet01_2_pre <- function(adam_db, ...) {
  checkmate::assert_list(adam_db, types = "list")

  aet01_2_check(adam_db)

  labs <- formatters::var_labels(adam_db$adae)

  adam_db$adae <- adam_db$adae %>%
    filter(.data$ANL01FL == "Y") %>%
    mutate(
      FATAL = .data$AESDTH == "Y",
      SER = .data$AESER == "Y",
      SERWD = (.data$AESER == "Y" & .data$AEACN == "DRUG WITHDRAWN"),
      SERDSM = (.data$AESER == "Y" & .data$AEACN %in% c("DRUG INTERRUPTED", "DOSE INCREASED", "DOSE REDUCED")),
      RELSER = (.data$AESER == "Y" & .data$AREL == "Y"),
      WD = .data$AEACN == "DRUG WITHDRAWN",
      DSM = .data$AEACN %in% c("DRUG INTERRUPTED", "DOSE INCREASED", "DOSE REDUCED"),
      REL = .data$AREL == "Y",
      RELWD = (.data$AREL == "Y" & .data$AEACN == "DRUG WITHDRAWN"),
      RELDSM = (.data$AREL == "Y" & .data$AEACN %in% c("DRUG INTERRUPTED", "DOSE INCREASED", "DOSE REDUCED")),
      CTC35 = if ("ATOXGR" %in% colnames(.)) .data$ATOXGR %in% c("3", "4", "5"),
      CTC45 = if ("ATOXGR" %in% colnames(.)) .data$ATOXGR %in% c("4", "5"),
      SEV = if ("ASEV" %in% colnames(.)) .data$ASEV == "SEVERE",
      SMQ01 = if ("SMQ01NAM" %in% colnames(.)) .data$SMQ01NAM != "",
      SMQ02 = if ("SMQ02NAM" %in% colnames(.)) .data$SMQ02NAM != "",
      CQ01 = if ("CQ01NAM" %in% colnames(.)) .data$CQ01NAM != ""
    ) %>%
    mutate(
      AEDECOD = formatters::with_label(.data$AEDECOD, "Dictionary-Derived Term"),
      AESDTH = formatters::with_label(.data$AESDTH, "Results in Death"),
      AEACN = formatters::with_label(.data$AEACN, "Action Taken with Study Treatment"),
      FATAL = formatters::with_label(.data$FATAL, "AE with fatal outcome"),
      SER = formatters::with_label(.data$SER, "Serious AE"),
      SEV = if ("SEV" %in% colnames(.)) formatters::with_label(.data$SEV, "Severe AE (at greatest intensity)"),
      SERWD = formatters::with_label(.data$SERWD, "Serious AE leading to withdrawal from treatment"),
      SERDSM = formatters::with_label(.data$SERDSM, "Serious AE leading to dose modification/interruption"),
      RELSER = formatters::with_label(.data$RELSER, "Related Serious AE"),
      WD = formatters::with_label(.data$WD, "AE leading to withdrawal from treatment"),
      DSM = formatters::with_label(.data$DSM, "AE leading to dose modification/interruption"),
      REL = formatters::with_label(.data$REL, "Related AE"),
      RELWD = formatters::with_label(.data$RELWD, "Related AE leading to withdrawal from treatment"),
      RELDSM = formatters::with_label(.data$RELDSM, "Related AE leading to dose modification/interruption"),
      CTC35 = if ("CTC35" %in% colnames(.)) formatters::with_label(.data$CTC35, "Grade 3-5 AE"),
      CTC45 = if ("CTC45" %in% colnames(.)) formatters::with_label(.data$CTC45, "Grade 4/5 AE"),
      SMQ01 = if ("SMQ01" %in% colnames(.)) {
        formatters::with_label(
          .data$SMQ01,
          .env$labs["SMQ01NAM"]
        )
      },
      SMQ02 = if ("SMQ02" %in% colnames(.)) {
        formatters::with_label(
          .data$SMQ02,
          .env$labs["SMQ02SC"]
        )
      },
      CQ01 = if ("CQ01" %in% colnames(.)) formatters::with_label(.data$CQ01, .env$labs["CQ01NAM"])
    )

  missing_rule <- rule("<Missing>" = c("", NA))

  new_format <- list(
    adsl = list(
      DCSREAS = missing_rule
    )
  )

  adam_db <- dunlin::reformat(adam_db, new_format, na_last = TRUE)

  adam_db
}

#' @describeIn aet01_2 Checks
#'
#' @inheritParams gen_args
#'
aet01_2_check <- function(adam_db,
                          req_tables = c("adsl", "adae"),
                          arm_var = "ACTARM",
                          safety_var = list(
                            "FATAL", "SER", "SERWD", "SERDSM",
                            "RELSER", "WD", "DSM", "REL", "RELWD", "RELDSM", "SEV"
                          ),
                          medconcept_var = list("SMQ01", "SMQ02", "CQ01")) {
  assert_all_tablenames(adam_db, req_tables)
  checkmate::assert_list(safety_var, types = "character")
  safety_var <- unlist(safety_var)

  checkmate::assert_list(medconcept_var, types = "character")
  medconcept_var <- unlist(medconcept_var)

  msg <- NULL

  corresponding_col <- list(
    FATAL = "AESDTH",
    SER = "AESER",
    SERWD = c("AESER", "AEACN"),
    SERDSM = c("AESER", "AEACN"),
    RELSER = c("AESER", "AREL"),
    WD = "AEACN",
    DSM = "AEACN",
    REL = "AREL",
    RELWD = c("AREL", "AEACN"),
    RELDSM = c("AREL", "AEACN"),
    CTC35 = "ATOXGR",
    CTC45 = "ATOXGR",
    SEV = "ASEV",
    SMQ01 = "SMQ01NAM",
    SMQ02 = "SMQ02NAM",
    CQ01 = "CQ01NAM"
  )

  native_col <- setdiff(c(arm_var, safety_var, medconcept_var), names(corresponding_col))
  new_col <- unique(unlist(corresponding_col[c(arm_var, safety_var)]))
  adae_layout_col <- "USUBJID"
  adsl_layout_col <- c("USUBJID", "DTHFL", "DCSREAS")

  msg <- c(msg, check_all_colnames(adam_db$adae, c(native_col, new_col, adae_layout_col)))
  msg <- c(msg, check_all_colnames(adam_db$adsl, c(arm_var, adsl_layout_col)))

  if (is.null(msg)) {
    TRUE
  } else {
    stop(paste(msg))
  }
}

#' `AET01` Table 2 (Supplementary) Overview of Deaths and Adverse Events Summary Table 2. Overview of death and summary
#' of adverse events with medical concepts.
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' run(aet01_2, syn_data)
aet01_2 <- chevron_t(
  main = aet01_2_main,
  preprocess = aet01_2_pre,
  postprocess = aet01_post,
  adam_datasets = c("adsl", "adae")
)
