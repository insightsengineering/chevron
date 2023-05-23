# mht01 ----

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
                       lbl_overall = NULL,
                       ...) {
  assert_all_tablenames(adam_db, c("admh", "adsl"))
  checkmate::assert_string(arm_var)
  checkmate::assert_string(lbl_overall, null.ok = TRUE)
  assert_valid_variable(adam_db$admh, c("MHBODSYS", "MHDECOD"), types = list(c("character", "factor")), empty_ok = TRUE)
  assert_valid_variable(adam_db$admh, "USUBJID", types = list(c("character", "factor")), empty_ok = TRUE)
  assert_valid_variable(adam_db$adsl, "USUBJID", types = list(c("character", "factor")))
  assert_valid_var_pair(adam_db$adsl, adam_db$admh, arm_var)

  lbl_mhbodsys <- var_labels_for(adam_db$admh, "MHBODSYS")
  lbl_mhdecod <- var_labels_for(adam_db$admh, "MHDECOD")

  lyt <- mht01_lyt(
    arm_var = arm_var,
    lbl_overall = lbl_overall,
    lbl_mhbodsys = lbl_mhbodsys,
    lbl_mhdecod = lbl_mhdecod
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

  adam_db$admh <- adam_db$admh %>%
    mutate(
      across(all_of(c("MHBODSYS", "MHDECOD")), ~ reformat(.x, nocoding, na_last = TRUE))
    ) %>%
    mutate(
      MHBODSYS = with_label(.data$MHBODSYS, "MedDRA System Organ Class"),
      MHDECOD = with_label(.data$MHDECOD, "MedDRA Preferred Term")
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
  postprocess = mht01_post,
  adam_datasets = c("adsl", "admh")
)
