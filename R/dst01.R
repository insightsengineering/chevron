
#' Adverse Events by System Organ Class and Preferred Term Table
#'
#' @inheritParams gen_args
#'
#'
#' @details
#'  * dst01_1 == default
#'  * is the dataset always adsl? => YES
#'  * are the summary vars ever different from Completed Study and Discontinued Study (e.g include Ongoing?) => should be an option
#'  * Always split by ARM ? => should also be possible to be TRT01P/TREATsecp: decision is made outside of the template (above the template)
#'  * Always a total column? => YES as a standard (should be optional)
#'  * numeric variables are always count & fraction => YES
#'  * are fractions always x/N? => N
#'  * is the grouping into safety/non-safety fixed ? => safety is fixed (rest in non-safety or missing)
#'  * should 0 counts rows be removed? => YES
#'  * Should factor level be sorted ? => abc
#'  * What is the alternative count ? => ?
#'  *
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
#' dst01_1(adsl, adae, lbl_overall = "")
#'
#' dst01_2(adsl,adae)
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
                      lbl_overall = "All patients"
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
                          lbl_overall = "All patients"
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




#' Title
#'
#' @inheritParams gen_args
#'
#' @details
#'   * Non-standard
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
#' dst01_2(adsl, adae)
#' dst01_2(adsl, adae, lbl_overall = "All patients")
dst01_2 <- function(adsl, adae,
                    armvar = .study$armvar,
                    lbl_overall = .study$lbl_overall,
                    deco = std_deco("DST01"),
                    .study = list(
                      armvar = "ACTARM",
                      lbl_overall = "All patients"
                    )) {

  # TODO: discuss if this is truly in the function body
  adae <- adae %>%
    filter(bol_YN(ANL01FL))

  lbl_EOSSTT <- var_labels_for(adae, "EOSSTT")

  lyt <- dst01_2_lyt(
    armvar = armvar,
    lbl_EOSSTT = lbl_EOSSTT,
    lbl_overall = lbl_overall,
    deco = deco
  )

  adae_gp <- adae %>%
    mutate(DCSREASGP = case_when(
      DCSREAS %in% c("ADVERSE EVENT", "DEATH") ~ "Safety",
      DCSREAS == "<Missing>" ~ "<Missing>",
      TRUE ~ "Non Safety"
      )
    )

  tbl <- build_table(
    lyt,
    df = adae_gp
    # alt_counts_df = adsl # this part is a mystery
  )


  tbl_sorted <- tbl  %>%
  prune_table() # %>%
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


dst01_2_lyt <- function(armvar = .study$armvar,
                        lbl_overall = .study$lbl_overall,
                        lbl_EOSSTT = "EOSSTT",
                        deco = std_deco("DST01"),
                        .study = list(
                          armvar = "ACTARM",
                          lbl_overall = "All patients"
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
    split_rows_by(
      "DCSREASGP",
      split_fun = reorder_split_levels(neworder = c("Safety", "Non Safety"))
    ) %>%
    summarize_row_groups() %>%
    summarize_vars(
      "DCSREAS",
      .stats = "count_fraction",
      denom = "N_col"
    )
}




#' Title
#'
#' @inheritParams gen_args
#'
#' @details
#' * Is there a difference between completed treatment/study ? If yes, which variable can tell us that?
#'
#' @importFrom dplyr filter
#'
#' @export
#'
#' @examples
#' library(scda)
#' library(dplyr)
#' sd <- synthetic_cdisc_data("rcd_2021_03_22")
#' adsl <- sd$adsl
#' adae <- sd$adae %>%
#'  mutate(ANL01FL = 'Y',
#'         EOTSTT = sample(c("ONGOING","COMPLETED","DISCONTINUATED"),
#'                         nrow(adae),
#'                         replace = TRUE))
#'
#' dst01_3(adsl, adae)
#' dst01_3(adsl, adae, lbl_overall = "All patients")
#'
dst01_3 <- function(adsl, adae,
                    armvar = .study$armvar,
                    lbl_overall = .study$lbl_overall,
                    deco = std_deco("DST01"),
                    .study = list(
                      armvar = "ACTARM",
                      lbl_overall = "All patients"
                    )) {

  # TODO: discuss if this is truly in the function body
  adae <- adae %>%
    filter(bol_YN(ANL01FL))

  adae_gp <- adae %>%
    mutate(DCSREASGP = case_when(
      DCSREAS %in% c("ADVERSE EVENT", "DEATH") ~ "Safety",
      DCSREAS == "<Missing>" ~ "<Missing>",
      TRUE ~ "Non Safety"
    )
  )

  lbl_EOSSTT <- var_labels_for(adae, "EOSSTT")

  lyt <- dst01_3_lyt(
    armvar = armvar,
    lbl_EOSSTT = lbl_EOSSTT,
    lbl_overall = lbl_overall,
    deco = deco
  )

  tbl <- build_table(
    lyt,
    df = adae_gp
    # alt_counts_df = adsl # this part is a mystery

  )

  tbl_sorted <- tbl  %>%
    prune_table()

  #2nd table

  lbl_EOSSTT <- var_labels_for(adae, "EOSSTT")

  lyt <- dst01_2_lyt(
    armvar = armvar,
    lbl_EOSSTT = lbl_EOSSTT,
    lbl_overall = lbl_overall,
    deco = deco
  )

  tbl2 <- build_table(
    lyt,
    df = adae_gp
    # alt_counts_df = adsl # this part is a mystery
  )

  tbl_sorted2 <- tbl2  %>%
    prune_table()

  col_info(tbl_sorted2) <- col_info(tbl_sorted)

  tbl_sorted = rbind(tbl_sorted2, tbl_sorted)


  if (lbl_overall == "")
    tbl_sorted[, -ncol(tbl_sorted)]
  else
    tbl_sorted

}


dst01_3_lyt <- function(armvar = .study$armvar,
                        lbl_overall = .study$lbl_overall,
                        lbl_EOSSTT = "EOSSTT",
                        deco = std_deco("DST01"),
                        .study = list(
                          armvar = "ACTARM",
                          lbl_overall = "All patients"
                        )) {

  basic_table(title = deco$title, subtitles = deco$subtitles, main_footer = deco$main_footer)  %>%
    split_cols_by(var = armvar,
                  split_fun = add_overall_level(lbl_overall, first = FALSE)
    ) %>%
    add_colcounts() %>%
    #add_overall_col(label = lbl_overall) %>%
    count_values(
      var = "EOTSTT",
      values = "COMPLETED",
      .labels = c(count_fraction = "Completed Treatment")
    ) %>%
    count_values(
      var = "EOTSTT",
      values = "ONGOING",
      .labels = c(count_fraction = "Ongoing Treatment")
    ) %>%
    count_values(
      var = "EOTSTT",
      values = "DISCONTINUATED",
      .labels = c(count_fraction = "Discontinued Treatment")
    )
}


