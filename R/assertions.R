# assert_colnames ----

#' Check if strings are column names of a data frame
#'
#' Provides a clearer error message in the case of missing variable.
#'
#' @param df (`data.frame`) input to check for the presence of column names.
#' @param x (vector of `character`) the names of the columns to be checked.
#' @param null_ok (`logical`) can `x` be NULL.
#'
#' @export
#'
#' @examples
#' \dontrun{
#' assert_colnames(mtcars, c("speed", "seats"), null_ok = TRUE)
#'
#' my_colnames <- NULL
#' assert_colnames(mtcars, my_colnames, null_ok = FALSE)
#' }
assert_colnames <- function(df, x, null_ok = TRUE) {
  if (!null_ok && is.null(x)) {
    stop(
      paste0(
        deparse(substitute(x)),
        " cannot be NULL."
      ),
      call. = FALSE
    )
  }

  missing_var <- setdiff(x, colnames(df))
  if (length(missing_var) > 0) {
    stop(
      paste0(
        "Variable(s) not a column name of ",
        deparse(substitute(df)),
        ":",
        paste("\n", missing_var, collapse = ""),
        "\n [available columns are: ",
        paste(colnames(df), collapse = ", "),
        "]"
      ),
      call. = FALSE
    )
  } else {
    invisible(TRUE)
  }
}

#' Assert that all names are among table names of a `dm` object
#'
#' @param db (`dm`) input to check for the presence of tables.
#' @param tab (`character`) the names of the tables to be checked.
#' @param null_ok (`flag`) can `x` be NULL.
#' @param qualifier (`string`) to be returned if the check fails.
#'
#' @export
#' @examples
#' \dontrun{
#' assert_all_tablenames(dm::dm_nycflights13(), c("mpg", "new", "hoho"), qualifier = "first test:")
#' }
assert_all_tablenames <- function(db, tab, null_ok = TRUE, qualifier = NULL) {
  checkmate::assert_class(db, "dm")
  checkmate::assert_character(tab, null.ok = null_ok)
  checkmate::assert_string(qualifier, null.ok = TRUE)

  diff <- setdiff(tab, names(db))

  if (length(diff) == 0) {
    invisible(NULL)
  } else {
    stop(
      paste(qualifier, "Expected table names:", toString(diff), "not in", deparse(substitute(db)))
    )
  }
}

#' Assert that at least one name is among table names of a `dm` object
#'
#' @param db (`dm`) input to check for the presence or tables.
#' @param tab (`character`) the names of the tables to be checked.
#' @param null_ok (`flag`) can `x` be NULL.
#' @param qualifier (`string`) to be returned if the check fails.
#'
#' @export
#' @examples
#' \dontrun{
#' assert_one_tablenames(dm::dm_nycflights13(), c("mpg", "new", "hoho"), qualifier = "first test:")
#' }
assert_one_tablenames <- function(db, tab, null_ok = TRUE, qualifier = NULL) {
  checkmate::assert_class(db, "dm")
  checkmate::assert_character(tab, null.ok = null_ok)
  checkmate::assert_string(qualifier, null.ok = TRUE)

  diff <- setdiff(tab, names(db))

  common <- intersect(tab, names(db))

  if (length(common) > 0) {
    invisible(NULL)
  } else {
    stop(
      paste(qualifier, "At least one of:", toString(tab), "is expected to be a table name of", deparse(substitute(db)))
    )
  }
}
