# dtht01_1 ----

#' @describeIn dtht01_1 Main TLG function
#'
#' @inheritParams gen_args
#' @param time_since_last_dose (`logical`) should the time to event information be displayed.
#' @param other_category (`logical`) should the breakdown of the `OTHER` category be displayed.
#'
#' @details
#'  * Numbers represent absolute numbers of subjects and fraction of `N`, or absolute numbers when specified.
#'  * Remove zero-count rows unless overridden with `prune_0 = FALSE`.
#'  * Does not include a total column by default.
#'
#' @note
#' * `adam_db` object must contain an `adsl` table with the columns `"DTHFL"`, `"DTHCAT"` as well as `LDDTHGR1` if
#' `time_since_last_dose` is `TRUE`.
#' * `lyt_ls` must contain a "causes" and, if `time_since_last_dose` is `TRUE`, a "time_since_last_dose" element.
#'
#' @export
#'
dtht01_1_main <- function(adam_db,
                          lyt_ls = list(causes = dtht01_1_lyt, time_since_last_dose = dtht01_1_opt_lyt),
                          armvar = .study$actualarm,
                          time_since_last_dose = FALSE,
                          other_category = FALSE,
                          lbl_overall = .study$lbl_overall,
                          prune_0 = TRUE,
                          deco = std_deco("DTHT01"),
                          .study = list(
                            actualarm = "ACTARM",
                            lbl_overall = NULL
                          ),
                          ...) {
  dbsel <- get_db_data(adam_db, "adsl")

  checkmate::assert_subset("causes", names(lyt_ls))
  checkmate::assert_factor(dbsel$adsl$DTHFL, any.missing = FALSE)
  checkmate::assert_factor(dbsel$adsl$DTHCAT, any.missing = FALSE)
  checkmate::assert_flag(time_since_last_dose)
  checkmate::assert_flag(other_category)


  lyt <- lyt_ls[["causes"]](
    armvar = armvar,
    other_category = other_category,
    lbl_overall = lbl_overall,
    deco = deco,
    ... = ...
  )

  tbl <- build_table(lyt, dbsel$adsl)

  if (time_since_last_dose) {
    checkmate::assert_subset("time_since_last_dose", names(lyt_ls))
    checkmate::assert_factor(dbsel$adsl$LDDTHGR1, any.missing = FALSE)

    lyt2 <- lyt_ls[["time_since_last_dose"]](
      armvar = armvar,
      lbl_overall = lbl_overall,
      deco = deco,
      ... = ...
    )

    tbl_other <- build_table(lyt2, dbsel$adsl)

    col_info(tbl_other) <- col_info(tbl)

    tbl <- rbind(tbl, tbl_other)

    tbl <- set_decoration(tbl, deco)
  }

  if (prune_0) {
    tbl <- smart_prune(tbl)
  }

  tbl
}

#' @describeIn dtht01_1 Layout
#'
#' @inheritParams gen_args
#' @param other_category (`logical`) should the breakdown of the `OTHER` category be displayed.
#' @param ... not used.
#'
#' @export
#'
dtht01_1_lyt <- function(armvar = .study$actualarm,
                         lbl_overall = .study$lbl_overall,
                         other_category = TRUE,
                         deco = std_deco("DTHT01"),
                         .study = list(
                           actualarm = "ACTARM",
                           lbl_overall = NULL
                         ),
                         ...) {
  tab <-
    basic_table_deco(deco) %>%
    split_cols_by(var = armvar) %>%
    add_colcounts() %>%
    ifneeded_add_overall_col(lbl_overall) %>%
    count_values(
      "DTHFL",
      values = "Y",
      .labels = c(count_fraction = "Total number of deaths"),
      .formats = c(count_fraction = "xx (xx.x%)")
    ) %>%
    summarize_vars(vars = c("DTHCAT"), var_labels = c("Primary cause of death"))

  if (other_category) {
    tab <-
      tab %>%
      split_rows_by(
        "DTHCAT",
        split_fun = keep_split_levels("OTHER"),
        child_labels = "hidden"
      ) %>%
      summarize_vars(
        "DTHCAUS",
        nested = TRUE,
        .stats = "count_fraction",
        .indent_mods = c("count_fraction" = 4L)
      )
  }
  tab
}

#' @describeIn dtht01_1 Optional Layout
#'
#' @inheritParams gen_args
#' @param ... not used.
#'
#' @export
#'
dtht01_1_opt_lyt <- function(armvar = .study$actualarm,
                             lbl_overall = .study$lbl_overall,
                             deco = std_deco("DTHT01"),
                             .study = list(
                               actualarm = "ACTARM",
                               lbl_overall = NULL
                             ),
                             ...) {
  basic_table_deco(deco) %>%
    split_cols_by(var = armvar) %>%
    add_colcounts() %>%
    ifneeded_add_overall_col(lbl_overall) %>%
    summarize_vars(
      vars = "LDDTHGR1",
      var_labels = "Days from last drug administration",
      show_labels = "visible"
    ) %>%
    split_rows_by(
      "LDDTHGR1",
      split_fun = remove_split_levels("<Missing>"),
      split_label = "Primary cause by days from last study drug administration",
      label_pos = "visible"
    ) %>%
    summarize_vars("DTHCAT")
}

#' @describeIn dtht01_1 Preprocessing
#'
#' @inheritParams gen_args
#' @param ... not used.
#'
#' @export
#'
dtht01_1_pre <- function(adam_db, ...) {
  checkmate::assert_class(adam_db, "dm")

  death_fact <- levels(adam_db$adsl$DTHCAT)
  death_fact <- setdiff(death_fact, "OTHER")
  death_fact <- c(death_fact, "OTHER")

  existing_lvl <- as.list(setNames(death_fact, death_fact))
  na_lvl <- list("<Missing>" = c("", NA))

  new_formats <- list(
    adsl = list(
      DTHCAT = c(
        existing_lvl,
        na_lvl
      ),
      DTHCAUS = na_lvl,
      LDDTHGR1 = na_lvl
    )
  )

  dunlin::apply_reformat(adam_db, new_formats)
}

#' `DTHT01` Table 1 (Default) Death Table.
#'
#'  A description of the causes of death optionally with the breakdown of the
#' `OTHER` category and/or post-study reporting of death.
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#'
#' db <- syn_test_data()
#'
#' run(dtht01_1, db)
#' run(dtht01_1, db, other_category = TRUE, time_since_last_dose = TRUE)
dtht01_1 <- chevron_tlg(
  dtht01_1_main,
  list(causes = dtht01_1_lyt, time_since_last_dose = dtht01_1_opt_lyt),
  dtht01_1_pre,
  adam_datasets = c("adsl"),
  type = "t"
)
