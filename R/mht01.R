# mht01 ----

#' @describeIn cmt01a Default labels
#' @export
mht01_label <- c(
  unique = "Total number of {patient_label} with at least one condition",
  nonunique = "Total number of conditions"
)

#' @describeIn mht01 Main TLG function
#'
#' @inheritParams gen_args
#'
#' @details
#'  * Numbers represent absolute numbers of patients and fraction of `N`, or absolute number of event when specified.
#'  * Remove zero-count rows unless overridden with `prune_0 = FALSE`.
#'  * Split columns by arm.
#'  * Does not include a total column by default.
#'  * Order by body system alphabetically and within body system and medical condition by decreasing total number of
#'  patients with the specific condition.
#'
#' @note
#'   * `adam_db` object must contain an `admh` table with columns `"MHBODSYS"` and `"MHDECOD"`.
#'
#' @export
#'
mht01_main <- function(adam_db,
                       arm_var = "ARM",
                       row_split_var = "MHBODSYS",
                       lbl_overall = NULL,
                       summary_labels = list(
                        all = mht01_label
                       ),
                       ...) {
  assert_all_tablenames(adam_db, c("admh", "adsl"))
  assert_string(arm_var)
  assert_string(lbl_overall, null.ok = TRUE)
  assert_valid_variable(adam_db$admh, c(row_split_var, "MHDECOD"), types = list(c("character", "factor")), empty_ok = TRUE)
  assert_valid_variable(adam_db$admh, "USUBJID", types = list(c("character", "factor")), empty_ok = TRUE)
  assert_valid_variable(adam_db$adsl, "USUBJID", types = list(c("character", "factor")))
  assert_valid_var_pair(adam_db$adsl, adam_db$admh, arm_var)
  assert_list(summary_labels, null.ok = TRUE)
  assert_subset(names(summary_labels), c("all", "TOTAL", row_split_var))
  assert_subset(
    unique(unlist(lapply(summary_labels, names))),
    c("unique", "nonunique", "unique_count")
  )
  if ("all" %in% names(summary_labels)) {
    summary_labels <- lapply(
      c(TOTAL = "TOTAL", setNames(row_split_var, row_split_var)),
      function(x) {
        modify_character(summary_labels$all, summary_labels[[x]])
      }
    )
  }

  lbl_overall <- render_safe(lbl_overall)
  lbl_row_split <- var_labels_for(adam_db$admh, row_split_var)
  lbl_mhdecod <- var_labels_for(adam_db$admh, "MHDECOD")

  lyt <- occurrence_lyt(
    arm_var = arm_var,
    lbl_overall = lbl_overall,
    row_split_var = row_split_var,
    lbl_row_split = lbl_row_split,
    medname_var = "MHDECOD",
    lbl_medname_var = lbl_mhdecod,
    summary_labels = summary_labels,
    count_by = "MHSEQ"
  )

  tbl <- build_table(lyt, adam_db$admh, alt_counts_df = adam_db$adsl)

  tbl
}

#' `mht01` Layout
#'
#' @inheritParams gen_args
#' @inheritParams mht01_main
#' @param lbl_mhbodsys (`string`) label associated with `"MHBODSYS"`.
#' @param lbl_mhdecod (`string`) label associated with `"MHDECOD"`.
#'
#' @keywords internal
#'
mht01_lyt <- function(arm_var,
                      lbl_overall,
                      lbl_mhbodsys,
                      lbl_mhdecod) {
  basic_table(show_colcounts = TRUE) %>%
    split_cols_by_with_overall(arm_var, lbl_overall) %>%
    summarize_num_patients(
      var = "USUBJID",
      .stats = c("unique", "nonunique"),
      .labels = c(
        unique = render_safe("Total number of {patient_label} with at least one condition"),
        nonunique = render_safe("Total number of conditions")
      )
    ) %>%
    split_rows_by(
      "MHBODSYS",
      child_labels = "visible",
      labels_var = "MHBODSYS",
      nested = FALSE,
      indent_mod = -1L,
      split_fun = drop_split_levels,
      label_pos = "topleft",
      split_label = lbl_mhbodsys
    ) %>%
    summarize_num_patients(
      var = "USUBJID",
      .stats = c("unique", "nonunique"),
      .labels = c(
        unique = render_safe("Total number of {patient_label} with at least one condition"),
        nonunique = "Total number of conditions"
      )
    ) %>%
    count_occurrences(
      vars = "MHDECOD",
      .indent_mods = -1L
    ) %>%
    append_topleft(paste0("  ", lbl_mhdecod))
}

#' @describeIn mht01 Preprocessing
#'
#' @inheritParams gen_args
#'
#' @export
#'
mht01_pre <- function(adam_db, ...) {
  adam_db$admh <- adam_db$admh %>%
    filter(.data$ANL01FL == "Y")

  adam_db$admh <- adam_db$admh %>%
    mutate(
      across(all_of(c("MHBODSYS", "MHDECOD")), ~ reformat(.x, nocoding))
    ) %>%
    mutate(
      MHBODSYS = with_label(.data$MHBODSYS, "MedDRA System Organ Class"),
      MHDECOD = with_label(.data$MHDECOD, "MedDRA Preferred Term"),
      MHSEQ = as.factor(MHSEQ)
    )

  adam_db
}

#' @describeIn mht01 Postprocessing
#'
#' @inheritParams gen_args
#'
#' @export
#'
mht01_post <- function(tlg, prune_0 = TRUE, ...) {
  if (prune_0) {
    tlg <- smart_prune(tlg)
  }

  tbl_sorted <- tlg %>%
    sort_at_path(
      path = c("MHBODSYS", "*", "MHDECOD"),
      scorefun = score_occurrences
    )

  std_postprocess(tbl_sorted)
}

#' `MHT01` Medical History Table.
#'
#' The `MHT01` table provides an overview of the subjects medical
#' history by SOC and Preferred Term.
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' run(mht01, syn_data)
mht01 <- chevron_t(
  main = mht01_main,
  preprocess = mht01_pre,
  postprocess = mht01_post
)
