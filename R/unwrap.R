
#' Helper Function Extracting Layout Functions
#'
#'
#' @keywords internal
#' @examples
#' h_unwrap_layout(body(aet01_main)[-1], "lyt")
#'
#'
h_unwrap_layout <- function(x, pattern) {

  assert_string(pattern)

  # If x is a list or a call, apply the function on each element
  if (class(x) %in% c("list", "call", "<-", "if")) {
    lapply(x, \(x) h_unwrap_layout(x, pattern))
  } else if (class(x) == "name") {

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

  assert_function(x)
  assert_string(pattern)

  res <- unlist(h_unwrap_layout(body(x)[-1], pattern))

  if (length(res) > 0L) {
    purrr::lmap(
      res,
      function(x){
        cat(sprintf("  %s:\n", names(x)))
        cat(paste(deparse(eval(x[[1]])), collapse = "\n"), "\n")
        list()
      }
    )
  }

  invisible(NULL)
}
