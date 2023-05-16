# lbt04 ----

#' @describeIn lbt04 Main TLG function
#'
#' @inheritParams gen_args
#'
#' @details
#'  * Only count LOW or HIGH values.
#'  * Lab test results with missing `ANRIND` values are excluded.
#'  * Split columns by arm, typically `ACTARM`.
#'  * Does not include a total column by default.
#'
#' @note
#'  * `adam_db` object must contain an `adlb` table with columns `"PARCAT1"`, `"PARCAT2"`, `"PARAM"`, `"ANRIND"`,
#'  and column specified by `arm_var`.
#'
#' @export
#'
lbt04_main <- function(adam_db,
                       arm_var = "ACTARM",
                       ...) {
  assert_all_tablenames(adam_db, c("adsl", "adlb"))
  checkmate::assert_string(arm_var)
  assert_valid_variable(
    adam_db$adlb, c("PARAM", "PARCAT1"),
    types = list("characater", "factor")
  )
  assert_valid_variable(adam_db$adlb, c("AVALCAT1", "ANRIND"), na_ok = TRUE, empty_ok = TRUE, min_chars = 0L)
  assert_valid_variable(adam_db$adlb, c("USUBJID"), types = list(c("character", "factor")), empty_ok = TRUE)
  assert_valid_variable(adam_db$adsl, c("USUBJID"), types = list(c("character", "factor")))
  checkmate::assert_true(
    any(lvls(adam_db$adlb$ANRIND) %in% c("HIGH HIGH", "HIGH", "LOW", "LOW LOW")) || all(is.na(adam_db$adlb$ANRIND))
  )
  assert_valid_var_pair(adam_db$adsl, adam_db$adlb, arm_var)
  lbl_anrind <- var_labels_for(adam_db$adlb, "ANRIND")
  lbl_param <- var_labels_for(adam_db$adlb, "PARAM")

  lyt <- lbt04_lyt(
    arm_var = arm_var,
    var_parcat = "PARCAT1",
    var_param = "PARAM",
    lbl_param = lbl_param,
    var_anrind = "ANRIND",
    lbl_anrind = lbl_anrind
  )

  tbl <- build_table(lyt, adam_db$adlb, alt_counts_df = adam_db$adsl)

  tbl
}

#' `lbt04` Layout
#'
#' @inheritParams gen_args
#'
#' @inheritParams gen_args
#' @param lbl_param (`string`) label of the `PARAM` variable.
#' @param lbl_anrind (`string`) label of the `ANRIND` variable.
#'
#' @keywords internal
#'
lbt04_lyt <- function(arm_var,
                      var_parcat,
                      var_param,
                      lbl_param,
                      var_anrind,
                      lbl_anrind) {
  basic_table(show_colcounts = TRUE) %>%
    split_cols_by(arm_var) %>%
    split_rows_by(
      var_parcat,
      split_fun = drop_split_levels
    ) %>%
    split_rows_by(
      var_param,
      split_fun = drop_split_levels,
      label_pos = "topleft",
      split_label = lbl_param,
      indent_mod = 0L
    ) %>%
    count_abnormal(
      var = var_anrind,
      abnormal = list(Low = c("LOW", "LOW LOW"), High = c("HIGH", "HIGH HIGH")),
      exclude_base_abn = TRUE,
      .formats = list(fraction = format_fraction_fixed_dp)
    ) %>%
    append_topleft(paste("   ", lbl_anrind))
}

#' @describeIn lbt04 Preprocessing
#'
#' @inheritParams gen_args
#'
#' @export
#'
lbt04_pre <- function(adam_db, ...) {
  adam_db$adlb <- adam_db$adlb %>%
    filter(
      .data$ONTRTFL == "Y",
      .data$PARCAT2 == "SI",
      !is.na(.data$ANRIND)
    ) %>%
    mutate(
      PARAM = with_label(.data$PARAM, "Laboratory Test"),
      ANRIND = with_label(.data$ANRIND, "Direction of Abnormality")
    ) %>%
    mutate(
      ANRIND = reformat(
        .data$ANRIND,
        rule(
          "HIGH HIGH" = "HIGH HIGH",
          "HIGH" = "HIGH",
          "LOW" = "LOW",
          "LOW LOW" = "LOW LOW",
          "NORMAL" = "NORMAL"
        )
      )
    )

  adam_db
}

#' @describeIn lbt04 Postprocessing
#'
#' @inheritParams gen_args
#'
#' @export
#'
lbt04_post <- function(tlg, ...) {
  std_postprocess(tlg)
}

#' `LBT04` Laboratory Abnormalities Not Present at Baseline Table.
#'
#' The `LBT04` table provides an
#' overview of laboratory abnormalities not present at baseline.
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' run(lbt04, syn_data)
lbt04 <- chevron_t(
  main = lbt04_main,
  preprocess = lbt04_pre,
  postprocess = lbt04_post,
  adam_datasets = c("adsl", "adlb")
)
