#' Demographics and Baseline Characteristics Table
#'
#' For each variable, summary statistics are by default based on the number of patients in the corresponding `n` row.
#'
#' @inheritParams gen_args
#' @param summaryvars variables summarized in demographic table
#'
#' @details
#' Questions for a standard:
#'
#' 1. is the data ever different than adsl
#'    - generally no, as adsub variables need to be merged in
#'    - > still want to stay specific, this is a special case > ad_bl
#' 1a. get the standard variables
#'    - c("AAGE", "AGEGR1", "SEX", "ETHNIC", "RACE", "BWGHTSI")
#' 2. only split on one variable
#'     - no in the column
#'     - theoretically yes in row space but we can either treat it as a non-standard
#'       (if it not in the lopo) or as a standard variant
#' 3. always total column
#'     - yes - can be a different label
#' 4. numeric variables
#'     - only n, Mean (SD), Median, Min - Max >> yes - precision on a study level
#' 5. categorical variables
#'    - remove zero counts
#'          yes by default, if no then it's a non-standard or dmt01_2
#'    - prop. = c/n or c/N > c/N
#'    - sorting
#'       - factor levels (default)
#'       - frequency counts (freq) (req total column)
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
#'  summaryvars = c("AGE", "RACE", "SEX")
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
