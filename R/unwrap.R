#' Helper Function Extracting Layout Functions
#' @keywords internal
#'
h_unwrap_layout <- function(x, pattern) {
  assert_string(pattern)

  # If x is a list or a call, apply the function on each element
  if (inherits(x, c("list", "call", "<-", "if"))) {
    lapply(x, \(x) h_unwrap_layout(x, pattern))
  } else if (is(x, "name")) {
    # Return if name match pattern.

    if (grepl(pattern, x)) {
      res <- list(x)
      names(res) <- as.character(x)
      res
    } else {
      NULL
    }
  } else {
    NULL
  }
}

#' Extracting Layout Function.
#'
#' @param x (`function`) containing a call to a layout function.
#' @param pattern (`string`) identifying layout functions
#'
#' @returns invisible `NULL` and print the content of the layout functions found in the body of `x`.
#'
#' @export
#' @keywords internal
#' @examples
#' unwrap_layout(aet01_main)
#'
unwrap_layout <- function(x, pattern = "_lyt$") {
  checkmate::assert_function(x)
  checkmate::assert_string(pattern)

  # Identify environment of the parent function.
  env_x <- tryCatch(
    rlang::get_env(x),
    error = function(e) NULL
  )

  # Get the associated layout functions as name objects
  res <- unlist(h_unwrap_layout(body(x)[-1], pattern))

  if (length(res) > 0L) {
    cat("Layout function:")
    purrr::lmap(
      res,
      function(x) {
        # Evaluate layout function symbol in the environment of the parent function.
        tryCatch(
          {
            cat("\n")
            layout_code <- paste(deparse(eval(x[[1]], envir = env_x)), collapse = "\n")
            cat(sprintf("  %s:\n", names(x)))
            cat(layout_code)
          },
          error = function(e) cat("\n  Unable to print layout function!")
        )

        list()
      }
    )
  }
  cat("\n")
  invisible(NULL)
}
