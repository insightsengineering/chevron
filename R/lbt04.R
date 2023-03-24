# lbt04_1 ----

#' @describeIn lbt04_1 Main TLG function
#'
#' @inheritParams gen_args
#' @param lbl_param (`character`) label of the `PARAM` variable.
#' @param lbl_anrind (`character`) label of the `ANRIND` variable.
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
lbt04_1_main <- function(adam_db,
                         arm_var = "ACTARM",
                         lbl_param = "Laboratory Test",
                         lbl_anrind = "Direction of Abnormality",
                         deco = std_deco("LBT04"),
                         ...) {
  lyt <- lbt04_1_lyt(
    arm_var = arm_var,
    lbl_param = lbl_param,
    lbl_anrind = lbl_anrind,
    deco = deco
  )

  tbl <- build_table(lyt, adam_db$adlb, alt_counts_df = adam_db$adsl)

  tbl
}

#' @describeIn lbt04_1 Layout
#'
#' @inheritParams gen_args
#'
#' @inheritParams gen_args
#' @param lbl_param (`character`) label of the `PARAM` variable.
#' @param lbl_anrind (`character`) label of the `ANRIND` variable.
#'
#' @export
#'
lbt04_1_lyt <- function(arm_var,
                        lbl_param,
                        lbl_anrind,
                        deco) {
  basic_table_deco(deco, show_colcounts = TRUE) %>%
    split_cols_by(arm_var) %>%
    split_rows_by("PARCAT1") %>%
    split_rows_by(
      "PARAM",
      split_fun = drop_split_levels,
      label_pos = "topleft",
      split_label = paste(lbl_param),
      indent_mod = 0L
    ) %>%
    count_abnormal(
      var = "ANRIND",
      abnormal = list(Low = c("LOW", "LOW LOW"), High = c("HIGH", "HIGH HIGH")),
      exclude_base_abn = TRUE,
      .formats = list(fraction = format_fraction_fixed_dp)
    ) %>%
    append_topleft(paste("   ", lbl_anrind))
}

#' @describeIn lbt04_1 Preprocessing
#'
#' @inheritParams gen_args
#'
#' @export
#'
lbt04_1_pre <- function(adam_db, req_tables = c("adsl", "adlb"), arm_var = "ACTARM", ...) {
  checkmate::assert_class(adam_db, "dm")

  lbt04_1_check(adam_db, req_tables = req_tables, arm_var = arm_var)

  new_format <- list(
    adlb = list(
      ANRIND = rule("<Missing>" = c("", NA, "<Missing>"))
    )
  )

  adam_db <- dunlin::reformat(adam_db, new_format, na_last = TRUE)

  adam_db %>%
    dm_zoom_to("adlb") %>%
    filter(
      .data$ONTRTFL == "Y",
      .data$PARCAT2 == "SI",
      .data$ANRIND != "<Missing>"
    ) %>%
    dm_update_zoomed()
}

#' @describeIn lbt04_1 Checks
#'
#' @inheritParams gen_args
#'
lbt04_1_check <- function(adam_db,
                          req_tables = c("adsl", "adlb"),
                          arm_var = "ACTARM") {
  assert_all_tablenames(adam_db, req_tables)

  msg <- NULL

  adlb_layout_col <- c("USUBJID", "ONTRTFL", "PARCAT1", "PARCAT2", "PARAM", "ANRIND")
  adsl_layout_col <- c("USUBJID")

  msg <- c(msg, check_all_colnames(adam_db$adlb, c(arm_var, adlb_layout_col)))
  msg <- c(msg, check_all_colnames(adam_db$adsl, c(adsl_layout_col)))

  if (is.null(msg)) {
    TRUE
  } else {
    stop(paste(msg, collapse = "\n  "))
  }
}

#' @describeIn lbt04_1 Postprocessing
#'
#' @inheritParams gen_args
#'
#' @export
#'
lbt04_1_post <- function(tlg, ...) {
  std_postprocess(tlg)
}

#' `LBT04` Table 1 (Default) Laboratory Abnormalities Not Present at Baseline.
#'
#' The `LBT04` table provides an
#' overview of laboratory abnormalities not present at baseline.
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' run(lbt04_1, syn_data)
lbt04_1 <- chevron_t(
  main = lbt04_1_main,
  preprocess = lbt04_1_pre,
  postprocess = lbt04_1_post,
  adam_datasets = c("adsl", "adlb")
)
