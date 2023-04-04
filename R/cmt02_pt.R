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
                            arm_var = "ARM",
                            lbl_overall = NULL,
                            deco = std_deco("CMT02_PT"),
                            ...) {
  dbsel <- get_db_data(adam_db, "adsl", "adcm")

  lyt <- cmt02_pt_1_lyt(
    arm_var = arm_var,
    lbl_overall = lbl_overall,
    deco = deco
  )

  tbl <- build_table(lyt, dbsel$adcm, alt_counts_df = dbsel$adsl)

  tbl
}

#' @describeIn cmt02_pt_1 Layout
#'
#' @inheritParams gen_args
#'
#' @export
#'
cmt02_pt_1_lyt <- function(arm_var,
                           lbl_overall,
                           deco) {
  basic_table_deco(deco) %>%
    split_cols_by(var = arm_var) %>%
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
#'
#' @export
#'
cmt02_pt_1_pre <- function(adam_db, ...) {
  assert_all_tablenames(adam_db, c("adsl", "adcm"))

  adam_db$adcm <- adam_db$adcm %>%
    filter(.data$ANL01FL == "Y") %>%
    mutate(
      DOMAIN = "CM",
      CMSEQ = as.character(CMSEQ)
    )

  fmt_ls <- list(
    CMDECOD = rule(
      "No Coding available" = c("", NA)
    ),
    CMSEQ = rule(
      "<Missing>" = c("", NA)
    )
  )

  new_format <- list(adcm = fmt_ls)

  dunlin::reformat(adam_db, new_format, na_last = TRUE)
}

#' @describeIn cmt02_pt_1 Postprocessing
#'
#' @inheritParams gen_args
#'
#' @export
#'
cmt02_pt_1_post <- function(tlg, prune_0 = TRUE, ...) {
  if (prune_0) {
    tlg <- smart_prune(tlg)
  }

  tlg %>%
    sort_at_path(
      path = c("DOMAIN", "*", "CMDECOD"),
      scorefun = score_occurrences
    ) %>%
    std_postprocess()
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
#' run(cmt02_pt_1, syn_data)
cmt02_pt_1 <- chevron_t(
  main = cmt02_pt_1_main,
  lyt = cmt02_pt_1_lyt,
  preprocess = cmt02_pt_1_pre,
  postprocess = cmt02_pt_1_post,
  adam_datasets = c("adsl", "adcm")
)
