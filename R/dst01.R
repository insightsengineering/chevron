# dst01_1 ----

#' @describeIn dst01_1 Main TLG function
#'
#' @inheritParams gen_args
#' @param arm_var (`string`) variable. Usually one of `ARM`, `ACTARM`, `TRT01A`, or `TRT01A`.
#' @param status_var (`string`) variable used to define patient status. Default is `EOSSTT`, however can also be a
#'   variable name with the pattern `EOPxxSTT` where `xx` must be substituted by 2 digits referring to the analysis
#'   period.
#' @param disc_reason_var (`string`) variable used to define reason for patient withdrawal. Default is `DCSREAS`,
#'   however can also be a variable with the pattern `DCPxxRS` where `xx` must be substituted by 2 digits referring to
#'   the analysis period.
#'
#' @details
#'  * Default patient disposition table summarizing the reasons for patients withdrawal.
#'  * Numbers represent absolute numbers of patients and fraction of `N`.
#'  * Remove zero-count rows.
#'  * Split columns by arm.
#'  * Include a total column by default.
#'  * Sort withdrawal reasons by alphabetic order.
#'
#' @note
#'  * `adam_db` object must contain an `adsl` table with the columns specified by `status_var` and `disc_reason_var`.
#'
#'
#' @export
#'
#' @examples
#' library(dm)
#' library(magrittr)
#'
#' db <- syn_data %>%
#'   dst01_1_pre()
#'
#' dst01_1_main(db)
dst01_1_main <- function(adam_db,
                         arm_var = "ARM",
                         status_var = "EOSSTT",
                         disc_reason_var = "DCSREAS",
                         lbl_overall = "All Patients",
                         deco = std_deco("DST01"),
                         ...) {
  # Standard values defined in GDSR.
  completed_lvl <- "COMPLETED"
  discontinued_lvl <- "DISCONTINUED"
  ongoing_lvl <- "ONGOING"

  checkmate::assert_factor(adam_db$adsl[[status_var]])

  lyt <- dst01_1_lyt(
    arm_var = arm_var,
    lbl_overall = lbl_overall,
    deco = deco,
    status_var = status_var,
    disc_reason_var = disc_reason_var,
    completed_lbl = completed_lvl,
    ongoing_lbl = ongoing_lvl,
    discontinued_lbl = discontinued_lvl
  )

  tbl_completed <- build_table(
    lyt[[1]],
    df = adam_db$adsl
  )

  tbl_other <- build_table(
    lyt[[2]],
    df = adam_db$adsl
  )

  list(tbl_completed, tbl_other)
}

#' @describeIn dst01_1 Layout
#'
#' @inheritParams gen_args
#' @param status_var (`string`) variable used to define patient status. Default is `EOSSTT`, however can also be a
#'   variable name with the pattern `EOPxxSTT` where `xx` must be substituted by 2 digits referring to the analysis
#'   period.
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
#'
#' @details Since the two parts of the tables are pruned differently, the layout function returns a list of layouts,
#'   which allows the tables to be constructed and pruned separately before binding.
#'
#' @export
#'
dst01_1_lyt <- function(arm_var,
                        status_var,
                        disc_reason_var,
                        completed_lbl,
                        ongoing_lbl,
                        discontinued_lbl,
                        lbl_overall,
                        deco) {
  layout_table <- basic_table_deco(deco) %>%
    split_cols_by(arm_var) %>%
    add_colcounts() %>%
    ifneeded_add_overall_col(lbl_overall) %>%
    split_rows_by(var = "DOMAIN", split_fun = drop_split_levels, child_labels = "hidden")

  layout_table_completed <-
    layout_table %>%
    count_values(
      vars = status_var,
      values = completed_lbl,
      .labels = c(count_fraction = "Completed Study"),
      .formats = list(count_fraction = format_count_fraction_fixed_dp)
    )

  layout_table_other <-
    layout_table %>%
    count_values(
      vars = status_var,
      values = ongoing_lbl,
      .labels = c(count_fraction = "Ongoing"),
      .formats = list(count_fraction = format_count_fraction_fixed_dp)
    ) %>%
    split_rows_by(
      status_var,
      split_fun = keep_split_levels(discontinued_lbl),
    ) %>%
    summarize_row_groups(
      label_fstr = "Discontinued Study",
      format = format_count_fraction_fixed_dp
    ) %>%
    summarize_vars(
      disc_reason_var,
      .stats = "count_fraction",
      denom = "N_col",
      .formats = list(count_fraction = format_count_fraction_fixed_dp)
    )

  list(layout_table_completed, layout_table_other)
}

#' @describeIn dst01_1 Preprocessing
#'
#' @inheritParams dst01_1_main
#'
#'
#' @export
#'
#' @examples
#' dst01_1_pre(syn_data)
dst01_1_pre <- function(adam_db,
                        status_var = "EOSSTT",
                        disc_reason_var = "DCSREAS",
                        ...) {
  new_format <- list(
    adsl = list(
      rule("<Missing>" = c("", NA)),
      rule(
        "COMPLETED" = "Completed",
        "DISCONTINUED" = "Discontinued",
        "ONGOING" = "Ongoing",
        "<Missing>" = c("", NA)
      )
    )
  )

  names(new_format$adsl) <- c(disc_reason_var, status_var)

  adam_db <- dunlin::reformat(adam_db, new_format, na_last = TRUE)

  adam_db %>%
    dm_zoom_to("adsl") %>%
    mutate(DOMAIN = "ADSL") %>%
    mutate(
      !!status_var := factor(.data[[status_var]], levels = c("COMPLETED", "DISCONTINUED", "ONGOING", "<Missing>"))
    ) %>%
    dm_update_zoomed()
}

#' @describeIn dst01_1 Postprocessing
#'
#' @inheritParams gen_args
#'
#'
#' @export
dst01_1_post <- function(tlg, prune_0 = TRUE, deco = std_deco("DST01"), ...) {
  tbl_completed <- tlg[[1]]
  tbl_other <- tlg[[2]]
  if (prune_0) tbl_other <- tbl_other %>% trim_rows()

  col_info(tbl_other) <- col_info(tbl_completed)

  tbl <- rbind(tbl_completed, tbl_other)

  tbl <- set_decoration(tbl, deco)

  std_postprocess(tbl)
}

#' DST01 Table 1 (Default) Patient Disposition Table 1.
#'
#' The DST01 Disposition Table provides an overview of patients
#' study completion. For patients who discontinued the study a reason is provided.
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' run(dst01_1, syn_data)
dst01_1 <- chevron_t(
  main = dst01_1_main,
  preprocess = dst01_1_pre,
  postprocess = dst01_1_post,
  adam_datasets = c("adsl")
)


# dst01_2 ----

#' @describeIn dst01_2 Main TLG function
#'
#' @inheritParams gen_args
#' @param status_var (`string`) variable used to define patient status. Default is `EOSSTT`, however can also be a
#'   variable name with the pattern `EOPxxSTT` where `xx` must be substituted by 2 digits referring to the analysis
#'   period.
#' @param disc_reason_var (`string`) variable used to define reason for patient withdrawal. Default is `DCSREAS`,
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
#' @note
#'  * `adam_db` object must contain an `adsl` table with the columns specified by `status_var` and `disc_reason_var`.
#'
#' @export
#'
#' @examples
#' library(dm)
#' library(magrittr)
#'
#' db <- syn_data %>%
#'   dst01_2_pre()
#'
#' dst01_2_main(db)
#' dst01_2_main(db, lbl_overall = NULL)
dst01_2_main <- function(adam_db,
                         arm_var = "ARM",
                         status_var = "EOSSTT",
                         disc_reason_var = "DCSREAS",
                         lbl_overall = "All Patients",
                         deco = std_deco("DST01"),
                         ...) {
  # Standard values defined in GDSR.
  completed_lvl <- "COMPLETED"
  discontinued_lvl <- "DISCONTINUED"
  ongoing_lvl <- "ONGOING"

  checkmate::assert_factor(adam_db$adsl[[status_var]])

  lyt <- dst01_2_lyt(
    arm_var = arm_var,
    status_var = status_var,
    disc_reason_var = disc_reason_var,
    completed_lbl = completed_lvl,
    discontinued_lbl = discontinued_lvl,
    lbl_overall = lbl_overall,
    ongoing_lbl = ongoing_lvl,
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

  list(tbl_completed, tbl_other)
}

#' @describeIn dst01_2 Layout
#'
#' @inheritParams gen_args
#' @param status_var (`string`) variable used to define patient status. Default is `EOSSTT`, however can also be a
#'   variable name with the pattern `EOPxxSTT` where `xx` must be substituted by 2 digits referring to the analysis
#'   period.
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
#'
#' @details Since the two parts of the tables are pruned differently, the layout function returns a list of layouts,
#'   which allows the tables to be constructed and pruned separately before binding.
#'
#' @export
#'
dst01_2_lyt <- function(arm_var,
                        status_var,
                        disc_reason_var,
                        completed_lbl,
                        ongoing_lbl,
                        discontinued_lbl,
                        lbl_overall,
                        deco = std_deco("DST01")) {
  layout_table <- basic_table_deco(deco) %>%
    split_cols_by(
      arm_var,
      split_fun = if (!is.null(lbl_overall)) add_overall_level(lbl_overall, first = FALSE)
    ) %>%
    add_colcounts() %>%
    split_rows_by(var = "DOMAIN", split_fun = drop_split_levels, child_labels = "hidden")

  layout_table_completed <- layout_table %>%
    count_values(
      vars = status_var,
      values = completed_lbl,
      .labels = c(count_fraction = "Completed Study"),
      .formats = list(count_fraction = format_count_fraction_fixed_dp)
    )

  layout_table_other <- layout_table %>%
    count_values(
      vars = status_var,
      values = ongoing_lbl,
      .labels = c(count_fraction = "Ongoing"),
      .formats = list(count_fraction = format_count_fraction_fixed_dp)
    ) %>%
    split_rows_by(
      var = status_var,
      split_fun = keep_split_levels(discontinued_lbl)
    ) %>%
    summarize_row_groups(
      label_fstr = "Discontinued Study",
      format = format_count_fraction_fixed_dp
    ) %>%
    split_rows_by(
      "reasonGP",
      split_fun = reorder_split_levels(neworder = c("Safety", "Non-Safety"))
    ) %>%
    summarize_row_groups(format = format_count_fraction_fixed_dp) %>%
    summarize_vars(
      disc_reason_var,
      .stats = "count_fraction",
      denom = "N_col",
      .formats = list(count_fraction = format_count_fraction_fixed_dp)
    )



  list(completed = layout_table_completed, other = layout_table_other)
}

#' @describeIn dst01_2 Preprocessing
#'
#' @inheritParams dst01_2_main
#'
#'
#' @export
#'
#' @examples
#' dst01_2_pre(syn_data)
dst01_2_pre <- function(adam_db,
                        status_var = "EOSSTT",
                        disc_reason_var = "DCSREAS",
                        ...) {
  checkmate::assert_class(adam_db, "dm")

  new_format <- list(
    adsl = list(
      rule("<Missing>" = c("", NA)),
      rule(
        "COMPLETED" = "Completed",
        "DISCONTINUED" = "Discontinued",
        "ONGOING" = "Ongoing",
        "<Missing>" = c("", NA)
      )
    )
  )

  names(new_format$adsl) <- c(disc_reason_var, status_var)

  adam_db <- dunlin::reformat(adam_db, new_format, na_last = TRUE)

  adam_db %>%
    dm_zoom_to("adsl") %>%
    mutate(
      !!status_var := factor(.data[[status_var]], levels = c("COMPLETED", "DISCONTINUED", "ONGOING", "<Missing>"))
    ) %>%
    mutate(reasonGP = case_when(
      .data[[disc_reason_var]] %in% c("ADVERSE EVENT", "DEATH") ~ "Safety",
      (.data[[disc_reason_var]] != "<Missing>" &
        !.data[[disc_reason_var]] %in% c("ADVERSE EVENT", "DEATH")) ~ "Non-Safety",
      .data[[disc_reason_var]] == "<Missing>" ~ "<Missing>",
    )) %>%
    mutate(reasonGP = as.factor(.data$reasonGP)) %>%
    mutate(DOMAIN = "ADSL") %>%
    dm_update_zoomed()
}

#' @describeIn dst01_2 Postprocessing
#'
#' @inheritParams gen_args
#'
#'
#' @export
dst01_2_post <- function(tlg, prune_0 = TRUE, deco = std_deco("DST01"), ...) {
  tbl_completed <- tlg[[1]]
  tbl_other <- tlg[[2]]
  if (prune_0) tbl_other <- tbl_other %>% trim_rows()

  col_info(tbl_other) <- col_info(tbl_completed)

  tbl <- rbind(tbl_completed, tbl_other)

  tbl <- set_decoration(tbl, deco)

  std_postprocess(tbl)
}

#' DST01 Table 2 (Supplementary) Patient Disposition Table 2.
#'
#' The DST01_2 Disposition Table provides an overview of
#' patients study completion. For patients who discontinued the study, the reason provided is categorized as "Safety" or
#' "Non-Safety" issue.
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' run(dst01_2, syn_data)
dst01_2 <- chevron_t(
  main = dst01_2_main,
  preprocess = dst01_2_pre,
  postprocess = dst01_2_post,
  adam_datasets = c("adsl")
)


# dst01_3 ----

#' @describeIn dst01_3 Main TLG function
#'
#' @inheritParams gen_args
#' @param status_var (`string`) variable used to define patient status. Default is `EOSSTT`, however can also be a
#'   variable name with the pattern `EOPxxSTT` where `xx` must be substituted by 2 digits referring to the analysis
#'   period.
#' @param disc_reason_var (`string`) variable used to define reason for patient withdrawal. Default is `DCSREAS`,
#'   however can also be a variable with the pattern `DCPxxRS` where `xx` must be substituted by 2 digits referring to
#'   the analysis period.
#' @param status_treatment_var (`string`) variable used to define the treatment status of the patients. Default is
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
#' @note
#'  * `adam_db` object must contain an `adsl` table with the column specified in `status`, `status_treatment` and
#'  `disc_reason_var`.
#'
#' @export
#'
#' @examples
#' library(dm)
#' library(magrittr)
#'
#' db <- syn_data %>%
#'   dst01_3_pre()
#'
#' dst01_3_main(db)
#' dst01_3_main(db, lbl_overall = NULL)
dst01_3_main <- function(adam_db,
                         arm_var = "ARM",
                         status_var = "EOSSTT",
                         disc_reason_var = "DCSREAS",
                         status_treatment_var = "EOTSTT",
                         lbl_overall = "All Patients",
                         deco = std_deco("DST01"),
                         ...) {
  completed_lvl <- "COMPLETED"
  discontinued_lvl <- "DISCONTINUED"
  ongoing_lvl <- "ONGOING"

  checkmate::assert_factor(adam_db$adsl[[status_var]])
  checkmate::assert_factor(adam_db$adsl[[status_treatment_var]])

  lyt <- dst01_3_lyt(
    arm_var = arm_var,
    lbl_overall = lbl_overall,
    deco = deco,
    completed_trt_lbl = completed_lvl,
    ongoing_trt_lbl = ongoing_lvl,
    discontinued_trt_lbl = discontinued_lvl,
    status_treatment_var = status_treatment_var
  )

  tbl <- build_table(
    lyt,
    df = adam_db$adsl
  )

  lyt <- dst01_2_lyt(
    arm_var = arm_var,
    lbl_overall = lbl_overall,
    deco = deco,
    completed_lbl = completed_lvl,
    ongoing_lbl = ongoing_lvl,
    discontinued_lbl = discontinued_lvl,
    status_var = status_var,
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

  list(tbl, tbl_completed, tbl_other)
}

#' @describeIn dst01_3 Layout
#'
#' @inheritParams gen_args
#'
#' @param status_treatment_var (`string`) variable used to define the treatment status of the patients. Default is
#'   `EOTSTT`, however can also be a variable with the pattern `EOTxxSTT` where `xx` must be substituted by 2 digits
#'   referring to the analysis period.
#' @param completed_trt_lbl (`string`) associated with completed treatment and found in the columns given by
#'   `status_treatment_var`. By Default `COMPLETED`.
#' @param discontinued_trt_lbl (`string`) associated with discontinued treatment and found in the columns given by
#'   `status_treatment_var`. By Default `DISCONTINUED`.
#' @param ongoing_trt_lbl (`string`) associated with ongoing treatment and found in the columns given by
#'   `status_treatment_var`. By Default `ONGOING.
#'
#'
#' @export
#'
dst01_3_lyt <- function(arm_var,
                        status_treatment_var,
                        completed_trt_lbl,
                        discontinued_trt_lbl,
                        ongoing_trt_lbl,
                        lbl_overall,
                        deco) {
  layout_table <- basic_table_deco(deco) %>%
    split_cols_by(arm_var) %>%
    add_colcounts() %>%
    ifneeded_add_overall_col(lbl_overall) %>%
    split_rows_by(var = "DOMAIN", split_fun = drop_split_levels, child_labels = "hidden") %>%
    count_values(
      vars = status_treatment_var,
      values = completed_trt_lbl,
      .labels = c(count_fraction = "Completed Treatment"),
      .formats = list(count_fraction = format_count_fraction_fixed_dp),
      table_names = c("COMPLETED")
    ) %>%
    count_values(
      vars = status_treatment_var,
      values = ongoing_trt_lbl,
      .labels = c(count_fraction = "Ongoing Treatment"),
      .formats = list(count_fraction = format_count_fraction_fixed_dp),
      table_names = c("ONGOING")
    ) %>%
    count_values(
      vars = status_treatment_var,
      values = discontinued_trt_lbl,
      .labels = c(count_fraction = "Discontinued Treatment"),
      .formats = list(count_fraction = format_count_fraction_fixed_dp),
      table_names = c("DISCONTINUED")
    )
}

#' @describeIn dst01_3 Preprocessing
#'
#' @inheritParams dst01_3_main
#'
#' @export
#'
dst01_3_pre <- function(adam_db,
                        status_var = "EOSSTT",
                        disc_reason_var = "DCSREAS",
                        status_treatment_var = "EOTSTT",
                        ...) {
  checkmate::assert_class(adam_db, "dm")

  new_format <- list(
    adsl = list(
      rule("<Missing>" = c("", NA)),
      rule(
        "COMPLETED" = "Completed",
        "DISCONTINUED" = "Discontinued",
        "ONGOING" = "Ongoing",
        "<Missing>" = c("", NA)
      ),
      rule(
        "COMPLETED" = "Completed",
        "DISCONTINUED" = "Discontinued",
        "ONGOING" = "Ongoing",
        "<Missing>" = c("", NA)
      )
    )
  )

  names(new_format$adsl) <- c(disc_reason_var, status_var, status_treatment_var)

  adam_db <- dunlin::reformat(adam_db, new_format, na_last = TRUE)

  adam_db %>%
    dm_zoom_to("adsl") %>%
    mutate(
      !!status_var := factor(.data[[status_var]], levels = c("COMPLETED", "DISCONTINUED", "ONGOING", "<Missing>"))
    ) %>%
    mutate(reasonGP = case_when(
      .data[[disc_reason_var]] %in% c("ADVERSE EVENT", "DEATH") ~ "Safety",
      .data[[disc_reason_var]] == "<Missing>" ~ "<Missing>",
      TRUE ~ "Non-Safety"
    )) %>%
    mutate(reasonGP = factor(.data$reasonGP, levels = c("Safety", "Non-Safety", "<Missing>"))) %>%
    mutate(DOMAIN = "ADSL") %>%
    dm_update_zoomed()
}

#' @describeIn dst01_3 Postprocessing
#'
#' @inheritParams dst01_3_main
#' @inheritParams gen_args
#'
#' @export
dst01_3_post <- function(tlg, prune_0 = TRUE, deco = std_deco("DST01"), ...) {
  tbl <- tlg[[1]]
  tbl_completed <- tlg[[2]]
  tbl_other <- tlg[[3]]
  if (prune_0) tbl_other <- tbl_other %>% trim_rows()

  col_info(tbl_other) <- col_info(tbl_completed)

  tbl2 <- rbind(tbl_completed, tbl_other)

  col_info(tbl) <- col_info(tbl2)

  if (prune_0) tbl <- trim_rows(tbl)

  tbl <- rbind(tbl2, tbl)

  tbl <- set_decoration(tbl, deco)

  std_postprocess(tbl)
}
#' DST01 Table 3 (Supplementary) Patient Disposition Table 3.
#'
#' The DST01_3 Disposition Table provides an overview of patients study treatment status. For patients who discontinued
#' the study, the reason provided is categorized as "Safety" or "Non-Safety" issue.
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' run(dst01_3, syn_data)
dst01_3 <- chevron_t(
  main = dst01_3_main,
  preprocess = dst01_3_pre,
  postprocess = dst01_3_post,
  adam_datasets = c("adsl")
)
