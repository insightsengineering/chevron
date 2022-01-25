



#' `CMT02_PT` Table 1 (Default)
#'
#' @inheritParams gen_args
#'
#' @details
#'   * Order by decreasing total number of patients with the specific medication.
#'   * Does not include a total column by default.
#'
#' @return
#' @export
#'
#' @examples
#' library(dm)
#' library(rtables)
#'
#' db <- syn_test_data() %>%
#'   preprocess_data("cmt02_pt_1")
#'
#' cmt02_pt_1(adam_db = db)
#'
cmt02_pt_1 <- function(adam_db,
                       armvar = .study$armvar,
                       prune_0 = TRUE,
                       lbl_overall = .study$lbl_overall,
                       deco = std_deco("CMT02_PT"),
                       .study = list(
                         armvar = "ARM",
                         lbl_overall = "All patients"
                       )) {

  dbsel <- get_db_data(adam_db, "adsl", "adcm")

  lyt <- cmt02_pt_1_lyt(
    armvar = armvar,
    lbl_overall = lbl_overall,
    deco = deco
  )

  tbl <- build_table(lyt, dbsel$adcm, alt_counts_df = dbsel$adsl)

  if (prune_0) {
    tbl <- tbl %>% prune_table()
  }

  tbl %>%
    sort_at_path(
      path =  c("CMDECOD"),
      scorefun = score_occurrences
    )
}


cmt02_pt_1_lyt <- function(armvar = .study$armvar,
                           lbl_overall = .study$lbl_overall,
                           deco = std_deco("CMT02_PT"),
                           .study = list(
                             armvar = "ACTARM",
                             lbl_overall = NULL
                           )) {

  basic_table_deco(deco) %>%
    split_cols_by(var = armvar) %>%
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
    count_occurrences(vars = "CMDECOD", .indent_mods = 0L) %>%
    append_topleft("Other Treatment")
}
