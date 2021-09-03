
#' Patient Disposition Table
#'
#' @inheritParams gen_args
#' @param status variable used to define patient status
#' @param reason variable used to define reason for patient withdrawal
#'
#'
#' @details
#'  * Default patient disposition table summarizing the reasons for patients withdrawal
#'  * Numbers represent absolute numbers of patients and fraction of N
#'  * Remove zero-count rows
#'  * Split columns by arm
#'  * Include a total column by default
#'  * Sort withdrawal reasons by alphabetic order
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
#' adae <- sd$adae |>
#'  mutate(ANL01FL = 'Y')
#'
#' dst01_1(adsl, adae)
#' dst01_1(adsl, adae, lbl_overall = "")
#'
dst01_1 <- function(adsl, adae,
                    armvar = .study$armvar,
                    lbl_overall = .study$lbl_overall,
                    deco = std_deco("DST01"),
                    status = .study$status,
                    reason = .study$reason,
                    .study = list(
                      armvar = "ARM",
                      lbl_overall = "All patients",
                      status = "EOSSTT",
                      reason = "DCSREAS"
                    )) {

  match.arg(armvar, c("ARM","ACTARM","TRT01A","TRT01A"))
  match.arg(status, c("EOSSTT","EOPxxSTT"))
  match.arg(reason, c("DCSREAS","DCPxxRS"))

  adae <- adae |>
    filter(bol_YN(ANL01FL))

  lyt <- dst01_1_lyt(
    armvar = armvar,
    lbl_overall = lbl_overall,
    deco = deco,
    status = status,
    reason = reason
  )

  tbl <- build_table(
    lyt,
    df = adae
   # alt_counts_df = adsl # this part is a mystery
  )

  tbl_sorted <- tbl |>
    prune_table()

  if (lbl_overall == "")
    tbl_sorted[, -ncol(tbl_sorted)]
  else
    tbl_sorted

}


dst01_1_lyt <- function(armvar = .study$armvar,
                        lbl_overall = .study$lbl_overall,
                        deco = std_deco("DST01"),
                        status = .study$status,
                        reason = .study$reason,
                        .study = list(
                          armvar = "ARM",
                          lbl_overall = "All patients",
                          status = "EOSSTT",
                          reason = "DCSREAS"
                        )) {

  basic_table(title = deco$title, subtitles = deco$subtitles, main_footer = deco$main_footer)  |>
    split_cols_by(var = armvar,
                  split_fun = add_overall_level(lbl_overall, first = FALSE)
    ) |>
    add_colcounts() |>
    count_values(
      vars = status,
      values = "COMPLETED",
      .labels = c(count_fraction = "Completed Study")
    ) |>
    split_rows_by(
      status,
      split_fun = keep_split_levels("DISCONTINUED"),
    ) |>
    summarize_row_groups(label_fstr = "Discontinued Study") |>
    summarize_vars(
      reason,
      .stats = "count_fraction",
      denom = "N_col"
    )
}




#' Patient Disposition Table 2
#'
#' @inheritParams gen_args
#' @param status variable used to define patient status
#' @param reason variable used to define reason for patient withdrawal
#'
#' @details
#'  * Non-standard disposition table summarizing the reasons for patient withdrawal
#'  * Withdrawal reasons are grouped into Safety and Non-Safety issues
#'  * Safety issues include Death and Adverse event
#'  * Numbers represent absolute numbers of patients and fraction of N
#'  * Remove zero-count rows
#'  * Split columns by arm
#'  * Include a total column by default
#'  * Sort withdrawal reasons by alphabetic order
#'
#' @importFrom dplyr filter case_when mutate
#' @importFrom rlang sym
#'
#' @export
#'
#' @examples
#'
#' library(scda)
#' library(dplyr)
#' sd <- synthetic_cdisc_data("rcd_2021_03_22")
#' adsl <- sd$adsl
#' adae <- sd$adae |>
#'  mutate(ANL01FL = 'Y')
#'
#' dst01_2(adsl, adae)
#' dst01_2(adsl, adae, lbl_overall = "")
#'
dst01_2 <- function(adsl, adae,
                    armvar = .study$armvar,
                    lbl_overall = .study$lbl_overall,
                    deco = std_deco("DST01"),
                    status = .study$status,
                    reason = .study$reason,
                    .study = list(
                      armvar = "ARM",
                      lbl_overall = "All patients",
                      status = "EOSSTT",
                      reason = "DCSREAS"
                    )) {

  match.arg(armvar, c("ARM","ACTARM","TRT01A","TRT01A"))
  match.arg(status, c("EOSSTT","EOPxxSTT"))
  match.arg(reason, c("DCSREAS","DCPxxRS"))

  adae <- adae |>
    filter(bol_YN(ANL01FL))

  lyt <- dst01_2_lyt(
    armvar = armvar,
    status = status,
    reason = reason,
    lbl_overall = lbl_overall,
    deco = deco
  )

  sym_reason = sym(reason)

  adae_gp <- adae |>
    mutate(reasonGP = case_when(
      !!sym_reason %in% c("ADVERSE EVENT", "DEATH") ~ "Safety",
      !!sym_reason == "<Missing>" ~ "<Missing>",
      TRUE ~ "Non Safety"
    )
  )

  tbl <- build_table(
    lyt,
    df = adae_gp,
    # alt_counts_df = adsl # this part is a mystery
  )


  tbl_sorted <- tbl  |>
    prune_table()

  if (lbl_overall == "")
    tbl_sorted[, -ncol(tbl_sorted)]
  else
    tbl_sorted

}


dst01_2_lyt <- function(armvar = .study$armvar,
                        lbl_overall = .study$lbl_overall,
                        deco = std_deco("DST01"),
                        status = .study$status,
                        reason = .study$reason,
                        .study = list(
                          armvar = "ARM",
                          lbl_overall = "All patients",
                          status = "EOSSTT",
                          reason = "DCSREAS"
                        )) {

  basic_table(title = deco$title, subtitles = deco$subtitles, main_footer = deco$main_footer)  |>
    split_cols_by(var = armvar,
                  split_fun = add_overall_level(lbl_overall, first = FALSE)
    ) |>
    add_colcounts() |>
    count_values(
      vars = status,
      values = "COMPLETED",
      .labels = c(count_fraction = "Completed Study")
    ) |>
    split_rows_by(
      var = status,
      split_fun = keep_split_levels("DISCONTINUED")
    ) |>
    summarize_row_groups(label_fstr = "Discontinued Study") |>
    split_rows_by(
      "reasonGP",
      split_fun = reorder_split_levels(neworder = c("Safety", "Non Safety"))
    ) |>
    summarize_row_groups() |>
    summarize_vars(
      reason,
      .stats = "count_fraction",
      denom = "N_col"
    )
}




#' Patient Disposition Table 3
#'
#' @inheritParams gen_args
#' @param status variable used to define patient status
#' @param reason variable used to define reason for patient withdrawal
#' @param status_treatment variable used to define patient treatment status
#'
#' @details
#'  * Non-standard disposition table summarizing the reasons for patient withdrawal and treatment status
#'  * Withdrawal reasons are grouped into Safety and Non-Safety issues
#'  * Safety issues include Death and Adverse Event
#'  * Numbers represent absolute numbers of patients and fraction of N
#'  * Remove zero-count rows
#'  * Split columns by arm
#'  * Include a total column by default
#'  * Sort withdrawal reasons by alphabetic order
#'
#' @importFrom dplyr filter case_when mutate
#' @importFrom rlang sym
#'
#' @export
#'
#' @examples
#' library(scda)
#' library(dplyr)
#' sd <- synthetic_cdisc_data("rcd_2021_03_22")
#' adsl <- sd$adsl
#'
#' adae <- sd$adae |>
#'  mutate(ANL01FL = 'Y',
#'         EOTSTT = sample(c("ONGOING","COMPLETED","DISCONTINUED"),
#'                         nrow(sd$adae),
#'                         replace = TRUE))
#'
#' dst01_3(adsl, adae)
#' dst01_3(adsl, adae, lbl_overall = "")
#'
dst01_3 <- function(adsl, adae,
                    armvar = .study$armvar,
                    lbl_overall = .study$lbl_overall,
                    deco = std_deco("DST01"),
                    status = .study$status,
                    reason = .study$reason,
                    status_treatment = .study$status_treatment,
                    .study = list(
                      armvar = "ARM",
                      lbl_overall = "All patients",
                      status = "EOSSTT",
                      reason = "DCSREAS",
                      status_treatment = "EOTSTT"
                    )) {

  match.arg(armvar, c("ARM","ACTARM","TRT01A","TRT01A"))
  match.arg(status, c("EOSSTT","EOPxxSTT"))
  match.arg(reason, c("DCSREAS","DCPxxRS"))
  match.arg(status_treatment, c("EOTSTT","EOTxxSTT"))

  adae <- adae |>
    filter(bol_YN(ANL01FL))

  sym_reason = sym(reason)

  adae_gp <- adae |>
    mutate(reasonGP = case_when(
      !!sym_reason %in% c("ADVERSE EVENT", "DEATH") ~ "Safety",
      !!sym_reason == "<Missing>" ~ "<Missing>",
      TRUE ~ "Non Safety"
    )
  )

  lyt <- dst01_3_lyt(
    armvar = armvar,
    lbl_overall = lbl_overall,
    deco = deco,
    status_treatment = status_treatment,
  )

  tbl <- build_table(
    lyt,
    df = adae_gp
    # alt_counts_df = adsl # this part is a mystery
  )

  tbl_sorted <- tbl  |>
    prune_table()

  lyt <- dst01_2_lyt(
    armvar = armvar,
    lbl_overall = lbl_overall,
    deco = deco,
    status = status,
    reason = reason
  )

  tbl2 <- build_table(
    lyt,
    df = adae_gp
    # alt_counts_df = adsl # this part is a mystery
  )

  tbl_sorted2 <- tbl2  |>
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
                        deco = std_deco("DST01"),
                        status_treatment = .study$status,
                        .study = list(
                          armvar = "ARM",
                          lbl_overall = "All patients",
                          status_treatment = "EOTSTT"
                        )) {

  basic_table(title = deco$title, subtitles = deco$subtitles, main_footer = deco$main_footer)  |>
    split_cols_by(var = armvar,
                  split_fun = add_overall_level(lbl_overall, first = FALSE)
    ) |>
    add_colcounts() |>
    count_values(
      vars = status_treatment,
      values = "COMPLETED",
      .labels = c(count_fraction = "Completed Treatment"),
      table_names = c("COMPLETED")
    ) |>
    count_values(
      vars = status_treatment,
      values = "ONGOING",
      .labels = c(count_fraction = "Ongoing Treatment"),
      table_names = c("ONGOING")
    ) |>
    count_values(
      vars = status_treatment,
      values = "DISCONTINUED",
      .labels = c(count_fraction = "Discontinued Treatment"),
      table_names = c("DISCONTINUED")
    )
}


