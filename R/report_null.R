#' Creates `NULL` Report
#'
#' @param tlg to convert to null report.
#' @param ind (`integer`) indentation for the outputs of class `VTableTree`.
#' @param ... not used.
#'
#' @rdname report_null
#' @name report_null
#'
#' @returns the `tlg` object or a `NULL` report if the `tlg` is `NULL`, is a `TableTree` with 0 rows, is a `listing_df`
#'   with 0 rows or is a `list` with 0 elements.
#'
#' @export
#' @examples
#' report_null(NULL)
setGeneric("report_null", function(tlg, ...) {
  standardGeneric("report_null")
})

#' @rdname report_null
setMethod("report_null", "NULL", function(tlg, ind = 2L, ...) {
  res <- null_report
  table_inset(res) <- ind
  res
})

#' @rdname report_null
setMethod("report_null", "VTableTree", function(tlg, ind = 2L, ...) {
  res <- if (nrow(tlg) == 0L || count_children(tlg) == 0) {
    null_report
  } else {
    tlg
  }

  table_inset(res) <- ind
  res
})

#' @rdname report_null
setMethod("report_null", "listing_df", function(tlg, ind = 2L, ...) {
  if (nrow(tlg) == 0L) {
    res <- null_report
    table_inset(res) <- ind
    res
  } else {
    tlg
  }
})

#' @rdname report_null
setMethod("report_null", "list", function(tlg, ind = 2L, ...) {
  if (length(tlg) == 0) {
    res <- null_report
    table_inset(res) <- ind
    res
  } else {
    tlg
  }
})

#' @rdname report_null
setMethod("report_null", "ANY", function(tlg, ...) {
  tlg
})

#' @export
#' @rdname report_null
null_report <- rtables::rtable(
  header = "",
  rrow("", "Null Report: No observations met the reporting criteria for inclusion in this output."),
  inset = 2L
)

#' Standard Post Processing
#'
#' @param tlg to post process.
#' @param ... additional arguments passed to [report_null].
#'
#' @returns a processed `tlg` or a null report.
#' @export
#' @examples
#' library(rtables)
#' std_postprocessing(build_table(basic_table() |> analyze("Species"), iris), ind = 10L)
#'
std_postprocessing <- function(tlg, ...) {
  tlg <- report_null(tlg, ...)
  tlg
}
