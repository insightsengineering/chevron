# aet03 ----

#' @describeIn aet03 Main TLG function
#'
#' @inheritParams gen_args
#'
#' @details
#'  * Default Adverse Events by Greatest Intensity table.
#'  * Numbers represent absolute numbers of patients and fraction of `N`.
#'  * Remove zero-count rows unless overridden with `prune_0 = FALSE`.
#'  * Split columns by arm.
#'  * Does not include a total column by default.
#'  * Sort by Body System or Organ Class (`SOC`) and Dictionary-Derived Term (`PT`).
#'
#' @note
#'  * `adam_db` object must contain an `adae` table with the columns `"AEBODSYS"`, `"AEDECOD"` and `"ASEV"`.
#'
#' @export
#'
aet03_main <- function(adam_db,
                       arm_var = "ACTARM",
                       lbl_overall = NULL,
                       ...) {
  assert_all_tablenames(adam_db, "adsl", "adae")
  checkmate::assert_string(lbl_overall, null.ok = TRUE)
  checkmate::assert_string(arm_var)
  assert_valid_variable(adam_db$adsl, c("USUBJID", arm_var), types = list(c("character", "factor")))
  assert_valid_variable(adam_db$adae, c(arm_var, "AEBODSYS", "AEDECOD", "ASEV"), types = list(c("character", "factor")))
  assert_valid_variable(adam_db$adae, "USUBJID", empty_ok = TRUE, types = list(c("character", "factor")))
  assert_valid_var_pair(adam_db$adsl, adam_db$adae, arm_var)
  lbl_overall <- render_safe(lbl_overall)
  intensity_grade <- levels(adam_db$adae[["ASEV"]])
  lbl_aebodsys <- var_labels_for(adam_db$adae, "AEBODSYS")
  lbl_aedecod <- var_labels_for(adam_db$adae, "AEDECOD")
  lyt <- aet03_lyt(
    arm_var = arm_var,
    lbl_overall = lbl_overall,
    lbl_aebodsys = lbl_aebodsys,
    lbl_aedecod = lbl_aedecod,
    intensity_grade = intensity_grade
  )

  tbl <- build_table(lyt, df = adam_db$adae, alt_counts_df = adam_db$adsl)

  tbl
}

#' `aet03` Layout
#'
#' @inheritParams gen_args
#'
#' @param lbl_aebodsys (`string`) text label for `AEBODSYS`.
#' @param lbl_aedecod (`string`) text label for `AEDECOD`.
#' @param intensity_grade (`character`) describing the intensity levels present in the dataset.
#'
#' @keywords internal
#'
aet03_lyt <- function(arm_var,
                      lbl_overall,
                      lbl_aebodsys,
                      lbl_aedecod,
                      intensity_grade) {
  all_grade_groups <- list("- Any Intensity -" = intensity_grade)

  basic_table(show_colcounts = TRUE) %>%
    split_cols_by(var = arm_var) %>%
    ifneeded_add_overall_col(lbl_overall) %>%
    count_occurrences_by_grade(
      var = "ASEV",
      grade_groups = all_grade_groups,
      .formats = c("count_fraction" = format_count_fraction_fixed_dp)
    ) %>%
    split_rows_by(
      "AEBODSYS",
      child_labels = "visible",
      nested = TRUE,
      split_fun = drop_split_levels,
      label_pos = "topleft",
      split_label = lbl_aebodsys
    ) %>%
    summarize_occurrences_by_grade(
      var = "ASEV",
      grade_groups = all_grade_groups,
      .formats = c("count_fraction" = format_count_fraction_fixed_dp)
    ) %>%
    split_rows_by(
      "AEDECOD",
      child_labels = "visible",
      nested = TRUE,
      indent_mod = -1L,
      split_fun = drop_split_levels,
      label_pos = "topleft",
      split_label = lbl_aedecod
    ) %>%
    summarize_num_patients(
      var = "USUBJID",
      .stats = "unique",
      .labels = c("- Any Intensity -")
    ) %>%
    count_occurrences_by_grade(
      var = "ASEV",
      .indent_mods = -1L
    )
}

#' @describeIn aet03 Preprocessing
#'
#' @inheritParams gen_args
#'
#' @export
#'
aet03_pre <- function(adam_db, ...) {
  asev_lvls <- c("MILD", "MODERATE", "SEVERE")
  adam_db$adae <- adam_db$adae %>%
    filter(.data$ANL01FL == "Y") %>%
    mutate(
      AEBODSYS = reformat(.data$AEBODSYS, nocoding),
      AEDECOD = reformat(.data$AEDECOD, nocoding),
      ASEV = factor(.data$ASEV, levels = asev_lvls)
    ) %>%
    filter(!is.na(.data$ASEV))

  adam_db
}

#' @describeIn aet03 Postprocessing
#'
#' @inheritParams gen_args
#'
#' @export
aet03_post <- function(tlg, prune_0 = TRUE, ...) {
  tlg <- tlg %>%
    tlg_sort_by_vars(
      c("AEBODSYS", "AEDECOD"),
      scorefun = cont_n_allcols
    )
  if (prune_0) tlg <- trim_rows(tlg)
  std_postprocess(tlg)
}

#' `AET03` Table 1 (Default) Advert Events by Greatest Intensity Table 1.
#'
#' An adverse events table categorized by System
#' Organ Class, Dictionary-Derived Term and Greatest intensity.
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' run(aet03, syn_data)
aet03 <- chevron_t(
  main = aet03_main,
  preprocess = aet03_pre,
  postprocess = aet03_post
)
