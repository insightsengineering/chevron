# assert_colnames ----

#' Check if strings are column names of a data frame
#'
#' Provides a clearer error message in the case of missing variable.
#'
#' @param df (`data.frame`)
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
