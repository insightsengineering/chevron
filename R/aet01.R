# aet01_1 ----

#' `AET01` Table 1 (Default) Overview of Deaths and Adverse Events Summary Table 1.
#'
#' Overview of death and summary of adverse events.
#'
#' @details
#'  * Does not remove rows with zero counts by default.
#'
#' @inheritParams gen_args
#' @param safety_var (`character`) the safety variables to be summarized.
#' @param lbl_safety_var (`character`) the labels of the safety variables to be summarized.
#'
#' @importFrom magrittr %>%
#'
#' @return
#' @export
#'
#' @examples
#' library(dm)
#' library(dplyr)
#'
#' db <- syn_test_data() %>%
#'   preprocess_data("aet01_1")
#'
#' aet01_1(db, armvar = "ARM")
#'
aet01_1 <- function(adam_db,
                    armvar = .study$armvar,
                    lbl_overall = .study$lbl_overall,
                    prune_0 = FALSE,
                    deco = std_deco("AET01"),
                    safety_var = .study$safety_var,
                    lbl_safety_var = var_labels_for(adam_db$adae, .study$safety_var),
                    .study = list(
                      armvar = "ARM",
                      lbl_overall = NULL,
                      safety_var = c("FATAL", "SER", "SERWD", "SERDSM",
                                     "RELSER", "WD", "DSM", "REL", "RELWD", "RELDSM", "SEV")
                    )) {

  dbsel <- get_db_data(adam_db, "adsl", "adae")

  lyt <- aet01_1_lyt(
    armvar = armvar,
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

   tbl <- set_decoration(tbl, deco)

   if (prune_0) {
    tbl <- tbl %>% prune_table()
   }

   tbl
}

#' `AET01` Layout 1 (Default)
#'
#' @describeIn aet01_1
#'
#' @inheritParams gen_args
#' @param safety_var (`character`) the safety variables to be summarized.
#' @param lbl_safety_var (`character`) the labels of the safety variables to be summarized.
#'
#' @importFrom magrittr %>%
#'
#' @return
#' @export
#'
#' @examples
#' aet01_1_lyt(
#'   armvar = "ACTARM",
#'   lbl_overall = NULL,
#'   deco = std_deco("AET01")
#' )
aet01_1_lyt <- function(armvar = .study$armvar,
                        lbl_overall = .study$lbl_overall,
                        deco = std_deco("AET01"),
                        safety_var = .study$safety_var,
                        lbl_safety_var = .study$lbl_safety_var,
                        .study = list(
                          armvar = "ARM",
                          lbl_overall = NULL,
                          safety_var = c("FATAL", "SER", "SERWD", "SERDSM", "RELSER", "WD", "DSM", "REL",
                                         "RELWD", "RELDSM", "CTC35", "CTC45", "SEV"),
                          lbl_safety_var = c("FATAL", "SER", "SERWD", "SERDSM", "RELSER", "WD", "DSM", "REL",
                                             "RELWD", "RELDSM", "CTC35", "CTC45", "SEV")
                        )) {

  names(lbl_safety_var) <- safety_var

  lyt_adae <-
    basic_table_deco(deco) %>%
    split_cols_by(var = armvar) %>%
    add_colcounts() %>%
    ifneeded_add_overall_col(lbl_overall) %>%
    summarize_num_patients(
      var = "USUBJID",
      .stats = c("unique", "nonunique"),
      .labels = c(
        unique = "Total number of patients with at least one AE",
        nonunique = "Total number of AEs"
      )
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

  lyt_adsl <-
    basic_table_deco(deco) %>%
    split_cols_by(var = armvar) %>%
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


# aet01_2 ----

#' `AET01` Table 2 (Supplementary) Overview of Deaths and Adverse Events Summary Table 2.
#'
#' Overview of death and summary of adverse events with medical concepts.
#'
#' @details
#'  * Does not remove rows with zero counts by default.
#'
#' @inheritParams gen_args
#' @param safety_var (`character`) the safety variables to be summarized.
#' @param lbl_safety_var (`character`) the labels of the safety variables to be summarized.
#' @param medconcept_var (`character`) the medical concept variables to be summarized.
#' @param lbl_medconcept_var (`character`) the label of the medical concept variables to be summarized.
#'
#' @importFrom magrittr %>%
#'
#' @return
#' @export
#'
#' @examples
#' library(dm)
#'
#' db <- syn_test_data() %>%
#'   preprocess_data("aet01_2")
#'
#' aet01_2(db, armvar = "ARM", prune_0 = FALSE)
#'
aet01_2 <- function(adam_db,
                    armvar = .study$armvar,
                    lbl_overall = .study$lbl_overall,
                    prune_0 = FALSE,
                    deco = std_deco("AET01"),
                    safety_var = .study$safety_var,
                    lbl_safety_var = var_labels_for(adam_db$adae, .study$safety_var),
                    medconcept_var = .study$medconcept_var,
                    lbl_medconcept_var = var_labels_for(adam_db$adae, .study$medconcept_var),
                    .study = list(
                      armvar = "ARM",
                      lbl_overall = NULL,
                      safety_var = c("FATAL", "SER", "SERWD", "SERDSM",
                                     "RELSER", "WD", "DSM", "REL", "RELWD", "RELDSM", "SEV"),
                      medconcept_var = c("SMQ01", "SMQ02", "CQ01")
                    )) {

  dbsel <- get_db_data(adam_db, "adsl", "adae")

  lyt <- aet01_2_lyt(
    armvar = armvar,
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

   tbl <- set_decoration(tbl, deco)

   if (prune_0) {
    tbl <- tbl %>% prune_table()
   }

   tbl
}

#' `AET01` Layout 2 (Supplementary)
#'
#' @describeIn aet01_2
#'
#' @inheritParams gen_args
#' @param safety_var (`character`) the safety variables to be summarized.
#' @param lbl_safety_var (`character`) the labels of the safety variables to be summarized.
#' @param medconcept_var (`character`) the medical concept variables to be summarized.
#' @param lbl_medconcept_var (`character`) the label of the medical concept variables to be summarized.
#'
#' @return
#' @export
#'
#' @examples
#' aet01_1_lyt(
#'   armvar = "ACTARM",
#'   lbl_overall = NULL,
#'   deco = std_deco("AET01")
#' )
aet01_2_lyt <- function(armvar = .study$armvar,
                        lbl_overall = .study$lbl_overall,
                        deco = std_deco("AET01"),
                        safety_var = .study$safety_var,
                        lbl_safety_var = .study$lbl_safety_var,
                        medconcept_var = .study$medconcept_var,
                        lbl_medconcept_var = .study$lbl_medconcept_var,
                        .study = list(
                          armvar = "ARM",
                          lbl_overall = NULL,
                          safety_var = c("FATAL", "SER", "SERWD", "SERDSM", "RELSER", "WD", "DSM", "REL",
                                         "RELWD", "RELDSM", "CTC35", "CTC45", "SEV"),
                          lbl_safety_var = c("FATAL", "SER", "SERWD", "SERDSM", "RELSER", "WD", "DSM", "REL",
                                             "RELWD", "RELDSM", "CTC35", "CTC45", "SEV"),
                          medconcept_var = c("SMQ01", "SMQ02", "CQ01"),
                          lbl_medconcept_var = c("SMQ01", "SMQ02", "CQ01")
                        )) {

  names(lbl_safety_var) <- safety_var
  names(lbl_medconcept_var) <- medconcept_var

  lyt_adae <-
    basic_table_deco(deco) %>%
    split_cols_by(var = armvar) %>%
    add_colcounts() %>%
    ifneeded_add_overall_col(lbl_overall) %>%
    summarize_num_patients(
      var = "USUBJID",
      .stats = c("unique", "nonunique"),
      .labels = c(
        unique = "Total number of patients with at least one AE",
        nonunique = "Total number of AEs"
      )
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

  lyt_adsl <-
    basic_table_deco(deco) %>%
    split_cols_by(var = armvar) %>%
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
