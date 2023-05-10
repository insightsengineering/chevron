# lbt06 ----

#' @describeIn lbt06 Main TLG function
#'
#' @inheritParams gen_args
#' @param lbl_param (`string`) label of the `PARAM` variable.
#' @param lbl_anrind (`string`) label of the `ANRIND` variable.
#'
#' @details
#'  * Only count LOW or HIGH values.
#'  * Lab test results with missing `ANRIND` values are excluded.
#'  * Split columns by arm, typically `ACTARM`.
#'  * Do include a total column by default.
#'
#' @note
#'  * `adam_db` object must contain an `adlb` table with columns ``,
#'  and column specified by `arm_var`.
#'
#' @export
#'
lbt06_main <- function(adam_db,
                       arm_var = "ACTARM",
                       summaryvars = c("AVISIT", "ANRIND"),
                       paramcd = NULL,
                       lbl_param = "Laboratory Test",
                       lbl_anrind = "Direction of Abnormality",
                       deco = std_deco("LBT06"),
                       ...) {
  lyt <- lbt06_lyt(
    arm_var = arm_var,
    summaryvars = summaryvars,
    paramcd = paramcd,
    lbl_param = lbl_param,
    lbl_anrind = lbl_anrind,
    deco = deco
  )

  tbl <- build_table(lyt, adam_db$adlb, alt_counts_df = adam_db$adsl)

  tbl
}

#' @describeIn lbt06 Layout
#'
#' @inheritParams gen_args
#'
#' @inheritParams gen_args
#' @param lbl_param (`string`) label of the `PARAM` variable.
#' @param lbl_anrind (`string`) label of the `ANRIND` variable.
#'
#' @export internal
#'
lbt06_lyt <- function(arm_var,
                      summaryvars,
                      paramcd,
                      lbl_paramcd,
                      lbl_anrind,
                      deco) {
  basic_table_deco(deco, show_colcounts = TRUE) %>%
    split_cols_by(arm_var) %>%
    ifneeded_split_row(paramcd, lbl_paramcd) %>%
    split_rows_by(
      var = summaryvars[1],
      split_fun = drop_split_levels,
      label_pos = "topleft",
      split_label = paste(lbl_param)
    ) %>%
    count_abnormal_by_baseline(
      var = summaryvars[2],
      abnormal = c(Low = "LOW", High = "HIGH"),
      .indent_mods = 4L
    ) %>%
    append_topleft(paste("   ", lbl_anrind)) %>%
    append_topleft("      Baseline Status")
}

#' @describeIn lbt06 Preprocessing
#'
#' @inheritParams gen_args
#'
#' @export
#'
lbt06_pre <- function(adam_db, arm_var = "ACTARM", summaryvars = c("AVISIT", "ANRIND"),
                      lab_vars = c("ONTRTFL", "PARCAT2", "AVAL"), paramcd = NULL, ...) {
  lbt06_check(adam_db,
    arm_var = arm_var, summaryvars = summaryvars, lab_vars = lab_vars,
    paramcd = paramcd
  )

  new_format <- list(
    adlb = list(
      ANRIND = rule("<Missing>" = c("", NA, "<Missing>")),
      BNRIND = rule("<Missing>" = c("", NA, "<Missing>"))
    )
  )

  adam_db <- dunlin::reformat(adam_db, new_format, na_last = TRUE)

  adam_db$adlb <- adam_db$adlb %>%
    filter(
      .data$ONTRTFL == "Y",
      .data$PARCAT2 == "SI",
      !is.na(.data$AVAL)
    )

  adam_db
}

#' @describeIn lbt06 Checks
#'
#' @inheritParams gen_args
#'
#' @export
lbt06_check <- function(adam_db,
                        arm_var,
                        summaryvars,
                        lab_vars,
                        paramcd,
                        req_tables = c("adsl", "adlb")) {
  assert_all_tablenames(adam_db, req_tables)

  msg <- NULL

  msg <- c(msg, check_all_colnames(adam_db$adlb, c(
    "USUBJID", arm_var, summaryvars, lab_vars,
    paramcd
  )))
  msg <- c(msg, check_all_colnames(adam_db$adsl, c("USUBJID")))

  if (is.null(msg)) {
    TRUE
  } else {
    stop(paste(msg, collapse = "\n  "))
  }
}

#' @describeIn lbt06 Postprocessing
#'
#' @inheritParams gen_args
#'
#' @export
#'
lbt06_post <- function(tlg, prune_0 = FALSE, ...) {
  if (prune_0) {
    tlg <- smart_prune(tlg)
  }
  std_postprocess(tlg)
}

#' `LBT06` Table 1 (Default) Laboratory Abnormalities by Visit and Baseline Status.
#'
#' The `LBT06` table produces the standard laboratory abnormalities by visit and
#' baseline status summary.
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' run(lbt06, syn_data)
#'
#' run(lbt06, syn_data, paramcd = "PARAMCD")
lbt06 <- chevron_t(
  main = lbt06_main,
  preprocess = lbt06_pre,
  postprocess = lbt06_post,
  adam_datasets = c("adsl", "adlb")
)
