# aet03_1 ----

#' @describeIn aet03_1 Main TLG function
#'
#' @inheritParams gen_args
#' @param intensity_grade (`vector of character`) putting in correspondence intensity levels.
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
aet03_1_main <- function(adam_db,
                         armvar = "ACTARM",
                         intensity_grade = c("MILD", "MODERATE", "SEVERE"),
                         lbl_overall = NULL,
                         deco = std_deco("AET03"),
                         ...) {
  dbsel <- get_db_data(adam_db, "adsl", "adae")

  assert_colnames(dbsel$adae, c("AEBODSYS", "AEDECOD", "ASEV"))

  checkmate::assert_character(intensity_grade)
  checkmate::assert(all(intensity_grade %in% c("MILD", "MODERATE", "SEVERE", "LIFE THREATENING")))
  checkmate::assert(all(levels(dbsel$adae[["ASEV"]]) %in% intensity_grade))

  lyt <- aet03_1_lyt(
    armvar = armvar,
    lbl_overall = lbl_overall,
    intensity_grade = intensity_grade,
    deco = deco,
    ... = ...
  ) %>%
    append_varlabels(df = dbsel$adae, vars = "ASEV", indent = 2L)

  tbl <- build_table(lyt, df = dbsel$adae, alt_counts_df = dbsel$adsl)

  tbl
}

#' @describeIn aet03_1 Layout
#'
#' @inheritParams gen_args
#'
#' @param lbl_aebodsys (`character`) text label for `AEBODSYS`.
#' @param lbl_aedecod (`character`) text label for `AEDECOD`.
#' @param intensity_grade (`vector of character`) describing the intensity levels present in the dataset.
#' @param ... not used.
#'
#' @export
#'
aet03_1_lyt <- function(armvar,
                        lbl_overall,
                        lbl_aebodsys = "MedDRA System Organ Class",
                        lbl_aedecod = "MedDRA Preferred Term",
                        intensity_grade,
                        deco,
                        ...) {
  all_grade_groups <- list("- Any Intensity -" = intensity_grade)

  basic_table_deco(deco) %>%
    split_cols_by(var = armvar) %>%
    add_colcounts() %>%
    ifneeded_add_overall_col(lbl_overall) %>%
    count_occurrences_by_grade(
      var = "ASEV",
      grade_groups = all_grade_groups
    ) %>%
    split_rows_by(
      "AEBODSYS",
      child_labels = "visible",
      nested = TRUE,
      split_fun = trim_levels_in_group("ASEV"),
      label_pos = "topleft",
      split_label = lbl_aebodsys
    ) %>%
    summarize_occurrences_by_grade(
      var = "ASEV",
      grade_groups = all_grade_groups
    ) %>%
    split_rows_by(
      "AEDECOD",
      child_labels = "visible",
      nested = TRUE,
      indent_mod = -1L,
      split_fun = trim_levels_in_group("ASEV"),
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

#' @describeIn aet03_1 Preprocessing
#'
#' @inheritParams gen_args
#' @param ... not used.
#'
#' @export
#'
aet03_1_pre <- function(adam_db, ...) {
  checkmate::assert_class(adam_db, "dm")

  new_format <- list(
    adae = list(
      AEBODSYS = list("No Coding available" = c("", NA, "<Missing>")),
      AEDECOD = list("No Coding available" = c("", NA, "<Missing>")),
      ASEV = list("<Missing>" = c("", NA, "<Missing>"))
    )
  )
  adam_db <- dunlin::apply_reformat(adam_db, new_format)

  adam_db %>%
    dm_zoom_to("adae") %>%
    filter(.data$ANL01FL == "Y") %>%
    filter(.data$ASEV != "<Missing>") %>%
    mutate(ASEV = droplevels(.data$ASEV, "<Missing>")) %>%
    mutate(ASEV = if (length(levels(.data$ASEV)) > 0L) .data$ASEV else factor(.data$ASEV, "Missing")) %>%
    dm_update_zoomed()
}

#' @describeIn aet03_1 Postprocessing
#'
#' @inheritParams gen_args
#'
#' @param ... not used.
#'
#' @export
aet03_1_post <- function(tlg, prune_0 = TRUE, ...) {
  if (prune_0) tlg <- tlg %>% trim_rows()

  tbl_sorted <- tlg %>%
    sort_at_path(
      path = c("AEBODSYS"),
      scorefun = cont_n_allcols,
      decreasing = TRUE
    ) %>%
    sort_at_path(
      path = c("AEBODSYS", "*", "AEDECOD"),
      scorefun = cont_n_allcols,
      decreasing = TRUE
    )

  std_postprocess(tbl_sorted)
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
#' run(aet03_1, syn_data)
aet03_1 <- chevron_t(
  main = aet03_1_main,
  preprocess = aet03_1_pre,
  postprocess = aet03_1_post,
  adam_datasets = c("adsl", "adae")
)
