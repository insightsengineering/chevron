#' @include utils.R

# Chevron_tlg ----

#' `chevron_tlg` class
#'
#' The `chevron_tlg` class associates a `preprocess` function, a main `tlg` function and `AdAM` tables names and
#' optionally a `postprocess` function.
#'
#' @slot main (`function`) returning a `tlg`. Typically one of the `*_main` function from `chevron`.
#' @slot preprocess (`function`) returning a pre-processed `dm` object amenable to `tlg` creation. Typically one of the
#'   `*_pre` function from `chevron`.
#' @slot postprocess (`function`) returning a post-processed `tlg`.
#' @slot adam_datasets (`character`) representing the name of the tables from an `AdAM` dataset required for `tlg`
#'   creation.
#'
#' @format NULL
#'
#' @note To ensure the correct execution of the workflow additional validation criteria are:
#' * the first argument of the `main` function must be `adam_db`, the input `dm` object to pre-process. The `...`
#' argument is not allowed.
#' * the first argument of the `preprocess` function must be `adam_db`, the input `dm` object to create `tlg` output.
#' The `...` argument is not allowed.
#' * the first argument of the `postprocess` function must be `tlg`, the input `TableTree` object to post-process. The
#' `...` argument is not allowed.
#'
#' @name chevron_tlg-class
#' @exportClass chevron_tlg
.chevron_tlg <- setClass(
  "chevron_tlg",
  contains = "VIRTUAL",
  slots = c(
    main = "function",
    preprocess = "function",
    postprocess = "function",
    adam_datasets = "character"
  )
)

# Validation ----

methods::setValidity("chevron_tlg", function(object) {
  coll <- checkmate::makeAssertCollection()
  checkmate::assert_function(object@main, args = c("adam_db"), ordered = TRUE, add = coll)
  checkmate::assert_disjunct(rlang::fn_fmls_names(object@main), "...", add = coll)
  checkmate::assert_function(object@preprocess, args = c("adam_db"), ordered = TRUE, add = coll)
  checkmate::assert_disjunct(rlang::fn_fmls_names(object@preprocess), "...", add = coll)
  checkmate::assert_function(object@postprocess, args = c("tlg"), ordered = TRUE, add = coll)
  checkmate::assert_disjunct(rlang::fn_fmls_names(object@postprocess), "...", add = coll)
  checkmate::reportAssertions(coll)
})

# Subclasses ----

## chevron_t ----

#' `chevron_t`
#'
#' `chevron_t`, a subclass of [chevron::chevron_tlg-class] with specific validation criteria to handle table creation
#'
#' @aliases chevron_table
#' @rdname chevron_tlg-class
#' @exportClass chevron_t
.chevron_t <- setClass(
  "chevron_t",
  contains = "chevron_tlg"
)

methods::setValidity("chevron_t", function(object) {
  coll <- checkmate::makeAssertCollection()
  checkmate::assert_function(object@main, args = c("adam_db"), ordered = TRUE, add = coll)
  checkmate::reportAssertions(coll)
})

## chevron_l ----

#' `chevron_l`
#'
#' `chevron_l`, a subclass of [chevron::chevron_tlg-class] with specific validation criteria to handle listing creation
#'
#' @aliases chevron_listing
#' @rdname chevron_tlg-class
#' @exportClass chevron_l
.chevron_l <- setClass(
  "chevron_l",
  contains = "chevron_tlg"
)

methods::setValidity("chevron_l", function(object) {
  coll <- checkmate::makeAssertCollection()
  checkmate::assert_function(object@main, args = c("adam_db"), ordered = TRUE, add = coll)
  checkmate::reportAssertions(coll)
})

## chevron_g ----

#' `chevron_g`
#'
#' `chevron_g`, a subclass of [chevron::chevron_tlg-class] with specific validation criteria to handle graph creation
#'
#' @aliases chevron_graph
#' @rdname chevron_tlg-class
#' @exportClass chevron_g
.chevron_g <- setClass(
  "chevron_g",
  contains = "chevron_tlg"
)

methods::setValidity("chevron_g", function(object) {
  coll <- checkmate::makeAssertCollection()
  checkmate::assert_function(object@main, args = c("adam_db"), ordered = TRUE, add = coll)
  checkmate::reportAssertions(coll)
})


# Sub Constructor ----

#' `chevron_t` constructor
#'
#' @rdname chevron_tlg-class
#'
#' @inheritParams gen_args
#' @param ... not used
#'
#' @export
#'
#' @examples
#' chevron_t_obj <- chevron_t()
#' chevron_t_obj <- chevron_t(postprocess = function(tlg, indent) {
#'   rtables::table_inset(tlg) <- indent
#'   tlg
#' })
#'
chevron_t <- function(main = function(adam_db) build_table(basic_table(), adam_db[[1]]),
                      preprocess = function(adam_db) adam_db,
                      postprocess = report_null,
                      adam_datasets = NA_character_,
                      ...) {
  res <- .chevron_t(
    main = main,
    preprocess = preprocess,
    postprocess = postprocess,
    adam_datasets = adam_datasets
  )

  res
}

#' `chevron_l` constructor
#'
#' @rdname chevron_tlg-class
#'
#' @inheritParams gen_args
#' @param ... not used
#'
#' @export
#'
#' @examples
#' chevron_l_obj <- chevron_l()
#'
chevron_l <- function(main = function(adam_db) data.frame(),
                      preprocess = function(adam_db) adam_db,
                      postprocess = function(tlg) tlg,
                      adam_datasets = NA_character_,
                      ...) {
  res <- .chevron_l(
    main = main,
    preprocess = preprocess,
    postprocess = postprocess,
    adam_datasets = adam_datasets
  )

  res
}

#' `chevron_g` constructor
#'
#' @rdname chevron_tlg-class
#' @param ... not used
#'
#' @inheritParams gen_args
#'
#' @export
#'
#' @examples
#' chevron_g_obj <- chevron_g()
#' chevron_g_obj <- chevron_g(
#'   postprocess = function(tlg, title) tlg + ggplot2::labs(main = title)
#' )
#'
chevron_g <- function(main = function(adam_db) ggplot2::ggplot(),
                      preprocess = function(adam_db) adam_db,
                      postprocess = function(tlg) tlg,
                      adam_datasets = NA_character_,
                      ...) {
  res <- .chevron_g(
    main = main,
    preprocess = preprocess,
    postprocess = postprocess,
    adam_datasets = adam_datasets
  )

  res
}
