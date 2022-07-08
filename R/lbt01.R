
#' `LBT01` Table 1 (Default) Laboratory Test Results and Change from Baseline by Visit.
#'
#' The LBT01 table provides an
#' overview of the analysis values and its change from baseline of each respective arm over the course of the trial.
#'
#' @inheritParams gen_args
#' @param summaryvars (`vector of character`) the variables to be analyzed. For this table, `AVAL` and `CHG` by default.
#' @param summaryvars_lbls (`vector of character`) the label of the variables to be analyzed.
#' @param visitvar (`character`) the type of time point to use. Typically one of `"AVISIT"` (Default) or `"ATPTN"`.
#'
#' @details
#'  * The `Analysis Value` column, displays the number of patients, the mean, standard deviation, median and range of
#'  the analysis value for each visit.
#'  * The `Change from Baseline` column, displays the number of patient and the mean, standard deviation,
#'  median and range of changes relative to the baseline.
#'  * Remove zero-count rows unless overridden with `prune_0 = FALSE`.
#'  * Split columns by arm, typically `ACTARM`.
#'  * Does not include a total column by default.
#'  * Sorted  based on factor level; first by `PARAM` labels in alphabetic order then by chronological time point given
#'  by `AVISIT`. Re-level to customize order
#'
#' @export
#'
#' @examples
#' library(dm)
#'
#' db <- syn_test_data() %>%
#'   lbt01_1_pre()
#'
#' lbt01_1_main(db)
lbt01_1_main <- function(adam_db,
                         armvar = .study$actualarm,
                         summaryvars = c("AVAL", "CHG"),
                         summaryvars_lbls = c("Value at Visit", "Change from \nBaseline"),
                         visitvar = "AVISIT",
                         prune_0 = TRUE,
                         deco = std_deco("LBT01"),
                         .study = list(
                           actualarm = "ACTARM"
                         )) {
  lyt <- lbt01_1_lyt(
    armvar = armvar,
    summaryvars = summaryvars,
    summaryvars_lbls = summaryvars_lbls,
    visitvar = visitvar,
    lbl_avisit = var_labels_for(adam_db$adlb, visitvar),
    lbl_param = var_labels_for(adam_db$adlb, "PARAM"),
    deco = deco
  )

  tbl <- build_table(lyt, adam_db$adlb)

  if (prune_0) tbl <- tbl %>% trim_rows()

  tbl
}

<<<<<<< HEAD
#' @describeIn lbt01_1 `lbt01_1` Layout
=======
#' @describeIn lbt01_1_main `lbt01_1` Layout
>>>>>>> origin/main
#'
#' @inheritParams gen_args
#'
#' @param summaryvars (`vector of character`) the variables to be analyzed. For this table, `AVAL` and `CHG` by default.
#' @param summaryvars_lbls (`vector of character`) the label of the variables to be analyzed.
#' @param visitvar (`character`) typically one of `"AVISIT"` (Default) or `"ATPTN"` depending on the type of time point
#'   to be displayed.
#' @param lbl_avisit (`character`) label of the `visitvar` variable.
#' @param lbl_param (`character`) label of the `PARAM` variable.
#'
#' @export
lbt01_1_lyt <- function(armvar = .study$actualarm,
                        summaryvars = c("AVAL", "CHG"),
                        summaryvars_lbls = c("Value at Visit", "Change from \nBaseline"),
                        visitvar = .study$visitvar,
                        lbl_avisit = "Visit",
                        lbl_param = "Parameter",
                        deco = std_deco("LBT01"),
                        .study = list(
                          actualarm = "ACTARM",
                          visitvar = "AVISIT"
                        )) {


  # TODO solve the problem of the overall column
  # remove change from baseline in BASELINE

  basic_table_deco(deco) %>%
    split_cols_by(armvar) %>%
    split_rows_by(
      "PARAM",
      split_fun = drop_split_levels,
      label_pos = "hidden",
      split_label = paste(lbl_param)
    ) %>%
    split_rows_by(
      visitvar,
      split_fun = drop_split_levels,
      label_pos = "hidden",
      split_label = lbl_avisit
    ) %>%
    split_cols_by_multivar(
      vars = summaryvars,
      varlabels = summaryvars_lbls,
      nested = TRUE
    ) %>%
    summarize_colvars() %>%
    append_topleft(paste(lbl_param)) %>%
    append_topleft(c(paste(" ", lbl_avisit), " "))
}

<<<<<<< HEAD
#' @describeIn lbt01_1 `lbt01_1` Preprocessing
#'
#' @inheritParams gen_args
=======
#' @describeIn lbt01_1_main `lbt01_1` Preprocessing
#'
#' @inheritParams gen_args
#' @param ... not used.
>>>>>>> origin/main
#'
#' @export
#'
#' @examples
#' syn_test_data() %>%
#'   lbt01_1_pre()
<<<<<<< HEAD
lbt01_1_pre <- function(adam_db) {
=======
lbt01_1_pre <- function(adam_db, ...) {
>>>>>>> origin/main
  checkmate::assert_class(adam_db, "dm")

  adam_db %>%
    dm_zoom_to("adlb") %>%
    filter(.data$ANL01FL == "Y") %>%
    dm_update_zoomed()
}
<<<<<<< HEAD
=======

# `LBT01_1` Pipeline ----

#' `LBT01_1`
#'
#' @seealso [lbt01_1_main()]
#' @rdname chevron_tlg-class
#' @export
lbt01_1 <- chevron_tlg(lbt01_1_main, lbt01_1_pre, adam_datasets = c("adlb"))
>>>>>>> origin/main
