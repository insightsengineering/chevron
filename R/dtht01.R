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
#'
#' @export
#'
dtht01_1_main <- function(adam_db,
                          arm_var = "ACTARM",
                          time_since_last_dose = FALSE,
                          other_category = FALSE,
                          lbl_overall = NULL,
                          deco = std_deco("DTHT01"),
                          ...) {
  dbsel <- get_db_data(adam_db, "adsl")

  checkmate::assert_factor(dbsel$adsl$DTHFL, any.missing = FALSE)
  checkmate::assert_factor(dbsel$adsl$DTHCAT, any.missing = FALSE)
  checkmate::assert_flag(time_since_last_dose)
  checkmate::assert_flag(other_category)


  lyt <- dtht01_1_lyt(
    arm_var = arm_var,
    lbl_overall = lbl_overall,
    deco = deco
  )

  tbl <- build_table(lyt[[1]], dbsel$adsl)

  if (other_category) {
    tbl_2 <- build_table(lyt[[2]], dbsel$adsl %>% filter(.data$DTHFL == "Y")) # to ensure the correct denominator.
    col_info(tbl_2) <- col_info(tbl)
    tbl <- rbind(tbl, tbl_2)
  }


  if (time_since_last_dose) {
    checkmate::assert_factor(dbsel$adsl$LDDTHGR1, any.missing = FALSE)

    lyt2 <- dtht01_1_opt_lyt(
      arm_var = arm_var,
      lbl_overall = lbl_overall,
      deco = deco
    )

    tbl_opt <- build_table(lyt2, dbsel$adsl)
    col_info(tbl_opt) <- col_info(tbl)
    tbl <- rbind(tbl, tbl_opt)
    tbl <- set_decoration(tbl, deco)
  }
  tbl
}

#' @describeIn dtht01_1 Layout
#'
#' @inheritParams gen_args
#' @param other_category (`logical`) should the breakdown of the `OTHER` category be displayed.
#'
#' @export
#'
dtht01_1_lyt <- function(arm_var,
                         lbl_overall,
                         other_category,
                         deco) {
  tab <-
    basic_table_deco(deco) %>%
    split_cols_by(var = arm_var) %>%
    add_colcounts() %>%
    ifneeded_add_overall_col(lbl_overall) %>%
    count_values(
      "DTHFL",
      values = "Y",
      .labels = c(count_fraction = "Total number of deaths"),
      .formats = c(count_fraction = format_count_fraction_fixed_dp)
    ) %>%
    summarize_vars(
      vars = c("DTHCAT"),
      var_labels = c("Primary cause of death"),
      .formats = c(count_fraction = format_count_fraction_fixed_dp)
    )

  tab2 <-
    basic_table_deco(deco) %>%
    split_cols_by(var = arm_var) %>%
    add_colcounts() %>%
    ifneeded_add_overall_col(lbl_overall) %>%
    split_rows_by("DTHCAT", split_fun = keep_split_levels("OTHER"), child_labels = "hidden") %>%
    summarize_vars(
      "DTHCAUS",
      .stats = "count_fraction",
      .indent_mods = c("count_fraction" = 4L),
      .formats = c(count_fraction = format_count_fraction_fixed_dp),
      denom = "N_col"
    )

  list(tab, tab2)
}

#' @describeIn dtht01_1 Optional Layout
#'
#' @inheritParams gen_args
#'
#' @export
#'
dtht01_1_opt_lyt <- function(arm_var,
                             lbl_overall,
                             deco) {
  basic_table_deco(deco) %>%
    split_cols_by(var = arm_var) %>%
    add_colcounts() %>%
    ifneeded_add_overall_col(lbl_overall) %>%
    summarize_vars(
      vars = "LDDTHGR1",
      var_labels = "Days from last drug administration",
      show_labels = "visible",
      .formats = c(count_fraction = format_count_fraction_fixed_dp)
    ) %>%
    split_rows_by(
      "LDDTHGR1",
      split_fun = remove_split_levels("<Missing>"),
      split_label = "Primary cause by days from last study drug administration",
      label_pos = "visible"
    ) %>%
    summarize_vars(
      "DTHCAT",
      .formats = c(count_fraction = format_count_fraction_fixed_dp)
    )
}

#' @describeIn dtht01_1 Preprocessing
#'
#' @inheritParams gen_args
#'
#' @export
#'
dtht01_1_pre <- function(adam_db, ...) {
  checkmate::assert_class(adam_db, "dm")

  missing_rule <- rule("<Missing>" = c("", NA))

  new_formats <- list(
    adsl = list(
      DTHCAT = missing_rule,
      DTHCAUS = missing_rule,
      LDDTHGR1 = missing_rule
    )
  )

  # Reorder factors to have "OTHER" last.
  adam_db <- adam_db %>%
    dm_zoom_to("adsl") %>%
    mutate(DTHFL = as.factor(.data$DTHFL)) %>%
    mutate(DTHCAT = as.factor(.data$DTHCAT)) %>%
    mutate(DTHCAT = factor(.data$DTHCAT, levels = c(setdiff(levels(.data$DTHCAT), "OTHER"), "OTHER"))) %>%
    dm_update_zoomed()

  dunlin::reformat(adam_db, new_formats, na_last = TRUE)
}


#' @describeIn dtht01_1 Postprocessing
#'
#' @inheritParams gen_args
#'
#' @export
#'
dtht01_1_post <- function(tlg, prune_0 = TRUE, ...) {
  if (prune_0) {
    tbl <- smart_prune(tlg)
  }
  std_postprocess(tbl)
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
#' db <- syn_data
#'
#' run(dtht01_1, db)
#' run(dtht01_1, db, other_category = TRUE, time_since_last_dose = TRUE)
dtht01_1 <- chevron_t(
  main = dtht01_1_main,
  preprocess = dtht01_1_pre,
  postprocess = dtht01_1_post,
  adam_datasets = c("adsl")
)
