
#' `tlg_pipeline_s4` Class
#'
#' The `tlg_pipeline_s4` class associates a `preprocess` function, a main `tlg` function and `AdAM` tables names and
#' optionally a `postprocess` function.
#'
#' @slot main (`function`) returning a `tlg`. Typically one of the `_main` function of `chevron`.
#' @slot preprocess (`function`) returning a pre processed `dm` object amenable to `tlg` creation. Typically one of the
#'   `_pre` function of `chevron`.
#' @slot postprocess (`function`) returning a post processed `tlg`.
#' @slot adam_datasets (`character`) representing the name of the table from an `AdAM` data set required for `tlg`
#'   creation.
#'
#' @note To ensure the correct execution of the pipeline workflow additional validation criteria are:
#' * the first argument of the `main` function must be `adam_db`, the input `dm` object to preprocess.
#' * the first argument of the `preprocess` function must be `adam_db`, the input `dm` object to create `tlg` output.
#' * the first argument of the `postprocess` function must be `tlg`, the input `TableTree` object to post process.
#'
#' @aliases tlg_pipeline_s4
#' @exportClass tlg_pipeline_s4
.tlg_pipeline_s4 <- setClass(
  "tlg_pipeline_s4",
  slots = c(
    main = "function",
    preprocess = "function",
    postprocess = "function",
    adam_datasets = "character"
  )
)

# Validation ----

check_first_args <- function(fun, first_arg) {
  actual <- names(formals(fun))[1]

  if (actual == first_arg) {
    NULL
  } else {
    paste0(
      deparse(substitute(fun)),
      " expects `",
      first_arg,
      "` as first argument name but found `",
      actual,
      "`"
    )
  }
}

S4Vectors::setValidity2("tlg_pipeline_s4", function(object) {
  msg <- NULL
  msg <- c(msg, check_first_args(object@main, "adam_db"))
  msg <- c(msg, check_first_args(object@preprocess, "adam_db"))
  msg <- c(msg, check_first_args(object@postprocess, "tlg"))

  if (is.null(msg)) TRUE else msg
})

# Constructor ----

#' `tlg_pipeline_s4` constructor
#'
#' @rdname tlg_pipeline_s4-class
#'
#' @param main (`function`) returning a `tlg`. Typically one of the `_main` function of `chevron`.
#' @param preprocess (`function`) returning a pre processed `dm` object amenable to `tlg` creation. Typically one of the
#'   `_pre` function of `chevron`.
#' @param postprocess (`function`) returning a post processed `tlg`.
#' @param adam_datasets (`character`) representing the name of the table from an `AdAM` data set required for `tlg`
#'   creation.
#'
#' @export
#' @examples
#' x <- tlg_pipeline_s4(aet01_1_main, aet01_1_pre, adam_datasets = c("adsl", "adae"))
tlg_pipeline_s4 <- function(main = function(adam_db, ...) adam_db,
                            preprocess = function(adam_db, ...) adam_db,
                            postprocess = function(tlg, ...) tlg,
                            adam_datasets = NA_character_) {
  res <- .tlg_pipeline_s4(
    main = main,
    preprocess = preprocess,
    postprocess = postprocess,
    adam_datasets = adam_datasets
  )

  validObject(res)
  res
}
