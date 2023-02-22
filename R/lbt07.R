# lbt07_1 ----

#' @describeIn lbt07_1 Main TLG function
#'
#' @inheritParams gen_args
#' @param grade_var (`character`) `PARAM` and variables derived from the standard lab grade variable `ATOXGR`:
#' * A grade direction variable (`GRADE_DIR`) is required in order to obtain
#'   the correct denominators when building the layout as it is used to define row splitting.
#' * A toxicity grade variable (e.g. `GRADE_ANL`) where all negative values from
#'   `ATOXGR` are replaced by their absolute values.
#' @param lbl_grade_var (`character`) label of the variables in `grade_var`. If `NULL`, uses the label
#'   attribute of the columns selected in `grade_var`.
#'
#' @details
#'  * Split columns by arm, typically `ACTARM`.
#'
#' @note
#'  * `adam_db` object must contain an `adlb` table with columns `"USUBJID"`, `"ATOXGR"`,
#'  `"ONTRTFL"` and column specified by `arm_var`.
#'
#' @export
#'
lbt07_1_main <- function(adam_db,
                         arm_var = "ACTARM",
                         lbl_overall = NULL,
                         grade_var = c("PARAM", "GRADE_DIR", "GRADE_ANL"),
                         deco = std_deco("LBT07"),
                         lbl_grade_var = c("Parameter", "Direction of Abnormality", "Toxicity Grade"),
                         req_tables = c("adsl", "adlb")) {
  lbt07_1_check(adam_db, req_tables = req_tables, arm_var = arm_var)

  lbl_grade_var <- if (is.null(lbl_grade_var)) var_labels_for(adam_db$adlb, grade_var) else lbl_grade_var

  map <- expand.grid(
    PARAM = levels(adam_db$adlb$PARAM),
    GRADE_DIR = c("LOW", "HIGH"),
    GRADE_ANL = as.character(1:4),
    stringsAsFactors = FALSE
  ) %>%
    arrange(PARAM, desc(GRADE_DIR), GRADE_ANL)

  lyt <- lbt07_1_lyt(
    arm_var = arm_var,
    lbl_overall = lbl_overall,
    grade_var = grade_var,
    lbl_grade_var = lbl_grade_var,
    deco = deco,
    map = map
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
#'
#' @export
#'
lbt07_1_lyt <- function(arm_var,
                        lbl_overall,
                        lbl_gradedir,
                        lbl_param,
                        grade_var,
                        lbl_grade_var,
                        deco,
                        map) {
  names(lbl_grade_var) <- grade_var

  basic_table_deco(deco, show_colcount = TRUE) %>%
    split_cols_by(arm_var) %>%
    ifneeded_add_overall_col(lbl_overall) %>%
    split_rows_by(
      "PARAM",
      label_pos = "topleft",
      split_label = lbl_grade_var[1]
    ) %>%
    summarize_num_patients(
      var = "USUBJID",
      required = "ATOXGR",
      .stats = "unique_count"
    ) %>%
    split_rows_by(
      "GRADE_DIR",
      label_pos = "topleft",
      split_label = lbl_grade_var[2],
      split_fun = trim_levels_to_map(map)
    ) %>%
    count_abnormal_by_worst_grade(
      var = "GRADE_ANL",
      variables = list(id = "USUBJID", param = "PARAM", grade_dir = "GRADE_DIR"),
      .formats = list(count_fraction = tern::format_count_fraction_fixed_dp),
      .indent_mods = 4L
    ) %>%
    append_topleft("            Highest NCI CTCAE Grade")
}

#' @describeIn lbt07_1 Preprocessing
#'
#' @inheritParams gen_args
#'
#' @export
#'
lbt07_1_pre <- function(adam_db) {
  checkmate::assert_class(adam_db, "dm")

  new_format <- list(
    adlb = list(
      ATOXGR = list("<Missing>" = c("", NA, "<Missing>", "No Coding available"))
    )
  )

  adam_db <- dunlin::apply_reformat(adam_db, new_format)

  adam_db %>%
    dm_zoom_to("adlb") %>%
    filter(
      .data$ATOXGR != "<Missing>",
      .data$ONTRTFL == "Y",
      .data$WGRLOFL == "Y" | .data$WGRHIFL == "Y"
    ) %>%
    mutate(
      GRADE_DIR = factor(
        case_when(
          ATOXGR %in% c("-1", "-2", "-3", "-4") & .data$WGRLOFL == "Y" ~ "LOW",
          ATOXGR == "0" ~ "ZERO",
          ATOXGR %in% c("1", "2", "3", "4") & .data$WGRHIFL == "Y" ~ "HIGH",
          TRUE ~ "NONE"
        ),
        levels = c("LOW", "ZERO", "HIGH", "NONE")
      ),
      GRADE_ANL = factor(ATOXGR, levels = c(-4:4), labels = abs(c(-4:4))),
      PARAM = as.factor(.data$PARAM)
    ) %>%
    dm_update_zoomed()
}

#' @describeIn lbt07_1 Checks
#'
#' @inheritParams gen_args
#'
lbt07_1_check <- function(adam_db,
                          req_tables = c("adsl", "adlb"),
                          arm_var = "ACTARM") {
  assert_all_tablenames(adam_db, req_tables)

  msg <- NULL

  adlb_layout_col <- c("USUBJID", "ATOXGR", "ONTRTFL")
  adsl_layout_col <- c("USUBJID")

  msg <- c(msg, check_all_colnames(adam_db$adlb, c(arm_var, adlb_layout_col)))
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
#'
#' @export
#'
lbt07_1_post <- function(tlg, prune_0 = TRUE, ...) {
  if (prune_0) {
    tlg <- smart_prune(tlg)
  }
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
