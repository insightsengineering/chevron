# mht01 ----

#' @describeIn mht01 Main TLG function
#'
#' @inheritParams gen_args
#' @param lbl_mhbodsys (`string`) text label for `MHBODSYS`. If `NULL`, the value of the argument defaults to the label
#'   of the corresponding column in the `admh` table.
#' @param lbl_mhdecod (`string`) text label for `MHDECOD`. If `NULL`, the value of the argument defaults to the label of
#'   the corresponding column in the `admh` table.
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
                       lbl_overall = NULL,
                       lbl_mhbodsys = "MedDRA System Organ Class",
                       lbl_mhdecod = "MedDRA Preferred Term",
                       ...) {
  assert_all_tablenames(adam_db, c("admh", "adsl"))
  checkmate::assert_string(arm_var)
  checkmate::assert_string(lbl_overall, null.ok = TRUE)
  checkmate::assert_string(lbl_mhbodsys, null.ok = TRUE)
  checkmate::assert_string(lbl_mhdecod, null.ok = TRUE)
  assert_valid_variable(adam_db$admh, c("MHBODSYS", "MHDECOD"), empty_ok = TRUE)
  assert_valid_variable(adam_db$admh, "USUBJID", empty_ok = TRUE)
  assert_valid_variable(adam_db$adsl, "USUBJID")
  assert_valid_var_pair(adam_db$adsl, adam_db$admh, arm_var)

  dbsel <- get_db_data(adam_db, "adsl", "admh")

  if (is.null(lbl_mhbodsys)) lbl_mhbodsys <- var_labels_for(adam_db$admh, "MHBODSYS")
  if (is.null(lbl_mhdecod)) lbl_mhdecod <- var_labels_for(adam_db$admh, "MHDECOD")

  lyt <- mht01_lyt(
    arm_var = arm_var,
    lbl_overall = lbl_overall,
    lbl_mhbodsys = lbl_mhbodsys,
    lbl_mhdecod = lbl_mhdecod
  )

  tbl <- build_table(lyt, dbsel$admh, alt_counts_df = dbsel$adsl)

  tbl
}

#' @describeIn mht01 Layout
#'
#' @inheritParams mht01_main
#'
#' @keywords internal
#'
mht01_lyt <- function(arm_var,
                      lbl_overall,
                      lbl_mhbodsys,
                      lbl_mhdecod) {
  basic_table(show_colcounts = TRUE) %>%
    split_cols_by(var = arm_var) %>%
    add_colcounts() %>%
    ifneeded_add_overall_col(lbl_overall) %>%
    summarize_num_patients(
      var = "USUBJID",
      .stats = c("unique", "nonunique"),
      .labels = c(
        unique = "Total number of patients with at least one condition",
        nonunique = "Total number of conditions"
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
        unique = "Total number of patients with at least one condition",
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

  new_format <- list(
    admh = list(
      MHBODSYS = rule(
        "No Coding available" = c("", NA)
      ),
      MHDECOD = rule(
        "No Coding available" = c("", NA)
      )
    )
  )

  reformat(adam_db, new_format, na_last = TRUE)
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
  postprocess = mht01_post,
  adam_datasets = c("adsl", "admh")
)
