

std_preprocessing_map <- tibble::tribble(
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
  "dmt01_1", NA, NA, c("adsl"),
  "dst01_1", NA, NA, c("adsl"),
  "dst01_2", NA, "mutate_adsl_gp", c("adsl"),
  "dst01_3", NA, "mutate_adsl_gp", c("adsl"),
  "dtht01_1", NA, "reorder_dtht01", c("adsl"),
  "dtht01_2", NA, "reorder_dtht01", c("adsl"),
  "egt01_1", "filter_adeg_anl01fl", NA, c("adsl", "adeg"),
  "ext01_1", "filter_adex_drug", "reorder_adex_params", c("adsl", "adex"),
  "ext01_2", "filter_adex_drug", "remove_adex_aval", c("adsl", "adex"),
  "lbt01_1", "filter_adlb_anl01fl", NA, c("adsl", "adlb"),
  "mht01_1", "filter_admh_anl01fl", NA, c("adsl", "admh"),
  "vst01_1", "filter_advs_anl01fl", NA, c("adsl", "advs")
)

#' Standard Preprocessing Map
#'
#' The preprocessing map contains information how the ADaM data needs to be preprocessed for each function.
#'
#'
#' @export
#'
#' @examples
#' std_pmap()
std_pmap <- function() {
  std_preprocessing_map
}

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
#'
#' pmap_row("tabc", NA, "identity", c("adsl", "adae"))
pmap_row <- function(tlgfname, filter_fname = NA, mutate_fname = NA, req_data) {
  fnames <- list(tlgfname, filter_fname, mutate_fname)
  is_char <- vapply(fnames, function(xi) is.na(xi) || is.character(xi), logical(1))
  fname_len <- vapply(fnames, length, numeric(1))

  assert_that(all(is_char), msg = "tlgfname, filter_fname, mutate_fname must either be NA or of type character")
  assert_that(all(fname_len == 1), msg = "tlgfname, filter_fname, mutate_fname must be of length 1")
  assert_that(is.character(req_data), msg = "req_data need to be a character string")

  tibble(
    tlgfname = tlgfname,
    filter_fname = filter_fname,
    mutate_fname = mutate_fname,
    req_data = list(req_data)
  )
}


#' Append A Preprocessing Map Entry
#'
#'
#' @param x (`data.frame`) in the structure returned from `std_pmap` or `pmap_entry`
#' @param y (`data.frame`) in the structure returned from `std_pmap` or `pmap_entry`
#'
#' @export
#'
append_to_pmap <- function(x, y) {
  rbind(x, y)
}

#' Remove Row For a tlgfunction from a pre-processing map
#'
#' @inheritParams gen_args
#'
#'
#' @export
#'
#' @examples
#'
#' remove_tlg_pmap(std_pmap(), "aet02_1")
remove_tlg_pmap <- function(pmap, tlgfname) {
  assert_that(tlgfname %in% pmap$tlgfname)

  pmap[pmap$tlgfname != tlgfname, ]
}


lookup_fun <- function(fname, what, pmap) {
  assert_that(fname %in% pmap$tlgfname)

  fstr <- pmap %>%
    filter(tlgfname == fname) %>%
    slice(1) %>%
    pull(what)

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
  assert_that(id %in% pmap$tlgfname)

  fstr <- pmap %>%
    filter(tlgfname == id) %>%
    slice(1) %>%
    pull(req_data)

  fstr[[1]]
}

#' Preprocess ADaM Data for A TLG function
#'
#' @inheritParams gen_args
#'
#' @export
#'
#'
#' @examples
#' library(magrittr)
#' db <- syn_test_data()
#'
#' db %>%
#'   preprocess_data("aet02_2")
preprocess_data <- function(adam_db, tlgfname, pmap = std_pmap(), .study) {
  assert_that(
    all(get_req_data(tlgfname, pmap) %in% names(adam_db)),
    msg = paste(
      "adam_db is missing the data:",
      paste(setdiff(get_req_data(tlgfname, pmap), names(adam_db)), collapse = ", ")
    )
  )

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
std_filter_fun <- function(tlgfname, pmap = std_pmap()) {
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
std_mutate_fun <- function(tlgfname, pmap = std_pmap()) {
  lookup_fun(tlgfname, "filter_fname", pmap)
}


## manipulation functions ----

#' Filter `adsl` for `ANL01FL`
#'
#' @inheritParams gen_args
#'
#'
filter_adsl_anl01fl <- function(adam_db) {
  assert_that(is(adam_db, "dm"))

  adam_db %>%
    dm_zoom_to(adsl) %>%
    filter(ANL01FL == "Y") %>%
    dm_update_zoomed()
}


#' Filter `adae` for `ANL01FL`
#'
#' @inheritParams gen_args
#'
#' @importFrom dplyr filter
#'
#'
filter_adae_anl01fl <- function(adam_db) {
  assert_that(is(adam_db, "dm"))

  adam_db %>%
    dm_zoom_to(adae) %>%
    filter(ANL01FL == "Y") %>%
    dm_update_zoomed()
}

#' Filter `adlb` for `ANL01FL`
#'
#' @inheritParams gen_args
#'
filter_adlb_anl01fl <- function(adam_db) {
  assert_that(is(adam_db, "dm"))

  adam_db %>%
    dm_zoom_to(adlb) %>%
    filter(ANL01FL == "Y") %>%
    dm_update_zoomed()
}

#' Filter `adeg` for `ANL01FL`
#'
#' @inheritParams gen_args
#'
filter_adeg_anl01fl <- function(adam_db) {
  assert_that(is(adam_db, "dm"))

  adam_db %>%
    dm_zoom_to(adeg) %>%
    filter(ANL01FL == "Y") %>%
    dm_update_zoomed()
}

#' Filter `advs` for `ANL01FL`
#'
#' @inheritParams gen_args
#'
filter_advs_anl01fl <- function(adam_db) {
  assert_that(is(adam_db, "dm"))

  adam_db %>%
    dm_zoom_to(advs) %>%
    filter(ANL01FL == "Y") %>%
    dm_update_zoomed()
}

#' Filter `admh` for `ANL01FL`
#'
#' @inheritParams gen_args
#'
filter_admh_anl01fl <- function(adam_db) {
  assert_that(is(adam_db, "dm"))

  adam_db %>%
    dm_filter(admh, bol_YN(ANL01FL)) %>%
    dm_apply_filters()
}

#' Filter `adex` for `PARCAT1`
#'
#' @inheritParams gen_args
#'
filter_adex_drug <- function(adam_db) {
  assert_that(is(adam_db, "dm"))

  adam_db %>%
    dm_zoom_to(adex) %>%
    filter(PARCAT1 == "OVERALL") %>%
    dm_update_zoomed()
}

#' Filter `adcm` for `ANL01FL` and  `ATIREL`
#'
#' @details filter with `ANL01FL` (instead of `SAFFL ` which is external to `chevron`).
#'
#' @inheritParams gen_args
#'
filter_adcm_anl01fl <- function(adam_db) {
    assert_that(is(adam_db, "dm"))

    adam_db %>%
      dm_zoom_to(adcm) %>%
      filter(ANL01FL == "Y") %>%
      dm_update_zoomed()
}

#' Creating Necessary Columns for `aet01`
#'
#' @inheritParams gen_args
#'
mutate_for_aet01 <- function(adam_db) {

  db <- adam_db %>%
    dm_zoom_to(adae) %>%
    mutate(
    FATAL = AESDTH == "Y",
    SER = AESER == "Y",
    SERWD = (AESER == "Y" & AEACN == "DRUG WITHDRAWN"),
    SERDSM = (AESER == "Y" & AEACN %in% c("DRUG INTERRUPTED", "DOSE INCREASED", "DOSE REDUCED")),
    RELSER = (AESER == "Y" & AREL == "Y"),
    WD = AEACN == "DRUG WITHDRAWN",
    DSM = AEACN %in% c("DRUG INTERRUPTED", "DOSE INCREASED", "DOSE REDUCED"),
    REL = AREL == "Y",
    RELWD = (AREL == "Y" & AEACN == "DRUG WITHDRAWN"),
    RELDSM = (AREL == "Y" & AEACN %in% c("DRUG INTERRUPTED", "DOSE INCREASED", "DOSE REDUCED")),
    CTC35 = ATOXGR %in% c("3", "4", "5"),
    CTC45 = ATOXGR %in% c("4", "5"),
    SEV = ASEV == "SEVERE",
    SMQ01 = SMQ01NAM != "",
    SMQ02 = SMQ02NAM != "",
    CQ01 = CQ01NAM != ""
    ) %>%
    mutate(
    AEDECOD = with_label(AEDECOD, "Dictionary-Derived Term"),
    AESDTH = with_label(AESDTH, "Results in Death"),
    AEACN = with_label(AEACN, "Action Taken with Study Treatment"),
    FATAL = with_label(FATAL, "AE with fatal outcome"),
    SER = with_label(SER, "Serious AE"),
    SEV = with_label(SEV, "Severe AE (at greatest intensity)"),
    SERWD = with_label(SERWD, "Serious AE leading to withdrawal from treatment"),
    SERDSM = with_label(SERDSM, "Serious AE leading to dose modification/interruption"),
    RELSER = with_label(RELSER, "Related Serious AE"),
    WD = with_label(WD, "AE leading to withdrawal from treatment"),
    DSM = with_label(DSM, "AE leading to dose modification/interruption"),
    REL = with_label(REL, "Related AE"),
    RELWD = with_label(RELWD, "Related AE leading to withdrawal from treatment"),
    RELDSM = with_label(RELDSM, "Related AE leading to dose modification/interruption"),
    CTC35 = with_label(CTC35, "Grade 3-5 AE"),
    CTC45 = with_label(CTC45, "Grade 4/5 AE"),
    SMQ01 =  with_label(SMQ01, aesi_label(SMQ01NAM, SMQ01SC)),
    SMQ02 = with_label(SMQ02, aesi_label(SMQ02NAM, SMQ02SC)),
    CQ01 = with_label(CQ01, aesi_label(CQ01NAM))
    ) %>%
    dm_update_zoomed()

  db
}

#' Categorize Reason for Discontinuation from Study.
#'
#' @inheritParams gen_args
#' @param reason (`character`) the variable name for variable with the reason for discontinuation.
#'
mutate_adsl_gp <- function(adam_db,
                           reason = .study$disc_reason_var,
                           .study = list(disc_reason_var = "DCSREAS")) {
  assert_that(is(adam_db, "dm"))

  # TODO: revisit
  sym_reason <- sym(reason) # nolint

  adam_db %>%
    dm_zoom_to("adsl") %>%
    mutate(reasonGP = case_when(
      !!sym_reason %in% c("ADVERSE EVENT", "DEATH") ~ "Safety",
      !!sym_reason == "<Missing>" ~ "<Missing>",
      TRUE ~ "Non Safety"
    )) %>%
    dm_update_zoomed()
}

#' Coerce `CMSEQ` to factor in `adcm`
#'
#' @inheritParams gen_args
#'
mutate_cmt01a <- function(adam_db) {

  adam_db %>%
    dm_zoom_to(adcm) %>%
    mutate(CMSEQ = as.factor(CMSEQ)) %>%
    dm_update_zoomed()
}



#' Reorder `PARAM` and `PARAMCD` levels
#'
#' @inheritParams gen_args
#' @param paramcd_order (`vector of character`) providing the `PARAMCD` values in the desired order.
#'
#' @return a `dm` object
#'
reorder_adex_params <- function(adam_db,
                                paramcd_order = .study$paramcd_order,
                                .study = list(paramcd_order = c("TNDOSE", "DOSE", "NDOSE", "TDOSE"))) {
  param_vars <- adam_db$adex %>%
    select(PARAM, PARAMCD) %>%
    reorder_levels_params(paramcd_levels = paramcd_order)

  adam_db %>%
    dm_zoom_to(adex) %>%
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
#'
remove_adex_aval <- function(adam_db,
                             show_stats = .study$show_cont_stats,
                             show_bins = .study$show_cat_stats,
                             .study = list(
                               show_cont_stats = c("ALL"),
                               show_cat_stats = c("ALL")
                             )) {
  if (!"ALL" %in% show_stats) {
    adam_db <- adam_db %>%
      dm_zoom_to(adex) %>%
      mutate(AVAL = ifelse(PARAM %in% show_stats, AVAL, NA)) %>%
      dm_update_zoomed()
  }

  if (!"ALL" %in% show_bins) {
    adam_db <- adam_db %>%
      dm_zoom_to(adex) %>%
      mutate(AVALCAT1 = ifelse(PARAM %in% show_bins, AVALCAT1, NA)) %>%
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
#'
reorder_dtht01 <- function(adam_db) {

  death_fact <- levels(adam_db$adae$DTHCAT)
  death_fact <- setdiff(death_fact, "OTHER")
  death_fact <- c(death_fact, "OTHER")

  db <- adam_db %>%
    dm_zoom_to(adsl) %>%
    mutate(DTHCAT = fct_relevel(DTHCAT, death_fact)) %>%
    dm_update_zoomed()

  db
}

#' Mutate Function for `CMT02_PT_1`
#'
#' @inheritParams gen_args
#'
#' @return
#'
mutate_cmt02_pt_1 <- function(adam_db) {

  db <- adam_db %>%
    dm_zoom_to(adcm) %>%
    mutate(CMSEQ = as.factor(CMSEQ)) %>%
    dm_update_zoomed()

  db
}
