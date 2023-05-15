# assert_colnames ----

#' Check if strings are column names of a `data.frame`
#'
#' Provides a clearer error message in the case of missing variable.
#'
#' @param df (`data.frame`) input to check for the presence of column names.
#' @param x (`character`) the names of the columns to be checked.
#' @param null_ok (`logical`) can `x` be NULL.
#' @param types (`character`) type of the variables.
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
assert_colnames <- function(df, x, null_ok = TRUE, types = NULL) {
  if (!null_ok && is.null(x)) {
    stop("x cannot be NULL.", call. = FALSE)
  }

  missing_var <- setdiff(x, colnames(df))
  if (length(missing_var) > 0) {
    abort(
      paste0(
        "Variable(s) not a column name of ",
        deparse(substitute(df)),
        ":",
        paste("\n", missing_var, collapse = ""),
        "\n [available columns are: ",
        paste(colnames(df), collapse = ", "),
        "]"
      )
    )
  }
  if (!is.null(types)) {
    var_types <- mapply(is, object = df[x], class2 = types, SIMPLIFY = TRUE)
    non_match <- which(var_types != types)
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

  abort(msg)
}


#' Check variable only has one unique value.
#' @param x value vector.
#' @param label (`string`) label of input.
#' @export
assert_single_value <- function(x, label = deparse(substitute(x))) {
  unique_param_val <- unique(x)
  if (length(unique_param_val) > 1) {
    stop(
      quote_str(label),
      " has than one values ",
      toString(unique_param_val),
      ", only one value is allowed."
    )
  }
}

#' @title Check whether var is valid
#' @details
#' This function checks the variable values are valid or not.
#' @param x value of col_split variable
#' @param label (`string`) hints.
#' @param na_ok (`flag`) whether NA value is allowed
#' @param empty_ok (`flag`) whether length 0 value is allowed.
#' @param ... Further arguments to methods.
#' @export
assert_valid_var <- function(x, label, na_ok, empty_ok, ...) {
  UseMethod("assert_valid_var")
}
#' @rdname assert_valid_var
#' @export
#' @param min_chars (`integer`) the minimum length of the characters.
assert_valid_var.character <- function(
    x, label = deparse(substitute(x)),
    na_ok = FALSE, empty_ok = FALSE,
    min_chars = 1L, ...) {
  checkmate::assert_character(
    x,
    min.chars = min_chars,
    min.len = as.integer(!empty_ok),
    any.missing = na_ok,
    .var.name = label,
    ...
  )
}
#' @export
assert_valid_var.factor <- function(
    x, label = deparse(substitute(x)),
    na_ok = FALSE, empty_ok = FALSE,
    min_chars = 1L, ...) {
  checkmate::assert_character(
    levels(x),
    min.chars = min_chars,
    .var.name = paste("level of", label),
    ...
  )
  checkmate::assert_factor(
    x,
    min.levels = as.integer(empty_ok),
    any.missing = na_ok,
    .var.name = label,
    ...
  )
}
#' @export
assert_valid_var.logical <- function(x, label = deparse(substitute(x)), na_ok = TRUE, empty_ok = FALSE, ...) {
  checkmate::assert_logical(
    x,
    min.len = as.integer(!empty_ok),
    any.missing = na_ok,
    .var.name = label,
    ...
  )
}
#' @rdname assert_valid_var
#' @export
#' @param integerish (`flag`) whether the number should be treated as integerish.
assert_valid_var.numeric <- function(
    x, label = deparse(substitute(x)),
    na_ok = TRUE, empty_ok = FALSE, integerish = FALSE, ...) {
  check_fun <- if (integerish) checkmate::assert_integerish else checkmate::assert_numeric
  check_fun(
    x,
    min.len = as.integer(!empty_ok),
    any.missing = na_ok,
    .var.name = label,
    ...
  )
}
#' @export
assert_valid_var.default <- function(x, label = deparse(substitute(x)), na_ok = FALSE, empty_ok = FALSE, ...) {
}
#' Check variables in a data frame are valid character or factor.
#' @param df (`data.frame`) input dataset.
#' @param vars (`character`) variables to check.
#' @param label (`string`) labels of the data frame.
#' @param types Named (`list`) of type of the input.
#' @param ... further arguments for `assert_valid_var`. Please note that different methods have different arguments
#' so if provided make sure the variables to check is of the same class.
#'
#' @export
assert_valid_variable <- function(df, vars, label = deparse(substitute(df)), types = NULL, ...) {
  assert_colnames(df, vars, null_ok = TRUE)
  labels <- sprintf("%s$%s", label, vars)
  if (length(types) == 1 && is.null(names(types))) {
    types <- setNames(rep(types, length(vars)), vars)
  }
  if (!is.null(types)) {
    vars_to_check <- which(vars %in% names(types))
    mapply(
      assert_valid_type,
      df[vars[vars_to_check]],
      types = types[vars_to_check],
      label = labels[vars_to_check]
    )
  }
  collection <- checkmate::makeAssertCollection()
  mapply(assert_valid_var, df[vars], labels, MoreArgs = list(..., add = collection), SIMPLIFY = FALSE)
  checkmate::reportAssertions(collection)
}

#' Check variable is of correct type
#' @param x Object to check the type.
#' @param types (`character`) possible types to check.
#' @param label (`string`) label.
assert_valid_type <- function(x, types, label = deparse(substitute(x))) {
  if (!any(vapply(types, is, object = x, FUN.VALUE = TRUE))) {
    abort(
      quote_str(label),
      " is not of type ",
      toString(types)
    )
  }
}

#' Check variables are of same levels
#' @param df1 (`data.frame`) input.
#' @param df2 (`data.frame`) input.
#' @param var (`string`) variable to check.
#' @param lab1 (`string`) label hint for df1.
#' @param lab2 (`string`) label hint for df2.
assert_valid_var_pair <- function(df1, df2, var, lab1 = deparse(substitute(df1)), lab2 = deparse(substitute(df2))) {
  checkmate::assert_data_frame(df1)
  checkmate::assert_data_frame(df2)
  checkmate::assert_string(var)
  lvl_x <- lvls(df1[[var]])
  lvl_y <- lvls(df2[[var]])
  if (!identical(lvl_x, lvl_y)) {
    abort(
      quote_str(lab1), " and ",
      quote_str(lab2), " should contain the same levels in variable ",
      quote_str(var), "!"
    )
  }
}

#' Abort without call information
#' @param ... Pass to `stop`
#' @export
abort <- function(...) {
  stop(..., call. = FALSE)
}
