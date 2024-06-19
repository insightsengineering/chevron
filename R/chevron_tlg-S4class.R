#' @include utils.R
#' @include report_null.R

# Chevron_tlg ----

#' `chevron_tlg` class
#'
#' The `chevron_tlg` S4 class associates a `preprocess` function, a main `tlg` function and a `postprocess` function.
#'
#' @slot main (`function`) returning a `tlg`. Typically one of the `*_main` function from `chevron`.
#' @slot preprocess (`function`) returning a pre-processed `list` of `data.frames` amenable to `tlg` creation. Typically
#'   one of the `*_pre` function from `chevron`.
#' @slot postprocess (`function`) returning a post-processed `tlg`. Typically one of the `*_post` function from
#'   `chevron`.
#'
#' @format NULL
#'
#' @note To ensure the correct execution of the workflow, additional validation criteria are:
#' * the first argument of the `main` function must be `adam_db`, the input `list` of `data.frames` to pre-process. The
#' `...` argument is mandatory.
#' * the first argument of the `preprocess` function must be `adam_db`, the input `list` of `data.frames` to create
#' `tlg` output. The `...` argument is mandatory.
#' * the first argument of the `postprocess` function must be `tlg`, the input `TableTree` object to post-process. The
#' `...` argument is mandatory.
#'
#' @name chevron_tlg-class
#' @exportClass chevron_tlg
.chevron_tlg <- setClass(
  "chevron_tlg",
  contains = "VIRTUAL",
  slots = c(
    main = "function",
    preprocess = "function",
    postprocess = "function"
  )
)

# Validation ----

methods::setValidity("chevron_tlg", function(object) {
  coll <- makeAssertCollection()
  assert_function(object@main, args = c("adam_db"), ordered = TRUE, add = coll)
  assert_function(object@main, args = "...", add = coll)
  assert_function(object@preprocess, args = c("adam_db"), ordered = TRUE, add = coll)
  assert_function(object@preprocess, args = "...", add = coll)
  assert_function(object@postprocess, args = c("tlg"), ordered = TRUE, add = coll)
  assert_function(object@postprocess, args = "...", add = coll)
  reportAssertions(coll)
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

## chevron_simple ----

#' `chevron_simple`
#'
#' `chevron_simple`, a subclass of [chevron::chevron_tlg-class], where main function is a simple call
#'
#' @aliases chevron_simple
#' @rdname chevron_tlg-class
#' @exportClass chevron_simple
.chevron_simple <- setClass(
  "chevron_simple",
  contains = "chevron_tlg"
)


# Validity of class `chevron_simple`
methods::setValidity("chevron_simple", function(object) {
  main_body <- body(object@main)
  if (is.symbol(main_body)) {
    return(invisible(TRUE))
  }
  res <- rapply(to_list(main_body), function(x) {
    identical(x, as.name("return"))
  })
  has_return <- if (any(res)) "Must be a simple expression without `return`" else TRUE
  makeAssertion(object@main, has_return, var.name = "object@main", collection = NULL)
  invisible(TRUE)
})

# Sub Constructor ----

#' `chevron_t` constructor
#'
#' @rdname chevron_tlg-class
#'
#' @inheritParams gen_args
#' @param ... not used
#' @returns a `chevron_t` class object.
#'
#' @export
#'
#' @examples
#' chevron_t_obj <- chevron_t()
#' chevron_t_obj <- chevron_t(postprocess = function(tlg, indent, ...) {
#'   rtables::table_inset(tlg) <- indent
#'   tlg
#' })
#'
chevron_t <- function(main = function(adam_db, ...) build_table(basic_table(), adam_db[[1]]),
                      preprocess = function(adam_db, ...) adam_db,
                      postprocess = report_null,
                      ...) {
  res <- .chevron_t(
    main = main,
    preprocess = preprocess,
    postprocess = postprocess
  )

  res
}

#' `chevron_l` constructor
#'
#' @rdname chevron_tlg-class
#'
#' @inheritParams gen_args
#' @param ... not used
#' @returns a `chevron_l` class object.
#' @export
#'
#' @examples
#' chevron_l_obj <- chevron_l()
#'
chevron_l <- function(main = function(adam_db, ...) data.frame(),
                      preprocess = function(adam_db, ...) adam_db,
                      postprocess = report_null,
                      ...) {
  res <- .chevron_l(
    main = main,
    preprocess = preprocess,
    postprocess = postprocess
  )

  res
}

#' `chevron_g` constructor
#'
#' @rdname chevron_tlg-class
#'
#' @inheritParams gen_args
#' @param ... not used
#' @returns a `chevron_g` class object.
#'
#' @export
#'
#' @examples
#' chevron_g_obj <- chevron_g()
#' chevron_g_obj <- chevron_g(
#'   postprocess = function(tlg, title, ...) tlg + ggplot2::labs(main = title)
#' )
#'
chevron_g <- function(main = function(adam_db, ...) ggplot2::ggplot(),
                      preprocess = function(adam_db, ...) adam_db,
                      postprocess = report_null,
                      ...) {
  res <- .chevron_g(
    main = main,
    preprocess = preprocess,
    postprocess = postprocess
  )

  res
}

#' `chevron_simple` constructor
#'
#' @rdname chevron_tlg-class
#'
#' @inheritParams gen_args
#' @param ... not used
#' @returns a `chevron_simple` class object.
#'
#' @export
#'
#' @examples
#' chevron_simple_obj <- chevron_simple()
chevron_simple <- function() {
  res <- .chevron_simple(
    main = \(adam_db, ...) basic_table() %>% build_table(data.frame()),
    preprocess = \(adam_db, ...) adam_db,
    postprocess = \(tlg, ...) tlg
  )
  res
}
