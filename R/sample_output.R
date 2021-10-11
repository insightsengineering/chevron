#' Sample function for Chevron
#'
#' Returns a list of predefined tables.
#'
#' @param sd (`list`) cdisc data
#'
#' @importFrom magrittr %>%
#' @importFrom dplyr mutate
#' @import chevron
#'
#' @return (`list`) of tables.
#' @export
#'
#' @examples
#' library(scda)
#' library(dplyr)
#'
#' sd <- synthetic_cdisc_data("rcd_2021_03_22")
#' sample_output(sd)
#'
sample_output <- function(sd) {

  adsl <- sd$adsl
  adae <- sd$adae %>%
    mutate(ANL01FL = "Y")

  tbls <- list(
    DMT01 = dmt01_1(
      ad_bl = adsl,
      summaryvars = c("AGE", "RACE", "SEX")
    ),
    DST01 = dst01_1(adsl, adae),
    AET02 = aet02_1(adsl, adae)
  )

  tbls
}
