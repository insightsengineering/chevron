
lookup_fun <- function(idt, what, pmap) {

  assert_that(idt %in% pmap$id)

  fname <- pmap %>%
    filter(id == idt) %>%
    slice(1) %>%
    pull(what)

  if (is.na(fname))
    identity
  else
    get(fname)
}

get_filter_fun <- function(id, pmap) {
  lookup_fun(id, "filter_fun", pmap)
}

get_mutate_fun <- function(id, pmap) {
  lookup_fun(id, "mutate_fun", pmap)
}


#' @export
preprocess_data <- function(adam_db, tlgfname, preproc_map = std_preproc_map(), .study, ...) {

  ffun <- get_filter_fun(tlgfname, preproc_map)
  mfun <- get_mutate_fun(tlgfname, preproc_map)

  adam_db %>%
    ffun() %>%
    mfun()

}
