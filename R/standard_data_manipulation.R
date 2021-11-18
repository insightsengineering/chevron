

std_data_manipulation_map <- tibble::tribble(
  ~id,           ~filter_fun,                       ~mutate_fun,           ~req_data,
  "aet02_1",     "filter_adae_anl01fl",             NA,                    c("adsl", "adae"),
  "aet02_2",     "filter_adae_anl01fl",             NA,                    c("adsl", "adae"),
  "aet02_3",     "filter_adae_anl01fl",             NA,                    c("adsl", "adae")
)


#' Retrieve Standard Subsetting for Templates
#'
#' @export
#'
#' @examples
#' std_filter("aet02_1")
std_filter <- function(id) {

  assert_that(id %in% std_data_manipulation_map$id)

  fname <- std_data_manipulation_map %>%
    filter(id == id) %>%
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
std_mutate <- function(id) {

  assert_that(id %in% std_data_manipulation_map$id)

  fname <- std_data_manipulation_map %>%
    filter(id == id) %>%
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
