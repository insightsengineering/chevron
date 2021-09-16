# as we use NSE
globalVariables(c("ANL01FL", "adae", "ANL01FL"))

#' Retrieve Variables for Certain variables
#'
#' @param df data froma
#' @param vars variable names in data frame `df`
#'
#' @importFrom assertthat assert_that
#' @importFrom rtables var_labels
#' @export
var_labels_for <- function(df, vars) {
  assert_that(all(vars %in% names(df)))
  unname(var_labels(df, fill = TRUE)[vars])
}


#' Standard Documentation Lookup
#'
#' @param id standard id of output
#' @param ... not used at the moment
#'
#' @export
std_deco <- function(id, ...) {
  list(
    title = "Main Title",
    subtitles = "Protocol: {{protocol}}, Snapshot: {{snapshot}}, Snapshot Date: {{snapshot-date}}, Cutoff Date: {{cutoff-date}}",
    main_footer = "Footnotes go here"
  )
}

#' Convert Y N values used in CDISC to R boolean object
#'
#' Empty strings are mapped to `NA`
#'
#' @param x character vector with Y and N
#'
#' @export
#'
#' @examples
#' \dontrun{
#' chevron:::bol_YN(c("Y", "Y", "N", "", NA))
#' }
bol_YN <- function(x) {
  if (is.logical(x)) {
    x
  } else {
    y <- x == "Y"
    y[x == ""] <- NA
    y
  }
}
