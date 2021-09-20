#' Demographics and Baseline Characteristics Table
#'
#' For each variable, summary statistics are by default based on the number of patients in the corresponding `n` row.
#'
#' @inheritParams gen_args
#' @param summaryvars (`vector of strings`) variables summarized in demographic table.
#' Usually a vector containing the following one or more of the following:
#' `AAGE`, `AGEGR1`, `SEX`, `ETHNIC`, `RACE`, `BWGHTSI` and by default all of them.
#'
#' @details
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
#' library(scda)
#' adsl <- synthetic_cdisc_data("rcd_2021_03_22")$adsl
#'
#' dmt01_1(ad_bl = adsl, summaryvars = c("AGE", "RACE", "SEX"))
#'
#' dmt01_1(
#'  ad_bl = adsl,
#'  armvar = "ARMCD",
#'  summaryvars = c("AGE", "RACE")
#' )
#'
dmt01_1 <- function(ad_bl,
                    armvar = .study$armvar,
                    summaryvars = .study$summaryvars,
                    lbl_overall = .study$lbl_overall,
                    prune_0 = TRUE,
                    deco = std_deco("DMT01"),
                    .study = list(
                      armvar = "ARM",
                      summaryvars =  c("AAGE", "AGEGR1", "SEX", "ETHNIC", "RACE", "BWGHTSI"),
                      lbl_overall = "All Patients"
                    )) {

    # provide a clearer error message in the case of missing variable
    missing_var = setdiff(summaryvars,colnames(ad_bl))
    if(length(missing_var) > 0){

      stop(paste0("\nVariable(s) does not exist in the dataset: \n",
                  paste(missing_var, "\n", collapse = "")
                  )
           )
    }


  lyt <- dmt01_1_lyt(
    armvar = armvar,
    summaryvars = summaryvars,
    summaryvars_lbls = var_labels_for(ad_bl, summaryvars),
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
#' @param summaryvars (`vector of strings`) variables summarized in demographic table.
#' @param summaryvars_lbls (`vector of strings`) labels corresponding to the analyzed variables.
#'
#' @return
#' @export
#'
#' @examples
#' dmt01_1_lyt(armvar = "ACTARM",
#' summaryvars =  c("AAGE", "SEX", "ETHNIC"),
#' summaryvars_lbls = c("AGE", "SEX", "ETHNICITY"))
dmt01_1_lyt <- function(armvar = .study$armvar,
                        summaryvars = .study$summaryvars,
                        summaryvars_lbls = summaryvars,
                        lbl_overall = .study$lbl_overall,
                        deco = std_deco("DMT01"),
                        .study = list(
                          armvar = "ARM",
                          summaryvars =  c("AAGE", "AGEGR1", "SEX", "ETHNIC", "RACE", "BWGHTSI"),
                          overall_col = "All Patients"
                        )) {

  basic_table(title = deco$title, subtitles = deco$subtitles, main_footer = deco$main_footer) %>%
    split_cols_by(var = armvar) %>%
    add_overall_col(lbl_overall) %>%
    add_colcounts() %>%
    summarize_vars(vars = summaryvars, var_labels = summaryvars_lbls)
}
