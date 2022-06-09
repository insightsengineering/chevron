# DTHT01_1 ----

#' `DTHT01` Table 1 (Default) Death Table.
#'
#' A description of the causes of death optionally with the breakdown of the `OTHER` category and/or post-study
#' reporting of death.
#'
#' @inheritParams gen_args
#' @param time_since_last_dose (`logical`) should the time to event information be displayed.
#' @param other_category (`logical`) should the breakdown of the `OTHER` category be displayed.
#'
#' @details
#'  * Numbers represent absolute numbers of subjects and fraction of `N`, or absolute numbers when specified.
#'  * Remove zero-count rows unless overridden with `prune_0 = FALSE`.
#'  * Does not include a total column by default.
#'  * For the breakdown of `OTHER`, the percentages are based on `N`.
#'
#' @export
#'
#' @examples
#' library(dm)
#'
#' db <- syn_test_data() %>%
#'   dm_zoom_to(adsl) %>%
#'   mutate(DTHCAT = tern::explicit_na(DTHCAT)) %>%
#'   mutate(LDDTHGR1 = tern::explicit_na(LDDTHGR1)) %>%
#'   dm_update_zoomed() %>%
#'   dtht01_1_pre()
#'
#' dtht01_1(adam_db = db)
#' dtht01_1(adam_db = db, other_category = TRUE)
#' dtht01_1(adam_db = db, time_since_last_dose = TRUE)
#' dtht01_1(adam_db = db, time_since_last_dose = TRUE, other_category = TRUE)
dtht01_1 <- function(adam_db,
                     armvar = .study$actualarm,
                     time_since_last_dose = FALSE,
                     other_category = FALSE,
                     lbl_overall = .study$lbl_overall,
                     prune_0 = TRUE,
                     deco = std_deco("DTHT01"),
                     .study = list(
                       actualarm = "ACTARM",
                       lbl_overall = NULL
                     )) {
  dbsel <- get_db_data(adam_db, "adsl")

  checkmate::assert_factor(dbsel$adsl$DTHFL, any.missing = FALSE)
  checkmate::assert_factor(dbsel$adsl$DTHCAT, any.missing = FALSE)
  checkmate::assert_flag(time_since_last_dose)
  checkmate::assert_flag(other_category)


  lyt <- dtht01_1_lyt(
    armvar = armvar,
    other_category = other_category,
    lbl_overall = lbl_overall,
    deco = deco
  )

  tbl <- build_table(lyt, dbsel$adsl)

  if (time_since_last_dose) {
    assert_factor(dbsel$adsl$LDDTHGR1, any.missing = FALSE)

    lyt2 <- dtht01_1_opt_lyt(
      armvar = armvar,
      lbl_overall = lbl_overall,
      deco = deco
    )

    tbl_other <- build_table(lyt2, dbsel$adsl)

    col_info(tbl_other) <- col_info(tbl)

    tbl <- rbind(tbl, tbl_other)

    tbl <- set_decoration(tbl, deco)
  }

  if (prune_0) {
    tbl <- prune_table(tbl)
  }

  tbl
}

#' @describeIn dtht01_1 `dtht01_1` Layout
#'
#' @inheritParams gen_args
#' @param other_category (`logical`) should the breakdown of the `OTHER` category be displayed.
#'
#' @export
#'
#' @examples
#' dtht01_1_lyt(
#'   armvar = "ACTARM",
#'   lbl_overall = NULL
#' )
dtht01_1_lyt <- function(armvar = .study$actualarm,
                         lbl_overall = .study$lbl_overall,
                         other_category = TRUE,
                         deco = std_deco("DTHT01"),
                         .study = list(
                           actualarm = "ACTARM",
                           lbl_overall = NULL
                         )) {
  tab <-
    basic_table_deco(deco) %>%
    split_cols_by(var = armvar) %>%
    add_colcounts() %>%
    ifneeded_add_overall_col(lbl_overall) %>%
    count_values(
      "DTHFL",
      values = "Y",
      .labels =  c(count_fraction = "Total number of deaths"),
      .formats = c(count_fraction = "xx (xx.x%)")
    ) %>%
    summarize_vars(
      vars = c("DTHCAT"),
      var_labels = c("Primary cause of death"),
      denom = "N_col"
    )

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
        .indent_mods = c("count_fraction" = 4L),
        denom = "N_col"
      )
  }
  tab
}

#' @describeIn dtht01_1 `dtht01_1` Optional Layout
#'
#' @inheritParams gen_args
#'
#' @export
#'
#' @examples
#' dtht01_1_opt_lyt(
#'   armvar = "ACTARM",
#'   lbl_overall = NULL
#' )
dtht01_1_opt_lyt <- function(armvar = .study$actualarm,
                             lbl_overall = .study$lbl_overall,
                             deco = std_deco("DTHT01"),
                             .study = list(
                               actualarm = "ACTARM",
                               lbl_overall = NULL
                             )) {
  basic_table_deco(deco) %>%
    split_cols_by(var = armvar) %>%
    add_colcounts() %>%
    ifneeded_add_overall_col(lbl_overall) %>%
    summarize_vars(
      vars = "LDDTHGR1",
      var_labels = "Days from last drug administration",
      show_labels = "visible",
      denom = "N_col"
    ) %>%
    split_rows_by(
      "LDDTHGR1",
      split_fun = remove_split_levels("<Missing>"),
      split_label = "Primary cause by days from last study drug administration",
      label_pos = "visible"
    ) %>%
    summarize_vars("DTHCAT", denom = "N_col")
}

#' @describeIn dtht01_1 `dtht01_1` Preprocessing
#'
#' @inheritParams gen_args
#'
#' @export
#'
#' @examples
#' syn_test_data() %>%
#'   dtht01_1_pre()
dtht01_1_pre <- function(adam_db) {
  checkmate::assert_class(adam_db, "dm")

  death_fact <- levels(adam_db$adsl$DTHCAT)
  death_fact <- setdiff(death_fact, "OTHER")
  death_fact <- c(death_fact, "OTHER")

  adam_db %>%
    dm_zoom_to("adsl") %>%
    mutate(DTHCAT = fct_relevel(.data$DTHCAT, death_fact)) %>%
    dm_update_zoomed()
}
