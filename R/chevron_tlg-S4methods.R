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
    assert_list(adam_db, types = "list")
    assert_flag(auto_pre)
    assert_flag(verbose)
    assert_list(user_args, names = "unique")

    user_args <- modifyList(user_args, list(...), keep.null = TRUE)

    if (verbose) {
      cl <- match.call()
      print_args(
        run_call = cl,
        additional_args = user_args,
        args = args_ls(object, omit = c("...", "adam_db", "tlg")),
        auto_pre = auto_pre
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
print_args <- function(run_call, additional_args, args, auto_pre = TRUE) {
  assert_class(run_call, "call")
  assert_list(args)
  assert_flag(auto_pre)

  run_call[[1]] <- NULL
  run_call <- as.list(run_call)

  is_name <- Filter(is.name, run_call)
  is_name["user_args"] <- NULL

  if (!is.null(additional_args)) {
    run_call <- c(is_name, additional_args[setdiff(names(additional_args), names(is_name))])
  } else {
    run_call[c("auto_pre", "verbose")] <- NULL
  }
  nms_args <- unique(unlist(lapply(args, names)))
  nms_call <- names(run_call)
  m <- pmatch(nms_call, nms_args)
  nms_call[!is.na(m)] <- nms_args[m[!is.na(m)]]
  names(run_call) <- nms_call
  cat(
    "Using template: ",
    if (is.name(run_call$object)) run_call$object else paste("object of class", class(run_call$object)),
    "\n"
  )
  cat(
    "Using data:     ",
    if (is.name(run_call$adam_db)) run_call$adam_db else paste("object of class", class(run_call$adam_db)),
    "\n"
  )
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
        deparse_print(x[[k]], m_charx + indent + 2)
      )
    )
  }
}

#' Deparse print
#' @keywords internal
deparse_print <- function(x, indent, max_line = getOption("chevron.arg_max_line", 5L)) {
  assert_int(indent)
  assert_int(max_line, lower = 1L)
  ret <- deparse(x)
  sep <- paste0("\n", stringr::str_dup(" ", indent))
  if (length(ret) > max_line) {
    ret[max_line] <- sprintf("... (print of class <%s> truncated)", toString(class(x)))
    ret <- ret[seq_len(max_line)]
  }
  paste(ret, collapse = sep)
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
    assert_flag(simplify)
    assert_character(omit, null.ok = TRUE)

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
#' @param name (`string`) name of the template.
#' @param args (`string`) the name of argument list.
#'
#' @name script
#' @rdname script
NULL

## script_funs ----

#' Create Script for `TLG` Generation
#'
#' @rdname script
#' @export
setGeneric("script_funs", function(x, adam_db, args, name = deparse(substitute(x))) standardGeneric("script_funs"))

#' @rdname script
#' @export
#'
#' @examples
#' script_funs(aet04, adam_db = "syn_data", args = "args")
setMethod(
  f = "script_funs",
  signature = "chevron_tlg",
  definition = function(x, adam_db, args, name) {
    checkmate::assert_string(adam_db)
    checkmate::assert_string(args)
    checkmate::assert_string(name)
    c(
      "# Edit Preprocessing Function.",
      glue::glue("preprocess({name}) <- "),
      deparse(preprocess(x), control = c("useSource")),
      "",
      "# Create TLG",
      glue::glue(
        "tlg_output <- run(object = {name}, adam_db = {adam_db}",
        ", verbose = TRUE, user_args = {args})"
      )
    )
  }
)

#' @rdname script
#' @export
#'
setMethod(
  f = "script_funs",
  signature = "chevron_simple",
  definition = function(x, adam_db, args, name) {
    checkmate::assert_string(adam_db)
    main_body <- body(main(x))
    c(
      "# Create TLG",
      if (!identical(adam_db, "adam_db")) {
        glue::glue("adam_db <- {adam_db}")
      },
      "",
      "tlg_output <- ",
      deparse(main_body)
    )
  }
)
