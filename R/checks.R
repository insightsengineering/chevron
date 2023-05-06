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
#' \dontrun{
#' check_all_colnames(mtcars, c("x", "y"))
#' }
check_all_colnames <- function(df, x, null_ok = TRUE, qualifier = NULL) {
  checkmate::assert_data_frame(df)
  checkmate::assert_character(x, null.ok = null_ok)
  checkmate::assert_string(qualifier, null.ok = TRUE)

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
#' \dontrun{
#' check_all_colnames(mtcars, c("x", "y"))
#' }
check_one_colnames <- function(df, x, null_ok = TRUE, qualifier = NULL) {
  checkmate::assert_data_frame(df)
  checkmate::assert_character(x, null.ok = null_ok)
  checkmate::assert_string(qualifier, null.ok = TRUE)

  common <- intersect(x, colnames(df))

  if (length(common) > 0) {
    invisible(NULL)
  } else {
    paste(qualifier, "At least one of:", toString(x), "is expected to be a column name of", deparse(substitute(df)))
  }
}

#' Check that value exists in the column
#'
#' @param df (`data.frame`)
#' @param value (`string`) the value to be checked.
#' @param x (`string`) the names of the column.
#' @param df_name (`string`) name of the data frame
#'
#' @keywords internal
#' @export
#'
#' @examples
#' \dontrun{
#' check_col_contains(iris, "setosa", "Species")
#' }
check_col_contains <- function(df, value, x, null_ok = TRUE, df_name = deparse(substitute(df))) {
  assert_colnames(df, x, null_ok = FALSE)
  checkmate::assert_string(df_name)
  checkmate::assert_string(value)
  if (all(value %in% df[[x]])) {
    invisible()
  } else {
    sprintf("No record available in [%s] with condition [%s.%s] = %s.", df_name, df_name, x, toString(value))
  }
}
