# aet01_aesi_1 ----

#' @describeIn aet01_aesi_1 Main TLG function
#'
#' @inheritParams gen_args
#' @param aesi_vars (`character`) the AESI variables to be included in the summary. Defaults to `NA`.
#' @param ... not used.
#'
#' @details
#'  * Does not remove rows with zero counts by default.
#'
#' @note
#'  * `adam_db` object must contain an `adae` table with columns `"AEOUT"`, `"AEACN"`, `"AECONTRT"`, `"AESER"`,
#'  `"AREL"`, and the column specified by `armvar`.
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
aet01_aesi_1_main <- function(adam_db,
                              armvar = "ACTARM",
                              aesi_vars = NA,
                              deco = std_deco("AET01_AESI"),
                              ...) {
  if ("ALL" %in% aesi_vars) aesi_vars <- c("ALL_ALLRES", "ALL_NOTRES", "ALL_SER", "ALL_REL")
  if (any(grepl("^ALL_", aesi_vars))) {
    aesi <- c(grep("^ALL_", aesi_vars, value = TRUE, invert = TRUE), sapply(
      c("WD", "DSM", "CONTRT"),
      function(x) sub("^(ALL_)(.*)", paste0("\\2", x), grep("^ALL_", aesi_vars, value = TRUE))
    ))
    if ("ALL_REL" %in% aesi_vars) aesi <- c(aesi, "RELSER")
  }
  aesi_vars <- aesi
  all_aesi_vars <- c(
    "WD", "DSM", "CONTRT", "ALL_RESOLVED", grep("^ALLRES", aesi_vars, value = TRUE),
    "NOT_RESOLVED", grep("^NOTRES", aesi, value = TRUE), "SER", grep("^SER", aesi_vars, value = TRUE),
    "REL", grep("^REL", aesi_vars, value = TRUE)
  )
  lbl_aesi_vars <- var_labels_for(adam_db$adae, all_aesi_vars)

  lyt <- aet01_aesi_1_lyt(
    armvar = armvar,
    aesi_vars = all_aesi_vars,
    deco = deco,
    lbl_aesi_vars = lbl_aesi_vars,
    ... = ...
  )

  tbl <- build_table(lyt, adam_db$adae, alt_counts_df = adam_db$adsl)

  tbl
}

#' @describeIn aet01_aesi_1 Layout
#'
#' @inheritParams gen_args
#' @param lbl_aesi_vars (`character`) the labels of the AESI variables to be summarized.
#' @param ... not used
#'
#' @export
#'
aet01_aesi_1_lyt <- function(armvar,
                             aesi_vars,
                             deco,
                             lbl_aesi_vars,
                             ...) {
  names(lbl_aesi_vars) <- aesi_vars
  basic_table_deco(deco, show_colcounts = TRUE) %>%
    split_cols_by(var = armvar) %>%
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
      show_labels = "visible"
    ) %>%
    count_patients_with_flags(
      "USUBJID",
      flag_variables = lbl_aesi_vars,
      denom = "N_col"
    )
}

#' @describeIn aet01_aesi_1 Preprocessing
#'
#' @inheritParams aet01_aesi_1_main
#' @param ... not used.
#'
#' @export
#'
aet01_aesi_1_pre <- function(adam_db, ...) {
  checkmate::assert_class(adam_db, "dm")

  aet01_aesi_1_check(adam_db, ...)

  new_format <- list(
    adae = list(
      AEDECOD = list("<Missing>" = c("", NA, "<Missing>", "No Coding Available"))
    )
  )

  adam_db <- dunlin::apply_reformat(adam_db, new_format)

  db <- adam_db %>%
    dm_zoom_to("adae") %>%
    filter(
      .data$ANL01FL == "Y",
      .data$AEDECOD != "<Missing>"
    ) %>%
    dm_update_zoomed() %>%
    dm_zoom_to("adae") %>%
    mutate(
      ALL_RESOLVED = !AEOUT %in% c("NOT RECOVERED/NOT RESOLVED", "RECOVERING/RESOLVING", "UNKNOWN", "FATAL"),
      NOT_RESOLVED = AEOUT %in% c("NOT RECOVERED/NOT RESOLVED", "RECOVERING/RESOLVING", "UNKNOWN"),
      WD = AEACN == "DRUG WITHDRAWN",
      DSM = AEACN %in% c("DRUG INTERRUPTED", "DOSE INCREASED", "DOSE REDUCED"),
      CONTRT = AECONTRT == "Y",
      SER = AESER == "Y",
      REL = AREL == "Y",
      ALLRESWD = WD == TRUE & ALL_RESOLVED == TRUE,
      ALLRESDSM = DSM == TRUE & ALL_RESOLVED == TRUE,
      ALLRESCONTRT = CONTRT == TRUE & ALL_RESOLVED == TRUE,
      NOTRESWD = WD == TRUE & NOT_RESOLVED == TRUE,
      NOTRESDSM = DSM == TRUE & NOT_RESOLVED == TRUE,
      NOTRESCONTRT = CONTRT == TRUE & NOT_RESOLVED == TRUE,
      SERWD = AESER == "Y" & AEACN == "DRUG WITHDRAWN",
      SERCONTRT = AECONTRT == "Y" & AESER == "Y",
      SERDSM = AESER == "Y" & AEACN %in% c("DRUG INTERRUPTED", "DOSE INCREASED", "DOSE REDUCED"),
      RELWD = AREL == "Y" & AEACN == "DRUG WITHDRAWN",
      RELDSM = AREL == "Y" & AEACN %in% c("DRUG INTERRUPTED", "DOSE INCREASED", "DOSE REDUCED"),
      RELCONTRT = AECONTRT == "Y" & AREL == "Y",
      RELSER = AESER == "Y" & AREL == "Y"
    ) %>%
    mutate(
      ALL_RESOLVED = formatters::with_label(
        .data$ALL_RESOLVED, "Total number of patients with all non-fatal AEs resolved"
      ),
      NOT_RESOLVED = formatters::with_label(
        .data$NOT_RESOLVED, "Total number of patients with at least one unresolved or ongoing non-fatal AE"
      ),
      WD = formatters::with_label(
        .data$WD, "Total number of patients with study drug withdrawn due to AE"
      ),
      DSM = formatters::with_label(
        .data$DSM, "Total number of patients with dose modified/interrupted due to AE"
      ),
      CONTRT = formatters::with_label(
        .data$CONTRT, "Total number of patients with treatment received for AE"
      ),
      SER = formatters::with_label(
        .data$SER, "Total number of patients with at least one serious AE"
      ),
      REL = formatters::with_label(
        .data$REL, "Total number of patients with at least one related AE"
      ),
      ALLRESWD = formatters::with_label(
        .data$ALLRESWD, "  No. of patients with study drug withdrawn due to resolved AE"
      ),
      ALLRESDSM = formatters::with_label(
        .data$ALLRESDSM, "  No. of patients with dose modified/interrupted due to resolved AE"
      ),
      ALLRESCONTRT = formatters::with_label(
        .data$ALLRESCONTRT, "  No. of patients with treatment received for resolved AE"
      ),
      NOTRESWD = formatters::with_label(
        .data$NOTRESWD, "  No. of patients with study drug withdrawn due to unresolved or ongoing AE"
      ),
      NOTRESDSM = formatters::with_label(
        .data$NOTRESDSM, "  No. of patients with dose modified/interrupted due to unresolved or ongoing AE"
      ),
      NOTRESCONTRT = formatters::with_label(
        .data$NOTRESCONTRT, "  No. of patients with treatment received for unresolved/ongoing AE"
      ),
      SERWD = formatters::with_label(
        .data$SERWD, "  No. of patients with study drug withdrawn due to serious AE"
      ),
      SERDSM = formatters::with_label(
        .data$SERDSM, "  No. of patients with dose modified/interrupted due to serious AE"
      ),
      SERCONTRT = formatters::with_label(
        .data$SERCONTRT, "  No. of patients with treatment received for serious AE"
      ),
      RELWD = formatters::with_label(
        .data$RELWD, "  No. of patients with study drug withdrawn due to related AE"
      ),
      RELDSM = formatters::with_label(
        .data$RELDSM, "  No. of patients with dose modified/interrupted due to related AE"
      ),
      RELCONTRT = formatters::with_label(
        .data$RELCONTRT, "  No. of patients with treatment received for related AE"
      ),
      RELSER = formatters::with_label(
        .data$RELSER, "  No. of patients with serious, related AE"
      )
    ) %>%
    mutate(
      ATOXGR = forcats::fct_recode(
        ATOXGR,
        "Grade 1" = "1",
        "Grade 2" = "2",
        "Grade 3" = "3",
        "Grade 4" = "4",
        "Grade 5 (fatal outcome)" = "5"
      )
    ) %>%
    dm_update_zoomed()

  db
}

#' @describeIn aet01_aesi_1 Checks
#'
#' @inheritParams gen_args
#' @param ... not used.
#'
aet01_aesi_1_check <- function(adam_db,
                               req_tables = c("adsl", "adae"),
                               armvar = "ACTARM",
                               ...) {
  assert_all_tablenames(adam_db, req_tables)

  msg <- NULL

  corresponding_col <- list(
    ALL_RESOLVED = "AEOUT",
    NOT_RESOLVED = "AEOUT",
    WD = "AEACN",
    DSM = "AEACN",
    CONTRT = "AECONTRT",
    SER = "AESER",
    REL = "AREL",
    ALLRESWD = "AEACN",
    ALLRESDSM = "AEACN",
    ALLRESCONTRT = "AECONTRT",
    NOTRESWD = "AEACN",
    NOTRESDSM = "AEACN",
    NOTRESCONTRT = "AECONTRT",
    SERWD = c("AESER", "AEACN"),
    SERDSM = c("AESER", "AEACN"),
    SERCONTRT = c("AESER", "AECONTRT"),
    RELWD = c("AREL", "AEACN"),
    RELDSM = c("AREL", "AEACN"),
    RELCONTRT = c("AREL", "AECONTRT"),
    RELSER = c("AREL", "AESER")
  )

  native_col <- c(armvar, unique(unlist(corresponding_col)))
  filter_col <- "ANL01FL"
  layout_col <- "USUBJID"

  msg <- c(msg, check_all_colnames(adam_db$adae, c(native_col, filter_col, layout_col)))
  msg <- c(msg, check_all_colnames(adam_db$adsl, c(armvar, layout_col)))

  if (is.null(msg)) {
    TRUE
  } else {
    stop(paste(msg, collapse = "\n  "))
  }
}

#' @describeIn aet01_aesi_1 Postprocessing
#'
#' @inheritParams gen_args
#' @param ... not used
#'
#' @export
aet01_aesi_post <- function(tlg, prune_0 = FALSE, deco = std_deco("AET01_AESI"), ...) {
  tbl <- set_decoration(tlg, deco)
  if (prune_0) {
    tbl <- smart_prune(tbl)
  }
  std_postprocess(tbl)
}

#' `AET01_AESI` Table 1 (Default) Adverse Event of Special Interest Summary Table.
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' run(aet01_aesi_1, syn_data)
aet01_aesi_1 <- chevron_t(
  main = aet01_aesi_1_main,
  preprocess = aet01_aesi_1_pre,
  postprocess = aet01_aesi_post,
  adam_datasets = c("adsl", "adae")
)
