.onLoad <- function(libname, pkgname) {
  if (is.null(getOption("na_str"))) {
    options(na_str = "NE")
  }
}
