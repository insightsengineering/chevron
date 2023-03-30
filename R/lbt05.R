# lbt05_1 ----

#' @describeIn lbt05_1 Main TLG function
#'
#' @inheritParams gen_args
#' @param lbl_param (`string`) label of the `PARAM` variable.
#' @param lbl_anrind (`string`) label of the `ANRIND` variable.
#'
#' @details
#'  * Does not remove rows with zero counts by default.
#'  * Lab test results with missing `AVAL` values are excluded.
#'  * Split columns by arm, typically `ACTARM`.
#'
#' @note
#'  * `adam_db` object must contain an `adlb` table with columns `"ONTRTFL"`, `"PARCAT2"`, `"PARAM"`, `"ANRIND"`,
#'  `"AVALCAT1"`, and column specified by `arm_var`.
#'
#' @export
#'
lbt05_1_main <- function(adam_db,
                         arm_var = "ACTARM",
                         lbl_overall = NULL,
                         lbl_param = "Laboratory Test",
                         lbl_anrind = "Direction of Abnormality",
                         deco = std_deco("LBT05"),
                         ...) {
  map <- expand.grid(
    PARAM = levels(adam_db$adlb$PARAM),
    abn_dir = c("Low", "High"),
    stringsAsFactors = FALSE
  ) %>%
    arrange(.data$PARAM, desc(.data$abn_dir))

  lyt <- lbt05_1_lyt(
    arm_var = arm_var,
    lbl_overall = lbl_overall,
    lbl_param = lbl_param,
    lbl_anrind = lbl_anrind,
    map = map,
    deco = deco
  )

  tbl <- build_table(lyt, adam_db$adlb, alt_counts_df = adam_db$adsl)

  tbl
}

#' @describeIn lbt05_1 Layout
#'
#' @inheritParams gen_args
#'
#' @inheritParams gen_args
#' @param lbl_param (`string`) label of the `PARAM` variable.
#' @param lbl_anrind (`string`) label of the `ANRIND` variable.
#' @param map (`data.frame`) mapping of `PARAM`s to directions of abnormality.
#'
#' @export
#'
lbt05_1_lyt <- function(arm_var,
                        lbl_overall,
                        lbl_param,
                        lbl_anrind,
                        map,
                        deco) {
  basic_table_deco(deco, show_colcounts = TRUE) %>%
    split_cols_by(arm_var) %>%
    ifneeded_add_overall_col(lbl_overall) %>%
    split_rows_by(
      "PARAM",
      label_pos = "topleft",
      split_label = lbl_param
    ) %>%
    summarize_num_patients(var = "USUBJID", .stats = "unique_count") %>%
    split_rows_by("abn_dir", split_fun = trim_levels_to_map(map)) %>%
    count_abnormal_by_marked(
      var = "AVALCAT1",
      variables = list(id = "USUBJID", param = "PARAM", direction = "abn_dir"),
      .formats = c("count_fraction" = format_count_fraction_fixed_dp)
    ) %>%
    append_topleft(paste("   ", lbl_anrind))
}

#' @describeIn lbt05_1 Preprocessing
#'
#' @inheritParams gen_args
#'
#' @export
#'
lbt05_1_pre <- function(adam_db, arm_var = "ACTARM", ...) {

  lbt05_1_check(adam_db, arm_var = arm_var, req_tables = "adlb")

adam_db$adlb <- adam_db$adlb %>%
    filter(
      .data$ONTRTFL == "Y",
      .data$PARCAT2 == "LS",
      !is.na(.data$AVAL)
    ) %>%
    mutate(abn_dir = factor(case_when(
      ANRIND == "LOW LOW" ~ "Low",
      ANRIND == "HIGH HIGH" ~ "High",
      TRUE ~ ""
    ), levels = c("Low", "High")))

  missing_rule <- rule("<Missing>" = c("", NA, "<Missing>", "No Coding Available"))

  new_format <- list(
    adlb = list(
      AVALCAT1 = missing_rule,
      abn_dir = missing_rule
    )
  )

  dunlin::reformat(adam_db, new_format, na_last = TRUE)
}

#' @describeIn lbt05_1 Checks
#'
#' @inheritParams gen_args
#'
lbt05_1_check <- function(adam_db,
                          req_tables,
                          arm_var) {
  assert_all_tablenames(adam_db, req_tables)

  msg <- NULL

  adlb_layout_col <- c("USUBJID", "ONTRTFL", "PARCAT2", "PARAM", "ANRIND", "AVALCAT1")
  adsl_layout_col <- c("USUBJID")

  msg <- c(msg, check_all_colnames(adam_db$adlb, c(arm_var, adlb_layout_col)))
  msg <- c(msg, check_all_colnames(adam_db$adsl, c(adsl_layout_col)))

  if (is.null(msg)) {
    TRUE
  } else {
    stop(paste(msg, collapse = "\n  "))
  }
}

#' @describeIn lbt05_1 Postprocessing
#'
#' @inheritParams gen_args
#'
#' @export
#'
lbt05_1_post <- function(tlg, prune_0 = FALSE, ...) {
  if (prune_0) {
    has_lbl <- function(lbl) CombinationFunction(function(tr) obj_label(tr) == lbl)
    tlg <- prune_table(tlg, keep_rows(has_lbl("Any Abnormality")))

    if (is.null(prune_table(tlg))) {
      tlg <- build_table(rtables::basic_table(), df = data.frame())
      col_info(tlg) <- col_info(tlg)
    }
  }

  std_postprocess(tlg)
}

#' `LBT05` Table 1 (Default) Laboratory Abnormalities with Single and Replicated Marked.
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' run(lbt05_1, syn_data)
lbt05_1 <- chevron_t(
  main = lbt05_1_main,
  preprocess = lbt05_1_pre,
  postprocess = lbt05_1_post,
  adam_datasets = c("adsl", "adlb")
)
