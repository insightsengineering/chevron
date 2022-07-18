
#' `CMT02_PT` Table 1 (Default) Concomitant Medications by Preferred Name.
#'
#' A concomitant medication table with the
#' number of subjects and the total number of treatments by medication name sorted by frequencies.
#'
#' @inheritParams gen_args
#'
#' @details
#'  * Data should be filtered for concomitant medication. `(ATIREL == "CONCOMITANT")`.
#'  * Order by decreasing total number of patients with the specific medication.
#'  * Does not include a total column by default.
#'
#' @export
#'
#' @examples
#' library(dm)
#'
#' db <- syn_test_data() %>%
#'   dm_zoom_to("adcm") %>%
#'   filter(.data$ATIREL == "CONCOMITANT") %>%
#'   dm_update_zoomed() %>%
#'   cmt02_pt_1_pre()
#'
#' cmt02_pt_1_main(adam_db = db)
cmt02_pt_1_main <- function(adam_db,
                            armvar = .study$planarm,
                            prune_0 = TRUE,
                            lbl_overall = .study$lbl_overall,
                            deco = std_deco("CMT02_PT"),
                            .study = list(
                              planarm = "ARM",
                              lbl_overall = NULL
                            )) {
  dbsel <- get_db_data(adam_db, "adsl", "adcm")

  lyt <- cmt02_pt_1_lyt(
    armvar = armvar,
    lbl_overall = lbl_overall,
    deco = deco
  )

  tbl <- build_table(lyt, dbsel$adcm, alt_counts_df = dbsel$adsl)

  if (prune_0) {
    tbl <- prune_table(tbl)
  }

  tbl %>%
    sort_at_path(
      path = c("CMDECOD"),
      scorefun = score_occurrences
    )
}

#' @describeIn cmt02_pt_1_main `cmt02_pt_1` Layout
#'
#' @inheritParams gen_args
#'
#' @export
#'
#' @examples
#' cmt02_pt_1_lyt(
#'   armvar = "ACTARM",
#'   lbl_overall = NULL
#' )
cmt02_pt_1_lyt <- function(armvar = .study$planarm,
                           lbl_overall = .study$lbl_overall,
                           deco = std_deco("CMT02_PT"),
                           .study = list(
                             planarm = "ARM",
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

#' @describeIn cmt02_pt_1_main `cmt02_pt_1` Preprocessing
#'
#' @inheritParams gen_args
#' @param ... not used.
#'
#' @export
#'
#' @examples
#' syn_test_data() %>%
#'   cmt02_pt_1_pre()
cmt02_pt_1_pre <- function(adam_db, ...) {
  checkmate::assert_class(adam_db, "dm")

  adam_db %>%
    dm_zoom_to("adcm") %>%
    filter(.data$ANL01FL == "Y") %>%
    dm_update_zoomed() %>%
    dm_zoom_to("adcm") %>%
    mutate(CMSEQ = as.factor(.data$CMSEQ)) %>%
    dm_update_zoomed()
}

# `CMT02_PT_1` `chevron_tlg` ----

#' `CMT02_PT_1`
#'
#' @seealso [cmt02_pt_1_main()]
#' @rdname chevron_tlg-class
#' @export
cmt02_pt_1 <- chevron_tlg(cmt02_pt_1_main, cmt02_pt_1_pre, adam_datasets = c("adsl", "adcm"))
