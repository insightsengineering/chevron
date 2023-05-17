# aet01_aesi ----

#' @describeIn aet01_aesi Main TLG function
#'
#' @inheritParams gen_args
#' @param aesi_vars (`character`) the AESI variables to be included in the summary. Defaults to `NA`.
#' @param grade_groups (`list`) the grade groups to be displayed.
#' @details
#'  * Does not remove rows with zero counts by default.
#'
#' @note
#'  * `adam_db` object must contain an `adae` table with columns `"AEOUT"`, `"AEACN"`, `"AECONTRT"`, `"AESER"`,
#'  `"AREL"`, and the column specified by `arm_var`.
#'  * `aesi_vars` may contain any/all of the following variables to display: `"ALLRESWD"`, `"ALLRESDSM"`,
#'  `"ALLRESCONTRT"`, `"NOTRESWD"`, `"NOTRESDSM"`, `"NOTRESCONTRT"`, `"SERWD"`, `"SERDSM"`, `"SERCONTRT"`,
#'  `"RELWD"`, `"RELDSM"`, `"RELCONTRT"`, `"RELSER"`.
#'  * `aesi_vars` variable prefixes are defined as follows:
#'    * `"ALLRES"` = "all non-fatal adverse events resolved"
#'    * `"NOTRES"` = "at least one unresolved or ongoing non-fatal adverse event"
#'    * `"SER"` = "serious adverse event"
#'    * `"REL"` = "related adverse event"
#'  * `aesi_vars` variable suffixes are defined as follows:
#'    * `"WD"` = "patients with study drug withdrawn"
#'    * `"DSM"` = "patients with dose modified/interrupted"
#'    * `"CONTRT"` = "patients with treatment received"
#'  * Several `aesi_vars` can be added to the table at once:
#'    * `aesi_vars = "ALL"` will include all possible `aesi_vars`.
#'    * Including `"ALL_XXX"` in `aesi_vars` where `XXX` is one of the prefixes listed above will include all
#'    `aesi_vars` with that prefix.
#'
#' @export
#'
aet01_aesi_main <- function(adam_db,
                            arm_var = "ACTARM",
                            aesi_vars = NULL,
                            grade_groups = NULL,
                            lbl_overall = NULL,
                            ...) {
  assert_all_tablenames(adam_db, "adsl", "adae")
  checkmate::assert_string(arm_var)
  checkmate::assert_character(aesi_vars, null.ok = TRUE)
  checkmate::assert_list(grade_groups, null.ok = TRUE)
  checkmate::assert_string(lbl_overall, null.ok = TRUE)
  assert_valid_variable(adam_db$adsl, c("USUBJID", arm_var))
  assert_valid_variable(adam_db$adae, c(arm_var))
  assert_valid_variable(adam_db$adae, "USUBJID", empty_ok = TRUE)
  assert_valid_var_pair(adam_db$adsl, adam_db$adae, arm_var)

  if (is.null(grade_groups)) {
    grade_groups <- list(
      "Grade 1" = "1",
      "Grade 2" = "2",
      "Grade 3" = "3",
      "Grade 4" = "4",
      "Grade 5 (fatal outcome)" = "5"
    )
  }
  all_aesi_vars <- get_aesi_vars(aesi_vars)
  assert_valid_variable(adam_db$adae, c(all_aesi_vars), empty_ok = TRUE, na_ok = TRUE, types = list("logical"))
  lbl_aesi_vars <- var_labels_for(adam_db$adae, all_aesi_vars)

  lyt <- aet01_aesi_lyt(
    arm_var = arm_var,
    aesi_vars = all_aesi_vars,
    lbl_aesi_vars = lbl_aesi_vars,
    lbl_overall = lbl_overall,
    grade_groups = grade_groups
  )

  tbl <- build_table(lyt, adam_db$adae, alt_counts_df = adam_db$adsl)

  tbl
}

#' `aet01_aesi` Layout
#'
#' @inheritParams gen_args
#' @param lbl_aesi_vars (`character`) the labels of the AESI variables to be summarized.
#'
#' @keywords internal
#'
aet01_aesi_lyt <- function(arm_var,
                           aesi_vars,
                           lbl_overall,
                           lbl_aesi_vars,
                           grade_groups) {
  names(lbl_aesi_vars) <- aesi_vars
  basic_table(show_colcounts = TRUE) %>%
    split_cols_by(var = arm_var) %>%
    ifneeded_add_overall_col(lbl_overall) %>%
    count_patients_with_event(
      vars = "USUBJID",
      filters = c("ANL01FL" = "Y"),
      denom = "N_col",
      .labels = c(count_fraction = "Total number of patients with at least one AE")
    ) %>%
    count_values(
      "ANL01FL",
      values = "Y",
      .stats = "count",
      .labels = c(count = "Total number of AEs"),
      table_names = "total_aes"
    ) %>%
    count_occurrences_by_grade(
      var = "ATOXGR",
      var_labels = "Total number of patients with at least one AE by worst grade",
      show_labels = "visible",
      grade_groups = grade_groups
    ) %>%
    count_patients_with_flags(
      "USUBJID",
      flag_variables = lbl_aesi_vars,
      denom = "N_col"
    )
}

#' @describeIn aet01_aesi Preprocessing
#'
#' @inheritParams aet01_aesi_main
#'
#' @export
#'
aet01_aesi_pre <- function(adam_db,
                           ...) {
  assert_all_tablenames(adam_db, c("adsl", "adae"))

  adam_db$adae <- adam_db$adae %>%
    filter(.data$ANL01FL == "Y") %>%
    mutate(
      NOT_RESOLVED = with_label(
        .data$AEOUT %in% c("NOT RECOVERED/NOT RESOLVED", "RECOVERING/RESOLVING", "UNKNOWN"),
        "Total number of patients with at least one unresolved or ongoing non-fatal AE"
      ),
      ALL_RESOLVED = with_label(
        !.data$AEOUT %in% "FATAL" & !.data$NOT_RESOLVED,
        "Total number of patients with all non-fatal AEs resolved"
      ),
      WD = with_label(
        .data$AEACN %in% "DRUG WITHDRAWN", "Total number of patients with study drug withdrawn due to AE"
      ),
      DSM = with_label(
        .data$AEACN %in% c("DRUG INTERRUPTED", "DOSE INCREASED", "DOSE REDUCED"),
        "Total number of patients with dose modified/interrupted due to AE"
      ),
      CONTRT = with_label(
        .data$AECONTRT %in% "Y", "Total number of patients with treatment received for AE"
      ),
      SER = with_label(
        .data$AESER %in% "Y", "Total number of patients with at least one serious AE"
      ),
      REL = with_label(
        .data$AREL %in% "Y", "Total number of patients with at least one related AE"
      ),
      ALLRESWD = with_label(
        .data$WD & .data$ALL_RESOLVED, "  No. of patients with study drug withdrawn due to resolved AE"
      ),
      ALLRESDSM = with_label(
        .data$DSM & .data$ALL_RESOLVED, "  No. of patients with dose modified/interrupted due to resolved AE"
      ),
      ALLRESCONTRT = with_label(
        .data$CONTRT & .data$ALL_RESOLVED, "  No. of patients with treatment received for resolved AE"
      ),
      NOTRESWD = with_label(
        .data$WD & .data$NOT_RESOLVED, "  No. of patients with study drug withdrawn due to unresolved or ongoing AE"
      ),
      NOTRESDSM = with_label(
        .data$DSM & .data$NOT_RESOLVED,
        "  No. of patients with dose modified/interrupted due to unresolved or ongoing AE"
      ),
      NOTRESCONTRT = with_label(
        .data$CONTRT & .data$NOT_RESOLVED, "  No. of patients with treatment received for unresolved/ongoing AE"
      ),
      SERWD = with_label(
        .data$SER & .data$WD, "  No. of patients with study drug withdrawn due to serious AE"
      ),
      SERDSM = with_label(
        .data$SER & .data$DSM, "  No. of patients with dose modified/interrupted due to serious AE"
      ),
      SERCONTRT = with_label(
        .data$SER & .data$CONTRT, "  No. of patients with treatment received for serious AE"
      ),
      RELWD = with_label(
        .data$REL & .data$WD, "  No. of patients with study drug withdrawn due to related AE"
      ),
      RELDSM = with_label(
        .data$REL & .data$DSM, "  No. of patients with dose modified/interrupted due to related AE"
      ),
      RELCONTRT = with_label(
        .data$REL & .data$CONTRT, "  No. of patients with treatment received for related AE"
      ),
      RELSER = with_label(
        .data$REL & .data$SER, "  No. of patients with serious, related AE"
      )
    ) %>%
    mutate(
      ATOXGR = factor(.data$ATOXGR, levels = 1:5)
    )

  adam_db
}

#' @describeIn aet01_aesi Postprocessing
#'
#' @inheritParams gen_args
#'
#' @export
aet01_aesi_post <- function(tlg, prune_0 = FALSE, ...) {
  if (prune_0) {
    tlg <- smart_prune(tlg)
  }
  std_postprocess(tlg)
}

#' `AET01_AESI` Table 1 (Default) Adverse Event of Special Interest Summary Table.
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' run(aet01_aesi, syn_data)
aet01_aesi <- chevron_t(
  main = aet01_aesi_main,
  preprocess = aet01_aesi_pre,
  postprocess = aet01_aesi_post,
  adam_datasets = c("adsl", "adae")
)

#' @keywords internal
get_aesi_vars <- function(aesi_vars) {
  if ("ALL" %in% aesi_vars) aesi_vars <- c("ALL_ALLRES", "ALL_NOTRES", "ALL_SER", "ALL_REL")
  if (any(grepl("^ALL_", aesi_vars))) {
    aesi <- c(grep("^ALL_", aesi_vars, value = TRUE, invert = TRUE), sapply(
      c("WD", "DSM", "CONTRT"),
      function(x) sub("^(ALL_)(.*)", paste0("\\2", x), grep("^ALL_", aesi_vars, value = TRUE))
    ))
    if ("ALL_REL" %in% aesi_vars) aesi <- c(aesi, "RELSER")
  } else {
    aesi <- aesi_vars
  }
  all_aesi_vars <- c(
    "WD", "DSM", "CONTRT", "ALL_RESOLVED", grep("^ALLRES", aesi, value = TRUE),
    "NOT_RESOLVED", grep("^NOTRES", aesi, value = TRUE), "SER", grep("^SER", aesi, value = TRUE),
    "REL", grep("^REL", aesi, value = TRUE)
  )
  return(all_aesi_vars)
}
