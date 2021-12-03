

# TODO: standardize the names
std_data_manipulation_map <- tibble::tribble(
  ~id,           ~filter_fun,                      ~mutate_fun,           ~req_data,
  "aet02_1",     "filter_adae_anl01fl",            NA,                    c("adsl", "adae"),
  "aet02_2",     "filter_adae_anl01fl",            NA,                    c("adsl", "adae"),
  "aet02_3",     "filter_adae_anl01fl",            NA,                    c("adsl", "adae"),
  "aet03_1",     "filter_adae_anl01fl",            NA,                    c("adsl", "adae"),
  "aet04_1",     "filter_adae_anl01fl",            NA,                    c("adsl", "adae"),
  "dmt01_1",     NA,                               NA,                    c("adsl"),
  "dst01_1",     NA,                               NA,                    c("adsl"),
  "dst01_2",     NA,                               "mutate_adsl_gp",      c("adsl"),
  "dst01_3",     NA,                               "mutate_adsl_gp",      c("adsl"),
  "ext01_1",     "filter_adex_drug",               "reorder_adex_params", c("adsl", "adex"),
  "ext01_2",     "filter_adex_drug",               "remove_adex_aval",    c("adsl", "adex"),
  "lbt01_1",     "filter_adlb_anl01fl",            NA,                    c("adsl", "adlb")
)

#' @export
std_preproc_map <- function() {
  std_data_manipulation_map
}


#' Retrieve Standard Subsetting for Templates
#'
#' @param idt (`character`) the id of the table.
#'
#' @export
#'
#' @examples
#' std_filter("aet02_1")
std_filter <- function(idt) {

  assert_that(idt %in% std_data_manipulation_map$id)

  fname <- std_data_manipulation_map %>%
    filter(id == idt) %>%
    slice(1) %>%
    pull("filter_fun")

  if (is.na(fname))
    identity
  else
    get(fname)
}

#' Retrieve Standard Mutation for Templates
#'
#' @param idt (`character`) the id of the table.
#'
#' @export
#'
#' @examples
#' std_mutate("aet02_1")
std_mutate <- function(idt) {

  assert_that(idt %in% std_data_manipulation_map$id)

  fname <- std_data_manipulation_map %>%
    filter(id == idt) %>%
    slice(1) %>%
    pull("mutate_fun")

  if (is.na(fname))
    identity
  else
    get(fname)

}


## manipulation functions ----

#' Filter `adae` for `ANL01FL`
#'
#' @param x (`dm`)
#'
#' @return
#'
filter_adae_anl01fl <- function(x) {
  assert_that(is(x, "dm"))

  x %>%
    dm_filter(adae, bol_YN(ANL01FL)) %>%
    dm_apply_filters()
}

#' Filter `adlb` for `ANL01FL`
#'
#' @param x (`dm`)
#'
#' @return
#'
filter_adlb_anl01fl <- function(x) {
  assert_that(is(x, "dm"))

  x %>%
    dm_filter(adlb, bol_YN(ANL01FL)) %>%
    dm_apply_filters()
}

#' Filter `adex` for `PARCAT1`
#'
#' @param x (`dm`)
#'
#' @return
#'
filter_adex_drug <- function(x) {
  assert_that(is(x, "dm"))

  x %>%
    dm_filter(adex, PARCAT1 == "OVERALL") %>%
    dm_apply_filters()
}

#' Categorize Reason for Discontinuation from Study.
#'
#' @inheritParams gen_args
#'
#' @param x (`dm`) object.
#' @param reason (`character`) the variable name containg the reason for discontinuation.
#'
#' @return
#'
mutate_adsl_gp <- function(x,
                           reason = .study$disc_reason_var,
                           .study = list(disc_reason_var = "DCSREAS")
                           ) {

  assert_that(is(x, "dm"))

  # TODO: revisit
  sym_reason <- sym(reason) # nolint

  x %>%
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
#'
#' @param paramcd_order (`vector of character`) providing the `PARAMCD` values in the desired order.
#'
#' @return a `dm` object
#'
reorder_adex_params <- function(adam_db,
                                paramcd_order = .study$paramcd_order,
                                .study = list(paramcd_order = c("TNDOSE", "DOSE", "NDOSE", "TDOSE"))
                                ) {

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
                             .study = list(show_cont_stats = c("ALL"),
                                           show_cat_stats = c("ALL"))
                             ) {

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
