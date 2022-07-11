
# Avoid non-standard argument values for `status`, `reason` and `status_treatment` In `EOPxxSTT`, `DCPxxRS` amd
# `EOTxxSTT` the analysis period `xx` is substituted by 2 digits
check_dst01_1_args <- function(reason, status, status_treatment) {
  if (!missing(status)) {
    stopifnot(status == "EOSSTT" || grepl("^EOP[[:digit:]]{2}STT$", status))
  }

  if (!missing(reason)) {
    stopifnot(reason == "DCSREAS" || grepl("^DCP[[:digit:]]{2}RS$", reason))
  }

  if (!missing(status_treatment)) {
    stopifnot(status_treatment == "EOTSTT" || grepl("^EOT[[:digit:]]{2}STT$", status_treatment))
  }
}


# DST01_1 ----

#' DST01 Table 1 (Default) Patient Disposition Table 1.
#'
#' The DST01 Disposition Table provides an overview of patients
#' study completion. For patients who discontinued the study a reason is provided.
#'
#' @inheritParams gen_args
#' @param armvar (`character`) variable. Usually one of `ARM`, `ACTARM`, `TRT01A`, or `TRT01A`.
#' @param status_var (`character`) variable used to define patient status. Default is `EOSSTT`, however can also be a
#'   variable name with the pattern `EOPxxSTT` where `xx` must be substituted by 2 digits referring to the analysis
#'   period.
#' @param disc_reason_var (`character`) variable used to define reason for patient withdrawal. Default is `DCSREAS`,
#'   however can also be a variable with the pattern `DCPxxRS` where `xx` must be substituted by 2 digits referring to
#'   the analysis period.
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
#' @export
#'
#' @examples
#' library(dm)
#'
#' db <- syn_test_data() %>%
#'   dst01_1_pre()
#'
#' dst01_1_main(db)
dst01_1_main <- function(adam_db,
                         armvar = .study$planarm,
                         status_var = .study$status_var,
                         disc_reason_var = .study$disc_reason_var,
                         prune_0 = TRUE,
                         lbl_overall = .study$lbl_overall,
                         deco = std_deco("DST01"),
                         .study = list(
                           planarm = "ARM",
                           lbl_overall = "All Patients",
                           disc_reason_var = "DCSREAS",
                           status_var = "EOSSTT"
                         )) {
  check_dst01_1_args(
    reason = disc_reason_var,
    status = status_var
  )


  # TODO: review later
  status_lvl <- levels(adam_db$adsl[[status_var]])

  completed_lbl <- status_lvl[grep("completed", status_lvl, ignore.case = TRUE)]
  discontinued_lbl <- status_lvl[grep("discontinued", status_lvl, ignore.case = TRUE)]
  ongoing_lbl <- status_lvl[grep("ongoing", status_lvl, ignore.case = TRUE)]

  lyt <- dst01_1_lyt(
    armvar = armvar,
    lbl_overall = lbl_overall,
    deco = deco,
    status = status_var,
    disc_reason_var = disc_reason_var,
    completed_lbl = completed_lbl,
    ongoing_lbl = ongoing_lbl,
    discontinued_lbl = discontinued_lbl
  )

  tbl_completed <- build_table(
    lyt[[1]],
    df = adam_db$adsl
  )

  tbl_other <- build_table(
    lyt[[2]],
    df = adam_db$adsl
  )

  if (prune_0) tbl_other <- tbl_other %>% prune_table()

  col_info(tbl_other) <- col_info(tbl_completed)

  tbl <- rbind(tbl_completed, tbl_other)

  tbl <- set_decoration(tbl, deco)

  tbl
}


#' @describeIn dst01_1_main `dst01_1` Layout
#'
#' @inheritParams gen_args
#'
#' @param status (`string`) variable used to define patient status. Default is `EOSSTT`, however can also be a variable
#'   name with the pattern `EOPxxSTT` where `xx` must be substituted by 2 digits referring to the analysis period.
#' @param disc_reason_var (`string`) variable used to define reason for patient withdrawal. Default is `DCSREAS`,
#'   however can also be a variable with the pattern `DCPxxRS` where `xx` must be substituted by 2 digits referring to
#'   the analysis period.
#' @param completed_lbl (`string`) associated with completed study and found in the columns given by `status`. By
#'   Default `COMPLETED`.
#' @param ongoing_lbl (`string`) associated with ongoing treatment and found in the columns given by `status_treatment`.
#'   By Default `ONGOING.
#' @param discontinued_lbl (`string`) associated with discontinued study and found in the columns given by `status`. By
#'   Default `DISCONTINUED`.
#'
#' @details Since the two parts of the tables are pruned differently, the layout function returns a list of layouts,
#'   which allows the tables to be constructed and pruned separately before binding.
#'
#' @export
#'
#' @examples
#' dst01_1_lyt(
#'   armvar = "ACTARM",
#'   status = "EOP01STT",
#'   disc_reason_var = "DCP01RS"
#' )
dst01_1_lyt <- function(armvar = .study$planarm,
                        status = .study$status,
                        disc_reason_var = .study$disc_reason_var,
                        completed_lbl = "COMPLETED",
                        ongoing_lbl = "ONGOING",
                        discontinued_lbl = "DISCONTINUED",
                        lbl_overall = .study$lbl_overall,
                        deco = std_deco("DST01"),
                        .study = list(
                          planarm = "ARM",
                          lbl_overall = "All Patients",
                          status = "EOSSTT",
                          disc_reason_var = "DCSREAS"
                        )) {
  layout_table <- basic_table_deco(deco) %>%
    split_cols_by(armvar) %>%
    add_colcounts() %>%
    ifneeded_add_overall_col(lbl_overall)

  layout_table_completed <-
    layout_table %>%
    count_values(
      vars = status,
      values = completed_lbl,
      .labels = c(count_fraction = "Completed Study"),
      .formats = "xx (xx.x%)"
    )

  layout_table_other <-
    layout_table %>%
    count_values(
      vars = status,
      values = ongoing_lbl,
      .labels = c(count_fraction = "Ongoing"),
      .formats = "xx (xx.x%)"
    ) %>%
    split_rows_by(
      status,
      split_fun = keep_split_levels(discontinued_lbl),
    ) %>%
    summarize_row_groups(label_fstr = "Discontinued Study", format = "xx (xx.x%)") %>%
    summarize_vars(
      disc_reason_var,
      .stats = "count_fraction",
      denom = "N_col",
      formats = "xx (xx.x%)"
    )

  list(layout_table_completed, layout_table_other)
}


#' @describeIn dst01_1_main `dst01_1` Preprocessing
#'
#' @inheritParams gen_args
#' @param ... not used.
#'
#' @export
#'
#' @examples
#' syn_test_data() %>%
#'   dst01_1_pre()
dst01_1_pre <- function(adam_db, ...) {
  adam_db
}

# `DST01_1` Pipeline ----

#' `DST01_1`
#'
#' @seealso [dst01_1_main()]
#' @rdname chevron_tlg-class
#' @export
dst01_1 <- chevron_tlg(dst01_1_main, dst01_1_pre, adam_datasets = c("adsl"))


# DST01_2 ----

#' DST01 Table 2 (Supplementary) Patient Disposition Table 2.
#'
#' The DST01_2 Disposition Table provides an overview of
#' patients study completion. For patients who discontinued the study, the reason provided is categorized as "Safety" or
#' "Non-Safety" issue.
#'
#' @inheritParams gen_args
#'
#' @param status_var (`character`) variable used to define patient status. Default is `EOSSTT`, however can also be a
#'   variable name with the pattern `EOPxxSTT` where `xx` must be substituted by 2 digits referring to the analysis
#'   period.
#' @param disc_reason_var (`character`) variable used to define reason for patient withdrawal. Default is `DCSREAS`,
#'   however can also be a variable with the pattern `DCPxxRS` where `xx` must be substituted by 2 digits referring to
#'   the analysis period.
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
#' @export
#'
#' @examples
#' library(dm)
#'
#' db <- syn_test_data() %>%
#'   dst01_2_pre()
#'
#' dst01_2_main(db)
#' dst01_2_main(db, lbl_overall = NULL)
dst01_2_main <- function(adam_db,
                         armvar = .study$planarm,
                         status_var = .study$status_var,
                         disc_reason_var = .study$disc_reason_var,
                         lbl_overall = .study$lbl_overall,
                         prune_0 = TRUE,
                         deco = std_deco("DST01"),
                         .study = list(
                           planarm = "ARM",
                           lbl_overall = "All Patients",
                           disc_reason_var = "DCSREAS",
                           status_var = "EOSSTT"
                         )) {
  check_dst01_1_args(
    reason = disc_reason_var,
    status = status_var
  )

  status_lvl <- levels(adam_db$adsl[[status_var]])

  completed_lbl <- status_lvl[grep("completed", status_lvl, ignore.case = TRUE)]
  discontinued_lbl <- status_lvl[grep("discontinued", status_lvl, ignore.case = TRUE)]
  ongoing_lbl <- status_lvl[grep("ongoing", status_lvl, ignore.case = TRUE)]

  lyt <- dst01_2_lyt(
    armvar = armvar,
    status = status_var,
    disc_reason_var = disc_reason_var,
    completed_lbl = completed_lbl,
    discontinued_lbl = discontinued_lbl,
    lbl_overall = lbl_overall,
    ongoing_lbl = ongoing_lbl,
    deco = deco
  )

  tbl_completed <- build_table(
    lyt[[1]],
    df = adam_db$adsl
  )

  tbl_other <- build_table(
    lyt[[2]],
    df = adam_db$adsl
  )

  if (prune_0) tbl_other <- tbl_other %>% prune_table()

  col_info(tbl_other) <- col_info(tbl_completed)

  tbl <- rbind(tbl_completed, tbl_other)

  tbl <- set_decoration(tbl, deco)

  tbl
}


#' @describeIn dst01_2_main `dst01_2` Layout
#'
#' @inheritParams gen_args
#'
#' @param status (`string`) variable used to define patient status. Default is `EOSSTT`, however can also be a variable
#'   name with the pattern `EOPxxSTT` where `xx` must be substituted by 2 digits referring to the analysis period.
#' @param disc_reason_var (`string`) variable used to define reason for patient withdrawal. Default is `DCSREAS`,
#'   however can also be a variable with the pattern `DCPxxRS` where `xx` must be substituted by 2 digits referring to
#'   the analysis period.
#' @param completed_lbl (`string`) associated with completed study and found in the columns given by `status`. By
#'   Default `COMPLETED`.
#' @param ongoing_lbl (`string`) associated with ongoing treatment and found in the columns given by `status_treatment`.
#'   By Default `ONGOING.
#' @param discontinued_lbl (`string`) associated with discontinued study and found in the columns given by `status`. By
#'   Default `DISCONTINUED`.
#'
#' @details Since the two parts of the tables are pruned differently, the layout function returns a list of layouts,
#'   which allows the tables to be constructed and pruned separately before binding.
#'
#' @export
#'
#' @examples
#' dst01_2_lyt(
#'   armvar = "ACTARM",
#'   status = "EOP01STT",
#'   disc_reason_var = "DCP01RS"
#' )
dst01_2_lyt <- function(armvar = .study$planarm,
                        status = .study$status,
                        disc_reason_var = .study$disc_reason_var,
                        completed_lbl = "COMPLETED",
                        ongoing_lbl = "ONGOING",
                        discontinued_lbl = "DISCONTINUED",
                        lbl_overall = .study$lbl_overall,
                        deco = std_deco("DST01"),
                        .study = list(
                          planarm = "ARM",
                          lbl_overall = "All Patients",
                          status = "EOSSTT",
                          disc_reason_var = "DCSREAS"
                        )) {
  layout_table <- basic_table_deco(deco) %>%
    split_cols_by(armvar) %>%
    add_colcounts() %>%
    ifneeded_add_overall_col(lbl_overall)

  layout_table_completed <- layout_table %>%
    count_values(
      vars = status,
      values = completed_lbl,
      .labels = c(count_fraction = "Completed Study"),
      .formats = "xx (xx.x%)"
    )

  layout_table_other <- layout_table %>%
    count_values(
      vars = status,
      values = ongoing_lbl,
      .labels = c(count_fraction = "Ongoing"),
      .formats = "xx (xx.x%)"
    ) %>%
    split_rows_by(
      var = status,
      split_fun = keep_split_levels(discontinued_lbl)
    ) %>%
    summarize_row_groups(label_fstr = "Discontinued Study") %>%
    split_rows_by(
      "reasonGP",
      split_fun = reorder_split_levels(neworder = c("Safety", "Non-safety"))
    ) %>%
    summarize_row_groups(format = "xx (xx.x%)") %>%
    summarize_vars(
      disc_reason_var,
      .stats = "count_fraction",
      denom = "N_col",
      formats = "xx (xx.x%)"
    )

  list(completed = layout_table_completed, other = layout_table_other)
}


#' @describeIn dst01_2_main `dst01_2` Preprocessing
#'
#' @inheritParams gen_args
#' @param reason (`string`) the variable name for variable with the reason for discontinuation.
#' @param ... not used.
#'
#' @export
#'
#' @examples
#' syn_test_data() %>%
#'   dst01_2_pre()
dst01_2_pre <- function(adam_db,
                        reason = .study$disc_reason_var,
                        .study = list(disc_reason_var = "DCSREAS"),
                        ...) {
  checkmate::assert_class(adam_db, "dm")

  adam_db %>%
    dm_zoom_to("adsl") %>%
    mutate(reasonGP = case_when(
      .data[[reason]] %in% c("ADVERSE EVENT", "DEATH") ~ "Safety",
      .data[[reason]] == "<Missing>" ~ "<Missing>",
      TRUE ~ "Non-safety"
    )) %>%
    dm_update_zoomed()
}

# `DST01_2` Pipeline ----

#' `DST01_2`
#'
#' @seealso [dst01_2_main()]
#' @rdname chevron_tlg-class
#' @export
dst01_2 <- chevron_tlg(dst01_2_main, dst01_2_pre, adam_datasets = c("adsl"))

# DST01_3 ----

#' DST01 Table 3 (Supplementary) Patient Disposition Table 3.
#'
#' The DST01_3 Disposition Table provides an overview of patients study treatment status. For patients who discontinued
#' the study, the reason provided is categorized as "Safety" or "Non-Safety" issue.
#'
#' @inheritParams gen_args
#'
#' @param status (`character`) variable used to define patient status. Default is `EOSSTT`, however can also be a
#'   variable name with the pattern `EOPxxSTT` where `xx` must be substituted by 2 digits referring to the analysis
#'   period.
#' @param disc_reason_var (`character`) variable used to define reason for patient withdrawal. Default is `DCSREAS`,
#'   however can also be a variable with the pattern `DCPxxRS` where `xx` must be substituted by 2 digits referring to
#'   the analysis period.
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
#' @export
#'
#' @examples
#' library(dm)
#'
#' db <- syn_test_data() %>%
#'   dst01_3_pre()
#'
#' dst01_3_main(db)
#' dst01_3_main(db, lbl_overall = NULL)
dst01_3_main <- function(adam_db,
                         armvar = .study$planarm,
                         status = .study$status_var,
                         disc_reason_var = .study$disc_reason_var,
                         status_treatment = "EOTSTT",
                         lbl_overall = .study$lbl_overall,
                         prune_0 = TRUE,
                         deco = std_deco("DST01"),
                         .study = list(
                           planarm = "ARM",
                           disc_reason_var = "DCSREAS",
                           lbl_overall = "All Patients",
                           status_var = "EOSSTT"
                         )) {
  check_dst01_1_args(
    reason = disc_reason_var,
    status = status,
    status_treatment = status_treatment
  )

  # TODO: revisit
  status_lvl <- levels(adam_db$adsl[[status_treatment]])
  completed_lbl <- status_lvl[grep("completed", status_lvl, ignore.case = TRUE)]
  discontinued_lbl <- status_lvl[grep("discontinued", status_lvl, ignore.case = TRUE)]
  ongoing_lbl <- status_lvl[grep("ongoing", status_lvl, ignore.case = TRUE)]

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
    df = adam_db$adsl
  )

  # TODO: revisit later
  # re-extract the labels associated with status in case they changed.
  status_lvl <- levels(adam_db$adsl[[status]])
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
    disc_reason_var = disc_reason_var
  )


  tbl_completed <- build_table(
    lyt[[1]],
    df = adam_db$adsl
  )

  tbl_other <- build_table(
    lyt[[2]],
    df = adam_db$adsl
  )

  if (prune_0) tbl_other <- tbl_other %>% prune_table()

  col_info(tbl_other) <- col_info(tbl_completed)

  tbl2 <- rbind(tbl_completed, tbl_other)

  col_info(tbl) <- col_info(tbl2)

  if (prune_0) tbl <- prune_table(tbl)

  tbl <- rbind(tbl2, tbl)

  tbl <- set_decoration(tbl, deco)

  tbl
}


#' @describeIn dst01_3_main `dst01_3` Layout
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
#' @export
#'
#' @examples
#' dst01_3_lyt(
#'   armvar = "ACTARM",
#'   status_treatment = "EOTxx01"
#' )
dst01_3_lyt <- function(armvar = .study$planarm,
                        status_treatment = .study$status,
                        completed_lbl = "COMPLETED",
                        discontinued_lbl = "DISCONTINUED",
                        ongoing_lbl = "ONGOING",
                        lbl_overall = .study$lbl_overall,
                        deco = std_deco("DST01"),
                        .study = list(
                          planarm = "ARM",
                          lbl_overall = "All Patients",
                          status_treatment = "EOTSTT"
                        )) {
  layout_table <- basic_table_deco(deco) %>%
    split_cols_by(armvar) %>%
    add_colcounts() %>%
    ifneeded_add_overall_col(lbl_overall) %>%
    count_values(
      vars = status_treatment,
      values = completed_lbl,
      .labels = c(count_fraction = "Completed Treatment"),
      .formats = "xx (xx.x%)",
      table_names = c("COMPLETED")
    ) %>%
    count_values(
      vars = status_treatment,
      values = ongoing_lbl,
      .labels = c(count_fraction = "Ongoing Treatment"),
      .formats = "xx (xx.x%)",
      table_names = c("ONGOING")
    ) %>%
    count_values(
      vars = status_treatment,
      values = discontinued_lbl,
      .labels = c(count_fraction = "Discontinued Treatment"),
      .formats = "xx (xx.x%)",
      table_names = c("DISCONTINUED")
    )
}


#' @describeIn dst01_3_main `dst01_3` Preprocessing
#'
#' @inheritParams gen_args
#' @param reason (`character`) the variable name for variable with the reason for discontinuation.
#' @param ... not used.
#'
#' @export
#'
#' @examples
#' syn_test_data() %>%
#'   dst01_3_pre()
dst01_3_pre <- function(adam_db,
                        reason = .study$disc_reason_var,
                        .study = list(disc_reason_var = "DCSREAS"),
                        ...) {
  checkmate::assert_class(adam_db, "dm")

  adam_db %>%
    dm_zoom_to("adsl") %>%
    mutate(reasonGP = case_when(
      .data[[reason]] %in% c("ADVERSE EVENT", "DEATH") ~ "Safety",
      .data[[reason]] == "<Missing>" ~ "<Missing>",
      TRUE ~ "Non-safety"
    )) %>%
    dm_update_zoomed()
}

# `DST01_3` Pipeline ----

#' `DST01_3`
#'
#' @seealso [dst01_3_main()]
#' @rdname chevron_tlg-class
#' @export
dst01_3 <- chevron_tlg(dst01_3_main, dst01_3_pre, adam_datasets = c("adsl"))
