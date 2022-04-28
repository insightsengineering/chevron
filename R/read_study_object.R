# read_study_object ----

#' Reading Study Object from `yaml` file
#'
#' @param file (`string`) path to a `yaml` file containing the `.study` object specification.
#'
#' @return list fitting the criteria of a `.study` object
#' @export
#'
#' @examples
read_study_object <- function(file) {

  res <- yaml::read_yaml(file)
  assert_study_object(res)

  res
}
