#' @include TLG_pipeline-S4class.R

# run ----

#' run
#'
#' Run the pipeline including checks, pre processing and `tlg` generation on the provided data set.
#'
#' @inheritParams gen_args
#' @param object (`chevron_tlg`) input.
#' @param ... extra arguments to pass to the check, pre processing or `tlg` functions.
#'
#' @aliases run
#' @export
setGeneric("run", function(object, adam_db, ...) standardGeneric("run"))

#' run
#'
#' @rdname run
#' @export
#' @examples
#' run(aet01_1, syn_test_data())
#'
setMethod(
  f = "run",
  signature = "chevron_tlg",
  definition = function(object, adam_db, ...) {
    checkmate::assert_class(adam_db, "dm")

    optional_arg <- if (!missing(...)) list(...) else NULL

    proc_data <- list(adam_db = do.call(object@preprocess, c(list(adam_db), optional_arg)))
    res_tlg <- list(tlg = do.call(object@main, c(proc_data, optional_arg)))

    do.call(object@postprocess, c(res_tlg, optional_arg))
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

#' get_main
#'
#' @rdname get_main
#' @export
setMethod(
  f = "get_main",
  signature = "chevron_tlg",
  definition = function(object) {
    object@main
  }
)

# get_preprocess ----

#' Retrieve Pre Processing Function
#'
#' @param object (`chevron_tlg`) input.
#' @param ... not used.
#'
#' @aliases get_preprocess
#' @export
setGeneric("get_preprocess", function(object, ...) standardGeneric("get_preprocess"))

#' get_preprocess
#'
#' @rdname get_preprocess
#' @export
setMethod(
  f = "get_preprocess",
  signature = "chevron_tlg",
  definition = function(object) {
    object@preprocess
  }
)

# get_postprocess ----

#' Retrieve Post Processing Function
#'
#' @param object (`chevron_tlg`) input.
#' @param ... not used.
#'
#' @aliases get_postprocess
#' @export
setGeneric("get_postprocess", function(object, ...) standardGeneric("get_postprocess"))

#' get_postprocess
#'
#' @rdname get_postprocess
#' @export
setMethod(
  f = "get_postprocess",
  signature = "chevron_tlg",
  definition = function(object) {
    object@postprocess
  }
)

# get_adam_datasets ----

#' Retrieve Names of Data Sets Associated with the Pipeline
#'
#' @param object (`chevron_tlg`) input.
#' @param ... not used.
#'
#' @export
#' @aliases get_adam_datasets
setGeneric("get_adam_datasets", function(object, ...) standardGeneric("get_adam_datasets"))

#' get_adam_datasets
#'
#' @rdname get_adam_datasets
#' @export
setMethod(
  f = "get_adam_datasets",
  signature = "chevron_tlg",
  definition = function(object) {
    object@adam_datasets
  }
)
