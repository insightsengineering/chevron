# lbt07 ----

#' @describeIn lbt07 Main TLG function
#'
#' @inheritParams gen_args
#' @param param_var (`string`) the name of the column storing the parameters name.
#' @param grad_dir_var  (`string`) the name of the column storing the grade direction variable which  is required in
#'   order to obtain the correct denominators when building the layout as it is used to define row splitting.
#' @param grad_anl_var (`string`)  the name of the column storing toxicity grade variable where all negative values from
#'   `ATOXGR` are replaced by their absolute values.
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
lbt07_main <- function(adam_db,
                       arm_var = "ACTARM",
                       lbl_overall = NULL,
                       param_var = "PARAM",
                       grad_dir_var = "GRADE_DIR",
                       grad_anl_var = "GRADE_ANL",
                       ...) {
  assert_all_tablenames(adam_db, c("adsl", "adlb"))
  checkmate::assert_string(arm_var)
  checkmate::assert_string(param_var)
  checkmate::assert_string(grad_dir_var)
  checkmate::assert_string(grad_anl_var)
  checkmate::assert_string(lbl_overall, null.ok = TRUE)
  assert_valid_variable(
    adam_db$adlb, c("ATOXGR", param_var, grad_dir_var, grad_anl_var),
    types = list(c("character", "factor"))
  )
  assert_valid_variable(adam_db$adlb, c("USUBJID"), types = list(c("character", "factor")), empty_ok = TRUE)
  assert_valid_variable(adam_db$adsl, c("USUBJID"), types = list(c("character", "factor")))
  assert_valid_var_pair(adam_db$adsl, adam_db$adlb, arm_var)

  lbl_param_var <- var_labels_for(adam_db$adlb, param_var)
  lbl_grad_dir_var <- var_labels_for(adam_db$adlb, grad_dir_var)

  map <- expand.grid(
    PARAM = levels(adam_db$adlb[[param_var]]),
    GRADE_DIR = c("LOW", "HIGH"),
    GRADE_ANL = as.character(1:4),
    stringsAsFactors = FALSE
  ) %>%
    arrange(.data$PARAM, desc(.data$GRADE_DIR), .data$GRADE_ANL)

  names(map) <- c(param_var, grad_dir_var, grad_anl_var)

  lyt <- lbt07_lyt(
    arm_var = arm_var,
    param_var = param_var,
    grad_dir_var = grad_dir_var,
    grad_anl_var = grad_anl_var,
    lbl_param_var = lbl_param_var,
    lbl_grad_dir_var = lbl_grad_dir_var,
    lbl_overall = lbl_overall,
    map = map
  )

  tbl <- build_table(lyt, adam_db$adlb, alt_counts_df = adam_db$adsl)

  tbl
}

#' @describeIn lbt07 Layout
#'
#' @inheritParams gen_args
#' @inheritParams lbt07_main
#'
#' @param lbl_param_var (`string`) label of the `param_var` variable.
#' @param lbl_grad_dir_var (`string`) label for the `grad_dir_var` variable.
#' @param map (`data.frame`) mapping of `PARAM`s to directions of abnormality.
#'
#' @keywords internal
#'
lbt07_lyt <- function(arm_var,
                      param_var,
                      grad_dir_var,
                      grad_anl_var,
                      lbl_param_var,
                      lbl_grad_dir_var,
                      lbl_overall,
                      map) {
  basic_table(show_colcounts = TRUE) %>%
    split_cols_by(arm_var) %>%
    ifneeded_add_overall_col(lbl_overall) %>%
    split_rows_by(
      param_var,
      label_pos = "topleft",
      split_label = lbl_param_var
    ) %>%
    summarize_num_patients(
      var = "USUBJID",
      required = "ATOXGR",
      .stats = "unique_count"
    ) %>%
    split_rows_by(
      grad_dir_var,
      label_pos = "topleft",
      split_label = lbl_grad_dir_var,
      split_fun = trim_levels_to_map(map)
    ) %>%
    count_abnormal_by_worst_grade(
      var = grad_anl_var,
      variables = list(id = "USUBJID", param = param_var, grade_dir = grad_dir_var),
      .formats = list(count_fraction = tern::format_count_fraction_fixed_dp),
      .indent_mods = 4L
    ) %>%
    append_topleft("            Highest NCI CTCAE Grade")
}

#' @describeIn lbt07 Preprocessing
#'
#' @inheritParams gen_args
#'
#' @export
#'
lbt07_pre <- function(adam_db, ...) {
  adam_db$adlb <- adam_db$adlb %>%
    mutate(
      ATOXGR = reformat(.data$ATOXGR, missing_rule, na_last = TRUE)
    ) %>%
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
      GRADE_ANL = factor(.data$ATOXGR, levels = c(-4:4), labels = abs(c(-4:4))),
      PARAM = as.factor(.data$PARAM)
    )

  adam_db$adlb <- adam_db$adlb %>%
    mutate(
      PARAM = with_label(.data$PARAM, "Parameter"),
      GRADE_DIR = with_label(.data$GRADE_DIR, "Direction of Abnormality"),
      GRADE_ANL = with_label(.data$GRADE_ANL, "Toxicity Grade")
    )

  adam_db
}

#' @describeIn lbt07 Postprocessing
#'
#' @inheritParams gen_args
#'
#' @export
#'
lbt07_post <- function(tlg, prune_0 = TRUE, ...) {
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
#' run(lbt07, syn_data)
lbt07 <- chevron_t(
  main = lbt07_main,
  preprocess = lbt07_pre,
  postprocess = lbt07_post,
  adam_datasets = c("adlb", "adsl")
)
