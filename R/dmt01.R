#' DMT01 Table 1 (Default) Demographics and Baseline Characteristics Table
#'
#' For each variable, summary statistics are by default based on the number of patients in the corresponding `n` row.
#'
#' @inheritParams gen_args
#' @param summaryvars (`vector of strings`) variables summarized in demographic table.
#' Usually a vector containing the following one or more of the following:
#' `AAGE`, `AGEGR1`, `SEX`, `ETHNIC`, `RACE`, `BWGHTSI` and by default all of them.
#' @param summaryvars_lbls (`vector of strings`) labels corresponding to the analyzed variables.
#'
#' @details
#'  * Information from ADSUB are generally included into ADSL before analysis.
#'  * Default demographic and characteristics table
#'  * If not specified otherwise, numbers represent absolute numbers of patients and fraction of `N`
#'  * Remove zero-count rows
#'  * Split columns by arm (planned or actual / code or description)
#'  * Include a total column by default
#'
#' @importFrom magrittr %>%
#'
#' @export
#'
#' @examples
#'
#' library(dplyr)
#' library(scda)
#' adsl <- synthetic_cdisc_data("rcd_2021_03_22")$adsl
#' adsub <- synthetic_cdisc_data("rcd_2021_03_22")$adsub
#'
#' adsub_wide <- pivot_wider_labels(adsub, "PARAMCD", "PARAM", "AVAL", c("USUBJID"))
#'
#' adsl <- adsl %>% left_join(adsub_wide)
#'
#' dmt01_1(ad_bl = adsl, summaryvars = c("AGE", "RACE", "SEX", "BWGHTSI"))
#' dmt01_1(ad_bl = adsl, summaryvars = c("AGE", "RACE", "SEX"), summaryvars_lbls = c("Age (yr)", "Race", "Sex"))
#' dmt01_1(ad_bl = adsl, summaryvars = c("AGE", "RACE", "SEX"), lbl_overall = "")
#'
dmt01_1 <- function(ad_bl,
                    armvar = .study$armvar,
                    summaryvars = .study$summaryvars,
                    summaryvars_lbls = var_labels_for(ad_bl, summaryvars),
                    lbl_overall = .study$lbl_overall,
                    prune_0 = TRUE,
                    deco = std_deco("DMT01"),
                    .study = list(
                      armvar = "ARM",
                      summaryvars =  c("AAGE", "AGEGR1", "SEX", "ETHNIC", "RACE", "BWGHTSI"),
                      lbl_overall = "All Patients"
                    )) {

    # provide a clearer error message in the case of missing variable
    missing_var <- setdiff(summaryvars, colnames(ad_bl))
    if (length(missing_var) > 0) {

      stop(paste0("\nVariable(s) does not exist in the dataset: \n",
                  paste(missing_var, "\n", collapse = "")
                  )
           )
    }


  assert_that(length(summaryvars) == length(summaryvars_lbls))

  lyt <- dmt01_1_lyt(
    armvar = armvar,
    summaryvars = summaryvars,
    summaryvars_lbls = summaryvars_lbls,
    lbl_overall = lbl_overall,
    deco = deco
  )

  tbl <- build_table(lyt, ad_bl)

  if (prune_0)
    prune_table(tbl)
  else
    tbl
}


#' DMT01 Layout 1 (Default)
#'
#' @describeIn dmt01_1
#'
#' @inheritParams gen_args
#'
#' @param summaryvars (`vector of strings`) variables summarized in demographic table.
#' @param summaryvars_lbls (`vector of strings`) labels corresponding to the analyzed variables.
#'
#' @return
#' @export
dmt01_1_lyt <- function(armvar = .study$armvar,
                        summaryvars = .study$summary_demo,
                        summaryvars_lbls = .study$summary_demo_lbl,
                        lbl_overall = .study$lbl_overall,
                        deco = std_deco("DMT01"),
                        .study = list(
                          armvar = "ARM",
                          summary_demo =  c("AAGE",
                                            "AGEGR1",
                                            "SEX",
                                            "ETHNIC",
                                            "RACE",
                                            "BWGHTSI"),
                          summary_demo_lbl = c("Age (yr)",
                                               "Pooled Age Group 1 (yr)",
                                               "SEX",
                                               "ETHNIC",
                                               "RACE",
                                               "Baseline Weight (kg)"),
                          lbl_overall = "All Patients"
                        )) {

  summaryvars_lbls <- paste0(
    c("", rep("\n", length(summaryvars_lbls) - 1)),
    summaryvars_lbls)


  layout_table <-  basic_table(title = deco$title, subtitles = deco$subtitles, main_footer = deco$main_footer) %>%
    split_cols_by(var = armvar) %>%
    add_colcounts()

  if (!identical(lbl_overall, "")) layout_table <- layout_table %>% add_overall_col(lbl_overall)

  layout_table %>%
    summarize_vars(vars = summaryvars, var_labels = summaryvars_lbls)

}
