# egt03_1 ----
#' @describeIn egt03_1 Main TLG function
#'
#' @param armvar (`vector of character`) the arm variables used for row split, typically `"ARMCD"`.
#' @param summaryvar (named vector of `character`) variables to be analyzed, typically `"BNRIND"`. Names are used as
#' subtitles. For values
#'   where no name is provided, the label attribute of the corresponding column in `adeg` table of `adam_db` is used.
#' @param splitvar (named vector of `character`) variables to be analyzed, typically `"BNRIND"`. Names are used as
#' subtitles. For values
#'   where no name is provided, the label attribute of the corresponding column in `adeg` table of `adam_db` is used.
#'
#' @details
#'  * ADEG data are subsetted to contain only "POST-BASELINE MINIMUM" visit
#'  * the number of patients by baseline assessment and minimum post-baseline assessment.
#'  * Percentages are based on the total number of patients in a treatment group.
#'  * Split columns by Analysis Reference Range Indicator, typically `ANRIND`.
#'  * Does not include a total column by default.
#'  * Sorted  based on factor level.
#'
#' @note
#'  * `adam_db` object must contain an `adeg` table with a `"ARMCD"` column as well as columns specified in
#'  `summaryvar` and `splitvar`.
#'
#' @export
#'
egt03_1_main <- function(adam_db,
                         armvar = "ARMCD",
                         summaryvar = c("Baseline Reference Range Indicator" = "BNRIND"),
                         splitvar = c("Analysis Reference Range Indicator" = "ANRIND"),
                         deco = std_deco("EGT03"),
                         ...) {
  lbl_armvar <- var_labels_for(adam_db$adeg, armvar)
  lbl_summaryvars <- get_labels(adam_db$adeg, summaryvar)
  lbl_splitvar <- get_labels(adam_db$adeg, splitvar)

  lyt <- egt03_1_lyt(
    armvar = armvar,
    splitvar = splitvar,
    summaryvar = summaryvar,
    lbl_armvar = lbl_armvar,
    lbl_splitvar = lbl_splitvar,
    lbl_summaryvars = lbl_summaryvars,
    deco = deco,
    ... = ...
  )

  tbl <- build_table(
    lyt,
    df = adam_db$adeg
  )

  return(tbl)
}


#' @describeIn egt03_1 Layout
#'
#' @inheritParams gen_args
#'
#' @param lbl_armvar (`character`) label of the `armvar` variable.
#' @param lbl_splitvar (`character`) label of the `splitvar` variable.
#' @param lbl_summaryvars (`character`) label of the `summaryvar` variable.
#' @param ... not used.
#'
#' @export
egt03_1_lyt <- function(armvar,
                        splitvar,
                        summaryvar,
                        lbl_armvar,
                        lbl_splitvar,
                        lbl_summaryvars,
                        deco,
                        ...) {
  indent <- 1L
  space <- paste(rep(" ", indent * 2), collapse = "")
  lbl_summaryvars <- paste0(space, lbl_summaryvars)

  basic_table_deco(deco) %>%
    split_cols_by("min_label") %>%
    split_cols_by(splitvar) %>%
    split_rows_by(armvar,
      split_fun = drop_split_levels,
      label_pos = "topleft",
      split_label = lbl_armvar
    ) %>%
    add_rowcounts() %>%
    summarize_vars(summaryvar, denom = "N_row", .stats = "count_fraction") %>%
    append_topleft(lbl_summaryvars)
}

#' @describeIn egt03_1 Checks
#'
#' @inheritParams gen_args
#' @param visitvar Analysis Visit variable, `AVISIT` by default
#' @param ... not used.
#'
egt03_1_check <- function(adam_db,
                          req_tables = c("adeg"),
                          visitvar = "AVISIT",
                          ...) {
  assert_all_tablenames(adam_db, req_tables)
  msg <- NULL

  adeg_layout_col <- "USUBJID"

  msg <- c(msg, check_all_colnames(adam_db$adeg, c(adeg_layout_col, visitvar)))

  if (is.null(msg)) {
    TRUE
  } else {
    stop(paste(msg))
  }
  checkmate::assert_true(c("POST-BASELINE MINIMUM") %in% adam_db$adeg$AVISIT)
  checkmate::assert_true(c("HR") %in% adam_db$adeg$PARAMCD)
}

#' @describeIn egt03_1 Preprocessing
#'
#' @inheritParams gen_args
#' @param ... not used.
#'
#' @export
#'
egt03_1_pre <- function(adam_db, ...) {
  checkmate::assert_class(adam_db, "dm")
  egt03_1_check(adam_db, ...)
  adam_db %>%
    dm_zoom_to("adeg") %>%
    filter(
      PARAMCD == "HR" & # Heart Rate
        SAFFL == "Y" & # "Safety Population Flag"
        ONTRTFL == "Y" & # "On Treatment Record Flag"
        AVISIT == "POST-BASELINE MINIMUM" # "Analysis Visit"
    ) %>%
    mutate(min_label = "Minimum Post-Baseline Assessment") %>%
    mutate(BNRIND = factor(
      BNRIND,
      levels = c("LOW", "NORMAL", "HIGH", "Missing"),
      labels = c("LOW", "NORMAL", "HIGH", "Missing")
    )) %>%
    mutate(ANRIND = factor(
      ANRIND,
      levels = c("LOW", "NORMAL", "HIGH", "Missing"),
      labels = c("LOW", "NORMAL", "HIGH", "Missing")
    )) %>%
    dm_update_zoomed()
}

#' @describeIn egt03_1 Postprocessing
#'
#' @inheritParams gen_args
#' @param ... not used.
#'
#' @export
egt03_1_post <- function(tlg, prune_0 = FALSE, ...) {
  if (prune_0) tlg <- smart_prune(tlg)

  std_postprocess(tlg)
}

#' `EGT03` Table 1 (Default) Shift Table of ECG Interval Data - Baseline versus Minimum Post-Baseline
#'
#' The `EGT03` Table entries provide the number of patients by baseline assessment and minimum post-baseline
#' assessment. Percentages are based on the total number of patients in a treatment group. Baseline is the
#' patient's last observation prior to initiation of study drug.
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' db <- syn_data
#' run(egt03_1, db)
egt03_1 <- chevron_t(
  main = egt03_1_main,
  preprocess = egt03_1_pre,
  postprocess = egt03_1_post,
  adam_datasets = c("adeg")
)


# egt03_2 ----
#' @describeIn egt03_2 Main TLG function
#'
#' @inheritParams gen_args
#' @param armvar (`vector of character`) the arm variables used for row split, typically `"ARMCD"`.
#' @param summaryvar (named vector of `character`) variables to be analyzed, typically `"BNRIND"`. Names are used as
#' subtitles. For values
#'   where no name is provided, the label attribute of the corresponding column in `adeg` table of `adam_db` is used.
#' @param splitvar (named vector of `character`) variables to be analyzed, typically `"BNRIND"`. Names are used as
#' subtitles. For values
#'   where no name is provided, the label attribute of the corresponding column in `adeg` table of `adam_db` is used.
#'
#' @details
#'  * ADEG data are subsetted to contain only "POST-BASELINE MAXIMUM" visit
#'  * the number of patients by baseline assessment and maximum post-baseline assessment.
#'  * Percentages are based on the total number of patients in a treatment group.
#'  * Split columns by Analysis Reference Range Indicator, typically `ANRIND`.
#'  * Does not include a total column by default.
#'  * Sorted  based on factor level.
#'
#' @note
#'  * `adam_db` object must contain an `adeg` table with a `"ARMCD"` column as well as columns specified in
#'  `summaryvar` and `splitvar`.
#'
#' @export
#'
egt03_2_main <- function(adam_db,
                         armvar = "ARMCD",
                         summaryvar = c("Baseline Reference Range Indicator" = "BNRIND"),
                         splitvar = c("Analysis Reference Range Indicator" = "ANRIND"),
                         deco = std_deco("EGT03"),
                         ...) {
  lbl_armvar <- var_labels_for(adam_db$adeg, armvar)
  lbl_summaryvars <- get_labels(adam_db$adeg, summaryvar)
  lbl_splitvar <- get_labels(adam_db$adeg, splitvar)

  lyt <- egt03_2_lyt(
    armvar = armvar,
    splitvar = splitvar,
    summaryvar = summaryvar,
    lbl_armvar = lbl_armvar,
    lbl_splitvar = lbl_splitvar,
    lbl_summaryvars = lbl_summaryvars,
    deco = deco,
    ... = ...
  )

  tbl <- build_table(
    lyt,
    df = adam_db$adeg
  )

  return(tbl)
}


#' @describeIn egt03_2 Layout
#'
#' @inheritParams gen_args
#'
#' @param lbl_armvar (`character`) label of the `armvar` variable.
#' @param lbl_splitvar (`character`) label of the `splitvar` variable.
#' @param lbl_summaryvars (`character`) label of the `summaryvar` variable.
#' @param ... not used.
#'
#' @export
egt03_2_lyt <- function(armvar,
                        splitvar,
                        summaryvar,
                        lbl_armvar,
                        lbl_splitvar,
                        lbl_summaryvars,
                        deco,
                        ...) {
  indent <- 1L
  space <- paste(rep(" ", indent * 2), collapse = "")
  lbl_summaryvars <- paste0(space, lbl_summaryvars)

  basic_table_deco(deco) %>%
    split_cols_by("max_label") %>%
    split_cols_by(splitvar) %>%
    split_rows_by(armvar,
      split_fun = drop_split_levels,
      label_pos = "topleft",
      split_label = lbl_armvar
    ) %>%
    add_rowcounts() %>%
    summarize_vars(summaryvar, denom = "N_row", .stats = "count_fraction") %>%
    append_topleft(lbl_summaryvars)
}

#' @describeIn egt03_2 Checks
#'
#' @inheritParams gen_args
#' @param visitvar Analysis Visit variable, `AVISIT` by default
#' @param ... not used.
#'
egt03_2_check <- function(adam_db,
                          req_tables = c("adeg"),
                          visitvar = "AVISIT",
                          ...) {
  assert_all_tablenames(adam_db, req_tables)
  msg <- NULL

  adeg_layout_col <- "USUBJID"

  msg <- c(msg, check_all_colnames(adam_db$adeg, c(adeg_layout_col, visitvar)))

  if (is.null(msg)) {
    TRUE
  } else {
    stop(paste(msg))
  }
  checkmate::assert_true(c("POST-BASELINE MAXIMUM") %in% adam_db$adeg$AVISIT)
  checkmate::assert_true(c("HR") %in% adam_db$adeg$PARAMCD)
}

#' @describeIn egt03_2 Preprocessing
#'
#' @inheritParams gen_args
#' @param ... not used.
#'
#' @export
#'
egt03_2_pre <- function(adam_db, ...) {
  checkmate::assert_class(adam_db, "dm")
  egt03_2_check(adam_db, ...)

  adam_db %>%
    dm_zoom_to("adeg") %>%
    filter(
      PARAMCD == "HR" & # Heart Rate
        SAFFL == "Y" & # "Safety Population Flag"
        ONTRTFL == "Y" & # "On Treatment Record Flag"
        AVISIT == "POST-BASELINE MAXIMUM" # "Analysis Visit"
    ) %>%
    mutate(max_label = "Maximum Post-Baseline Assessment") %>%
    mutate(BNRIND = factor(
      BNRIND,
      levels = c("LOW", "NORMAL", "HIGH", "Missing"),
      labels = c("LOW", "NORMAL", "HIGH", "Missing")
    )) %>%
    mutate(ANRIND = factor(
      ANRIND,
      levels = c("LOW", "NORMAL", "HIGH", "Missing"),
      labels = c("LOW", "NORMAL", "HIGH", "Missing")
    )) %>%
    dm_update_zoomed()
}

#' @describeIn egt03_2 Postprocessing
#'
#' @inheritParams gen_args
#' @param ... not used.
#'
#' @export
egt03_2_post <- function(tlg, prune_0 = FALSE, ...) {
  if (prune_0) tlg <- smart_prune(tlg)

  std_postprocess(tlg)
}

#' `EGT03` Table 2 Shift Table of ECG Interval Data - Baseline versus Maximum Post-Baseline
#'
#' The `EGT03` Table entries provide the number of patients by baseline assessment and maximum post-baseline
#' assessment. Percentages are based on the total number of patients in a treatment group. Baseline is the
#' patient's last observation prior to initiation of study drug.
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' db <- syn_data
#' run(egt03_2, db)
egt03_2 <- chevron_t(
  main = egt03_2_main,
  preprocess = egt03_2_pre,
  postprocess = egt03_2_post,
  adam_datasets = c("adeg")
)
