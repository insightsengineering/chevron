
#' @importFrom assertthat assert_that
#' @importFrom rtables var_labels
var_labels_for <- function(df, vars) {
  assert_that(all(vars %in% names(df)))
  unname(var_labels(df, fill = TRUE)[vars])
}


std_deco <- function(id, ...) {
  list(
    title = "Main Title",
    subtitles = "Protocol: {{protocol}}, Snapshot: {{snapshot}}, Snapshot Date: {{snapshot-date}}, Cutoff Date: {{cutoff-date}}",
    main_footer = "Footnotes go here"
  )
}

bol_YN <- function(x) {
  if (is.logical(x)) {
    x
  } else {
    y <- x == "Y"
    y[x == ""] <- NA
    y
  }
}
