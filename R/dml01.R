# dml01_1 ----
#' @describeIn dml01_1 Main TLG function
#'
#' @inheritParams gen_args
#' @param dataset (`string`) the name of a table in the `adam_db` object.
#' @param cols (`character`) the variables to be displayed in listing.
#' @param key_cols (`character`) the variables to be displayed as key columns in listing.
#'
#' @export
#'
#' @examples
#' library(dm)
#' library(magrittr)
#'
#' db <- syn_data %>%
#'   dml01_1_pre()
#'
#' dml01_1_main(db)
dml01_1_main <- function(adam_db, dataset, cols = c("USUBJID", "ASR"), key_cols = NULL, deco = std_deco("DMT01")) {
  as_listing(
    adam_db[[dataset]],
    cols = cols,
    key_cols = key_cols,
    main_titl = deco$title,
    subtitles = deco$subtitles,
    main_footer = deco$main_footer
  )
}

dml01_1_pre <- function(adam_db, ...) {
  adam_db %>%
    zoom_to("adsl") %>%
    mutate(ASR = sprintf("%s/%s/%s", AGE, SEX, RACE)) %>%
    dm_update_zoomed()
}

dml01_1_post <- function(tlg, ...) {
  tlg
}

dml01_1 <- chevron_l(main = dml01_1_main, preprocess = dml01_1_pre, postprocess = dml01_1_post)
