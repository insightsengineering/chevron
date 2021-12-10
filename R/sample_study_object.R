#' Extraction of .study object default values
#'
#' Sample the default value of the `.study` object defined in the `tlg-functions` and returns an existing default value.
#'
#' @return (`list`)
#' @export
#'
#' @examples
#' lst <- sample_study_object()
#' dput(lst)
#'
sample_study_object <- function() {

  # list functions
  ls_exported <- as.vector(lsf.str("package:chevron"))

  # Get the arguments of each exported function.
  ls_args <- lapply(ls_exported, formals)

  # Extract .study expression.
  ls_study <- lapply(ls_args, "[", ".study")

  has_study <- vapply(ls_study, function(xi) !is.null(xi[[".study"]]), logical(1))

  lsf_default <- lapply(ls_study[has_study], function(xi) eval(xi$.study, envir = baseenv()))

  ls_all_val <- unlist(lsf_default, recursive = FALSE)

  tapply(ls_all_val, names(ls_all_val), "[", 1)
}
