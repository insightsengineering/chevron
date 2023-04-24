# as we use NSE
globalVariables(c(".", ":="))

#' Retrieve labels for certain variables
#'
#' @param df data frame
#' @param vars variable names in `df`
#'
#' @export
var_labels_for <- function(df, vars) {
  assert_colnames(df, vars)
  unname(formatters::var_labels(df, fill = TRUE)[vars])
}


#' Standard documentation lookup
#'
#' @param id standard id of output
#' @param ... not used at the moment
#'
#' @export
std_deco <- function(id, ...) {
  list(
    title = "",
    subtitles = "",
    main_footer = ""
  )
}

basic_table_deco <- function(deco, ...) {
  checkmate::assert_set_equal(names(deco), c("title", "subtitles", "main_footer"))

  basic_table(title = deco$title, subtitles = deco$subtitles, main_footer = deco$main_footer, ...)
}

has_overall_col <- function(lbl_overall) {
  !is.null(lbl_overall) && !identical(lbl_overall, "")
}

ifneeded_add_overall_col <- function(lyt, lbl_overall) {
  if (has_overall_col(lbl_overall)) {
    add_overall_col(lyt, label = lbl_overall)
  } else {
    lyt
  }
}

#' Get Data from a DB
#'
#' @param db (named `list`) to extract elements form.
#' @param ... not used.
#'
#' @return named list of data sets.
#'
#' @examples
#' \dontrun{
#' get_db_data(list(iris = iris, mtcars = mtcars, CO2 = CO2))
#' get_db_data(list(iris = iris, mtcars = mtcars, CO2 = CO2), "iris")
#' get_db_data(list(iris = iris, mtcars = mtcars, CO2 = CO2), "iris", "CO2")
#' }
get_db_data <- function(db, ...) {
  checkmate::assert_list(db, types = "data.frame")
  datasets <- c(...)

  if (length(datasets) == 0) {
    return(list())
  }

  checkmate::assert_subset(datasets, names(db))

  db[datasets]
}

#' Temporary function to add decorator to a table
#'
#' @param x (`rtables`) object.
#' @param deco (`list`) typically generated with `std_deco()`.
#'
#' @keywords internal
#'
#' @return `rtables` with set title, subtitle and footnotes. If one of this attribute is NULL, the slot is empty.
set_decoration <- function(x, deco) {
  checkmate::assert_multi_class(x, c("TableTree", "ElementaryTable"))
  checkmate::assert_list(deco, types = "character", max.len = 3, names = "unique")
  checkmate::assert_subset(names(deco), c("title", "subtitles", "main_footer"))

  x@main_title <- deco$title
  x@subtitles <- deco$subtitles
  x@main_footer <- deco$main_footer
  x
}

#' Create a Null Report
#' @rdname report_null
#' @aliases null_report
#' @param tlg (`TableTree`) object.
#' @param ... not used. Important to be used directly as post processing function.
#'
#' @export
#'
#' @return original `TableTree` or a null report if no observation are found in the table.
#'
report_null <- function(tlg, ...) {
  checkmate::assert_true(is.null(tlg) || rtables::is_rtable(tlg))

  if (is.null(tlg) || nrow(tlg) == 0L) {
    null_report
  } else {
    tlg
  }
}

#' @export
#' @rdname report_null
null_report <- rtables::rtable(
  header = "",
  rrow("Null Report: No observations met the reporting criteria for inclusion in this output.")
)

#' @export
#' @rdname report_null
null_listing <- rlistings::as_listing(
  df = data.frame(x = formatters::with_label(
    "Null Report: No observations met the reporting criteria for inclusion in this output.", ""
  ))
)

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

#' Get Labels
#'
#' @param df (`data.frame`).
#' @param x (`character`) the names of column in the `df` data frame.
#'
#' @return the name of each element in the `x` vector where missing names are replaced with the value of the label
#'   attribute for the corresponding column in the `df` data frame.
#'
#' @keywords internal
#'
get_labels <- function(df, x) {
  checkmate::assert_character(x)
  assert_colnames(df, x)

  labels <- var_labels_for(df, x)

  all_names <- names(x)

  if (is.null(all_names)) {
    labels
  } else {
    if_else(all_names == "", labels, all_names)
  }
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
  checkmate::assert_integerish(ind, lower = 0L)

  res <- report_null(tlg)
  table_inset(res) <- ind

  res
}

# Special formats ----

#' Decimal Formatting
#'
#' @param digits (`integer`) number of digits.
#' @param format (`string`) describing how the numbers should be formatted following the `sprintf` syntax.
#'
#' @return `function` formatting numbers with the defined format or `NULL` if the format is not defined.
#'
#' @export
#'
#' @examples
#' fun <- h_format_dec(1, "%f - %f")
#' fun(c(123, 567.89))
#'
h_format_dec <- function(digits = NA, format = NA) {
  checkmate::assert_integerish(digits, lower = 0, len = 1)
  checkmate::assert_string(format, na.ok = TRUE)

  if (is.na(format)) {
    NULL
  } else {
    function(x, ...) {
      checkmate::assert_numeric(x)

      digit_string <- ifelse(is.na(digits), "", paste0(".", digits))
      new_format <- gsub("%([a-z])", paste0("%", digit_string, "\\1"), format)

      formatters::sprintf_format(new_format)(x)
    }
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
  checkmate::assert_list(ret, types = c("grob"))
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
  checkmate::assert_list(ret, types = c("ggplot"))
  structure(
    ret,
    class = c("gg_list", "list")
  )
}

#' @export
droplevels.character <- function(x, ...) {
  x
}