# cmt02_pt_1 ----

#' @describeIn cmt02_pt_1 Main TLG function
#'
#' @inheritParams gen_args
#'
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
cmt02_pt_1_main <- function(adam_db,
                            lyt_ls = list(cmt02_pt_1_lyt),
                            armvar = .study$planarm,
                            prune_0 = TRUE,
                            lbl_overall = .study$lbl_overall,
                            deco = std_deco("CMT02_PT"),
                            .study = list(
                              planarm = "ARM",
                              lbl_overall = NULL
                            ),
                            ...) {
  dbsel <- get_db_data(adam_db, "adsl", "adcm")

  lyt <- lyt_ls[[1]](
    armvar = armvar,
    lbl_overall = lbl_overall,
    deco = deco,
    ... = ...
  )

  tbl <- build_table(lyt, dbsel$adcm, alt_counts_df = dbsel$adsl)

  if (prune_0) {
    tbl <- smart_prune(tbl)
  }

  tbl %>%
    sort_at_path(
      path = c("DOMAIN", "*", "CMDECOD"),
      scorefun = score_occurrences
    )
}

#' @describeIn cmt02_pt_1 Layout
#'
#' @inheritParams gen_args
#' @param ... not used.
#'
#' @export
#'
cmt02_pt_1_lyt <- function(armvar = .study$planarm,
                           lbl_overall = .study$lbl_overall,
                           deco = std_deco("CMT02_PT"),
                           .study = list(
                             planarm = "ARM",
                             lbl_overall = NULL
                           ),
                           ...) {
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
    split_rows_by("DOMAIN", split_fun = drop_split_levels, child_labels = "hidden") %>%
    count_occurrences(vars = "CMDECOD", .indent_mods = 0L) %>%
    append_topleft("Other Treatment")
}

#' @describeIn cmt02_pt_1 Preprocessing
#'
#' @inheritParams gen_args
#' @param ... not used.
#'
#' @export
#'
cmt02_pt_1_pre <- function(adam_db, ...) {
  checkmate::assert_class(adam_db, "dm")

  adam_db <- adam_db %>%
    dm_zoom_to("adcm") %>%
    filter(.data$ANL01FL == "Y") %>%
    mutate(
      CMSEQ = as.factor(.data$CMSEQ),
      DOMAIN = "CM"
    ) %>%
    dm_update_zoomed()

  fmt_ls <- list(
    CMDECOD = list(
      "No Coding available" = c("", NA)
    ),
    CMSEQ = list(
      "<Missing>" = c("", NA)
    )
  )

  new_format <- list(adcm = fmt_ls)

  dunlin::apply_reformat(adam_db, new_format)
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
#' run(cmt02_pt_1, syn_test_data())
cmt02_pt_1 <- chevron_t(
  main = cmt02_pt_1_main,
  lyt = cmt02_pt_1_lyt,
  preprocess = cmt02_pt_1_pre,
  adam_datasets = c("adsl", "adcm")
)
