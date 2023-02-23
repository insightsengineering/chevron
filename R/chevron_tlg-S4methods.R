#' @include chevron_tlg-S4class.R

# run ----

#' Run the pipeline
#'
#' Execute the pre-processing, main and post-processing functions in a single run.
#'
#' @inheritParams gen_args
#' @param object (`chevron_tlg`) input.
#' @param auto_pre (`flag`) whether to perform the default pre processing step.
#' @param ... extra arguments to pass to the pre-processing, main and post-processing functions.
#'
#' @name run
#' @export
setGeneric("run", function(object, adam_db, auto_pre = TRUE, ...) standardGeneric("run"))

#' Run the pipeline
#' @rdname run
#' @export
#' @examples
#' run(mng01_1, syn_data, auto_pre = TRUE, dataset = "adlb")
setMethod(
  f = "run",
  signature = "chevron_tlg",
  definition = function(object, adam_db, auto_pre = TRUE, ...) {
    checkmate::assert_class(adam_db, "dm")
    checkmate::assert_flag(auto_pre)

    # Assert validity of provided arguments.
    user_args <- list(...)
    arg_pre_name <- if (auto_pre) rlang::fn_fmls_names(preprocess(object))
    arg_main_name <- rlang::fn_fmls_names(main(object))
    arg_post_name <- rlang::fn_fmls_names(postprocess(object))

    all_args_names <- unique(c(arg_pre_name, arg_main_name, arg_post_name))
    assert_subset_suggest(names(user_args), all_args_names)

    proc_data <- if (auto_pre) {
      arg_pre <- user_args[names(user_args) %in% arg_pre_name]
      list(adam_db = do.call(object@preprocess, c(list(adam_db), arg_pre)))
    } else {
      list(adam_db = adam_db)
    }

    arg_main <- user_args[names(user_args) %in% arg_main_name]
    arg_post <- user_args[names(user_args) %in% arg_post_name]

    res_tlg <- list(tlg = do.call(object@main, c(proc_data, arg_main)))

    do.call(object@postprocess, c(res_tlg, arg_post))
  }
)


# args_ls ----

#' Get Arguments List
#'
#' @param x (`chevron_tlg`) input.
#' @param simplify (`flag`) whether to simplify the output, coalescing the values of the parameters. The order of
#'   priority for the value of the parameters is: `main`, `preprocess` and `postprocess`.
#' @param omit (`character`) the names of the argument to omit from the output.
#'
#' @rdname args_ls
#' @export
setGeneric("args_ls", function(x, simplify = FALSE, omit = NULL) standardGeneric("args_ls"))

#' @rdname args_ls
#' @export
setMethod(
  f = "args_ls",
  signature = "chevron_tlg",
  definition = function(x, simplify = FALSE, omit = NULL) {
    checkmate::assert_flag(simplify)
    checkmate::assert_character(omit, null.ok = TRUE)

    x_ls <- list(
      main = formals(x@main),
      preprocess = formals(x@preprocess),
      postprocess = formals(x@postprocess)
    )

    x_sel <- lapply(x_ls, function(y) y[!names(y) %in% omit])

    res <- if (simplify) {
      Reduce(fuse_sequentially, x_sel)
    } else {
      x_sel
    }

    res
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

# preprocess ----

#' Pre process
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

#' Post process
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
#' retrieve or set `adam_datasets`.
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

# script ----

#' Create Script for Parameters Assignment
#'
#' @param x (`chevron_tlg`) input.
#' @param dict (`list`) with the name and value of custom arguments.
#' @param details (`flag`) whether to show the code of all function. By default, only the detail of the code of the
#'   prepossessing step is printed.
#'
#' @name script
#' @rdname script
NULL

#' @rdname script
#' @export
setGeneric("script_args", function(x, dict = NULL) standardGeneric("script_args"))

#' @rdname script
#' @export
#'
#' @examples
#' script_args(aet04_1)
#'
setMethod(
  f = "script_args",
  signature = "chevron_tlg",
  definition = function(x, dict = NULL) {
    checkmate::assert_list(dict, null.ok = TRUE)

    # Construct call for attribution of all arguments
    simple_arg <- args_ls(x, omit = c("tlg", "..."), simplify = TRUE)
    simple_arg <- fuse_sequentially(dict, simple_arg)
    names_args <- names(simple_arg)
    val_args <- unname(simple_arg)

    res <- alist()
    for (i in seq_along(simple_arg)) {
      val <- val_args[[i]]
      id <- names_args[[i]]

      if (missing(val)) {
        res[[id]] <- rlang::call2("stop", "enter dataset")
      } else {
        res[[id]] <- val
      }
    }

    arg_calls <- mapply(function(x, y) rlang::call2("<-", sym(x), y), as.list(names(res)), res)

    c(
      "\n# Arguments definition ----\n",
      unlist(lapply(arg_calls, deparse))
    )
  }
)

#' Create Script for `TLG` Generation
#'
#' @rdname script
#' @export
setGeneric("script_funs", function(x, details = FALSE) standardGeneric("script_funs"))

#' @rdname script
#' @export
#'
#' @examples
#' script_funs(aet04_1)
#'
setMethod(
  f = "script_funs",
  signature = "chevron_tlg",
  definition = function(x, details = FALSE) {
    checkmate::assert_flag(details)

    # Construct argument list for each function.
    all_arg <- args_ls(x, omit = c("...", "tlg"), simplify = FALSE)

    arg_pre <- lapply(names(all_arg$preprocess), sym)
    names(arg_pre) <- arg_pre

    arg_main <- lapply(names(all_arg$main), sym)
    names(arg_main) <- arg_main
    arg_main$adam_db <- sym("proc_data")

    arg_post <- lapply(names(all_arg$post), sym)
    names(arg_post) <- arg_post

    # Construct the call for the main and post process function.
    fun_def <- if (details) {
      c(
        deparse(rlang::call2("<-", sym("main_fun"), x@main)),
        deparse(rlang::call2("<-", sym("postprocess_fun"), x@postprocess))
      )
    } else {
      NULL
    }

    # Execute either the main and post function separately or together using `run`.
    fun_exec <- if (details) {
      arg_post$tlg <- sym("tlg")
      c(
        deparse(rlang::call2("<-", sym("tlg"), rlang::call2("main_fun", !!!arg_main))),
        deparse(rlang::call2("<-", sym("final_tlg"), rlang::call2("postprocess_fun", !!!arg_post)))
      )
    } else {
      main_post_arg <- fuse_sequentially(arg_main, arg_post)
      deparse(
        rlang::call2(
          "<-",
          sym("final_tlg"),
          rlang::call2("run", substitute(x), auto_pre = FALSE, !!!main_post_arg)
        )
      )
    }

    # Generate the script.
    spt <- c(
      "\n# Functions definition ----\n",
      deparse(rlang::call2("<-", sym("preprocess_fun"), x@preprocess)),
      fun_def,
      "\n# Functions execution ----\n",
      deparse(rlang::call2("<-", sym("proc_data"), rlang::call2("preprocess_fun", !!!arg_pre))),
      fun_exec
    )

    unlist(spt)
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
