# dst01 ----

#' @describeIn dst01 Main TLG function
#'
#' @inheritParams gen_args
#' @param arm_var (`string`) variable. Usually one of `ARM`, `ACTARM`, `TRT01A`, or `TRT01A`.
#' @param study_status_var (`string`) variable used to define patient status. Default is `EOSSTT`, however can also be a
#'   variable name with the pattern `EOPxxSTT` where `xx` must be substituted by 2 digits referring to the analysis
#'   period.
#' @param detail_vars Named (`list`) of grouped display of `study_status_var`. The names must be subset of unique levels
#' of `study_status_var`.
#' @param trt_status_var (`string`) variable of treatment status.
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
#' @export
#'
dst01_main <- function(adam_db,
                       arm_var = "ARM",
                       study_status_var = "EOSSTT",
                       detail_vars = list(
                         Discontinued = c("DCSREAS")
                       ),
                       trt_status_var = NULL,
                       lbl_overall = "All {Patient_label}",
                       ...) {
  assert_all_tablenames(adam_db, "adsl")
  checkmate::assert_string(arm_var)
  checkmate::assert_string(study_status_var)
  checkmate::assert_string(trt_status_var, null.ok = TRUE)
  checkmate::assert_string(lbl_overall, null.ok = TRUE)
  lbl_overall <- render_safe(lbl_overall)
  assert_valid_variable(
    adam_db$adsl,
    arm_var,
    types = list(c("character", "factor")), na_ok = TRUE
  )
  assert_valid_variable(
    adam_db$adsl, study_status_var,
    types = list(c("character", "factor")), na_ok = TRUE,
    empty_ok = FALSE, min_chars = 1L
  )
  assert_valid_variable(
    adam_db$adsl, trt_status_var,
    types = list(c("character", "factor")), na_ok = TRUE,
    empty_ok = TRUE, min_chars = 0L
  )
  status_var_lvls <- lvls(adam_db$adsl[[study_status_var]])
  checkmate::assert_subset(names(detail_vars), choice = status_var_lvls)
  assert_valid_variable(
    adam_db$adsl,
    unlist(detail_vars),
    types = list(c("character", "factor")),
    na_ok = TRUE,
    empty_ok = TRUE,
    min_chars = 0L
  )
  detail_vars <- setNames(detail_vars[status_var_lvls], status_var_lvls)
  lyt <- dst01_lyt(
    arm_var = arm_var,
    lbl_overall = lbl_overall,
    study_status_var = study_status_var,
    detail_vars = detail_vars,
    trt_status_var = trt_status_var
  )
  build_table(lyt, adam_db$adsl)
}

#' `dst01` Layout
#'
#' @inheritParams dst01_main
#' @param study_status_var (`string`) variable used to define patient status. Default is `EOSSTT`, however can also be a
#'   variable name with the pattern `EOPxxSTT` where `xx` must be substituted by 2 digits referring to the analysis
#'   period.
#' @param detail_vars Named (`list`) of grouped display of `study_status_var`.

#'
#' @keywords internal
#'
dst01_lyt <- function(arm_var,
                      study_status_var,
                      detail_vars,
                      trt_status_var,
                      lbl_overall) {
  lyt <- basic_table() %>%
    split_cols_by(arm_var) %>%
    add_colcounts() %>%
    ifneeded_add_overall_col(lbl_overall)
  for (n in names(detail_vars)) {
    lyt <- lyt %>%
      count_or_summarize(study_status_var, n, detail_vars[[n]])
  }
  if (!is.null(trt_status_var)) {
    lyt <- lyt %>%
      summarize_vars(
        trt_status_var,
        .stats = "count_fraction",
        denom = "N_col",
        .formats = list(count_fraction = format_count_fraction_fixed_dp),
        show_labels = "hidden",
        nested = FALSE
      )
  }
  lyt
}

#' @describeIn dst01 Preprocessing
#'
#' @inheritParams dst01_main
#' @export
#'
dst01_pre <- function(adam_db,
                      ...) {
  study_status_format <- rule(
    "Completed" = "COMPLETED",
    "Ongoing" = "ONGOING",
    "Discontinued" = "DISCONTINUED"
  )
  trt_status_format <- rule(
    "Completed Treatment" = "COMPLETED",
    "Ongoing Treatment" = "ONGOING",
    "Discontinued Treatment" = "DISCONTINUED"
  )
  dcsreas_grp_format <- rule(
    "Safety" = c("ADVERSE EVENT", "DEATH"),
    "Non-Safety" = c(
      "WITHDRAWAL BY SUBJECT", "LACK OF EFFICACY", "PROTOCOL VIOLATION",
      "WITHDRAWAL BY PARENT/GUARDIAN", "PHYSICIAN DECISION"
    )
  )
  adam_db$adsl <- adam_db$adsl %>%
    mutate(
      EOSSTT = reformat(.data$EOSSTT, study_status_format),
      EOTSTT = reformat(.data$EOTSTT, trt_status_format),
      DCSREASGP = reformat(.data$DCSREAS, dcsreas_grp_format),
      DCSREAS = reformat(.data$DCSREAS, empty_rule),
      STDONS = factor(
        case_when(
          EOTSTT == "Ongoing Treatment" & EOSSTT == "Ongoing" ~ "Alive: Ongoing",
          EOTSTT != "Ongoing Treatment" & EOSSTT == "Ongoing" ~ "Alive: In Follow-up",
          TRUE ~ NA_character_
        ),
        levels = c("Alive: Ongoing", "Alive: In Follow-up")
      )
    )
  adam_db
}

#' @describeIn dst01 Postprocessing
#'
#' @inheritParams gen_args
#'
#'
#' @export
dst01_post <- function(tlg, prune_0 = TRUE, ...) {
  if (prune_0) {
    tlg <- tlg %>%
      smart_prune()
  }
  std_postprocess(tlg)
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
#' run(dst01, syn_data, detail_vars = list(Ongoing = "STDONS"))
#' run(dst01, syn_data, detail_vars = list(Discontinued = "DCSREAS", Ongoing = "STDONS"))
#' run(
#'   dst01, syn_data,
#'   detail_vars = list(
#'     Discontinued = c("DCSREASGP", "DCSREAS"),
#'     Ongoing = "STDONS"
#'   )
#' )
dst01 <- chevron_t(
  main = dst01_main,
  preprocess = dst01_pre,
  postprocess = dst01_post
)
