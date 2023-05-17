# dtht01 ----

#' @describeIn dtht01 Main TLG function
#'
#' @inheritParams gen_args
#' @param time_since_last_dose (`flag`) should the time to event information be displayed.
#' @param other_category (`flag`) should the breakdown of the `OTHER` category be displayed.
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
dtht01_main <- function(adam_db,
                        arm_var = "ACTARM",
                        other_category = FALSE,
                        time_since_last_dose = FALSE,
                        lbl_overall = NULL,
                        ...) {
  assert_all_tablenames(adam_db, "adsl")
  checkmate::assert_string(arm_var)
  checkmate::assert_flag(other_category)
  checkmate::assert_string(lbl_overall, null.ok = TRUE)
  checkmate::assert_flag(time_since_last_dose, null.ok = TRUE)

  other_var <- if (other_category) "DTHCAUS"
  dose_death_var <- if (time_since_last_dose) "LDDTHGR1"
  assert_valid_variable(adam_db$adsl, c("USUBJID", arm_var), types = list("character", "factor"))
  assert_valid_variable(
    adam_db$adsl,
    "DTHFL",
    types = list("character", "factor"), na_ok = TRUE, min_chars = 0L
  )
  assert_valid_variable(
    adam_db$adsl,
    c("DTHCAT", other_var, dose_death_var),
    types = list("character", "factor"), na_ok = TRUE, min_chars = 1L
  )
  if (other_category) {
    death_cause <- lvls(adam_db$adsl$DTHCAT)
    if (length(death_cause) == 0L) {
      stop("other_category specified but could not find any level in `DTHCAT`!")
    }
    other_level <- death_cause[length(death_cause)]
    if (toupper(other_level) != "OTHER") {
      warning(
        "You included detailed information for Other, however the last level of ",
        " `adam_db$adsl$DTHCAT` looks like not `Other`.",
        call. = FALSE
      )
    }
  }

  lyt <- dtht01_lyt(
    arm_var = arm_var,
    lbl_overall = lbl_overall,
    other_var = other_var,
    other_level = other_level,
    death_flag = "DTHFL",
    death_var = "DTHCAT",
    dose_death_var = dose_death_var
  )
  adsl <- adam_db$adsl %>%
    mutate(TOTAL = "Primary Cause of Death")
  build_table(lyt, adsl)
}

#' dtht01 Layout
#'
#' @inheritParams dtht01_main
#' @param death_falg (`string`) variable name of death flag.
#' @param detah_var (`string`) variable name of death catagory.
#' @param other_level (`string`) "Other" level in death catagory.
#' @param other_var (`string`) variable name of death cause under "Other".
#' @param dose_death_var (`string`) variable name of the days from last dose.
#'
#' @keywords internal
#'
dtht01_lyt <- function(arm_var,
                       lbl_overall,
                       death_flag,
                       death_var,
                       other_level,
                       other_var,
                       dose_death_var) {
  if (is.null(dose_death_var) && is.null(other_var)) {
    lyt_block_fun <- analyze
  } else {
    lyt_block_fun <- summarize_row
  }
  lyt <- basic_table() %>%
    split_cols_by("ACTARM") %>%
    add_colcounts() %>%
    count_values(
      death_flag,
      values = "Y",
      .labels = c(count_fraction = "Total number of deaths"),
      .formats = c(count_fraction = format_count_fraction_fixed_dp)
    ) %>%
    split_rows_by("TOTAL", child_labels = "visible", label_pos = "hidden", split_fun = drop_split_levels) %>%
    lyt_block_fun(
      death_var,
      make_afun(
        s_summary_na,
        .stats = c("n", "count_fraction"), .ungroup_stats = "count_fraction",
        .formats = list(n = "xx", count_fraction = format_count_fraction_fixed_dp)
      ),
      indent_mod = 0L
    )
  if (!is.null(other_var)) {
    lyt <- lyt %>%
      split_rows_by(death_var, split_fun = keep_split_levels(other_level), child_labels = "hidden") %>%
      summarize_vars(other_var, .stats = "count_fraction", denom = "N_row")
  }
  if (!is.null(dose_death_var)) {
    lyt <- lyt %>%
      summarize_vars_allow_na(
        vars = dose_death_var,
        var_labels = "Days from last drug administration",
        .formats = list(count_fraction = format_count_fraction_fixed_dp),
        show_labels = "visible",
        nested = FALSE,
        inclNAs = FALSE
      ) %>%
      split_rows_by(
        dose_death_var,
        split_fun = drop_split_levels,
        split_label = "Primary cause by days from last study drug administration",
        label_pos = "visible",
        nested = FALSE
      ) %>%
      summarize_vars_allow_na(
        death_var,
        .formats = list(count_fraction = format_count_fraction_fixed_dp)
      )
  }
  lyt
}

#' @describeIn dtht01 Preprocessing
#'
#' @inheritParams gen_args
#'
#' @export
#'
dtht01_pre <- function(adam_db, ...) {
  death_format <- rule(
    "Adverse Event" = "ADVERSE EVENT",
    "Progressive Disease" = "PROGRESSIVE DISEASE",
    "Other" = "OTHER"
  )
  adam_db$adsl <- adam_db$adsl %>%
    mutate(
      DTHCAT = reformat(.data$DTHCAT, death_format)
    )
  adam_db
}


#' @describeIn dtht01 Postprocessing
#'
#' @inheritParams gen_args
#'
#' @export
#'
dtht01_post <- function(tlg, prune_0 = TRUE, ...) {
  if (prune_0) {
    tlg <- smart_prune(tlg)
  }
  std_postprocess(tlg)
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
#' run(dtht01, db)
#' run(dtht01, db, other_category = TRUE, time_since_last_dose = TRUE)
dtht01 <- chevron_t(
  main = dtht01_main,
  preprocess = dtht01_pre,
  postprocess = dtht01_post,
  adam_datasets = c("adsl")
)
