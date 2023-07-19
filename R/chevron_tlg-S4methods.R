#' @include chevron_tlg-S4class.R

# run ----

#' Run the pipeline
#'
#' Execute the pre-processing, main and post-processing functions in a single run.
#'
#' @inheritParams gen_args
#' @param object (`chevron_tlg`) input.
#' @param auto_pre (`flag`) whether to perform the default pre processing step.
#' @param verbose (`flag`) whether to print argument information.
#' @param ... extra arguments to pass to the pre-processing, main and post-processing functions.
#' @param user_args (`list`) arguments from `...`.
#'
#' @name run
#' @export
setGeneric(
  "run",
  function(object, adam_db, auto_pre = TRUE, verbose = FALSE, ..., user_args = list(...)) standardGeneric("run")
)

#' Run the pipeline
#' @rdname run
#' @export
#' @examples
#' run(mng01, syn_data, auto_pre = TRUE, dataset = "adlb")
setMethod(
  f = "run",
  signature = "chevron_tlg",
  definition = function(object, adam_db, auto_pre = TRUE, verbose = FALSE, ..., user_args = list(...)) {
    checkmate::assert_list(adam_db, types = "list")
    checkmate::assert_flag(auto_pre)
    checkmate::assert_flag(verbose)
    checkmate::assert_list(user_args, names = "unique")
    if (verbose) {
      cl <- match.call()
      print_args(
        cl,
        args_ls(object, omit = c("...", "adam_db", "tlg")), auto_pre
      )
    }
    proc_data <- if (auto_pre) {
      list(adam_db = do_call(object@preprocess, c(list(adam_db), user_args)))
    } else {
      list(adam_db = adam_db)
    }

    res_tlg <- list(tlg = do_call(object@main, c(proc_data, user_args)))

    do_call(object@postprocess, c(res_tlg, user_args))
  }
)

#' Print Arguments
#' @keywords internal
print_args <- function(run_call, args, auto_pre = TRUE) {
  checkmate::assert_class(run_call, "call")
  checkmate::assert_list(args)
  checkmate::assert_flag(auto_pre)
  run_call[[1]] <- NULL
  run_call <- as.list(run_call)
  run_call_user_args <- run_call$user_args
  if (!is.null(run_call_user_args)) {
    run_call_user_args <- as.list(run_call_user_args)
    run_call_user_args[[1]] <- NULL
    run_call <- c(run_call[c("object", "adam_db")], run_call_user_args)
  } else {
    run_call[c("auto_pre", "verbose")] <- NULL
  }
  nms_args <- unique(unlist(lapply(args, names)))
  nms_call <- names(run_call)
  m <- pmatch(nms_call, nms_args)
  nms_call[!is.na(m)] <- nms_args[m[!is.na(m)]]
  names(run_call) <- nms_call
  cat("Using template: ", run_call$object, "\n")
  cat("Using data:     ", run_call$adam_db, "\n")
  if (auto_pre) {
    cat("\nPre args:\n")
    print_list(get_subset(args$preprocess, run_call))
  }
  cat("\nMain args:\n")
  print_list(get_subset(args$main, run_call))
  cat("\nPost args:\n")
  print_list(get_subset(args$postprocess, run_call))
  add_args <- run_call[
    !names(run_call) %in% c(names(args$main), names(args$postprocess), names(args$preprocess), "object", "adam_db")
  ]
  if (length(add_args) > 0) {
    cat("\nAdditional args:\n")
    print_list(add_args)
  }
  cat("\n\n")
}

#' Subset Arguments and Merge
#' @keywords internal
get_subset <- function(x, y) {
  utils::modifyList(
    x,
    y[names(y) %in% names(x)],
    keep.null = TRUE
  )
}

#' Print list
#' @keywords internal
print_list <- function(x, indent = 2L) {
  if (length(x) == 0) {
    cat(paste0(
      stringr::str_dup(" ", indent),
      "No mapped argument.\n"
    ))
    return()
  }
  k <- names(x)
  m_charx <- max(nchar(k), 1)
  for (k in names(x)) {
    cat(
      sprintf(
        paste0("%s%-", m_charx + 2, "s: %s\n"),
        stringr::str_dup(" ", indent), k,
        paste(deparse(x[[k]]), collapse = paste0("\n", stringr::str_dup(" ", m_charx + indent + 2)))
      )
    )
  }
}

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
#' @param value  (`function`) returning a pre-processed `list` of `data.frames` amenable to `tlg` creation. Typically
#'   one of the `_pre` function of `chevron`.
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

# script ----

#' Create Script for Parameters Assignment
#'
#' @param x (`chevron_tlg`) input.
#' @param adam_db (`string`) the name of the dataset.
#' @param dict (`list`) with the name and value of custom arguments.
#' @param details (`flag`) whether to show the code of all function. By default, only the detail of the code of the
#'   prepossessing step is printed.
#' @param args (`string`) the name of argument list.
#'
#' @name script
#' @rdname script
NULL

## script_args ----

#' @rdname script
#' @export
setGeneric("script_args", function(x, dict = NULL) standardGeneric("script_args"))

#' @rdname script
#' @export
#'
#' @examples
#' script_args(aet04)
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
        res[[id]] <- rlang::call2("stop", "missing value")
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

## script_funs ----

#' Create Script for `TLG` Generation
#'
#' @rdname script
#' @export
setGeneric("script_funs", function(x, adam_db, args, details = FALSE) standardGeneric("script_funs"))

#' @rdname script
#' @export
#'
#' @examples
#' script_funs(aet04, adam_db = "syn_data", args = "args")
setMethod(
  f = "script_funs",
  signature = "chevron_tlg",
  definition = function(x, adam_db, args, details = FALSE) {
    checkmate::assert_flag(details)
    checkmate::assert_string(adam_db)
    checkmate::assert_string(args)

    if (details) {
      c(
        "# Edit Functions.",
        deparse(
          rlang::call2("<-", sym("pre_fun"), preprocess(x)),
          control = "useSource"
        ),
        "",
        deparse(
          rlang::call2("<-", sym("main_fun"), main(x)),
          control = "useSource"
        ),
        "",
        deparse(
          rlang::call2("<-", sym("post_fun"), postprocess(x)),
          control = "useSource"
        ),
        "",
        "# Create TLG",
        glue::glue("tlg_output <- rlang::exec(.fn = pre_fun, adam_db = {adam_db}, !!!{args}) %>% \
        rlang::exec(.fn = main_fun, !!!{args}) %>% \
        rlang::exec(.fn = post_fun, !!!{args})")
      )
    } else {
      tlg_name <- deparse(substitute(x))
      c(
        "# Edit Preprocessing Function.",
        utils::capture.output(
          print(
            rlang::call2("<-", sym("pre_fun"), preprocess(x)),
            useSource = TRUE
          )
        ),
        "",
        "# Create TLG",
        glue::glue("{adam_db} <- rlang::exec(.fn = pre_fun, adam_db = {adam_db}, !!!{args})"),
        glue::glue(
          "tlg_output <- run(object = {tlg_name}, adam_db = {adam_db}",
          ", auto_pre = FALSE, verbose = TRUE, user_args = {args})"
        )
      )
    }
  }
)
