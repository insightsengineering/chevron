#' AET01 Table
#'
#' @inheritParams gen_args
#'
#' @export
#'
#' @examples
#' # TODO: add examples
aet01_1 <- function(
  adsl, adae,
  armvar = .study$armvar,
  deco = std_deco("AET01"),
  .study = list(
    armvar = "ACTARM"
  )
) {

  aesi_vars <- c("FATAL", "SER", "SERWD", "SERDSM", "RELSER", "WD", "DSM", "REL", "RELWD", "RELDSM", "CTC35")

  # Layout for variables from adsl dataset.
  lyt_adsl <- basic_table() %>%
    split_cols_by(armvar) %>%
    add_colcounts() %>%
    count_values(
      "DTHFL",
      values = "Y",
      .labels = c(count_fraction = "Total number of deaths"),
      denom = "N_col"
    ) %>%
    count_values(
      "DCSREAS",
      values = "ADVERSE EVENT",
      .labels = c(count_fraction = "Total number of patients withdrawn from study due to an AE"),
      denom = "N_col"
    )

  result_adsl <- build_table(lyt_adsl, df = adsl, alt_counts_df = adsl)

  # Layout for variables from adae dataset.
  lyt_adae <- basic_table() %>%
    split_cols_by("ACTARM") %>%
    add_colcounts() %>%
    count_patients_with_event(
      vars = "USUBJID",
      filters = c("STUDYID" = as.character(unique(adae$STUDYID))),
      denom = "N_col",
      .labels = c(count_fraction = "Total number of patients with at least one adverse event")
    ) %>%
    count_values(
      "STUDYID",
      values = as.character(unique(adae$STUDYID)),
      .stats = "count",
      .labels = c(count = "Total AEs"),
      table_names = "total_aes"
    ) %>%
    count_patients_with_flags(
      "USUBJID",
      flag_variables = var_labels(adae[, aesi_vars]),
      .indent_mods = 1L
    )

  result_adae <- build_table(lyt_adae, df = adae, alt_counts_df = adsl)
  result_adae <- insert_rrow(result_adae, rrow("Total number of patients with at least one"), at = 3)

  # Combine tables.
  col_info(result_adsl) <- col_info(result_adae)
  result <- rbind(
    result_adae[1:2, ],
    result_adsl,
    result_adae[3:nrow(result_adae), ]
  )

  result

}
