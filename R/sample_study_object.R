#' Extraction of .study object default values
#'
#' Get the names and the values of the default arguments stored in the study object of each exported function of
#' chevron.
#'
#' @return (`data.frame`)
#' @export
#'
#' @examples
#' lst <- sample_study_object()
#' dput(lst)
#'
sample_study_object <- function() {


  df <- study_df()


  # now check if
  # throw warning if there is a conflict and say ... is used

  # for now choose the first
  list(
    armvar = c("ARM", "ARMCD"),

    ...
  )

}


study_df <- function() {
  lsf_exported <- as.vector(lsf.str("package:chevron"))
  lsf_formals <- lapply(lsf_exported, formals)

  has_study <- vapply(lsf_formals, function(xi) !is.null(xi[['.study']]), logical(1))


  # Get the arguments of each exported function.
  ls_args <- lapply(ls_exported, function(x) try(formals(x)))


  tibble(
    tlgfname = lsf_exported[has_study],
    dot_study_args = lapply(lsf_formals[has_study], function(xi) eval(xi$.study, envir = baseenv()))
  )
}
