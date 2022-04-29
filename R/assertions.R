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

# assert_study_object ----

#' Assertion on the Study Object
#'
#' @param x (`list`) to be assessed.
#'
#' @return invisible `NULL` if the object fits the criteria of a `.study` object.
#' @export
#'
#' @examples
#' assert_study_object(std_study_object)
assert_study_object <- function(x) {
  assert_list(x)
  assert_string(x$actualarm)
  assert_character(x$evo_vars, unique = TRUE)
  assert_character(x$evo_vars_lbls, len = length(x$evo_vars))
  assert_string(x$disc_reason_var)
  assert_list(x$group_grades)
  assert_string(x$lbl_overall)
  assert_character(x$medconcept_var, unique = TRUE)
  assert_string(x$planarm)
  assert_string(x$reason)
  assert_character(x$safety_var, unique = TRUE)
  assert_character(x$severity_grade, unique = TRUE)
  assert_string(x$status_var)
  assert_character(x$summary_demo, unique = TRUE)
  assert_character(x$summary_demo_lbl, len = length(x$summary_demo))
  assert_string(x$visitvar)

  invisible(NULL)
}
