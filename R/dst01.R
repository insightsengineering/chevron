
#' Adverse Events by System Organ Class and Preferred Term Table
#'
#' @inheritParams gen_args
#'
#'
#' @details
#'  * A disposition table summarizing the reasons for patient withdrawal
#'  * Split column by ARM
#'  * Include a total column
#'  * sort withdrawal reasons by alphabetic order
#'
#' @importFrom dplyr filter
#'
#' @export
#'
#' @examples
#'
#' library(scda)
#' library(dplyr)
#' sd <- synthetic_cdisc_data("rcd_2021_03_22")
#' adsl <- sd$adsl
#' adae <- sd$adae %>%
#'  mutate(ANL01FL = 'Y')
#'
#' dst01_1(adsl, adae)
#' dst01_1(adsl, adae, lbl_overall = "All Patients")
#'
#' adae <- adae %>% var_relabel(AEBODSYS = "Medra System Organ Class")
#' dst01_1(adsl, adae)
#'
dst01_1 <- function(adsl, adae,
                    armvar = .study$armvar,
                    lbl_overall = .study$lbl_overall,
                    deco = std_deco("DST01"),
                    .study = list(
                      armvar = "ACTARM",
                      lbl_overall = ""
                    )) {

  # TODO: discuss if this is truly in the function body
  adae <- adae %>%
    filter(bol_YN(ANL01FL))

  lbl_EOSSTT <- var_labels_for(adae, "EOSSTT")

  lyt <- dst01_1_lyt(
    armvar = armvar,
    lbl_EOSSTT = lbl_EOSSTT,
    lbl_overall = lbl_overall,
    deco = deco
  )

  tbl <- build_table(
    lyt,
    df = adae
   # alt_counts_df = adsl # this part is a mystery
  )


  tbl_sorted <- tbl # %>%
    # prune_table() %>%
    # sort_at_path(
    #   path =  c("AEBODSYS"),
    #   scorefun = cont_n_onecol(ncol(tbl))
    # ) %>%
    # sort_at_path(
    #   path = c("AEBODSYS", "*", "AEDECOD"),
    #   scorefun = score_occurrences
    # )

  if (lbl_overall == "")
    tbl_sorted[, -ncol(tbl_sorted)]
  else
    tbl_sorted

}


dst01_1_lyt <- function(armvar = .study$armvar,
                        lbl_overall = .study$lbl_overall,
                        lbl_EOSSTT = "EOSSTT",
                        deco = std_deco("DST01"),
                        .study = list(
                          armvar = "ACTARM",
                          lbl_overall = ""
                        )) {

  basic_table(title = deco$title, subtitles = deco$subtitles, main_footer = deco$main_footer)  %>%
    split_cols_by(var = armvar,
                  split_fun = add_overall_level(lbl_overall, first = FALSE)
    ) %>%
    add_colcounts() %>%
    #add_overall_col(label = lbl_overall) %>%
    count_values(
      var = "EOSSTT",
      values = "COMPLETED",
      .labels = c(count_fraction = "Completed Study")
    ) %>%
    split_rows_by(
      "EOSSTT",
      split_fun = keep_split_levels("DISCONTINUED")
    ) %>%
    summarize_row_groups(label_fstr = "Discontinued Study") %>%
    summarize_vars(
      "DCSREAS",
      .stats = "count_fraction",
      denom = "N_col"
    )
}
