# lbt07_1 ----

#' @describeIn lbt07_1 Main TLG function
#'
#' @inheritParams gen_args
#' @param lbl_param (`character`) label of the `PARAM` variable.
#' @param lbl_gradedir (`character`) label of the `GRADE_DIR` variable.
#'
#' @details
#'  * Split columns by arm, typically `ACTARM`.
#'
#' @note
#'  * `adam_db` object must contain an `adlb` table with columns `"USUBJID"`, `"ATOXGR"`, `"AVISIT"`, `"ANL01FL"`,
#'  `"ONTRTFL"`, `"WGRLOFL"`,`"WGRHIFL"`,and column specified by `armvar`.
#'
#'
#' @export
#'
lbt07_1_main <- function(adam_db,
                         armvar = "ACTARM",
                         lbl_gradedir = "Direction of Abnormality",
                         lbl_param = "Parameter",
                         deco = std_deco("LBT07"),
                         ...) {
  map <- unique(adam_db$adlb[adam_db$adlb$GRADE_DIR != "ZERO", c("PARAM", "GRADE_DIR", "GRADE_ANL")]) %>%
    lapply(as.character) %>%
    as.data.frame() %>%
    arrange(PARAM, desc(GRADE_DIR), GRADE_ANL)

  lyt <- lbt07_1_lyt(
    armvar = armvar,
    lbl_param = lbl_param,
    lbl_gradedir = lbl_gradedir,
    deco = deco,
    map = map,
    ... = ...
  )

  tbl <- build_table(lyt, adam_db$adlb, alt_counts_df = adam_db$adsl)

  tbl
}

#' @describeIn lbt07_1 Layout
#'
#' @inheritParams gen_args
#'
#' @param lbl_param (`character`) label of the `PARAM` variable.
#' @param lbl_gradedir (`character`) label of the `GRADE_DIR` variable.
#' @param map (`data.frame`) mapping of `PARAM`s to directions of abnormality.
#' @param ... not used.
#'
#' @export
#'
lbt07_1_lyt <- function(armvar,
                        lbl_gradedir,
                        lbl_param,
                        deco,
                        map,
                        ...) {
  basic_table_deco(deco, show_colcount = TRUE) %>%
    split_cols_by(armvar) %>%
    split_rows_by(
      "PARAM",
      label_pos = "topleft",
      split_label = lbl_param
    ) %>%
    summarize_num_patients(
      var = "USUBJID",
      required = "ATOXGR",
      .stats = "unique_count"
    ) %>%
    split_rows_by(
      "GRADE_DIR",
      label_pos = "topleft",
      split_label = lbl_gradedir,
      split_fun = trim_levels_to_map(map)
    ) %>%
    count_abnormal_by_worst_grade(
      var = "GRADE_ANL",
      variables = list(id = "USUBJID", param = "PARAM", grade_dir = "GRADE_DIR"),
      .indent_mods = 4L
    ) %>%
    append_topleft("    Highest NCI CTCAE Grade")
}

#' @describeIn lbt07_1 Preprocessing
#'
#' @inheritParams gen_args
#' @param ... not used.
#'
#' @export
#'
lbt07_1_pre <- function(adam_db, ...) {
  checkmate::assert_class(adam_db, "dm")

  db <- adam_db %>%
    dm_zoom_to("adlb") %>%
    filter(
      .data$ANL01FL == "Y",
      !.data$AVISIT %in% c("SCREENING", "BASELINE"),
      .data$ATOXGR != "<Missing>",
      .data$ONTRTFL == "Y",
      .data$WGRLOFL == "Y" | .data$WGRHIFL == "Y"
    ) %>%
    mutate(
      GRADE_DIR = factor(
        case_when(
          ATOXGR %in% c("-1", "-2", "-3", "-4") ~ "LOW",
          ATOXGR == "0" ~ "ZERO",
          ATOXGR %in% c("1", "2", "3", "4") ~ "HIGH"
        ),
        levels = c("LOW", "ZERO", "HIGH")
      ),
      GRADE_ANL = fct_relevel(
        forcats::fct_recode(ATOXGR,
          `1` = "-1", `2` = "-2", `3` = "-3", `4` = "-4"
        ),
        c("0", "1", "2", "3", "4")
      )
    ) %>%
    dm_update_zoomed()
}

#' @describeIn lbt07_1 Checks
#'
#' @inheritParams gen_args
#' @param ... not used.
#'
lbt07_1_check <- function(adam_db,
                          req_tables = c("adsl", "adlb"),
                          armvar = "ACTARM",
                          ...) {
  assert_all_tablenames(adam_db, req_tables)

  msg <- NULL

  adlb_layout_col <- c("USUBJID", "ATOXGR", "AVISIT", "ANL01FL", "ONTRTFL", "WGRLOFL", "WGRHIFL")
  adsl_layout_col <- c("USUBJID")

  msg <- c(msg, check_all_colnames(adam_db$adlb, c(armvar, adlb_layout_col)))
  msg <- c(msg, check_all_colnames(adam_db$adsl, c(adsl_layout_col)))

  if (is.null(msg)) {
    TRUE
  } else {
    stop(paste(msg, collapse = "\n  "))
  }
}


#' @describeIn lbt07_1 Postprocessing
#'
#' @inheritParams gen_args
#' @param ... not used.
#'
#' @export
#'
lbt07_1_post <- function(tlg, prune_0 = TRUE, ...) {
  std_postprocess(tlg)
}

#' `LBT07` Table 1 (Default) Laboratory Test Results and Change from Baseline by Visit.
#'
#' The `LBT07` table provides an
#' overview of the analysis values and its change from baseline of each respective arm over the course of the trial.
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' run(lbt07_1, syn_data)
lbt07_1 <- chevron_t(
  main = lbt07_1_main,
  preprocess = lbt07_1_pre,
  postprocess = lbt07_1_post,
  adam_datasets = c("adlb", "adsl")
)
