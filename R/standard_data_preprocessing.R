

std_preprocessing_map <- tibble::tribble(
  ~tlgfname, ~filter_fname, ~mutate_fname, ~req_data,
  "aet02_1", "filter_adae_anl01fl", NA, c("adsl", "adae"),
  "aet02_2", "filter_adae_anl01fl", NA, c("adsl", "adae"),
  "aet02_3", "filter_adae_anl01fl", NA, c("adsl", "adae"),
  "aet03_1", "filter_adae_anl01fl", NA, c("adsl", "adae"),
  "aet04_1", "filter_adae_anl01fl", NA, c("adsl", "adae"),
  "dmt01_1", NA, NA, c("adsl"),
  "dst01_1", NA, NA, c("adsl"),
  "dst01_2", NA, "mutate_adsl_gp", c("adsl"),
  "dst01_3", NA, "mutate_adsl_gp", c("adsl"),
  "egt01_1", "filter_adeg_anl01fl", NA, c("adsl", "adeg"),
  "ext01_1", "filter_adex_drug", "reorder_adex_params", c("adsl", "adex"),
  "ext01_2", "filter_adex_drug", "remove_adex_aval", c("adsl", "adex"),
  "lbt01_1", "filter_adlb_anl01fl", NA, c("adsl", "adlb"),
  "mht01_1", "filter_admh_anl01fl", NA, c("adsl", "admh"),
  "vst01_1", "filter_advs_anl01fl", NA, c("adsl", "advs"),
  "vst02_1", "mutate_vst02", "filter_vst02", c("adsl", "advs"),
  "vst02_2", "mutate_vst02", "filter_vst02", c("adsl", "advs")
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

#' Filter `adae` for `ANL01FL`
#'
#' @inheritParams gen_args
#'
#'
filter_adae_anl01fl <- function(adam_db) {
  assert_that(is(adam_db, "dm"))

  adam_db %>%
    dm_filter(adae, bol_YN(ANL01FL)) %>%
    dm_apply_filters()
}

#' Filter `adlb` for `ANL01FL`
#'
#' @inheritParams gen_args
#'
filter_adlb_anl01fl <- function(adam_db) {
  assert_that(is(adam_db, "dm"))

  adam_db %>%
    dm_filter(adlb, bol_YN(ANL01FL)) %>%
    dm_apply_filters()
}

#' Filter `adeg` for `ANL01FL`
#'
#' @inheritParams gen_args
#'
filter_adeg_anl01fl <- function(adam_db) {
  assert_that(is(adam_db, "dm"))

  adam_db %>%
    dm_filter(adeg, bol_YN(ANL01FL)) %>%
    dm_apply_filters()
}

#' Filter `advs` for `ANL01FL`
#'
#' @inheritParams gen_args
#'
filter_advs_anl01fl <- function(adam_db) {
  assert_that(is(adam_db, "dm"))

  adam_db %>%
    dm_filter(advs, bol_YN(ANL01FL)) %>%
    dm_apply_filters()
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
    dm_filter(adex, PARCAT1 == "OVERALL") %>%
    dm_apply_filters()
}


#' Filter post-baseline values in `advs`
#'
#' @inheritParams gen_args
#'
filter_vst02 <- function(adam_db) {
  assert_that(is(adam_db, "dm"))

  adam_db %>%
    dm_zoom_to(advs) %>%
    filter(!AVISIT %in% c("SCREENING", "BASELINE")) %>%
    dm_update_zoomed()
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


#' Categorize `advs` values
#'
#' @inheritParams gen_args
#'
mutate_vst02 <- function(adam_db) {

  db <- adam_db %>%
    dm_zoom_to(advs) %>%
    mutate(
      ANRIND = case_when(
        ANRIND == "HIGH HIGH" ~ "HIGH",
        ANRIND == "LOW LOW" ~ "LOW",
        TRUE ~ as.character(ANRIND)
      ),
      BNRIND = case_when(
        BNRIND == "HIGH HIGH" ~ "HIGH",
        BNRIND == "LOW LOW" ~ "LOW",
        TRUE ~ as.character(BNRIND)
    )) %>%
    mutate(ANRIND = as.factor(ANRIND),
           BNRIND = as.factor(BNRIND)
    ) %>%
    dm_update_zoomed()

  db
}
