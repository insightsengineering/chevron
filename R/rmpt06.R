# rmpt06 ----

#' @describeIn rmpt06 Main TLG function
#'
#' @inheritParams gen_args
#' @param method (`string`) the method used to construct the confidence interval.
#' See [`tern::estimate_proportions`].
#' @param conf_level (`proportion`) the confidence level of the interval. See [`tern::estimate_proportions`].
#' @param show_diff (`flag`) whether to show the difference of patient with at least one adverse event  between groups.
#' @param ref_group (`string`) the reference group for the difference.
#' @param method_diff (`string`) the method used to construct the confidence interval for the difference between groups.
#' @param conf_level_diff (`proportion`) the confidence level of the interval for the difference between groups.
#' @param grade_groups (`list`) the grade groups to be displayed.
#'
#' @export
rmpt06_main <- function(adam_db,
                        arm_var = "ACTARM",
                        lbl_overall = NULL,
                        method = "clopper-pearson",
                        conf_level = 0.95,
                        show_diff = FALSE,
                        ref_group = NULL,
                        method_diff = "wald",
                        conf_level_diff = 0.95,
                        grade_groups = NULL,
                        ...) {
  assert_all_tablenames(adam_db, "adsl", "adae")
  assert_string(arm_var)
  assert_string(lbl_overall, null.ok = TRUE)
  assert_choice(
    method,
    c(
      "waldcc", "wald", "clopper-pearson", "wilson", "wilsonc",
      "strat_wilson", "strat_wilsonc", "agresti-coull", "jeffreys"
    )
  )
  assert_numeric(conf_level, lower = 0, upper = 1)
  assert_flag(show_diff)
  assert_choice(
    method_diff,
    c(
      "waldcc", "wald", "cmh", "ha", "newcombe", "newcombecc", "strat_newcombe",
      "strat_newcombecc"
    )
  )
  assert_numeric(conf_level_diff, lower = 0, upper = 1)
  assert_list(grade_groups, null.ok = TRUE)
  assert_valid_variable(adam_db$adsl, "AEFL", types = list("logical"))
  assert_valid_variable(adam_db$adae, "ATOXGR", na_ok = TRUE, types = list("factor"))
  assert_valid_variable(adam_db$adae, "AESER", types = list("character", "factor"))
  assert_valid_variable(adam_db$adae, "AEOUT", na_ok = TRUE, types = list("factor"))
  assert_valid_variable(adam_db$adsl, c("USUBJID", arm_var))
  assert_valid_variable(adam_db$adae, c(arm_var), types = list(c("character", "factor")))
  assert_valid_variable(adam_db$adae, "USUBJID", empty_ok = TRUE, types = list(c("character", "factor")))
  assert_valid_var_pair(adam_db$adsl, adam_db$adae, arm_var)

  lbl_overall <- render_safe(lbl_overall)

  if (is.null(grade_groups)) {
    grade_groups <- list(
      "Grade 1" = "1",
      "Grade 2" = "2",
      "Grade 3" = "3",
      "Grade 4" = "4",
      "Grade 5 (fatal outcome)" = "5"
    )
  }

  ref_group <- ref_group %||% lvls(adam_db$adsl[[arm_var]])[1]

  lyt <- rmpt06_lyt(
    arm_var = arm_var,
    lbl_overall = lbl_overall,
    method = method,
    ref_group = ref_group,
    conf_level = conf_level,
    show_diff = show_diff,
    method_diff = method_diff,
    conf_level_diff = conf_level_diff,
    grade_groups = grade_groups
  )

  tbl_adsl <- build_table(lyt$adsl, adam_db$adsl)
  tbl_adae <- build_table(lyt$adae, adam_db$adae, alt_counts_df = adam_db$adsl)

  col_info(tbl_adae) <- col_info(tbl_adsl)

  rbind(
    tbl_adsl,
    tbl_adae
  )
}

#' `rmpt06` Layout
#'
#' @inheritParams gen_args
#'
#' @keywords internal
#'
rmpt06_lyt <- function(arm_var,
                       lbl_overall,
                       method,
                       conf_level,
                       show_diff,
                       ref_group,
                       method_diff,
                       conf_level_diff,
                       grade_groups) {
  lyt <- basic_table(show_colcounts = TRUE) %>%
    split_cols_by_with_overall(arm_var, lbl_overall, ref_group = ref_group)

  lyt_adsl <- lyt %>%
    estimate_proportion(
      vars = "AEFL",
      method = method,
      conf_level,
      .labels = c(
        n_prop = render_safe("Number of {patient_label} with at least one adverse event"),
        prop_ci = paste0(
          100 * conf_level,
          render_safe("% CI for % of {patient_label} with at least one AE ("),
          stringr::str_to_title(method),
          ")"
        )
      ),
      table_names = "est_prop"
    )

  if (show_diff) {
    lyt_adsl <- lyt_adsl %>%
      estimate_proportion_diff(
        vars = "AEFL",
        method = method_diff,
        conf_level = conf_level_diff,
        .labels = c(
          diff = render_safe("Difference in % of {patient_label} with at least one AE"),
          diff_ci = paste0(
            100 * conf_level_diff,
            "% CI of difference (",
            stringr::str_to_title(method_diff),
            ")"
          )
        ),
        table_names = "est_diff"
      )
  }

  lyt_adae <- lyt %>%
    analyze_num_patients(
      vars = "USUBJID",
      .stats = c("nonunique"),
      .labels = c(
        nonunique = "Total number of AEs"
      ),
      .formats = list(nonunique = "xx"),
      show_labels = "hidden"
    ) %>%
    count_occurrences_by_grade(
      var = "ATOXGR",
      var_labels = render_safe("Total number of {patient_label} with at least one AE by worst grade"),
      show_labels = "visible",
      grade_groups = grade_groups
    ) %>%
    count_patients_with_event(
      "USUBJID",
      filters = c("AESER" = "Y"),
      .labels = c(count_fraction = render_safe("Number of {patient_label} with at least one serious AE")),
      denom = "N_col",
      .formats = c(count_fraction = format_count_fraction_fixed_dp),
      table_names = "aeser"
    ) %>%
    count_occurrences(
      "AEOUT",
      denom = "n",
      var_labels = render_safe("Number of {patient_label} with at least one AE by outcome"),
      show_labels = "visible",
      drop = FALSE
    )


  list(
    adsl = lyt_adsl,
    adae = lyt_adae
  )
}

#' @describeIn rmpt06 Preprocessing
#'
#' @inheritParams rmpt06_main
#'
#' @export
rmpt06_pre <- function(adam_db, ...) {
  aeout_rule <- rule(
    "Fatal outcome" = "FATAL",
    "Unresolved" = "NOT RECOVERED/NOT RESOLVED",
    "Recovered/Resolved" = "RECOVERED/RESOLVED",
    "Resolved with sequelae" = "RECOVERED/RESOLVED WITH SEQUELAE",
    "Recovering/Resolving" = "RECOVERING/RESOLVING",
    "Unknown outcome" = "UNKNOWN"
  )

  adam_db$adae <- adam_db$adae %>%
    filter(.data$ANL01FL == "Y") %>%
    mutate(AEOUT = reformat(.data$AEOUT, aeout_rule))

  adam_db$adsl <- adam_db$adsl %>%
    mutate(AEFL = .data$USUBJID %in% .env$adam_db$adae$USUBJID)

  adam_db
}

#' @describeIn rmpt06 Postprocessing
#'
#' @inheritParams gen_args
#'
#' @export
#'
rmpt06_post <- function(tlg, prune_0 = FALSE, ...) {
  if (prune_0) {
    tlg <- smart_prune(tlg)
  }
  std_postprocess(tlg)
}

#' `RMPT06` Table 1 (Default) Seriousness, Outcomes, Severity, Frequency with 95% CI for Risk Management Plan.
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' run(rmpt06, syn_data)
rmpt06 <- chevron_t(
  main = rmpt06_main,
  preprocess = rmpt06_pre,
  postprocess = rmpt06_post
)
