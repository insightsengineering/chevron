# lbt08_1 ----

#' @describeIn lbt08_1 Main TLG function
#'
#' @inheritParams gen_args
#' @param lbl_param (`character`) label of the `PARAM` variable.
#' @param lbl_grade (`character`) label of the `GRADDR` variable;
#' directionality of the grade derived from the `PARAMCD` variable.
#'
#' @details
#'  * Split columns by arm, typically `ARMCD`.
#'  * Baseline grade variable described by `BTOXGR`.
#'  * Patient counts of Laboratory Events (Worsen by Baseline) by Highest Grade
#'  Post-Baseline flags described by `WGRLOFL` (ie. "LOW") and `WGRHIFL`(ie. "HIGH").
#'
#' @note
#'  * `adam_db` object must contain an `adlb` table with columns `"ONTRTFL"`,
#'  `"PARAMCD"`, `"ATOXGR"`, `WGRLOFL`, `WGRHIFL`, and column specified by `armvar`.
#'
#' @export
#'
lbt08_1_main <- function(adam_db,
                         armvar = "ARMCD",
                         lbl_param = "Laboratory Test",
                         lbl_grade = "Direction of Abnormality",
                         deco = std_deco("LBT08"),
                         ...) {
  lyt <- lbt08_1_lyt(
    armvar = armvar,
    lbl_param = lbl_param,
    lbl_grade = lbl_grade,
    deco = deco,
    ... = ...
  )

  tbl <- build_table(lyt, adam_db$adlb, alt_counts_df = adam_db$adsl)

  tbl
}

#' @describeIn lbt08_1 Layout
#'
#' @inheritParams gen_args
#'
#' @inheritParams gen_args
#' @param lbl_param (`character`) label of the `PARAMCD` variable.
#' @param lbl_grade (`character`) label of the `GRADDR` variable.
#' @param ... not used.
#'
#' @export
#'
lbt08_1_lyt <- function(armvar,
                        lbl_param,
                        lbl_grade,
                        deco,
                        ...) {
  basic_table_deco(deco, show_colcounts = TRUE) %>%
    split_cols_by(armvar) %>%
    split_rows_by(
      "PARAMCD",
      label_pos = "topleft",
      split_label = lbl_param,
      split_fun = drop_split_levels
    ) %>%
    split_rows_by(
      "GRADDR",
      label_pos = "topleft",
      split_label = lbl_grade
    ) %>%
    count_abnormal_lab_worsen_by_baseline(
      var = "ATOXGR",
      variables = list(
        id = "USUBJID",
        baseline_var = "BTOXGR",
        direction_var = "GRADDR"
        )
      ) %>%
    append_topleft(paste("   ", "    Highest NCI CTCAE Grade"))
}

#' @describeIn lbt08_1 Preprocessing
#'
#' @inheritParams gen_args
#' @param ... not used.
#'
#' @export
#'
lbt08_1_pre <- function(adam_db, ...) {
  checkmate::assert_class(adam_db, "dm")

  new_format <- list(
    adlb = list(
      PARAMCD = list(
        "No Coding available" = c("", NA, "<Missing>")
      )
    )
  )

  adam_db <- dunlin::apply_reformat(adam_db, new_format)


  adsl <- adam_db$adsl
  db <- adam_db$adlb %>%
    mutate(
      GRADDR = case_when(
        .data$PARAMCD == "ALT" ~ "B",
        .data$PARAMCD == "CRP" ~ "H",
        .data$PARAMCD == "IGA" ~ "L"
      )
    ) %>%
    filter(.data$ATOXGR != "" & .data$ONTRTFL == "Y" & .data$GRADDR != "" & .data$SAFFL != "")

  df <- h_adlb_worsen(
    db,
    worst_flag_low = c("WGRLOFL" = "Y"),
    worst_flag_high = c("WGRHIFL" = "Y"),
    direction_var = "GRADDR"
  )

  adam_db <- dm::dm(adlb = df, adsl)
}

#' @describeIn lbt08_1 Postprocessing
#'
#' @inheritParams gen_args
#' @param ... not used.
#'
#' @export
#'
lbt08_1_post <- function(tlg, ...) {
  std_postprocess(tlg)
}

#' `LBT08` Table 1 Laboratory Events (Worsened from Baseline) by Highest NCI CTCAE Grade Post-Baseline
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' run(lbt08_1, syn_data)
lbt08_1 <- chevron_t(
  main = lbt08_1_main,
  preprocess = lbt08_1_pre,
  postprocess = lbt08_1_post,
  adam_datasets = c("adlb", "adsl")
)
