# assert_colnames ----

#' Check if strings are column names of a `data.frame`
#'
#' Provides a clearer error message in the case of missing variable.
#'
#' @param df (`data.frame`) input to check for the presence of column names.
#' @param x (`character`) the names of the columns to be checked.
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
    stop("x cannot be NULL.", call. = FALSE)
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

#' Assert that all names are among names of a `list` of `data.frame`.
#'
#' @param db (`list` of `data.frame`) input to check for the presence of tables.
#' @param tab (`character`) the names of the tables to be checked.
#' @param null_ok (`flag`) can `x` be NULL.
#' @param qualifier (`string`) to be returned if the check fails.
#'
#' @export
#'
#' @examples
#' \dontrun{
#'
#' lsd <- list(
#'   mtcars = mtcars,
#'   iris = iris
#' )
#'
#' assert_all_tablenames(lsd, c("mtcars", "iris", "x"), qualifier = "first test:")
#' }
assert_all_tablenames <- function(db, tab, null_ok = TRUE, qualifier = NULL) {
  checkmate::assert_list(db, types = "data.frame", names = "unique")
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

#' Assert that at least one name is among table names of a `list` of `data.frame`.
#'
#' @param db (`list` of `data.frame`) input to check for the presence or tables.
#' @param tab (`character`) the names of the tables to be checked.
#' @param null_ok (`flag`) can `x` be NULL.
#' @param qualifier (`string`) to be returned if the check fails.
#'
#' @keywords internal
#'
#' @examples
#' \dontrun{
#'
#' lsd <- list(
#'   mtcars = mtcars,
#'   iris = iris
#' )
#'
#' assert_one_tablenames(lsd, c("mtcars", "x", "y"), qualifier = "first test:")
#' }
assert_one_tablenames <- function(db, tab, null_ok = TRUE, qualifier = NULL) {
  checkmate::assert_list(db, types = "data.frame", names = "unique")
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


#' Assert Subset and Provide Suggestions
#'
#' @param x (`character`) to be asserted
#' @param choices (`character`) set of possible values.
#'
#' @keywords internal
#'
#' @return invisible `NULL` if all `x` are subset of `choices` or an informative warning otherwise.
#'
#' @examples
#' \dontrun{
#' assert_subset_suggest(c("lbl_overall"), "lbl_overall")
#' assert_subset_suggest(
#'   c("lbl_", "xxx", "arm_var"),
#'   c("lbl_overall", "arm_var")
#' )
#' }
assert_subset_suggest <- function(x, choices) {
  checkmate::assert_character(choices)
  checkmate::assert_character(x, null.ok = TRUE)

  invalid_args <- setdiff(x, choices)

  if (length(invalid_args) == 0) {
    return(invisible(NULL))
  }

  supp_args <- setdiff(choices, x)
  matching_args <- lapply(invalid_args, function(choices) supp_args[agrep(choices, supp_args)])

  msg <- mapply(
    function(x, y) {
      paste(
        paste0(
          "\n",
          y,
          " is not a valid argument."
        ),
        if (length(x) > 0) {
          paste0(
            "Do you mean: ",
            toString(x),
            " ?"
          )
        }
      )
    },
    matching_args,
    invalid_args
  )

  stop(msg, call. = FALSE)
}


#' Check to have only one PARAMCD in the analysis dataset
#' @param param_val value of PARAMCD
#' @export
assert_single_paramcd <- function(param_val) {
  unique_param_val <- unique(param_val)
  if (length(unique_param_val) > 1) {
    stop(paste0(
      "More than one parameters:",
      toString(unique_param_val),
      ", only one suppose to have."
    ))
  }
}
