#' Check that all names are among column names
#'
#' @param df (`data.frame`)
#' @param x (`character`) the names of the columns to be checked.
#' @param null_ok (`flag`) can `x` be NULL.
#' @param qualifier (`string`) to be returned if the check fails.
#'
#' @keywords internal
#'
#' @examples
#' check_all_colnames(mtcars, c("mpg", "cyl"))
#' check_all_colnames(mtcars, c("mpg", "x"))
#' check_all_colnames(mtcars, c("x", "y"))
check_all_colnames <- function(df, x, null_ok = TRUE, qualifier = NULL) {
  assert_data_frame(df)
  assert_character(x, null.ok = null_ok)
  assert_string(qualifier, null.ok = TRUE)

  diff <- setdiff(x, colnames(df))

  if (length(diff) == 0) {
    invisible(NULL)
  } else {
    paste(qualifier, "Expected column names:", toString(diff), "not in", deparse(substitute(df)))
  }
}

#' Check that at least one name is among column names
#'
#' @param df (`data.frame`)
#' @param x (`character`) the names of the columns to be checked.
#' @param null_ok (`flag`) can `x` be NULL.
#' @param qualifier (`string`) to be returned if the check fails.
#'
#' @keywords internal
#'
#' @examples
#' check_one_colnames(mtcars, c("mpg"))
#' check_one_colnames(mtcars, c("mpg", "x"))
#' check_one_colnames(mtcars, c("x", "y"))
check_one_colnames <- function(df, x, null_ok = TRUE, qualifier = NULL) {
  assert_data_frame(df)
  assert_character(x, null.ok = null_ok)
  assert_string(qualifier, null.ok = TRUE)

  common <- intersect(x, colnames(df))

  if (length(common) > 0) {
    invisible(NULL)
  } else {
    paste(qualifier, "At least one of:", toString(x), "is expected to be a column name of", deparse(substitute(df)))
  }
}
