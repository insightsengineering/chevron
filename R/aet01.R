

#' `AET01` Table 1 (Default)
#'
#'
#' @inheritParams gen_args
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
#'   preprocess_data("aet01_1")
#'
#' aet01_1(db, armvar = "ARM")
#'
aet01_1 <- function(adam_db,
                    armvar = .study$armvar,
                    lbl_overall = .study$lbl_overall,
                    prune_0 = TRUE,
                    deco = std_deco("AET01"),
                    safety_var = .study$safety_var,
                    lbl_safety_var = var_labels_for(adam_db$adae, .study$safety_var),
                    .study = list(
                      armvar = "ARM",
                      lbl_overall = NULL,
                      safety_var = c("FATAL", "SER", "SERWD", "SERDSM",
                                     "RELSER", "WD", "DSM", "REL", "RELWD", "RELDSM", "CTC35")
                    )) {

  dbsel <- get_db_data(adam_db, "adsl", "adae")

  lyt <- aet01_1_lyt(
    armvar = armvar,
    lbl_overall = lbl_overall,
    deco = deco,
    safety_var = safety_var,
    lbl_safety_var = lbl_safety_var
  )

   tbl <- build_table(lyt, dbsel$adae, alt_counts_df = dbsel$adsl)

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
                                         "RELWD", "RELDSM", "CTC35", "CTC45", "SEV", "SMQ01", "SMQ02", "CQ01"),
                          lbl_safety_var = c("FATAL", "SER", "SERWD", "SERDSM", "RELSER", "WD", "DSM", "REL",
                                             "RELWD", "RELDSM", "CTC35", "CTC45", "SEV", "SMQ01", "SMQ02", "CQ01")
                        )) {

  names(lbl_safety_var) <- safety_var

  basic_table_deco(deco) %>%
    split_cols_by(var = armvar) %>%
    add_colcounts() %>%
    ifneeded_add_overall_col(lbl_overall) %>%
    summarize_num_patients(
      var = "USUBJID",
      .stats = c("unique", "nonunique"),
      .labels = c(
        unique = "  Total number of patients with at least one adverse event",
        nonunique = "  Total number of events"
      )
    ) %>%
    count_patients_with_event(
      "USUBJID",
      filters = c("DTHFL" = "Y"),
      denom = "N_col",
      .labels = c(count_fraction = "Total number of deaths"),
      table_names = "TotDeath",
      .indent_mods = 0L
    ) %>%
    count_patients_with_event(
      "USUBJID",
      filters = c("DCSREAS" = "ADVERSE EVENT"),
      denom = "N_col",
      .labels = c(count_fraction = "Total number of patients withdrawn from study due to an AE"),
      table_names = "TotWithdrawal",
      .indent_mods = 0L
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
}
