
# Avoid non-standard argument values for `status`, `reason` and `status_treatment` In `EOPxxSTT`, `DCPxxRS` amd
# `EOTxxSTT` the analysis period `xx` is substituted by 2 digits
check_dst01_1_args <- function(reason, status, status_treatment) {

  if (!missing(status))
    stopifnot(status == "EOSSTT" || grepl("^EOP[[:digit:]]{2}STT$", status))

  if (!missing(reason))
    stopifnot(reason == "DCSREAS" || grepl("^DCP[[:digit:]]{2}RS$", reason))

  if (!missing(status_treatment))
    stopifnot(status_treatment == "EOTSTT" || grepl("^EOT[[:digit:]]{2}STT$", status_treatment))

}

#' DST01 Table 1 (Default) Patient Disposition Table 1
#'
#' The DST01 Disposition Table provides an overview of patients study completion. For patients who discontinued the
#' study a reason is provided.
#'
#' @inheritParams gen_args
#' @param armvar (`character`) variable. Usually one of `ARM`, `ACTARM`, `TRT01A`, or `TRT01A`.
#' @param status (`character`) variable used to define patient status. Default is `EOSSTT`, however can also be a
#'   variable name with the pattern `EOPxxSTT` where `xx` must be substituted by 2 digits referring to the analysis
#'   period.
#' @param reason (`character`) variable used to define reason for patient withdrawal. Default is `DCSREAS`, however can
#'   also be a variable with the pattern `DCPxxRS` where `xx` must be substituted by 2 digits referring to the analysis
#'   period.
#'
#'
#' @details
#'  * Default patient disposition table summarizing the reasons for patients withdrawal.
#'  * Numbers represent absolute numbers of patients and fraction of `N`.
#'  * Remove zero-count rows.
#'  * Split columns by arm.
#'  * Include a total column by default.
#'  * Sort withdrawal reasons by alphabetic order.
#'
#' @importFrom dplyr filter
#' @importFrom magrittr %>%
#'
#' @export
#'
#' @examples
#'
#' library(scda)
#' library(dplyr)
#'
#' sd <- synthetic_cdisc_data("rcd_2021_03_22")
#' adsl <- sd$adsl
#'
#' dst01_1(adsl)
#' dst01_1(adsl, lbl_overall = "")
#'
#' adsl$EOSSTT <- as.factor(toupper(adsl$EOSSTT))
#' dst01_1(adsl)
dst01_1 <- function(adsl,
                    armvar = .study$armvar,
                    lbl_overall = .study$lbl_overall,
                    status = "EOSSTT",
                    reason = "DCSREAS",
                    prune_0 = TRUE,
                    deco = std_deco("DST01"),
                    .study = list(
                      armvar = "ARM",
                      lbl_overall = "All patients"
                    )) {

  check_dst01_1_args(reason = reason,
                     status = status)

  status_lvl <- levels(adsl[[status]])

  completed_lbl <- status_lvl[grep("completed", status_lvl, ignore.case = TRUE)]
  discontinued_lbl <- status_lvl[grep("discontinued", status_lvl, ignore.case = TRUE)]
  ongoing_lbl <- status_lvl[grep("ongoing", status_lvl, ignore.case = TRUE)]

  lyt <- dst01_1_lyt(
    armvar = armvar,
    lbl_overall = lbl_overall,
    deco = deco,
    status = status,
    reason = reason,
    completed_lbl = completed_lbl,
    ongoing_lbl = ongoing_lbl,
    discontinued_lbl = discontinued_lbl
  )

  tbl_completed <- build_table(
    lyt[[1]],
    df = adsl
  )

  tbl_other <- build_table(
    lyt[[2]],
    df = adsl
  )

  if (prune_0) tbl_other <- tbl_other %>% prune_table()

  col_info(tbl_other) <- col_info(tbl_completed)

  tbl <- rbind(tbl_completed, tbl_other)

  header <- dst01_header(armvar = armvar,
                         deco = deco,
                         lbl_overall = lbl_overall)

  tbl <- header %>%  add_existing_table(tbl) %>%  build_table(adsl)

  tbl
}


#' DST01 Layout 1 (Default)
#'
#' @describeIn dst01_1
#'
#' @inheritParams gen_args
#'
#' @param status (`string`) variable used to define patient status. Default is `EOSSTT`, however can also be a variable
#'   name with the pattern `EOPxxSTT` where `xx` must be substituted by 2 digits referring to the analysis period.
#' @param reason (`string`) variable used to define reason for patient withdrawal. Default is `DCSREAS`, however can
#'   also be a variable with the pattern `DCPxxRS` where `xx` must be substituted by 2 digits referring to the analysis
#'   period.
#' @param completed_lbl (`string`) associated with completed study and found in the columns given by `status`. By
#'   Default `COMPLETED`.
#' @param ongoing_lbl (`string`) associated with ongoing treatment and found in the columns given by `status_treatment`.
#'   By Default `ONGOING.
#' @param discontinued_lbl (`string`) associated with discontinued study and found in the columns given by `status`. By
#'   Default `DISCONTINUED`.
#'
#'
#'
#' @return
#' @export
#'
#' @examples
#' dst01_1_lyt(armvar = "ACTARM",
#' status = "EOP01STT",
#' reason = "DCP01RS")
dst01_1_lyt <- function(armvar = .study$armvar,
                        lbl_overall = .study$lbl_overall,
                        status = .study$status,
                        reason = .study$reason,
                        deco = std_deco("DST01"),
                        completed_lbl = "COMPLETED",
                        ongoing_lbl = "ONGOING",
                        discontinued_lbl = "DISCONTINUED",
                        .study = list(
                          armvar = "ARM",
                          lbl_overall = "All patients",
                          status = "EOSSTT",
                          reason = "DCSREAS"
                        )) {

  layout_table <- basic_table(title = deco$title, subtitles = deco$subtitles, main_footer = deco$main_footer)  %>%
    split_cols_by(armvar) %>%
    add_colcounts()


  if (!identical(lbl_overall, "")) layout_table <- layout_table %>% add_overall_col(lbl_overall)

  layout_table_completed <-
  layout_table %>%
    count_values(
      vars = status,
      values = completed_lbl,
      .labels = c(count_fraction = "Completed Study")
    )

  layout_table_other <-
  layout_table %>%
    count_values(
      vars = status,
      values = ongoing_lbl,
      .labels = c(count_fraction = "Ongoing Study")
    ) %>%
    split_rows_by(
      status,
      split_fun = keep_split_levels(discontinued_lbl),
    ) %>%
    summarize_row_groups(label_fstr = "Discontinued Study") %>%
    summarize_vars(
      reason,
      .stats = "count_fraction",
      denom = "N_col"
    )

  list(layout_table_completed, layout_table_other)


}




#' DST01 Table 2 (Supplementary) Patient Disposition Table 2
#'
#' The DST01_2 Disposition Table provides an overview of patients study completion. For patients who discontinued the
#' study, the reason provided is categorized as "Safety" or "Non-Safety" issue.
#'
#' @inheritParams gen_args
#'
#' @param status (`character`) variable used to define patient status. Default is `EOSSTT`, however can also be a
#'   variable name with the pattern `EOPxxSTT` where `xx` must be substituted by 2 digits referring to the analysis
#'   period.
#' @param reason (`character`) variable used to define reason for patient withdrawal. Default is `DCSREAS`, however can
#'   also be a variable with the pattern `DCPxxRS` where `xx` must be substituted by 2 digits referring to the analysis
#'   period.
#'
#' @details
#'  * Non-standard disposition table summarizing the reasons for patient withdrawal.
#'  * Withdrawal reasons are grouped into Safety and Non-Safety issues.
#'  * Safety issues include Death and Adverse events.
#'  * Numbers represent absolute numbers of patients and fraction of `N`.
#'  * Remove zero-count rows.
#'  * Split columns by arm.
#'  * Include a total column by default.
#'  * Sort withdrawal reasons by alphabetic order.
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
#' dst01_2(adsl)
#' dst01_2(adsl, lbl_overall = "")
#'
dst01_2 <- function(adsl,
                    armvar = .study$armvar,
                    lbl_overall = .study$lbl_overall,
                    status = "EOSSTT",
                    reason = "DCSREAS",
                    prune_0 = TRUE,
                    deco = std_deco("DST01"),
                    .study = list(
                      armvar = "ARM",
                      lbl_overall = "All patients"
                    )) {

  check_dst01_1_args(reason = reason,
                     status = status)

  status_lvl <- levels(adsl[[status]])

  completed_lbl <- status_lvl[grep("completed", status_lvl, ignore.case = TRUE)]
  discontinued_lbl <- status_lvl[grep("discontinued", status_lvl, ignore.case = TRUE)]
  ongoing_lbl <- status_lvl[grep("ongoing", status_lvl, ignore.case = TRUE)]

  lyt <- dst01_2_lyt(
    armvar = armvar,
    status = status,
    reason = reason,
    completed_lbl = completed_lbl,
    discontinued_lbl = discontinued_lbl,
    lbl_overall = lbl_overall,
    ongoing_lbl = ongoing_lbl,
    deco = deco
  )

  sym_reason <- sym(reason)

  adsl_gp <- adsl %>%
    mutate(reasonGP = case_when(
      !!sym_reason %in% c("ADVERSE EVENT", "DEATH") ~ "Safety",
      !!sym_reason == "<Missing>" ~ "<Missing>",
      TRUE ~ "Non Safety"
    )
  )

  tbl_completed <- build_table(
    lyt[[1]],
    df = adsl_gp
  )

  tbl_other <- build_table(
    lyt[[2]],
    df = adsl_gp
  )

  if (prune_0) tbl_other <- tbl_other %>% prune_table()

  col_info(tbl_other) <- col_info(tbl_completed)

  tbl <- rbind(tbl_completed, tbl_other)

  header <- dst01_header(armvar = armvar,
                         deco = deco,
                         lbl_overall = lbl_overall)

  tbl <- header %>%  add_existing_table(tbl) %>%  build_table(adsl)

  tbl
}

#' DST01 Layout 2 (Supplementary)
#'
#' @describeIn dst01_2
#'
#' @inheritParams gen_args
#'
#' @param status (`string`) variable used to define patient status. Default is `EOSSTT`, however can also be a variable
#'   name with the pattern `EOPxxSTT` where `xx` must be substituted by 2 digits referring to the analysis period.
#' @param reason (`string`) variable used to define reason for patient withdrawal. Default is `DCSREAS`, however can
#'   also be a variable with the pattern `DCPxxRS` where `xx` must be substituted by 2 digits referring to the analysis
#'   period.
#' @param completed_lbl (`string`) associated with completed study and found in the columns given by `status`. By
#'   Default `COMPLETED`.
#' @param ongoing_lbl (`string`) associated with ongoing treatment and found in the columns given by `status_treatment`.
#'   By Default `ONGOING.
#' @param discontinued_lbl (`string`) associated with discontinued study and found in the columns given by `status`. By
#'   Default `DISCONTINUED`.
#'
#'
#' @return
#' @export
#'
#' @examples
#' dst01_2_lyt(armvar = "ACTARM",
#' status = "EOP01STT",
#' reason = "DCP01RS")
dst01_2_lyt <- function(armvar = .study$armvar,
                        lbl_overall = .study$lbl_overall,
                        status = .study$status,
                        reason = .study$reason,
                        deco = std_deco("DST01"),
                        completed_lbl = "COMPLETED",
                        ongoing_lbl = "ONGOING",
                        discontinued_lbl = "DISCONTINUED",
                        .study = list(
                          armvar = "ARM",
                          lbl_overall = "All patients",
                          status = "EOSSTT",
                          reason = "DCSREAS"
                        )) {

  layout_table <- basic_table(title = deco$title, subtitles = deco$subtitles, main_footer = deco$main_footer)  %>%
    split_cols_by(armvar) %>%
    add_colcounts()


  if (!identical(lbl_overall, "")) layout_table <- layout_table %>% add_overall_col(lbl_overall)

  layout_table_completed <-
  layout_table %>%
    count_values(
      vars = status,
      values = completed_lbl,
      .labels = c(count_fraction = "Completed Study")
    )

  layout_table_other <-
  layout_table %>%
    count_values(
      vars = status,
      values = ongoing_lbl,
      .labels = c(count_fraction = "Ongoing Study")
    ) %>%
    split_rows_by(
      var = status,
      split_fun = keep_split_levels(discontinued_lbl)
    ) %>%
    summarize_row_groups(label_fstr = "Discontinued Study") %>%
    split_rows_by(
      "reasonGP",
      split_fun = reorder_split_levels(neworder = c("Safety", "Non Safety"))
    ) %>%
    summarize_row_groups() %>%
    summarize_vars(
      reason,
      .stats = "count_fraction",
      denom = "N_col"
    )

  list(layout_table_completed, layout_table_other)
}




#' DST01 Table 3 (Supplementary) Patient Disposition Table 3
#'
#' The DST01_3 Disposition Table provides an overview of patients study treatment status.
#' For patients who discontinued the study, the reason provided is categorized as "Safety" or "Non-Safety" issue.
#'
#' @inheritParams gen_args
#'
#' @param status (`character`) variable used to define patient status. Default is `EOSSTT`, however can also be a
#'   variable name with the pattern `EOPxxSTT` where `xx` must be substituted by 2 digits referring to the analysis
#'   period.
#' @param reason (`character`) variable used to define reason for patient withdrawal. Default is `DCSREAS`, however can
#'   also be a variable with the pattern `DCPxxRS` where `xx` must be substituted by 2 digits referring to the analysis
#'   period.
#' @param status_treatment (`character`) variable used to define the treatment status of the patients. Default is
#'   `EOTSTT`, however can also be a variable with the pattern `EOTxxSTT` where `xx` must be substituted by 2 digits
#'   referring to the analysis period.
#'
#' @details
#'  * Non-standard disposition table summarizing the reasons for patient withdrawal and treatment status.
#'  * Withdrawal reasons are grouped into Safety and Non-Safety issues.
#'  * Safety issues include Death and Adverse Events.
#'  * Numbers represent absolute numbers of patients and fraction of `N`.
#'  * Remove zero-count rows.
#'  * Split columns by arm.
#'  * Include a total column by default.
#'  * Sort withdrawal reasons by alphabetic order.
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
#'
#' adsl <- sd$adsl %>%
#'  mutate(ANL01FL = 'Y',
#'         EOTSTT = as.factor(sample(c("ONGOING", "COMPLETED", "DISCONTINUED"),
#'                         nrow(sd$adsl),
#'                         replace = TRUE)))
#'
#' dst01_3(adsl)
#' dst01_3(adsl, lbl_overall = "")
#'
#' adsl <- adsl %>% filter(EOSSTT != "COMPLETED")
#' dst01_3(adsl)
#'
dst01_3 <- function(adsl,
                    armvar = .study$armvar,
                    lbl_overall = .study$lbl_overall,
                    status = "EOSSTT",
                    reason = "DCSREAS",
                    prune_0 = TRUE,
                    status_treatment = "EOTSTT",
                    deco = std_deco("DST01"),
                    .study = list(
                      armvar = "ARM",
                      lbl_overall = "All patients"
                    )) {

  check_dst01_1_args(reason = reason,
                     status = status,
                     status_treatment = status_treatment)

  status_lvl <- levels(adsl[[status_treatment]])
  completed_lbl <- status_lvl[grep("completed", status_lvl, ignore.case = TRUE)]
  discontinued_lbl <- status_lvl[grep("discontinued", status_lvl, ignore.case = TRUE)]
  ongoing_lbl <- status_lvl[grep("ongoing", status_lvl, ignore.case = TRUE)]

  sym_reason <- sym(reason)

  adsl_gp <- adsl %>%
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
    completed_lbl = completed_lbl,
    ongoing_lbl = ongoing_lbl,
    discontinued_lbl = discontinued_lbl,
    status_treatment = status_treatment,
  )

  tbl <- build_table(
    lyt,
    df = adsl_gp
  )

  # re-extract the labels associated with status in case they changed.
  status_lvl <- levels(adsl[[status]])
  completed_lbl <- status_lvl[grep("completed", status_lvl, ignore.case = TRUE)]
  discontinued_lbl <- status_lvl[grep("discontinued", status_lvl, ignore.case = TRUE)]
  ongoing_lbl <- status_lvl[grep("ongoing", status_lvl, ignore.case = TRUE)]

  lyt <- dst01_2_lyt(
    armvar = armvar,
    lbl_overall = lbl_overall,
    deco = deco,
    completed_lbl = completed_lbl,
    ongoing_lbl = ongoing_lbl,
    discontinued_lbl = discontinued_lbl,
    status = status,
    reason = reason
  )


  tbl_completed <- build_table(
    lyt[[1]],
    df = adsl_gp
  )

  tbl_other <- build_table(
    lyt[[2]],
    df = adsl_gp
  )

  if (prune_0) tbl_other <- tbl_other %>% prune_table()

  col_info(tbl_other) <- col_info(tbl_completed)

  tbl2 <- rbind(tbl_completed, tbl_other)

  col_info(tbl) <- col_info(tbl2)

  if (prune_0) tbl <- tbl %>% prune_table()

  tbl <- rbind(tbl2, tbl)

  header <- dst01_header(armvar = armvar,
                         deco = deco,
                         lbl_overall = lbl_overall)

  tbl <- header %>%  add_existing_table(tbl) %>%  build_table(adsl)

  tbl
}

#' DST01 Layout 3 (Supplementary)
#'
#' @describeIn dst01_3
#'
#' @inheritParams gen_args
#'
#' @param status_treatment (`string`) variable used to define the treatment status of the patients. Default is `EOTSTT`,
#'   however can also be a variable with the pattern `EOTxxSTT` where `xx` must be substituted by 2 digits referring to
#'   the analysis period.
#' @param completed_lbl (`string`) associated with completed treatment and found in the columns given by
#'   `status_treatment`. By Default `COMPLETED`.
#' @param discontinued_lbl (`string`) associated with discontinued treatment and found in the columns given by
#'   `status_treatment`. By Default `DISCONTINUED`.
#' @param ongoing_lbl (`string`) associated with ongoing treatment and found in the columns given by `status_treatment`.
#'   By Default `ONGOING.
#'
#' @return
#' @export
#'
#' @examples
#' dst01_3_lyt(armvar = "ACTARM",
#' status_treatment = "EOTxx01")
dst01_3_lyt <- function(armvar = .study$armvar,
                        lbl_overall = .study$lbl_overall,
                        status_treatment = .study$status,
                        deco = std_deco("DST01"),
                        completed_lbl = "COMPLETED",
                        discontinued_lbl = "DISCONTINUED",
                        ongoing_lbl = "ONGOING",
                        .study = list(
                          armvar = "ARM",
                          lbl_overall = "All patients",
                          status_treatment = "EOTSTT"
                        )) {

  layout_table <- basic_table(title = deco$title, subtitles = deco$subtitles, main_footer = deco$main_footer)  %>%
    split_cols_by(armvar) %>%
    add_colcounts()


  if (!identical(lbl_overall, "")) layout_table <- layout_table %>% add_overall_col(lbl_overall)

  layout_table %>%
    count_values(
      vars = status_treatment,
      values = completed_lbl,
      .labels = c(count_fraction = "Completed Treatment"),
      table_names = c("COMPLETED")
    ) %>%
    count_values(
      vars = status_treatment,
      values = ongoing_lbl,
      .labels = c(count_fraction = "Ongoing Treatment"),
      table_names = c("ONGOING")
    ) %>%
    count_values(
      vars = status_treatment,
      values = discontinued_lbl,
      .labels = c(count_fraction = "Discontinued Treatment"),
      table_names = c("DISCONTINUED")
    )
}



#' Header for `DST01`
#'
#' @inheritParams gen_args
#' @describeIn dst01_1
#'
#' @return
dst01_header <- function(armvar = .study$armvar,
                         deco,
                         lbl_overall = .study$lbl_overall,
                         .study = list(armvar = "ARM",
                                       lbl_overall = ""
                         )) {

  basic_table(title = deco$title, subtitles = deco$subtitles, main_footer = deco$main_footer) %>%
    split_cols_by(armvar) %>%
    add_colcounts() %>%
    add_overall_col(lbl_overall)
}


