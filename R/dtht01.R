# DTHT01_1 ----

#' `DTHT01` Table 1 (Default) Death Table.
#'
#' A description of the causes of death.
#'
#' @inheritParams gen_args
#' @param add_time_to_event (`logical`) should the time to event information be displayed.

#' @details
#'  * Numbers represent absolute numbers of subjects and fraction of `N`, or absolute numbers when specified.
#'  * Remove zero-count rows unless overridden with `prune_0 = FALSE`.
#'  * Does not include a total column by default.
#'
#' @importFrom dplyr filter
#' @importFrom magrittr %>%
#'
#' @export
#'
#' @examples
#' library(tern)
#' library(dm)
#' library(dplyr)
#'
#' db <- syn_test_data() %>%
#'  dm_zoom_to(adsl) %>%
#'  mutate(DTHCAT = explicit_na(DTHCAT)) %>%
#'  mutate(LDDTHGR1 = explicit_na(LDDTHGR1)) %>%
#'  dm_update_zoomed() %>%
#'  preprocess_data("dtht01_1")
#'
#' dtht01_1(adam_db = db)
#' dtht01_1(adam_db = db, add_time_to_event = FALSE)
#'
dtht01_1 <- function(adam_db,
                     armvar = .study$armvar,
                     add_time_to_event = TRUE,
                     lbl_overall = .study$lbl_overall,
                     prune_0 = TRUE,
                     deco = std_deco("DTHT01"),
                     .study = list(
                       armvar = "ACTARM",
                       lbl_overall = NULL
                     )) {

  dbsel <- get_db_data(adam_db, "adsl")

  assert_factor(dbsel$adsl$DTHFL, any.missing = FALSE)
  assert_factor(dbsel$adsl$DTHCAT, any.missing = FALSE)

  lyt <- dtht01_1_lyt(
    armvar = armvar,
    lbl_overall = lbl_overall,
    deco = deco
  )

  tbl <- build_table(lyt, dbsel$adsl)

  if (add_time_to_event) {

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
    tbl <- tbl %>% prune_table()
  }

  tbl
}


#' `DTHT01` Layout 1 (Default)
#'
#' @describeIn dtht01_1
#'
#' @inheritParams gen_args

#' @export
#'
#' @examples
#' dtht01_1_lyt(
#'   armvar = "ACTARM",
#'   lbl_overall = NULL
#' )
dtht01_1_lyt <- function(adam_db,
                     armvar = .study$armvar,
                     lbl_overall = .study$lbl_overall,
                     deco = std_deco("DTHT01"),
                     .study = list(
                       armvar = "ACTARM",
                       lbl_overall = NULL
                     )) {

    basic_table_deco(deco) %>%
    split_cols_by(var = armvar) %>%
    add_colcounts() %>%
    ifneeded_add_overall_col(lbl_overall) %>%
    count_values(
      "DTHFL",
      values = "Y",
      .labels =  c(count_fraction = "Total number of deaths"),
      .formats = c(count_fraction = "xx (xx.x%)"))  %>%
    summarize_vars(vars = c("DTHCAT"), var_labels = c("Primary cause of death"))
}


#' `DTHT01` Layout 1 Optional (Optional)
#'
#' @describeIn dtht01_1
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
dtht01_1_opt_lyt <- function(dam_db,
                     armvar = .study$armvar,
                     lbl_overall = .study$lbl_overall,
                     deco = std_deco("DTHT01"),
                     .study = list(
                       armvar = "ACTARM",
                       lbl_overall = NULL
                     )) {

  basic_table_deco(deco) %>%
    split_cols_by(var = armvar) %>%
    add_colcounts() %>%
    ifneeded_add_overall_col(lbl_overall) %>%
    summarize_vars(
    vars = "LDDTHGR1",
    var_labels = "Days from last drug administration",
    show_labels = "visible") %>%
    split_rows_by(
    "LDDTHGR1",
    split_fun = remove_split_levels("<Missing>"),
    split_label = "Primary cause by days from last study drug administration",
    label_pos = "visible") %>%
    summarize_vars("DTHCAT")
}



# DTHT01_2 ----

#' `DTHT01` Table 2 (Supplementary) Death Table.
#'
#' A description of the causes of death with post-study reporting of death.
#'
#' @inheritParams gen_args
#' @param add_time_to_event (`logical`) should the time to event information be displayed.
#'
#' @details
#'  * Numbers represent absolute numbers of subjects and fraction of `N`, or absolute numbers when specified.
#'  * Remove zero-count rows unless overridden with `prune_0 = FALSE`.
#'  * Does not include a total column by default.
#'
#' @importFrom dplyr filter
#' @importFrom magrittr %>%
#'
#' @export
#'
#' @examples
#' library(tern)
#' library(dm)
#' library(dplyr)
#'
#' db <- syn_test_data() %>%
#'  dm_zoom_to(adsl) %>%
#'  mutate(DTHCAT = explicit_na(DTHCAT)) %>%
#'  mutate(LDDTHGR1 = explicit_na(LDDTHGR1)) %>%
#'  mutate(DTHCAUS = explicit_na(DTHCAUS)) %>%
#'  dm_update_zoomed() %>%
#'  preprocess_data("dtht01_2")
#'
#' dtht01_2(adam_db = db)
#'
dtht01_2 <- function(adam_db,
                     armvar = .study$armvar,
                     add_time_to_event = TRUE,
                     lbl_overall = .study$lbl_overall,
                     prune_0 = TRUE,
                     deco = std_deco("DTHT01"),
                     .study = list(
                       armvar = "ACTARM",
                       lbl_overall = NULL
                     )) {

  dbsel <- get_db_data(adam_db, "adsl")

  assert_factor(dbsel$adsl$DTHFL, any.missing = FALSE)
  assert_factor(dbsel$adsl$DTHCAT, any.missing = FALSE)
  assert_factor(dbsel$adsl$DTHCAUS, any.missing = FALSE)

  lyt <- dtht01_2_lyt(
    armvar = armvar,
    lbl_overall = lbl_overall,
    deco = deco
  )

  tbl <- build_table(lyt, dbsel$adsl)

  if (add_time_to_event) {

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
    tbl <- tbl %>% prune_table()
  }

  tbl
}

#' `DTHT01` Layout 2 (Supplementary)
#'
#' @describeIn dtht01_2
#'
#' @inheritParams gen_args
#'
#' @export
#'
#' @examples
#' dtht01_2_lyt(
#'   armvar = "ACTARM",
#'   lbl_overall = NULL
#' )
dtht01_2_lyt <- function(adam_db,
                         armvar = .study$armvar,
                         lbl_overall = .study$lbl_overall,
                         deco = std_deco("DTHT01"),
                         .study = list(
                           armvar = "ACTARM",
                           lbl_overall = NULL
                         )) {

  basic_table_deco(deco) %>%
    split_cols_by(var = armvar) %>%
    add_colcounts() %>%
    ifneeded_add_overall_col(lbl_overall) %>%
    count_values(
      "DTHFL",
      values = "Y",
      .labels =  c(count_fraction = "Total number of deaths"),
      .formats = c(count_fraction = "xx (xx.x%)"))  %>%
    summarize_vars(vars = c("DTHCAT"), var_labels = c("Primary cause of death")) %>%
    split_rows_by("DTHCAT", split_fun = keep_split_levels("OTHER"), child_labels = "hidden") %>%
    summarize_vars(
      "DTHCAUS",
      nested = TRUE,
      .stats = "count_fraction",
      .indent_mods = c("count_fraction" = 4L))
}
