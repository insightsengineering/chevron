
#' Function or List Union Class
#'
#' @keywords internal
#'
setClassUnion("function_or_list", c("function", "list"))

#' Assertion that an object is a function or a list of functions
#'
#' @keywords internal
#'
#' @param db (`x`) input to check for type.
#'
assert_fun_or_list <- function(x, add = NULL) {
  if (is.function(x)) {
    checkmate::assert_function(x, add = add)
  } else {
    checkmate::assert_list(x, types = "function", add = add)
  }
}

#' `chevron_tlg` class
#'
#' The `chevron_tlg` class associates a `preprocess` function, a main `tlg` function and `AdAM` tables names and
#' optionally a `postprocess` function.
#'
#' @slot main (`function`) returning a `tlg`. Typically one of the `*_main` function from `chevron`.
#' @slot lyt (`function` or `list of function`).  Typically one of the `*_lyt` function from `chevron`.
#' @slot preprocess (`function`) returning a pre-processed `dm` object amenable to `tlg` creation. Typically one of the
#'   `*_pre` function from `chevron`.
#' @slot postprocess (`function`) returning a post-processed `tlg`.
#' @slot adam_datasets (`character`) representing the name of the tables from an `AdAM` dataset required for `tlg`
#'   creation.
#'
#' @format NULL
#'
#' @note To ensure the correct execution of the workflow additional validation criteria are:
#' * the first argument of the `main` function must be `adam_db`, the input `dm` object to pre-process.
#' * the first argument of the `preprocess` function must be `adam_db`, the input `dm` object to create `tlg` output.
#' * the first argument of the `postprocess` function must be `tlg`, the input `TableTree` object to post-process.
#'
#' @aliases chevron_tlg
#' @name chevron_tlg-class
#' @exportClass chevron_tlg
.chevron_tlg <- setClass(
  "chevron_tlg",
  slots = c(
    main = "function",
    lyt = "function_or_list",
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

methods::setValidity("chevron_tlg", function(object) {
  coll <- checkmate::makeAssertCollection()
  checkmate::assert_function(object@main, args = "adam_db", add = coll)
  assert_fun_or_list(object@lyt, add = coll)
  checkmate::assert_function(object@preprocess, args = "adam_db", add = coll)
  checkmate::assert_function(object@postprocess, args = "tlg", add = coll)

  checkmate::reportAssertions(coll)
})

# Constructor ----

#' `chevron_tlg` constructor
#'
#' @describeIn chevron_tlg Default Constructor
#'
#' @param main (`function`) returning a `tlg`. Typically one of the `_main` function of `chevron`.
#' @param lyt  (`function`, `list of functions`, `call` or `PreDataTableLayouts`) typically one of the `_lyt` function
#'   of `chevron`.
#' @param preprocess (`function`) returning a pre-processed `dm` object amenable to `tlg` creation. Typically one of the
#'   `_pre` function of `chevron`.
#' @param postprocess (`function`) returning a post-processed `tlg`.
#' @param adam_datasets (`character`) representing the name of the table from an `AdAM` dataset required for `tlg`
#'   creation.
#'
#' @include utils.R
#'
#' @export
#' @examples
#' x <- chevron_tlg(aet01_1_main, aet01_1_lyt, aet01_1_pre, adam_datasets = c("adsl", "adae"))
chevron_tlg <- function(main = function(adam_db, ...) adam_db,
                        lyt = function(...) basic_table(),
                        preprocess = function(adam_db, ...) adam_db,
                        postprocess = report_null,
                        adam_datasets = NA_character_) {
  res <- .chevron_tlg(
    main = main,
    lyt = make_lyt_fun(lyt),
    preprocess = preprocess,
    postprocess = postprocess,
    adam_datasets = adam_datasets
  )

  validObject(res)
  res
}


#' Layout function constructor
#'
#' @inheritParams chevron_tlg
#'
#' @keywords internal
#'
#' @examples
#' \dontrun{
#' my_call <- quote(rtables::basic_table() %>% rtables::split_cols_by("ARM"))
#' lyt1 <- make_lyt_fun(my_call)
#'
#' my_obj <- rtables::basic_table() %>% rtables::split_cols_by("ARM")
#' lyt2 <- make_lyt_fun(my_obj)
#'
#' my_fun <- function(arm = "ARM", ...) rtables::basic_table() %>% rtables::split_cols_by(arm)
#' lyt3 <- make_lyt_fun(my_fun)
#'
#' identical(lyt1(), lyt2())
#' identical(lyt1(), lyt3())
#' }
make_lyt_fun <- function(lyt) {
  cl <- class(lyt)

  e <- new.env()
  e$lyt <- lyt

  switch(cl,
    "function" = {
      checkmate::assert_function(lyt, args = "...")
      lyt
    },
    "list" = {
      lapply(lyt, checkmate::assert_function, args = "...")
      lyt
    },
    "call" = {
      arg <- as.pairlist(alist(... = )) # nolint
      eval(call("function", arg, lyt))
    },
    "PreDataTableLayouts" = {
      arg <- as.pairlist(alist(... = )) # nolint
      eval(call("function", arg, lyt))
    },
    stop(paste("lyt must be a `function`, `list of functions`, `call` or `PreDataTableLayouts` but is", cl))
  )
}
