#' Extraction of .study object default values
#'
#' Get the names and the values of the default arguments stored in the study object of each exported function of
#' chevron.
#'
#' @return (`data.frame`)
#' @export
#'
#' @examples
#' sample_study_object()
sample_study_object <- function() {

  ls_exported <- ls(asNamespace("chevron"))

  # Get the arguments of each exported function.
  ls_args <- lapply(ls_exported, function(x) try(formals(x)))

  # Extract .study expression.
  ls_study <- lapply(ls_args, "[", ".study")
  names(ls_study) <- ls_exported

  # Clean and keep expression only for exported function with study object.
  is_list <- sapply(ls_study, is.list)
  ls_study_only <- ls_study[is_list]
  ls_final_study <- unlist(ls_study_only)
  names(ls_final_study) <- gsub("..study", "", names(ls_final_study))

  # Extract the name and the default value stored in each study object.
  nb_arg <- lapply(ls_final_study, function(x) setdiff(seq_along(x), 1))

  ls_default_val <- mapply(function(x, i) as.character(x)[i], ls_final_study, nb_arg)
  ls_default_arg <- mapply(function(x, i) names(x)[i], ls_final_study, nb_arg)

  ls_rep_names <- rep(names(ls_default_arg), sapply(ls_default_arg, length))

  # store in a data.frame
  df <-
  data.frame(
  function_name = ls_rep_names,
  arg_name = unlist(ls_default_arg),
  arg_default = unlist(ls_default_val))

  df
}
