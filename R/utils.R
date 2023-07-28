# as we use NSE
globalVariables(c(".", ":="))

#' Retrieve labels for certain variables
#'
#' @param df (`data.frame`) containing columns with label attribute.
#' @param vars (`character`) variable names in `df`.
#'
#' @details
#' The labels will be returned if the column has `label` attribute, otherwise the column name will be returned.
#' Any values between brackets {} will be replaced with `dunlin::render_safe`.
#' @export
var_labels_for <- function(df, vars) {
  assert_names(colnames(df), must.include = vars, what = "colnames")
  render_safe(unname(formatters::var_labels(df, fill = TRUE)[vars]))
}

#' Prune Table up to an `ElementaryTable`
#'
#' Avoid returning `NULL` when the `table` is empty.
#'
#' @param tlg (`TableTree`) object.
#'
#' @return pruned `TableTree`.
#'
smart_prune <- function(tlg) {
  res <- prune_table(tlg)

  if (is.null(res)) {
    res <- build_table(rtables::basic_table(), df = data.frame())
    col_info(res) <- col_info(tlg)
  }

  res
}


#' Standard Post processing
#'
#' @param tlg (`TableTree`) object.
#' @param ind (`integer`) the indentation of the table.
#' @param ... not used at the moment.
#'
#' @note Standard post processing includes:
#' * `NULL` report creation if necessary
#' * indentation
#'
#' @return a post-processed `tlg`.
#'
#' @keywords internal
#'
std_postprocess <- function(tlg, ind = 2L, ...) {
  assert_int(ind, lower = 0L)

  res <- report_null(tlg)
  table_inset(res) <- ind

  res
}

# Special formats ----

#' Decimal Formatting
#'
#' @param digits (`integer`) number of digits.
#' @param format (`string`) describing how the numbers should be formatted following the `sprintf` syntax.
#' @param ne (`flag`) indicator whether to use "NE" to replace the actual value.
#'
#' @return `function` formatting numbers with the defined format.
#'
#' @export
#'
#' @examples
#' fun <- h_format_dec(c(1, 1), "%s - %s")
#' fun(c(123, 567.89))
#'
h_format_dec <- function(digits, format, ne = FALSE) {
  assert_integerish(digits, lower = 0)
  assert_string(format)
  if (any(is.na(digits))) {
    function(x, ...) {
      ""
    }
  } else {
    if (ne) {
      ret <- function(x, ...) {
        do_call(sprintf, c(list(fmt = format), rep("NE", length(digits))))
      }
      return(ret)
    }
    digit_string <- paste0("%", ifelse(is.na(digits), "", paste0(".", digits)), "f")
    new_format <- do_call(sprintf, c(list(fmt = format), digit_string))
    formatters::sprintf_format(new_format)
  }
}

#' Fuse list elements
#'
#' @param x (`list`) to fuse.
#' @param y (`list`) to fuse. Elements with names already existing in `x` are discarded.
#'
#' @keywords internal
#'
fuse_sequentially <- function(x, y) {
  if (missing(y)) {
    return(x)
  }

  names_x <- names(x)
  sel_names_y <- setdiff(names(y), names_x)

  c(x, y[sel_names_y])
}

#' List of `grob` object
#' @param ... (`grob`) objects
#' @export
grob_list <- function(...) {
  ret <- list(...)
  assert_list(ret, types = c("grob"))
  structure(
    ret,
    class = c("grob_list", "list")
  )
}

#' List of `gg` object
#' @param ... (`ggplot`) objects
#' @export
gg_list <- function(...) {
  ret <- list(...)
  assert_list(ret, types = c("ggplot"))
  structure(
    ret,
    class = c("gg_list", "list")
  )
}

#' @export
droplevels.character <- function(x, ...) {
  x
}

#' Obtain levels from vector
#' @param x (`character`) or (`factor`) object to obtain levels.
#' @details
#' For factors, the levels will be returned. For characters, the sorted unique values will be returned.
#' @export
lvls <- function(x) {
  UseMethod("lvls")
}
#' @export
lvls.default <- function(x) {
  NULL
}
#' @export
lvls.character <- function(x) {
  sort(unique(x))
}
#' @export
lvls.factor <- function(x) {
  levels(x)
}

#' @keywords internal
quote_str <- function(x) {
  assert_string(x)
  paste0("`", x, "`")
}

#' @keywords internal
modify_default_args <- function(fun, ...) {
  ret <- fun
  formals(ret) <- utils::modifyList(formals(fun), list(...), keep.null = TRUE)
  return(ret)
}

#' Execute function with given arguments
#' @details If the function has `...`, this function will not pass other arguments to `...`.
#' Only named arguments are passed.
#' @keywords internal
execute_with_args <- function(fun, ...) {
  args <- list(...)
  do_call(fun, args[intersect(names(args), formalArgs(fun))])
}

#' Execute a Function Call
#' @keywords internal
do_call <- function(what, args) {
  arg_names <- names(args)
  if (is.null(arg_names)) {
    arg_names <- sprintf("var_%s", seq_along(args))
  } else if (any(arg_names == "")) {
    arg_names_random <- sprintf("var_%s", seq_along(args))
    arg_names[arg_names == ""] <- arg_names_random[arg_names == ""]
  }
  args_env <- as.environment(setNames(args, arg_names))
  parent.env(args_env) <- parent.frame()
  new_args <- lapply(arg_names, as.symbol)
  names(new_args) <- names(args)
  do.call(what, new_args, envir = args_env)
}

#' Modify character
#' @keywords internal
modify_character <- function(x, y) {
  assert_character(x, names = "unique", null.ok = TRUE)
  assert_character(y, names = "unique", null.ok = TRUE)
  c(y, x)[unique(c(names(y), names(x)))]
}
