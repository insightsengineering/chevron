#' Standard Preprocessing Map
#'
#' The preprocessing map contains information how the ADaM data needs to be preprocessed for each function.
#'
#' @export
#'
#' @examples
#' std_pmap
std_pmap <- tibble::tribble(
  ~tlgfname, ~filter_fname, ~mutate_fname, ~req_data,
  "aet01_1", "filter_adae_anl01fl", "mutate_for_aet01", c("adsl", "adae"),
  "aet01_2", "filter_adae_anl01fl", "mutate_for_aet01", c("adsl", "adae"),
  "aet02_1", "filter_adae_anl01fl", NA, c("adsl", "adae"),
  "aet02_2", "filter_adae_anl01fl", NA, c("adsl", "adae"),
  "aet02_3", "filter_adae_anl01fl", NA, c("adsl", "adae"),
  "aet03_1", "filter_adae_anl01fl", NA, c("adsl", "adae"),
  "aet04_1", "filter_adae_anl01fl", NA, c("adsl", "adae"),
  "cmt01a_1", "filter_adcm_anl01fl", "mutate_cmt01a", c("adsl", "adcm"),
  "cmt01a_2", "filter_adcm_anl01fl", "mutate_cmt01a", c("adsl", "adcm"),
  "cmt01a_3", "filter_adcm_anl01fl", "mutate_cmt01a", c("adsl", "adcm"),
  "cmt02_pt_1", "filter_adcm_anl01fl", "mutate_cmt02_pt_1", c("adsl", "adcm"),
  "dmt01_1", NA, "mutate_dmt01", c("adsl"),
  "dst01_1", NA, NA, c("adsl"),
  "dst01_2", NA, "mutate_adsl_gp", c("adsl"),
  "dst01_3", NA, "mutate_adsl_gp", c("adsl"),
  "dtht01_1", NA, "reorder_dtht01", c("adsl"),
  "egt01_1", "filter_adeg_anl01fl", NA, c("adsl", "adeg"),
  "egt02_1", "filter_egt02", NA, c("adsl", "adeg"),
  "egt02_2", "filter_egt02", NA, c("adsl", "adeg"),
  "ext01_1", "filter_adex_drug", "reorder_adex_params", c("adsl", "adex"),
  "ext01_2", "filter_adex_drug", "remove_adex_aval", c("adsl", "adex"),
  "lbt01_1", "filter_adlb_anl01fl", NA, c("adsl", "adlb"),
  "mht01_1", "filter_admh_anl01fl", NA, c("adsl", "admh"),
  "vst01_1", "filter_advs_anl01fl", NA, c("adsl", "advs"),
  "vst02_1", "filter_vst02", "mutate_vst02", c("adsl", "advs"),
  "vst02_2", "filter_vst02", "mutate_vst02", c("adsl", "advs")
)

#' Row in Preprocessing Map
#'
#' @param tlgfname (`character`) name of a function which creates a table, listing or graph
#' @param filter_fname (`character`) name of function which filters the ADaM `dm` data object
#' @param mutate_fname (`character`) name of function which mutates the ADaM `dm` data object
#' @param req_data (`character`) vector of data names in the ADaM `dm` data objects that are required to create the
#'   output
#'
#' @export
#'
#' @examples
#' pmap_row("tabc", NA, "identity", c("adsl", "adae"))
pmap_row <- function(tlgfname, filter_fname = NA, mutate_fname = NA, req_data) {
  fnames <- list(tlgfname, filter_fname, mutate_fname)
  is_char <- vapply(fnames, function(xi) is.na(xi) || is.character(xi), logical(1))
  fname_len <- vapply(fnames, length, numeric(1))

  checkmate::assert_true(all(fname_len == 1))
  checkmate::assert_character(req_data)

  tibble(
    tlgfname = tlgfname,
    filter_fname = filter_fname,
    mutate_fname = mutate_fname,
    req_data = list(req_data)
  )
}

#' Remove Row For a tlgfunction from a pre-processing map
#'
#' @inheritParams gen_args
#'
#' @export
#'
#' @examples
#' remove_tlg_pmap(std_pmap, "aet02_1")
remove_tlg_pmap <- function(pmap, tlgfname) {
  checkmate::assert_subset(tlgfname, pmap$tlgfname)

  pmap[pmap$tlgfname != tlgfname, ]
}


lookup_fun <- function(fname, what, pmap) {
  checkmate::assert_subset(fname, pmap$tlgfname)

  fstr <- pmap %>%
    dplyr::filter(.data$tlgfname == fname) %>%
    dplyr::slice(1) %>%
    dplyr::pull(what)

  if (is.na(fstr)) {
    identity
  } else {
    get(fstr)
  }
}

get_filter_fun <- function(id, pmap) {
  lookup_fun(id, "filter_fname", pmap)
}

get_mutate_fun <- function(id, pmap) {
  lookup_fun(id, "mutate_fname", pmap)
}

get_req_data <- function(id, pmap) {
  checkmate::assert_subset(id, pmap$tlgfname)

  fstr <- pmap %>%
    dplyr::filter(.data$tlgfname == id) %>%
    dplyr::slice(1) %>%
    dplyr::pull(.data$req_data)

  fstr[[1]]
}

#' Preprocess ADaM Data for A TLG function
#'
#' @inheritParams gen_args
#'
#' @export
#'
#' @examples
#' library(magrittr)
#' db <- syn_test_data()
#'
#' db %>%
#'   preprocess_data("aet02_2")
preprocess_data <- function(adam_db, tlgfname, pmap = std_pmap, .study) {
  checkmate::assert_subset(get_req_data(tlgfname, pmap), names(adam_db))

  ffun <- get_filter_fun(tlgfname, pmap)
  mfun <- get_mutate_fun(tlgfname, pmap)

  extra_args_ffun <- if (".study" %in% names(formals(ffun)) && !missing(.study)) {
    list(.study = .study)
  } else {
    list()
  }

  extra_args_mfun <- if (".study" %in% names(formals(mfun)) && !missing(.study)) {
    list(.study = .study)
  } else {
    list()
  }

  dbf <- do.call(ffun, c(list(adam_db), extra_args_ffun))
  do.call(mfun, c(list(dbf), extra_args_mfun))
}


#' Retrieve Standard Subsetting for Templates
#'
#' @inheritParams gen_args
#'
#' @export
#'
#' @examples
#' std_filter_fun("aet02_1")
std_filter_fun <- function(tlgfname, pmap = std_pmap) {
  lookup_fun(tlgfname, "filter_fname", pmap)
}

#' Retrieve Standard Mutation for Templates
#'
#' @inheritParams gen_args
#'
#' @export
#'
#' @examples
#' std_mutate_fun("aet02_1")
std_mutate_fun <- function(tlgfname, pmap = std_pmap) {
  lookup_fun(tlgfname, "mutate_fname", pmap)
}

#' Filter `adae` for `ANL01FL`
#'
#' @inheritParams gen_args
#'
#' @importFrom dplyr filter
filter_adae_anl01fl <- function(adam_db) {
  checkmate::assert_class(adam_db, "dm")

  adam_db %>%
    dm_zoom_to("adae") %>%
    filter(.data$ANL01FL == "Y") %>%
    dm_update_zoomed()
}

#' Filter `adlb` for `ANL01FL`
#'
#' @inheritParams gen_args
filter_adlb_anl01fl <- function(adam_db) {
  checkmate::assert_class(adam_db, "dm")

  adam_db %>%
    dm_zoom_to("adlb") %>%
    filter(.data$ANL01FL == "Y") %>%
    dm_update_zoomed()
}

#' Filter `adeg` for `ANL01FL`
#'
#' @inheritParams gen_args
filter_adeg_anl01fl <- function(adam_db) {
  checkmate::assert_class(adam_db, "dm")

  adam_db %>%
    dm_zoom_to("adeg") %>%
    filter(.data$ANL01FL == "Y") %>%
    dm_update_zoomed()
}

#' Filter `advs` for `ANL01FL`
#'
#' @inheritParams gen_args
filter_advs_anl01fl <- function(adam_db) {
  checkmate::assert_class(adam_db, "dm")

  adam_db %>%
    dm_zoom_to("advs") %>%
    filter(.data$ANL01FL == "Y") %>%
    dm_update_zoomed()
}

#' Filter `admh` for `ANL01FL`
#'
#' @inheritParams gen_args
filter_admh_anl01fl <- function(adam_db) {
  checkmate::assert_class(adam_db, "dm")

  adam_db %>%
    dm_zoom_to("admh") %>%
    filter(.data$ANL01FL == "Y") %>%
    dm_update_zoomed()
}

#' Filter `adex` for `PARCAT1`
#'
#' @inheritParams gen_args
filter_adex_drug <- function(adam_db) {
  checkmate::assert_class(adam_db, "dm")

  adam_db %>%
    dm_zoom_to("adex") %>%
    filter(.data$PARCAT1 == "OVERALL") %>%
    dm_update_zoomed()
}

#' Filter `adcm` for `ANL01FL` and  `ATIREL`
#'
#' @details filter with `ANL01FL` (instead of `SAFFL ` which is external to `chevron`).
#'
#' @inheritParams gen_args
filter_adcm_anl01fl <- function(adam_db) {
  checkmate::assert_class(adam_db, "dm")
  adam_db %>%
    dm_zoom_to("adcm") %>%
    filter(.data$ANL01FL == "Y") %>%
    dm_update_zoomed()
}

#' Filter post-baseline values in `advs`
#'
#' @inheritParams gen_args
filter_vst02 <- function(adam_db) {
  checkmate::assert_class(adam_db, "dm")
  adam_db %>%
    dm_zoom_to("advs") %>%
    filter(.data$ANRIND != "<Missing>") %>%
    filter(.data$ONTRTFL == "Y") %>%
    dm_update_zoomed()
}

#' Filter post-baseline values in `adeg`
#'
#' @inheritParams gen_args
filter_egt02 <- function(adam_db) {
  checkmate::assert_class(adam_db, "dm")
  adam_db %>%
    dm_zoom_to("adeg") %>%
    filter(.data$ANRIND != "<Missing>") %>%
    filter(.data$ONTRTFL == "Y") %>%
    dm_update_zoomed()
}

#' Creating Necessary Columns for `aet01`
#'
#' @inheritParams gen_args
mutate_for_aet01 <- function(adam_db) {
  db <- adam_db %>%
    dm_zoom_to("adae") %>%
    mutate(
      FATAL = .data$AESDTH == "Y",
      SER = .data$AESER == "Y",
      SERWD = (.data$AESER == "Y" & .data$AEACN == "DRUG WITHDRAWN"),
      SERDSM = (.data$AESER == "Y" & .data$AEACN %in% c("DRUG INTERRUPTED", "DOSE INCREASED", "DOSE REDUCED")),
      RELSER = (.data$AESER == "Y" & .data$AREL == "Y"),
      WD = .data$AEACN == "DRUG WITHDRAWN",
      DSM = .data$AEACN %in% c("DRUG INTERRUPTED", "DOSE INCREASED", "DOSE REDUCED"),
      REL = .data$AREL == "Y",
      RELWD = (.data$AREL == "Y" & .data$AEACN == "DRUG WITHDRAWN"),
      RELDSM = (.data$AREL == "Y" & .data$AEACN %in% c("DRUG INTERRUPTED", "DOSE INCREASED", "DOSE REDUCED")),
      CTC35 = if ("ATOXGR" %in% colnames(.)) .data$ATOXGR %in% c("3", "4", "5"),
      CTC45 = if ("ATOXGR" %in% colnames(.)) .data$ATOXGR %in% c("4", "5"),
      SEV = if ("ASEV" %in% colnames(.)) .data$ASEV == "SEVERE",
      SMQ01 = if ("SMQ01NAM" %in% colnames(.)) .data$SMQ01NAM != "",
      SMQ02 = if ("SMQ02NAM" %in% colnames(.)) .data$SMQ02NAM != "",
      CQ01 = if ("CQ01NAM" %in% colnames(.)) .data$CQ01NAM != ""
    ) %>%
    mutate(
      AEDECOD = formatters::with_label(.data$AEDECOD, "Dictionary-Derived Term"),
      AESDTH = formatters::with_label(.data$AESDTH, "Results in Death"),
      AEACN = formatters::with_label(.data$AEACN, "Action Taken with Study Treatment"),
      FATAL = formatters::with_label(.data$FATAL, "AE with fatal outcome"),
      SER = formatters::with_label(.data$SER, "Serious AE"),
      SEV = if ("SEV" %in% colnames(.)) formatters::with_label(.data$SEV, "Severe AE (at greatest intensity)"),
      SERWD = formatters::with_label(.data$SERWD, "Serious AE leading to withdrawal from treatment"),
      SERDSM = formatters::with_label(.data$SERDSM, "Serious AE leading to dose modification/interruption"),
      RELSER = formatters::with_label(.data$RELSER, "Related Serious AE"),
      WD = formatters::with_label(.data$WD, "AE leading to withdrawal from treatment"),
      DSM = formatters::with_label(.data$DSM, "AE leading to dose modification/interruption"),
      REL = formatters::with_label(.data$REL, "Related AE"),
      RELWD = formatters::with_label(.data$RELWD, "Related AE leading to withdrawal from treatment"),
      RELDSM = formatters::with_label(.data$RELDSM, "Related AE leading to dose modification/interruption"),
      CTC35 = if ("CTC35" %in% colnames(.)) formatters::with_label(.data$CTC35, "Grade 3-5 AE"),
      CTC45 = if ("CTC45" %in% colnames(.)) formatters::with_label(.data$CTC45, "Grade 4/5 AE"),
      SMQ01 = if ("SMQ01" %in% colnames(.)) formatters::with_label(.data$SMQ01, aesi_label(.data$SMQ01NAM, .data$SMQ01SC)),
      SMQ02 = if ("SMQ02" %in% colnames(.)) formatters::with_label(.data$SMQ02, aesi_label(.data$SMQ02NAM, .data$SMQ02SC)),
      CQ01 = if ("CQ01" %in% colnames(.)) formatters::with_label(.data$CQ01, aesi_label(.data$CQ01NAM))
    ) %>%
    dm_update_zoomed()

  db
}

#' Categorize Reason for Discontinuation from Study.
#'
#' @inheritParams gen_args
#' @param reason (`character`) the variable name for variable with the reason for discontinuation.
mutate_adsl_gp <- function(adam_db,
                           reason = .study$disc_reason_var,
                           .study = list(disc_reason_var = "DCSREAS")) {
  checkmate::assert_class(adam_db, "dm")

  # TODO: revisit
  sym_reason <- sym(reason) # nolint

  adam_db %>%
    dm_zoom_to("adsl") %>%
    mutate(reasonGP = case_when(
      !!sym_reason %in% c("ADVERSE EVENT", "DEATH") ~ "Safety",
      !!sym_reason == "<Missing>" ~ "<Missing>",
      TRUE ~ "Non-safety"
    )) %>%
    dm_update_zoomed()
}

#' Coerce `CMSEQ` to factor in `adcm`
#'
#' @inheritParams gen_args
mutate_cmt01a <- function(adam_db) {
  adam_db %>%
    dm_zoom_to("adcm") %>%
    mutate(CMSEQ = as.factor(.data$CMSEQ)) %>%
    dm_update_zoomed()
}



#' Reorder `PARAM` and `PARAMCD` levels
#'
#' @inheritParams gen_args
#' @param paramcd_order (`vector of character`) providing the `PARAMCD` values in the desired order.
#'
#' @return a `dm` object.
reorder_adex_params <- function(adam_db,
                                paramcd_order = .study$paramcd_order,
                                .study = list(paramcd_order = c("TNDOSE", "DOSE", "NDOSE", "TDOSE"))) {
  param_vars <- adam_db$adex %>%
    select(.data$PARAM, .data$PARAMCD) %>%
    reorder_levels_params(paramcd_levels = paramcd_order)

  adam_db %>%
    dm_zoom_to("adex") %>%
    mutate(PARAM = param_vars$PARAM, PARAMCD = param_vars$PARAMCD) %>%
    dm_update_zoomed()
}

#' Remove specific `AVAL` and `AVALCAT1` data from `adex`
#'
#' Useful if some continuous `AVAL` data, or categorical `AVALCAT1` data corresponding to specific `PARAM` should not be
#' displayed.
#'
#' @inheritParams gen_args
#'
#' @param show_stats (`vector of character`) providing the name of the parameters whose statistical summary should be
#'   presented. To analyze all, provide `show_stats = "ALL"` (Default), to analyze none, provide `show_stats = ""`.
#'
#' @param show_bins (`vector of character`) providing the name of the parameters whose categorical summary should be
#'   presented. To analyze all, provide `show_bins = "ALL"` (Default), to analyze none, provide `show_bins = ""`.
remove_adex_aval <- function(adam_db,
                             show_stats = .study$show_cont_stats,
                             show_bins = .study$show_cat_stats,
                             .study = list(
                               show_cont_stats = c("ALL"),
                               show_cat_stats = c("ALL")
                             )) {
  if (!"ALL" %in% show_stats) {
    adam_db <- adam_db %>%
      dm_zoom_to("adex") %>%
      mutate(AVAL = ifelse(.data$PARAM %in% show_stats, .data$AVAL, NA)) %>%
      dm_update_zoomed()
  }

  if (!"ALL" %in% show_bins) {
    adam_db <- adam_db %>%
      dm_zoom_to("adex") %>%
      mutate(AVALCAT1 = ifelse(.data$PARAM %in% show_bins, .data$AVALCAT1, NA)) %>%
      dm_update_zoomed()
  }

  adam_db
}

#' Reorder levels of `DTHCAT` in `adsl`
#'
#' The `OTHER` level is pushed last so that it appears last, and then the `DTHCAUS` related to `OTHER` appear underneath
#' as intended.
#'
#' @inheritParams gen_args
#'
#' @importFrom forcats fct_relevel
reorder_dtht01 <- function(adam_db) {
  death_fact <- levels(adam_db$adsl$DTHCAT)
  death_fact <- setdiff(death_fact, "OTHER")
  death_fact <- c(death_fact, "OTHER")

  db <- adam_db %>%
    dm_zoom_to("adsl") %>%
    mutate(DTHCAT = fct_relevel(.data$DTHCAT, death_fact)) %>%
    dm_update_zoomed()

  db
}

#' Mutate function for `CMT02_PT_1`
#'
#' @inheritParams gen_args
mutate_cmt02_pt_1 <- function(adam_db) {
  db <- adam_db %>%
    dm_zoom_to("adcm") %>%
    mutate(CMSEQ = as.factor(.data$CMSEQ)) %>%
    dm_update_zoomed()

  db
}

#' Mutate function for `DMT01_1`
#'
#' @inheritParams gen_args
mutate_dmt01 <- function(adam_db) {
  adsl_lbs <- formatters::var_labels(adam_db$adsl)
  db <- adam_db %>%
    dm_zoom_to("adsl") %>%
    mutate(
      SEX = case_when(.data$SEX == "F" ~ "Female", .data$SEX == "M" ~ "Male", TRUE ~ as.character(.data$SEX)),
      SEX = factor(.data$SEX, levels = c("Female", "Male"))
    ) %>%
    mutate(SEX = formatters::with_label(.data$SEX, adsl_lbs["SEX"])) %>%
    dm_update_zoomed()
  db
}

#' Categorize `advs` values
#'
#' @inheritParams gen_args
mutate_vst02 <- function(adam_db) {
  db <- adam_db %>%
    dm_zoom_to("advs") %>%
    mutate(
      ANRIND = case_when(
        .data$ANRIND == "HIGH HIGH" ~ "HIGH",
        .data$ANRIND == "LOW LOW" ~ "LOW",
        TRUE ~ as.character(.data$ANRIND)
      ),
      BNRIND = case_when(
        .data$BNRIND == "HIGH HIGH" ~ "HIGH",
        .data$BNRIND == "LOW LOW" ~ "LOW",
        TRUE ~ as.character(.data$BNRIND)
      )
    ) %>%
    mutate(
      ANRIND = as.factor(.data$ANRIND),
      BNRIND = as.factor(.data$BNRIND)
    ) %>%
    dm_update_zoomed()

  db
}
