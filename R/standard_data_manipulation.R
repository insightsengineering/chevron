

std_data_manipulation_map <- tibble::tribble(
  ~id,           ~filter_fun,                       ~mutate_fun,           ~req_data,
  "aet02_1",     "filter_adae_anl01fl",             NA,                    c("adsl", "adae"),
  "aet02_2",     "filter_adae_anl01fl",             NA,                    c("adsl", "adae"),
  "aet02_3",     "filter_adae_anl01fl",             NA,                    c("adsl", "adae"),
  "aet03_1",     "filter_adae_anl01fl",             NA,                    c("adsl", "adae"),
  "aet04_1",     "filter_adae_anl01fl",             NA,                    c("adsl", "adae"),
  "dmt01_1",      NA,                               NA,                    c("adsl"),
  "dst01_1",      NA,                               NA,                    c("adsl"),
  "dst01_2",      NA,                               NA,                    c("adsl"),
  "dst01_3",      NA,                               NA,                    c("adsl"),
  "ext01_1",      NA,                               "relevel_adex_params", c("adsl", "adex"),
  "lbt01_1",      "filter_adae_anl01fl",            NA,                    c("adsl", "adlb")
)


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
filter_adae_anl01fl <- function(x) {
  assert_that(is(x, "dm"))

  x %>%
    dm_filter(adae, bol_YN(ANL01FL)) %>%
    dm_apply_filters()
}

mutate_adsl_gp <- function(x, reason) {

  assert_that(is(x, "dm"))

  sym_reason <- sym(reason)

  x %>%
    dm_zoom_to("adsl") %>%
    mutate(reasonGP = case_when(
      !!sym_reason %in% c("ADVERSE EVENT", "DEATH") ~ "Safety",
      !!sym_reason == "<Missing>" ~ "<Missing>",
      TRUE ~ "Non Safety"
    ) %>%
    dm_update_zoomed()
  )
}

relevel_adex_params <- function(adam_db) {

  df <-
    adam_db$adex %>%
    relevel_params(paramcd_levels = c("TNDOSE", "DOSE", "NDOSE", "TDOSE"))

  adam_db <-
    adam_db %>%
    dm_mutate_tbl(adex = df)

  adam_db

}



