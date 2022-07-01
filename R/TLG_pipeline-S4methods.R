#' @include TLG_pipeline-S4class.R

# run ----

#' run
#'
#' Run the pipeline including checks, pre processing and `tlg` generation on the provided data set.
#'
#' @inheritParams gen_args
#' @param object (`tlg_pipeline_s4`) input.
#' @param ... extra arguments to pass to the check, pre processing or `tlg` functions.
#'
#' @aliases run
#' @export
setGeneric("run", function(object, adam_db, ...) standardGeneric("run"))

#' run
#'
#' @rdname run
#' @export
setMethod(
  f = "run",
  signature = "tlg_pipeline_s4",
  definition = function(object, adam_db, ...) {
    data <- list(adam_db = adam_db)
    optional_arg <- if (!missing(...)) list(...) else NULL

    proc_data <- list(adam_db = do.call(object@preprocess, c(data, optional_arg)))
    res <- do.call(object@main, c(proc_data, optional_arg))

    res_data <- list(tlg = res)
    do.call(object@postprocess, c(res_data, optional_arg))
  }
)

# get_main ----

#' Retrieve Main Function
#'
#' @param object (`tlg_pipeline_s4`) input.
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
  signature = "tlg_pipeline_s4",
  definition = function(object) {
    object@main
  }
)

# get_preprocess ----

#' Retrieve Pre Processing Function
#'
#' @param object (`tlg_pipeline_s4`) input.
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
  signature = "tlg_pipeline_s4",
  definition = function(object) {
    object@preprocess
  }
)

# get_postprocess ----

#' Retrieve Post Processing Function
#'
#' @param object (`tlg_pipeline_s4`) input.
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
  signature = "tlg_pipeline_s4",
  definition = function(object) {
    object@postprocess
  }
)

# get_datasets ----

#' Retrieve Names of Data Sets Associated with the Pipeline
#'
#' @param object (`tlg_pipeline_s4`) input.
#' @param ... not used.
#'
#' @aliases get_datasets
#' @export
setGeneric("get_datasets", function(object, ...) standardGeneric("get_datasets"))

#' get_datasets
#'
#' @rdname get_datasets
#' @export
setMethod(
  f = "get_datasets",
  signature = "tlg_pipeline_s4",
  definition = function(object) {
    object@adam_datasets
  }
)
