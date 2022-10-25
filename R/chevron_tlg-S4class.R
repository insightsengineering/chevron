# Chevron_tlg ----

#' `chevron_tlg` class
#'
#' The `chevron_tlg` class associates a `preprocess` function, a main `tlg` function and `AdAM` tables names and
#' optionally a `postprocess` function.
#'
#' @slot main (`function`) returning a `tlg`. Typically one of the `*_main` function from `chevron`.
#' @slot lyt (`list of function`).  Typically one of the `*_lyt` function from `chevron`wrapped in a `list`.
#' @slot preprocess (`function`) returning a pre-processed `dm` object amenable to `tlg` creation. Typically one of the
#'   `*_pre` function from `chevron`.
#' @slot postprocess (`function`) returning a post-processed `tlg`.
#' @slot adam_datasets (`character`) representing the name of the tables from an `AdAM` dataset required for `tlg`
#'   creation.
#'
#' @format NULL
#'
#' @note To ensure the correct execution of the workflow additional validation criteria are:
#' * the first argument of the `main` function must be `adam_db`, the input `dm` object to pre-process. In addition, it
#' must possess the `...` argument.
#' * the `lyt` function must posses the `...` argument.
#' * the first argument of the `preprocess` function must be `adam_db`, the input `dm` object to create `tlg` output.
#' In addition, it must possess the `...` argument.
#' * the first argument of the `postprocess` function must be `tlg`, the input `TableTree` object to post-process.
#'
#' @aliases chevron_tlg
#' @name chevron_tlg-class
#' @exportClass chevron_tlg
.chevron_tlg <- setClass(
  "chevron_tlg",
  slots = c(
    main = "function",
    lyt = "list",
    preprocess = "function",
    postprocess = "function",
    adam_datasets = "character"
  )
)

# Validation ----

methods::setValidity("chevron_tlg", function(object) {
  coll <- checkmate::makeAssertCollection()
  checkmate::assert_function(object@main, args = c("adam_db"), ordered = TRUE, add = coll)
  checkmate::assert_function(object@main, args = c("..."), add = coll)
  checkmate::assert_list(object@lyt, types = "function", add = coll)
  for (i in seq_along(object@lyt)) {
    checkmate::assert_function(
      object@lyt[[i]],
      args = "...",
      add = coll,
      .var.name = paste("Element", i, "of the lyt slot")
    )
  }
  checkmate::assert_function(object@preprocess, args = c("adam_db"), ordered = TRUE, add = coll)
  checkmate::assert_function(object@preprocess, args = c("..."), add = coll)
  checkmate::assert_function(object@postprocess, args = c("tlg"), ordered = TRUE, add = coll)
  checkmate::assert_function(object@postprocess, args = c("..."), add = coll)
  checkmate::reportAssertions(coll)
})

# Constructor ----

#' `chevron_tlg` constructor
#'
#' @describeIn chevron_tlg Default Constructor
#'
#' @param main (`function`) returning a `tlg`, with `adam_db` as first argument and `...` as last argument. Typically
#'   one of the `_main` function of `chevron`.
#' @param lyt  (a single `function` returning `PreDataTableLayouts` object or `PreDataTableLayouts` object or `list` of
#'   either `functions` or `PreDataTableLayouts` type of elements) typically one of the `_lyt` function of `chevron`.
#'   Functions passed to `lyt`, whether as a single `function` or as a `list of functions`, must have the `...` formal
#'   argument.
#' @param preprocess (`function`) returning a pre-processed `dm` object, with `adam_db` as first argument and `...` as
#'   last argument. Typically one of the `_pre` function of `chevron`.
#' @param postprocess (`function`) returning a post-processed `tlg`, with `tlg` as first argument.
#' @param adam_datasets (`character`) representing the names of the tables from an `ADaM` dataset required for `tlg`
#'   creation.
#'
#' @include utils.R
#'
#' @export
#' @examples
#' x <- chevron_tlg(aet01_1_main, aet01_1_lyt, aet01_1_pre, adam_datasets = c("adsl", "adae"))
chevron_tlg <- function(main = function(adam_db, ...) adam_db,
                        lyt = list(function(...) basic_table()),
                        preprocess = function(adam_db, ...) adam_db,
                        postprocess = report_null,
                        adam_datasets = NA_character_) {
  res <- .chevron_tlg(
    main = main,T
    lyt = make_lyt_ls(lyt),
    preprocess = preprocess,
    postprocess = postprocess,
    adam_datasets = adam_datasets
  )

  validObject(res)
  res
}


#' Layout List Constructor
#'
#' @inheritParams chevron_tlg
#'
#' @keywords internal
#'
#' @examples
#' \dontrun{
#' my_obj <- rtables::basic_table() %>% rtables::split_cols_by("ARM")
#' lyt2 <- make_lyt_ls(my_obj)
#'
#' my_fun <- function(arm = "ARM", ...) rtables::basic_table() %>% rtables::split_cols_by(arm)
#' lyt3 <- make_lyt_ls(my_fun)
#' }
make_lyt_ls <- function(lyt) {
  cl <- class(lyt)

  switch(cl,
    "function" = {
      checkmate::assert_function(lyt, args = "...")
      list(lyt)
    },
    "list" = {
      coll <- checkmate::makeAssertCollection()
      res <- list()
      for (i in seq_along(lyt)) {
        obj <- lyt[[i]]
        res[[i]] <- if (is(obj, "function")) {
          checkmate::assert_function(
            lyt[[i]],
            args = "...",
            add = coll,
            .var.name = paste("Element", i, "of the layout input")
          )
          obj
        } else if (is(obj, "PreDataTableLayouts")) {
          arg <- as.pairlist(alist(... = )) # nolint
          eval(call("function", arg, obj))
        } else {
          checkmate::assert_multi_class(
            obj,
            c("function", "PreDataTableLayouts"),
            .var.name = paste("Element", i, "of the layout input")
          )
        }
        checkmate::reportAssertions(coll)
        lyt
      }

      names(res) <- names(lyt)
      res
    },
    "PreDataTableLayouts" = {
      arg <- as.pairlist(alist(... = )) # nolint
      list(eval(call("function", arg, lyt)))
    },
    stop(paste("lyt must be a `function`, `list of functions` or `PreDataTableLayouts` but is", toString(cl)))
  )
}

# Subclasses ----

## chevron_t ----

#' `chevron_t`
#'
#' `chevron_t`, a subclass of [chevron::chevron_tlg] with specific validation criteria to handle graph creation
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
  checkmate::assert_function(object@main, args = c("adam_db", "lyt_ls"), ordered = TRUE, add = coll)
  checkmate::reportAssertions(coll)
})

## chevron_l ----

#' `chevron_l`
#'
#' `chevron_l`, a subclass of [chevron::chevron_tlg] with specific validation criteria to handle listing creation
#'
#' @aliases chevron_listing
#' @rdname chevron_tlg-class
#' @exportClass chevron_l
.chevron_l <- setClass(
  "chevron_l",
  contains = "chevron_tlg"
)

methods::setValidity("chevron_t", function(object) {
  coll <- checkmate::makeAssertCollection()
  checkmate::assert_function(object@main, args = c("adam_db", "lyt_ls"), ordered = TRUE, add = coll)
  checkmate::reportAssertions(coll)
})

## chevron_g ----

#' `chevron_g`
#'
#' `chevron_g`, a subclass of [chevron::chevron_tlg] with specific validation criteria to handle graph creation
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
  checkmate::assert_function(object@main, args = c("adam_db", "plot_ls"), ordered = TRUE, add = coll)
  checkmate::reportAssertions(coll)
})
