#' @include chevron_tlg-S4class.R
#' @include chevron_tlg-S4methods.R

# run ----

#' Run the pipeline
#' @rdname run
#' @export
#' @examples
#' run(aet01_1, syn_test_data())
setMethod(
  f = "run",
  signature = "chevron_t",
  definition = function(object, adam_db, ...) {
    checkmate::assert_class(adam_db, "dm")

    optional_arg <- list(...)

    proc_data <- list(adam_db = do.call(object@preprocess, c(list(adam_db), optional_arg)))
    res_tlg <- list(tlg = do.call(object@main, c(proc_data, list(object@lyt), optional_arg)))

    do.call(object@postprocess, c(res_tlg, optional_arg))
  }
)

# lyt ----

#' Layout
#'
#' retrieve or set `lyt` function.
#'
#' @param x (`chevron_t`) input.
#'
#' @name lyt
#' @export
setGeneric("lyt", function(x) standardGeneric("lyt"))

#' @rdname lyt
#' @export
setMethod(
  f = "lyt",
  signature = "chevron_t",
  definition = function(x) {
    x@lyt
  }
)

#' Set Layout Function
#'
#' @param x (`chevron_t`) input.
#' @param value (`function`, `list of functions`, `PreDataTableLayouts` or `list of PreDataTableLayouts`) typically one
#'   of the `_lyt` function of `chevron`. If a `function` or a `list of functions` is provided, they must have the `...`
#'   formal argument.
#'
#' @rdname lyt
#' @export
setGeneric("lyt<-", function(x, value) standardGeneric("lyt<-"))

#' @rdname lyt
#' @export
setMethod(
  f = "lyt<-",
  signature = "chevron_t",
  definition = function(x, value) {
    lyt_proc <- make_lyt_ls(value)
    x@lyt <- lyt_proc
    validObject(x)
    x
  }
)
