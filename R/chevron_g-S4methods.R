#' @include chevron_tlg-S4class.R
#' @include chevron_tlg-S4methods.R

# run ----

#' Run the pipeline
#' @rdname run
#' @export
#' @examples
#' run(mng01_1, syn_test_data(), dataset = "adlb")
setMethod(
  f = "run",
  signature = "chevron_g",
  definition = function(object, adam_db, ...) {
    checkmate::assert_class(adam_db, "dm")

    optional_arg <- if (!missing(...)) list(...) else NULL

    proc_data <- list(adam_db = do.call(object@preprocess, c(list(adam_db), optional_arg)))
    res_tlg <- list(tlg = do.call(object@main, c(proc_data, list(object@graph), optional_arg)))

    do.call(object@postprocess, c(res_tlg, optional_arg))
  }
)

# graph ----

#' Graph
#'
#' retrieve or set `graph` function.
#'
#' @param x (`chevron_g`) input.
#'
#' @aliases graph
#' @export
setGeneric("graph", function(x) standardGeneric("graph"))

#' @rdname graph
#' @export
setMethod(
  f = "graph",
  signature = "chevron_tlg",
  definition = function(x) {
    x@graph
  }
)

#' Set Graph Function
#'
#' @param x (`chevron_g`) input.
#' @param value (`function`) returning a `ggplot`. Typically one of the `_plot` function of `chevron`.
#'
#' @rdname graph
#' @export
setGeneric("graph<-", function(x, value) standardGeneric("graph<-"))

#' @rdname graph
#' @export
setMethod(
  f = "graph<-",
  signature = "chevron_g",
  definition = function(x, value) {
    x@main <- value
    validObject(x)
    x
  }
)
