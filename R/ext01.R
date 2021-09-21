#' EXT01 Table 1 (Default) Exposure Summary Table
#'
#' The EXT01 table provides an overview of the of the exposure of the patients in terms of Total dose administered or
#' missed, and treatment duration.
#'
#'
#' @inheritParams gen_args
#' @param summaryvars `(string)` the name of the variable to be analyzed. By default `"AVAL"`.
#'
#' @details
#'  * Default Exposure table
#'  * The `n` row provides the number of non-missing values. The percentages for categorical variables is based on `n`.
#'  The percentages for `Total number of patients with at least one dose modification` are based on the number of
#'  patients in the corresponding analysis population given by `N`.
#'  * Split columns by arm, typically `ACTARM`.
#'  * Does not include a total column by default.
#'  * Sorted by alphabetic order of the `PARAM` value. Transform to factor and re-level for custom order.
#'
#' @export
#'
#' @examples
#' library(scda)
#' library(dplyr)
#' sd <- synthetic_cdisc_data("rcd_2021_03_22")
#' adsl <- sd$adsl
#' adex <- sd$adex |>
#'  mutate(ANL01FL = 'Y')
#'
#' ext01_1(adex, adsl)
#'
ext01_1 <- function(adex,
                    adsl,
                    armvar = .study$armvar,
                    summaryvars = "AVAL",
                    lbl_overall = .study$lbl_overall,
                    prune_0 = TRUE,
                    deco = std_deco("EXT01"),
                    .study = list(
                      armvar = "ACTARM",
                      lbl_overall = ""
                    )) {


    # provide a clearer error message in the case of missing variable
  assert_colnames(adex, summaryvars)

  lyt <- ext01_1_lyt(
    armvar = armvar,
    summaryvars = summaryvars,
    summaryvars_lbls = var_labels_for(adex, summaryvars),
    lbl_overall = lbl_overall,
    deco = deco
  )

  tbl <- build_table(lyt, adex, adsl)


  if (prune_0) tbl <- tbl %>% prune_table()


  if (identical(lbl_overall, ""))
    tbl[, -ncol(tbl)]
  else
    tbl

}


ext01_1_lyt <- function(armvar = .study$armvar,
                        summaryvars = summaryvars,
                        summaryvars_lbls = summaryvars_lbls,
                        lbl_overall = .study$lbl_overall,
                        deco = std_deco("EXT01"),
                        .study = list(
                          armvar = "ACTARM",
                          overall_col = ""
                        )) {

  basic_table(title = deco$title, subtitles = deco$subtitles, main_footer = deco$main_footer) %>%
    split_cols_by(var = armvar) %>%
    add_overall_col(lbl_overall) %>%
    add_colcounts() %>%
    split_rows_by(
      "PARAM",
      split_fun = drop_split_levels
    ) %>%
    summarize_vars(vars = summaryvars, var_labels = summaryvars_lbls)
}


# Version 2 ----

#' EXT01 Table 2 (Supplementary) Exposure Summary Table with grouping options
#'
#' @inheritParams gen_args
#' @param summaryvars `(string)` the name of the variable to be analyzed. By default `"AVAL"`.
#'@param paramvar `(vector)` providing the name of the parameters whose statistical summary should be presented. To
#'  analyze all, provide `paramvar = "ALL"` (Default), to analyze none, provide `paramvar = ""`.
#'
#' @details
#'  * Supplementary Exposure table with binning of desired analysis values.
#'  * The `n` row provides the number of non-missing values. The percentages for categorical variables is based on `n`.
#'  The percentages for `Total number of patients with at least one dose modification` are based on the number of
#'  patients in the corresponding analysis population given by `N`.
#'  * Split columns by arm, typically `ACTARM`.
#'  * Does not include a total column by default.
#'  * Sorted by alphabetic order of the `PARAM` value. Transform to factor and re-level for custom order.
#'
#' @export
#'
#' @examples
#' library(scda)
#' library(dplyr)
#' sd <- synthetic_cdisc_data("rcd_2021_03_22")
#' adsl <- sd$adsl
#' adex <- sd$adex %>%
#'   mutate(ANL01FL = 'Y')
#'
#' group <- list(list("Dose administered during constant dosing interval",
#'                                          c(-Inf, 700, 900, 1200, Inf),
#'                                          c("<700", "700-900", "900-1200", ">1200")
#'                                           ),
#'                                       list("Total dose administered",
#'                                          c(-Inf, 5000, 7000, 9000, Inf),
#'                                          c("<5000", "5000-7000", "7000-9000", ">9000")
#'                                            )
#'                                        )
#'
#' adex <- cut_by_group(adex, "AVAL", "PARAM", group, "AVALCAT1", as_factor = TRUE)
#'
#' adex$PARAM <- factor(adex$PARAM,
#'                    c("Total number of doses administered",
#'                      "Total dose administered",
#'                      "Dose administered during constant dosing interval",
#'                      "Number of doses administered during constant dosing interval"))
#'
#' ext01_2(adex, adsl)
#'
ext01_2 <- function(adex,
                    adsl,
                    armvar = .study$armvar,
                    group = .study$group,
                    paramvar = .study$paramvar,
                    summaryvars = "AVAL",
                    lbl_overall = .study$lbl_overall,
                    prune_0 = TRUE,
                    deco = std_deco("EXT01"),
                    .study = list(
                      armvar = "ACTARM",
                      paramvar = c("ALL"),
                      lbl_overall = ""
                    )) {

  # provide a clearer error message in the case of missing variable
  assert_colnames(adex, summaryvars)

  # Set to NA the AVAL value of the parameters for which a statistical summary should not be presented
  if (paramvar != "ALL") {

    adex <- adex %>%
    mutate(AVAL = ifelse(PARAM %in% paramvar, AVAL, NA))

  }

  lyt <- ext01_2_lyt(
    armvar = armvar,
    summaryvars = summaryvars,
    summaryvars_lbls = var_labels_for(adex, summaryvars),
    lbl_overall = lbl_overall,
    deco = deco
  )

  tbl <- build_table(lyt, adex, adsl)

  if (prune_0) tbl <- tbl %>% prune_table()

  if (identical(lbl_overall, ""))
    tbl[, -ncol(tbl)]
  else
    tbl
}


ext01_2_lyt <- function(armvar = .study$armvar,
                        summaryvars = summaryvars,
                        summaryvars_lbls = summaryvars_lbls,
                        lbl_overall = .study$lbl_overall,
                        deco = std_deco("EXT01"),
                        .study = list(
                          armvar = "ACTARM",
                          overall_col = ""
                        )) {

  basic_table(title = deco$title, subtitles = deco$subtitles, main_footer = deco$main_footer)  %>%
    split_cols_by(var = armvar)  %>%
    add_overall_col(lbl_overall) %>%
    add_colcounts()  %>%
    split_rows_by(
      "PARAM",
      split_fun = NULL
    ) %>%
    summarize_vars(vars = c("AVAL", "AVALCAT1"), show_labels = "hidden", var_labels = c("Summary", "Categories"))

}
