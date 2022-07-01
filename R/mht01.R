#' @describeIn mht01_1 `mht01_1` main function
#'
#' `MHT01` Table 1 (Default) Medical History Table 1.  The `MHT01` table provides an overview of the subjects medical
#' history by SOC and Preferred Term.
#'
#' @inheritParams gen_args
#' @param lbl_mhbodsys (`character`) text label for `MHBODSYS`.
#' @param lbl_mhdecod (`character`) text label for `MHDECOD`.
#'
#' @details
#'  * Numbers represent absolute numbers of patients and fraction of `N`, or absolute number of event when specified.
#'  * Remove zero-count rows unless overridden with `prune_0 = FALSE`.
#'  * Split columns by arm.
#'  * Does not include a total column by default.
#'  * Order by body system alphabetically and within body system and medical condition by decreasing total number of
#'  patients with the specific condition.
#'
#' @importFrom dplyr filter
#'
#' @export
#'
#' @examples
#' library(dm)
#'
#' db <- syn_test_data() %>%
#'   mht01_1_pre()
#'
#' mht01_1_main(adam_db = db) %>% head(15)
mht01_1_main <- function(adam_db,
                         armvar = .study$planarm,
                         lbl_overall = .study$lbl_overall,
                         lbl_mhbodsys = var_labels_for(adam_db$admh, "MHBODSYS"),
                         lbl_mhdecod = var_labels_for(adam_db$admh, "MHDECOD"),
                         prune_0 = TRUE,
                         deco = std_deco("MHT01"),
                         .study = list(
                           planarm = "ARM",
                           lbl_overall = NULL
                         )) {
  dbsel <- get_db_data(adam_db, "adsl", "admh")

  lyt <- mht01_1_lyt(
    armvar = armvar,
    lbl_overall = lbl_overall,
    lbl_mhbodsys = lbl_mhbodsys,
    lbl_mhdecod = lbl_mhdecod,
    deco = deco
  )

  tbl <- build_table(lyt, dbsel$admh, alt_counts_df = dbsel$adsl)

  if (prune_0) {
    tbl <- prune_table(tbl)
  }

  tbl_sorted <- tbl %>%
    sort_at_path(
      path = c("MHBODSYS", "*", "MHDECOD"),
      scorefun = score_occurrences
    )

  tbl_sorted
}

#' @describeIn mht01_1 `mht01_1` Layout
#'
#' @inheritParams gen_args
#' @param lbl_mhbodsys (`character`) text label for `MHBODSYS`.
#' @param lbl_mhdecod (`character`) text label for `MHDECOD`.
#'
#' @export
#'
#' @examples
#' mht01_1_lyt(
#'   armvar = "ACTARM",
#'   lbl_overall = NULL,
#'   deco = std_deco("MHT01")
#' )
mht01_1_lyt <- function(armvar = .study$planarm,
                        lbl_overall = .study$lbl_overall,
                        lbl_mhbodsys = "MedDRA System Organ Class",
                        lbl_mhdecod = "MedDRA preferred Term",
                        deco = std_deco("MHT01"),
                        .study = list(
                          planarm = "ARM",
                          lbl_overall = NULL
                        )) {
  basic_table_deco(deco) %>%
    split_cols_by(var = armvar) %>%
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

#' @describeIn mht01_1 `mht01_1` Preprocessing
#'
#' @inheritParams gen_args
#' @param ... not used.
#'
#' @export
#'
#' @examples
#' syn_test_data() %>%
#'   mht01_1_pre()
mht01_1_pre <- function(adam_db, ...) {
  checkmate::assert_class(adam_db, "dm")

  adam_db %>%
    dm_zoom_to("admh") %>%
    filter(.data$ANL01FL == "Y") %>%
    dm_update_zoomed()
}

# `MHT01_1` Pipeline ----

#' `MHT01_1` Pipeline
#'
#' @description `MHT01_1` Pipeline of the class `tlg_pipeline_s4`
#'
#' @format a `tlg_pipeline_s4` object with the following slots:
#'   - `main` the `chevron::mht01_1_main` function.
#'   - `preprocess` the  `chevron::mht01_1_pre` function.
#'   - `postprocess` the identity function.
#'   - `check` no checks.
#'   - `adam_datasets` `"adsl"` and `"admh"`.
#'
#' @export
#'
mht01_1 <- tlg_pipeline_s4(mht01_1_main, mht01_1_pre, adam_datasets = c("adsl", "admh"))
