#' @include chevron_tlg-S4class.R

# run ----

#' Run the pipeline
#'
#' Execute the pre-processing, main and post-processing functions in a single run.
#'
#' @inheritParams gen_args
#' @param object (`chevron_tlg`) input.
#' @param ... extra arguments to pass to the check, pre-processing or `tlg` functions.
#'
#' @name run
#' @export
setGeneric("run", function(object, adam_db, ...) standardGeneric("run"))

#' Run the pipeline
#' @rdname run
#' @export
#' @examples
#' run(aet01_1, syn_test_data())
setMethod(
  f = "run",
  signature = "chevron_tlg",
  definition = function(object, adam_db, ...) {
    checkmate::assert_class(adam_db, "dm")

    optional_arg <- if (!missing(...)) list(...) else NULL

    proc_data <- list(adam_db = do.call(object@preprocess, c(list(adam_db), optional_arg)))
    res_tlg <- list(tlg = do.call(object@main, c(proc_data, list(object@lyt), optional_arg)))

    do.call(object@postprocess, c(res_tlg, optional_arg))
  }
)

# main ----

#' Main
#'
#' retrieve or set `main` function.
#'
#' @param x (`chevron_tlg`) input.
#'
#' @aliases main
#' @export
setGeneric("main", function(x) standardGeneric("main"))

#' @rdname main
#' @export
setMethod(
  f = "main",
  signature = "chevron_tlg",
  definition = function(x) {
    x@main
  }
)

#' Set Main Function
#'
#' @param x (`chevron_tlg`) input.
#' @param value (`function`) returning a `tlg`. Typically one of the `_main` function of `chevron`.
#'
#' @rdname main
#' @export
setGeneric("main<-", function(x, value) standardGeneric("main<-"))

#' @rdname main
#' @export
setMethod(
  f = "main<-",
  signature = "chevron_tlg",
  definition = function(x, value) {
    x@main <- value
    validObject(x)
    x
  }
)

# lyt ----

#' Layout
#'
#' retrieve or set `lyt` function.
#'
#' @param x (`chevron_tlg`) input.
#'
#' @name lyt
#' @export
setGeneric("lyt", function(x) standardGeneric("lyt"))

#' @rdname lyt
#' @export
setMethod(
  f = "lyt",
  signature = "chevron_tlg",
  definition = function(x) {
    x@lyt
  }
)

#' Set Layout Function
#'
#' @param x (`chevron_tlg`) input.
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
  signature = "chevron_tlg",
  definition = function(x, value) {
    lyt_proc <- make_lyt_ls(value)
    x@lyt <- lyt_proc
    validObject(x)
    x
  }
)

# preprocess ----

#' Preprocess
#'
#' retrieve or set `preprocess` function.
#'
#' @param x (`chevron_tlg`) input.
#'
#' @aliases preprocess
#' @export
setGeneric("preprocess", function(x) standardGeneric("preprocess"))

#' @rdname preprocess
#' @export
setMethod(
  f = "preprocess",
  signature = "chevron_tlg",
  definition = function(x) {
    x@preprocess
  }
)

#' Set Preprocess Function
#'
#' @param x (`chevron_tlg`) input.
#' @param value  (`function`) returning a pre-processed `dm` object amenable to `tlg` creation. Typically one of the
#'   `_pre` function of `chevron`.
#'
#' @rdname preprocess
#' @export
setGeneric("preprocess<-", function(x, value) standardGeneric("preprocess<-"))

#' @rdname preprocess
#' @export
setMethod(
  f = "preprocess<-",
  signature = "chevron_tlg",
  definition = function(x, value) {
    x@preprocess <- value
    validObject(x)
    x
  }
)

# postprocess ----

#' Postprocess
#'
#' retrieve or set `postprocess` function.
#'
#' @param x (`chevron_tlg`) input.
#'
#' @aliases postprocess
#' @export
setGeneric("postprocess", function(x) standardGeneric("postprocess"))

#' @rdname postprocess
#' @export
setMethod(
  f = "postprocess",
  signature = "chevron_tlg",
  definition = function(x) {
    x@postprocess
  }
)

#' Postprocess Assignment Function
#'
#' @param x (`chevron_tlg`) input.
#' @param value (`function`) returning a post-processed `tlg`.
#'
#' @rdname postprocess
#' @export
setGeneric("postprocess<-", function(x, value) standardGeneric("postprocess<-"))

#' @rdname postprocess
#' @export
setMethod(
  f = "postprocess<-",
  signature = "chevron_tlg",
  definition = function(x, value) {
    x@postprocess <- value
    validObject(x)
    x
  }
)

# datasets ----

#' `Datasets`
#'
#' retrieve or set `adam_dataset`.
#'
#' @param x (`chevron_tlg`) input.
#'
#' @aliases datasets
#' @export
setGeneric("datasets", function(x) standardGeneric("datasets"))

#' @rdname datasets
#' @export
setMethod(
  f = "datasets",
  signature = "chevron_tlg",
  definition = function(x) {
    x@adam_datasets
  }
)

#' Set Data Sets
#'
#' @param x (`chevron_tlg`) input.
#' @param value (`character`) representing the name of the table from an `ADaM` dataset required for `tlg` creation.
#'
#' @rdname datasets
#' @export
setGeneric("datasets<-", function(x, value) standardGeneric("datasets<-"))

#' @rdname datasets
#' @export
setMethod(
  f = "datasets<-",
  signature = "chevron_tlg",
  definition = function(x, value) {
    x@adam_datasets <- value
    validObject(x)
    x
  }
)

# get_main ----

#' Retrieve Main Function
#'
#' @param object (`chevron_tlg`) input.
#'
#' @aliases get_main
#' @export
setGeneric("get_main", function(object) standardGeneric("get_main"))

#' @rdname get_main
#' @export
setMethod(
  f = "get_main",
  signature = "chevron_tlg",
  definition = function(object) {
    .Deprecated("main()", old = "get_main()")
    object@main
  }
)

# get_preprocess ----

#' Retrieve pre-processing Function
#'
#' @param object (`chevron_tlg`) input.
#'
#' @aliases get_preprocess
#' @export
setGeneric("get_preprocess", function(object) standardGeneric("get_preprocess"))

#' @rdname get_preprocess
#' @export
setMethod(
  f = "get_preprocess",
  signature = "chevron_tlg",
  definition = function(object) {
    .Deprecated("preprocess()", old = "get_preprocess()")
    object@preprocess
  }
)

# get_postprocess ----

#' Retrieve post-processing Function
#'
#' @param object (`chevron_tlg`) input.
#'
#' @aliases get_postprocess
#' @export
setGeneric("get_postprocess", function(object) standardGeneric("get_postprocess"))

#' @rdname get_postprocess
#' @export
setMethod(
  f = "get_postprocess",
  signature = "chevron_tlg",
  definition = function(object) {
    .Deprecated("postprocess()", old = "get_postprocess()")
    object@postprocess
  }
)

# get_adam_datasets ----

#' Retrieve names of datasets associated with the object
#'
#' @param object (`chevron_tlg`) input.
#'
#' @export
#' @aliases get_adam_datasets
setGeneric("get_adam_datasets", function(object) standardGeneric("get_adam_datasets"))

#' @rdname get_adam_datasets
#' @export
setMethod(
  f = "get_adam_datasets",
  signature = "chevron_tlg",
  definition = function(object) {
    .Deprecated("datasets()", old = "get_adam_datasets()")
    object@adam_datasets
  }
)
