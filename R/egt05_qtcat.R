# egt05_qtcat_1 ----

#' @describeIn egt05_qtcat_1 Main TLG function
#'
#' @inheritParams gen_args
#' @param summaryvars (named vector of `character`) variables to be analyzed. Names are used as subtitles. For values
#'   where no name is provided, the label attribute of the corresponding column in `adeg` table of `adam_db` is used.
#' @param visitvar (`string`) typically one of `"AVISIT"` (Default) or `"ATPTN"` depending on the type of time point to
#'   be displayed
#'
#' @details
#'  * The `Analysis Value` column, displays the categories of QT value for patients, "<=450 msec", ">450 to <=480 msec",
#'  ">480 to <= 500 msec", ">500 msec", and "<Missing>" for each visit.
#'  * The `Change from Baseline` column, displays the categories of QT value change from baseline for patients,
#'  "<=30 msec", ">30 to <=60 msec", ">60 msec", and "<Missing>"
#'  * Remove zero-count rows unless overridden with `prune_0 = FALSE`.
#'  * Split columns by arm, typically `ACTARM`.
#'  * Does not include a total column by default.
#'  * Sorted  based on factor level; by chronological time point given by `AVISIT`. Re-level to customize order.
#'
#' @note
#'  * `adam_db` object must contain an `adeg` table with a `"PARAM"` column contains 'QT' as well as columns
#'  specified in `summaryvars` and `visitvar`.
#'
#' @export
#'
egt05_qtcat_1_main <- function(adam_db,
                               armvar = "ACTARM",
                               summaryvars = c("Value at Visit" = "AVALCAT1", "Change from Baseline" = "CHGCAT1"),
                               visitvar = "AVISIT", # or ATPTN
                               deco = std_deco("EGT05_QTCAT"),
                               ...) {
  lbl_avisit <- var_labels_for(adam_db$adeg, visitvar)

  summaryvars_lbls <- get_labels(adam_db$adeg, summaryvars)

  lyt <- egt05_qtcat_1_lyt(
    armvar = armvar,
    summaryvars = summaryvars,
    summaryvars_lbls = summaryvars_lbls,
    visitvar = visitvar,
    lbl_avisit = lbl_avisit,
    deco = deco,
    ... = ...
  )

  tbl <- build_table(
    lyt,
    df = adam_db$adeg,
    alt_counts_df = adam_db$adsl
    )
}

#' @describeIn egt05_qtcat_1 Layout
#'
#' @inheritParams gen_args
#'
#' @param summaryvars (`vector of character`) the variables to be analyzed. `AVALCAT1` and `CHGCAT1` by default.
#' @param summaryvars_lbls (`vector of character`) the label of the variables to be analyzed.
#' @param visitvar (`character`) typically one of `"AVISIT"` (Default) or `"ATPTN"` depending on the type of time point
#'   to be displayed.
#' @param lbl_avisit (`character`) label of the `visitvar` variable.
#' @param ... not used.
#'
#' @export
egt05_qtcat_1_lyt <- function(armvar,
                              summaryvars,
                              summaryvars_lbls,
                              visitvar,
                              lbl_avisit,
                              deco,
                              ...) {
  # TODE solve the problem of the overall column
  # remove change from baseline in BASELINE

  basic_table_deco(deco) %>%
    split_cols_by(armvar) %>%
    add_colcounts() %>%
    split_rows_by(
      visitvar,
      split_fun = drop_split_levels,
      label_pos = "hidden",
      split_label = lbl_avisit
    ) %>%
    summarize_vars(
      vars = summaryvars,
      var_labels = summaryvars_lbls
    ) %>%
    append_topleft("  Category")
}

#' @describeIn egt05_qtcat_1 Preprocessing
#'
#' @inheritParams gen_args
#' @param ... not used.
#'
#' @export
#'
egt05_qtcat_1_pre <- function(adam_db, ...) {
  checkmate::assert_class(adam_db, "dm")

  adam_db %>%
    dm_zoom_to("adeg") %>%
    filter(
      ANL01FL == "Y",
      PARAMCD == "QT"
      ) %>%
    mutate(
      AVALCAT1 = case_when(
        AVAL <= 450 ~ "<=450 msec",
        AVAL <= 480 ~ ">450 to <=480 msec",
        AVAL <= 500 ~ ">480 to <= 500 msec",
        AVAL > 500 ~ ">500 msec",
        is.na(AVAL) ~ "<Missing>"
        ),
      CHGCAT1 = case_when(
        CHG <= 30 ~ "<=30 msec",
        CHG <= 60 ~ ">30 to <=60 msec",
        CHG > 60 ~ ">60 msec",
        is.na(CHG) ~ "<Missing>"
        )
      ) %>%
    mutate(
      AVALCAT1 = factor(
        AVALCAT1,
        levels = c(
          "<=450 msec",
          ">450 to <=480 msec",
          ">480 to <= 500 msec",
          ">500 msec",
          "<Missing>"
          )
        ),
      CHGCAT1 = factor(
        CHGCAT1,
        levels = c(
          "<=30 msec",
          ">30 to <=60 msec",
          ">60 msec",
          "<Missing>"
          )
        )
      ) %>%
    dm_update_zoomed()
  }

#' @describeIn egt05_qtcat_1 Postprocessing
#'
#' @inheritParams gen_args
#' @param ... not used.
#'
#' @export
egt05_qtcat_1_post <- function(tlg, prune_0 = TRUE, ...) {
  if (prune_0) tlg <- smart_prune(tlg)

  std_postprocess(tlg)
}

#' `EGT05_QTCAT` Table 1 (Default) ECG Actual Values and Changes from Baseline by Visit Table 1.
#'
#' The `EGT05_QTCAT` table 1 summarizes
#' several electrocardiogram parameters and their evolution throughout the study.
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' db <- syn_data
#' run(egt05_qtcat_1, db)
#' run(egt05_qtcat_1, db, summaryvars = c("AVALCAT1", "Change" = "CHGCAT1"))
egt05_qtcat_1 <- chevron_t(
  main = egt05_qtcat_1_main,
  preprocess = egt05_qtcat_1_pre,
  postprocess = egt05_qtcat_1_post,
  adam_datasets = c("adeg")
)
