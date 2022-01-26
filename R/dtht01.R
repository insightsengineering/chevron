# DTHT01_1 ----

#' `DTHT01` Table 1 (Default) Death Table.
#'
#' A description of the causes of death.
#'
#' @inheritParams gen_args

#' @details
#'  * Numbers represent absolute numbers of subjects and fraction of `N`, or absolute numbers when specified.
#'  * Remove zero-count rows unless overridden with `prune_0 = FALSE`.
#'  * Does not include a total column by default.
#'
#' @importFrom dplyr filter
#' @importFrom magrittr %>%
#'
#' @export
#'
#' @examples
#' library(dm)
#' library(dplyr)
#'
#' db <- syn_test_data() %>%
#'   preprocess_data("dtht01_1")
#'
#' dtht01_1(adam_db = db)
#'
dtht01_1 <- function(adam_db,
                     armvar = .study$armvar,
                     lbl_overall = .study$lbl_overall,
                     prune_0 = TRUE,
                     deco = std_deco("DTHT01"),
                     .study = list(
                       armvar = "ACTARM",
                       lbl_overall = NULL
                     )) {

  dbsel <- get_db_data(adam_db, "adsl")

  lyt <- dtht01_1_lyt(
    armvar = armvar,
    lbl_overall = lbl_overall,
    deco = deco
  )

  tbl <- build_table(lyt, dbsel$adsl)

  if (prune_0) {
    tbl <- tbl %>% prune_table()
  }

  tbl
}


#' `DTHT01` Layout 1 (Default)
#'
#' @describeIn dtht01_1
#'
#' @inheritParams gen_args

#' @export
#'
#' @examples
#' dtht01_1(
#'   armvar = "ACTARM",
#'   lbl_overall = NULL
#' )
dtht01_1_lyt <- function(adam_db,
                     armvar = .study$armvar,
                     lbl_overall = .study$lbl_overall,
                     deco = std_deco("DTHT01"),
                     .study = list(
                       armvar = "ACTARM",
                       lbl_overall = NULL
                     )) {

    basic_table_deco(deco) %>%
    split_cols_by(var = armvar) %>%
    add_colcounts() %>%
    ifneeded_add_overall_col(lbl_overall) %>%
    count_values(
      "DTHFL",
      values = "Y",
      .labels =  c(count_fraction = "Total number of deaths"),
      .formats = c(count_fraction = "xx (xx.x%)"))  %>%
    summarize_vars(vars = c("DTHCAT"), var_labels = c("Primary cause of death"))
}
