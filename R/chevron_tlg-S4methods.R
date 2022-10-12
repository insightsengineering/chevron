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
#' @aliases run
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

#' Retrieve Main
#'
#' @param x (`chevron_tlg`) input.
#' @param ... not used.
#'
#' @aliases main
#' @name main
#' @export
setGeneric("main", function(x, ...) standardGeneric("main"))

#' @rdname get_main
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
#' @inheritParams chevron_tlg
#' @param x (`chevron_tlg`) input.
#' @param ... not used.
#'
#' @rdname main
#' @export
setGeneric("main<-", function(x, value, ...) standardGeneric("main<-"))

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

#' Retrieve Layout
#'
#' @param x (`chevron_tlg`) input.
#' @param ... not used.
#'
#' @aliases layout
#' @name layout
#' @export
setGeneric("lyt", function(x, ...) standardGeneric("lyt"))

#' @rdname layout
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
#' @inheritParams chevron_tlg
#' @param x (`chevron_tlg`) input.
#' @param ... not used.
#'
#' @rdname layout
#' @export
setGeneric("lyt<-", function(x, value, ...) standardGeneric("lyt<-"))

#' @rdname layout
#' @export
setMethod(
  f = "lyt<-",
  signature = "chevron_tlg",
  definition = function(x, value) {
    lyt_proc <- make_lyt_fun(value)
    x@lyt <- lyt_proc
    validObject(x)
    x
  }
)

# preprocess ----

#' Retrieve Preprocess
#'
#' @param x (`chevron_tlg`) input.
#' @param ... not used.
#'
#' @aliases preprocess
#' @name preprocess
#' @export
setGeneric("preprocess", function(x, ...) standardGeneric("preprocess"))

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
#' @inheritParams chevron_tlg
#' @param x (`chevron_tlg`) input.
#' @param ... not used.
#'
#' @rdname preprocess
#' @export
setGeneric("preprocess<-", function(x, value, ...) standardGeneric("preprocess<-"))

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

#' Retrieve Postprocess
#'
#' @param x (`chevron_tlg`) input.
#' @param ... not used.
#'
#' @aliases postprocess
#' @name postprocess
#' @export
setGeneric("postprocess", function(x, ...) standardGeneric("postprocess"))

#' @rdname postprocess
#' @export
setMethod(
  f = "postprocess",
  signature = "chevron_tlg",
  definition = function(x) {
    x@postprocess
  }
)

#' Set Postprocess Function
#'
#' @inheritParams chevron_tlg
#' @param x (`chevron_tlg`) input.
#' @param ... not used.
#'
#' @rdname postprocess
#' @export
setGeneric("postprocess<-", function(x, value, ...) standardGeneric("postprocess<-"))

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

#' Retrieve Data Sets
#'
#' @param x (`chevron_tlg`) input.
#' @param ... not used.
#'
#' @aliases datasets
#' @name datasets
#' @export
setGeneric("datasets", function(x, ...) standardGeneric("datasets"))

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
#' @inheritParams chevron_tlg
#' @param x (`chevron_tlg`) input.
#' @param ... not used.
#'
#' @rdname datasets
#' @export
setGeneric("datasets<-", function(x, value, ...) standardGeneric("datasets<-"))

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
#' @param ... not used.
#'
#' @aliases get_main
#' @export
setGeneric("get_main", function(object, ...) standardGeneric("get_main"))

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
#' @param ... not used.
#'
#' @aliases get_preprocess
#' @export
setGeneric("get_preprocess", function(object, ...) standardGeneric("get_preprocess"))

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
#' @param ... not used.
#'
#' @aliases get_postprocess
#' @export
setGeneric("get_postprocess", function(object, ...) standardGeneric("get_postprocess"))

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
#' @param ... not used.
#'
#' @export
#' @aliases get_adam_datasets
setGeneric("get_adam_datasets", function(object, ...) standardGeneric("get_adam_datasets"))

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
