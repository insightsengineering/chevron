# cmt01a_1 ----

#' @describeIn cmt01a_1 Main TLG function
#'
#' @inheritParams gen_args
#' @param medcat_var (`character`) the variable defining the medication category. By default `ATC2`.
#' @param lbl_medcat_var (`character`) label for the variable defining the medication category.
#' @param medname_var (`character`) the variable defining the medication name. By default `CMDECOD`.
#' @param lbl_medname_var (`character`) label for the variable defining the medication name.
#'
#' @details
#'  * Data should be filtered for concomitant medication. `(ATIREL == "CONCOMITANT")`.
#'  * Numbers represent absolute numbers of subjects and fraction of `N`, or absolute numbers when specified.
#'  * Remove zero-count rows unless overridden with `prune_0 = FALSE`.
#'  * Split columns by arm.
#'  * Does not include a total column by default.
#'  * Sort by medication class alphabetically and within medication class by decreasing total number of patients with
#'  the specific medication.
#'
#' @note
#'  * `adam_db` object must contain an `adcm` table with the columns specified in `medcat_var` and `medname_var` as well
#'  as `"CMSEQ"`.
#'
#' @export
#'
cmt01a_1_main <- function(adam_db,
                          arm_var = "ARM",
                          medcat_var = "ATC2", # Anatomical therapeutic category
                          lbl_medcat_var = "ATC Class Level 2",
                          medname_var = "CMDECOD",
                          lbl_medname_var = "Other Treatment",
                          lbl_overall = NULL,
                          deco = std_deco("CMT01A"),
                          ...) {
  assert_colnames(adam_db$adcm, c(medcat_var, medname_var))

  dbsel <- get_db_data(adam_db, "adsl", "adcm")

  lyt <- cmt01a_1_lyt(
    arm_var = arm_var,
    lbl_overall = lbl_overall,
    medcat_var = medcat_var,
    lbl_medcat_var = lbl_medcat_var,
    medname_var = medname_var,
    lbl_medname_var = lbl_medname_var,
    deco = deco
  )

  tbl <- build_table(lyt, dbsel$adcm, alt_counts_df = dbsel$adsl)

  tbl
}

#' @describeIn cmt01a_1 Layout
#'
#' @inheritParams gen_args
#' @param medcat_var (`character`) the variable defining the medication category. By default `ATC2`.
#' @param lbl_medcat_var (`character`) the label for the medication category.
#' @param medname_var (`character`) the variable defining the medication name. By default `CMDECOD`.
#' @param lbl_medname_var (`character`) the label for the medication name.
#'
#' @export
#'
cmt01a_1_lyt <- function(arm_var,
                         lbl_overall,
                         medcat_var,
                         lbl_medcat_var,
                         medname_var,
                         lbl_medname_var,
                         deco) {
  basic_table_deco(deco) %>%
    split_cols_by(var = arm_var) %>%
    add_colcounts() %>%
    ifneeded_add_overall_col(lbl_overall) %>%
    summarize_num_patients(
      var = "USUBJID",
      count_by = "CMSEQ",
      .stats = c("unique", "nonunique"),
      .labels = c(
        unique = "Total number of patients with at least one treatment",
        nonunique = "Total number of treatments"
      )
    ) %>%
    split_rows_by(
      medcat_var,
      child_labels = "visible",
      nested = FALSE,
      indent_mod = -1L,
      split_fun = drop_split_levels,
      label_pos = "topleft",
      split_label = lbl_medcat_var
    ) %>%
    summarize_num_patients(
      var = "USUBJID",
      count_by = "CMSEQ",
      .stats = c("unique", "nonunique"),
      .labels = c(
        unique = "Total number of patients with at least one treatment",
        nonunique = "Total number of treatments"
      )
    ) %>%
    count_occurrences(
      vars = medname_var,
      .indent_mods = -1L
    ) %>%
    append_topleft(paste0("  ", lbl_medname_var))
}

#' @describeIn cmt01a_1 Preprocessing
#'
#' @inheritParams cmt01a_1_main
#'
#'
#' @export
#'
cmt01a_1_pre <- function(adam_db, medcat_var = "ATC2", medname_var = "CMDECOD", ...) {
  checkmate::assert_class(adam_db, "dm")

  adam_db <- adam_db %>%
    dm_zoom_to("adcm") %>%
    filter(.data$ANL01FL == "Y") %>%
    mutate(CMSEQ = as.factor(.data$CMSEQ)) %>%
    dm_update_zoomed()

  fmt_ls <- list(
    medcat_var = rule(
      "No Coding available" = c("", NA)
    ),
    medname_var = rule(
      "No Coding available" = c("", NA)
    )
  )

  names(fmt_ls) <- c(medcat_var, medname_var)
  new_format <- list(adcm = fmt_ls)

  dunlin::reformat(adam_db, new_format, na_last = TRUE)
}

#' @describeIn cmt01a_1 Postprocessing
#'
#' @inheritParams cmt01a_1_main
#' @inheritParams gen_args
#'
#'
#' @export
#'
cmt01a_1_post <- function(tlg, prune_0 = TRUE, medcat_var = "ATC2", medname_var = "CMDECOD", ...) {
  if (prune_0) {
    tlg <- smart_prune(tlg)
  }

  tbl_sorted <- tlg %>%
    sort_at_path(
      path = c(medcat_var, "*", medname_var),
      scorefun = score_occurrences
    )

  std_postprocess(tbl_sorted)
}

#' `CMT01A` Table 1 (Default) Concomitant Medication by Medication Class and Preferred Name.
#'
#' A concomitant medication
#' table with the number of subjects and the total number of treatments by medication class sorted alphabetically and
#' medication name sorted by frequencies.
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' library(magrittr)
#' library(dm)
#'
#' db <- syn_data %>%
#'   dm_zoom_to("adcm") %>%
#'   filter(.data$ATIREL == "CONCOMITANT") %>%
#'   dm_update_zoomed()
#'
#' run(cmt01a_1, db)
cmt01a_1 <- chevron_t(
  main = cmt01a_1_main,
  lyt = cmt01a_1_lyt,
  preprocess = cmt01a_1_pre,
  postprocess = cmt01a_1_post,
  adam_datasets = c("adsl", "adcm")
)


# cmt01a_2 ----

#' @describeIn cmt01a_2 Main TLG function
#'
#' @inheritParams gen_args
#' @param medcat_var (`character`) the variable defining the medication category. By default `ATC2`.
#' @param lbl_medcat_var (`character`) label for the variable defining the medication category.
#' @param medname_var (`character`) the variable defining the medication name. By default `CMDECOD`.
#' @param lbl_medname_var (`character`) label for the variable defining the medication name.
#'
#' @details
#'  * Data should be filtered for concomitant medication. `(ATIREL == "CONCOMITANT")`.
#'  * Numbers represent absolute numbers of subjects and fraction of `N`, or absolute numbers when specified.
#'  * Remove zero-count rows unless overridden with `prune_0 = FALSE`.
#'  * Split columns by arm.
#'  * Does not include a total column by default.
#'  * Sort by medication class frequency and within medication class by decreasing total number of patients with
#'  the specific medication.
#'
#' @note
#'  * `adam_db` object must contain an `adcm` table with the columns specified in `medcat_var` and `medname_var` as well
#'  as `"CMSEQ"`.
#'
#' @export
#'
cmt01a_2_main <- function(adam_db,
                          arm_var = "ARM",
                          medcat_var = "ATC2", # Anatomical therapeutic category
                          lbl_medcat_var = "ATC Class Level 2",
                          medname_var = "CMDECOD",
                          lbl_medname_var = "Other Treatment",
                          lbl_overall = NULL,
                          deco = std_deco("CMT01A"),
                          ...) {
  assert_colnames(adam_db$adcm, c(medcat_var, medname_var))

  dbsel <- get_db_data(adam_db, "adsl", "adcm")

  # The same layout can be used.
  lyt <- cmt01a_1_lyt(
    arm_var = arm_var,
    lbl_overall = lbl_overall,
    medcat_var = medcat_var,
    lbl_medcat_var = lbl_medcat_var,
    medname_var = medname_var,
    lbl_medname_var = lbl_medname_var,
    deco = deco
  )

  tbl <- build_table(lyt, dbsel$adcm, alt_counts_df = dbsel$adsl)

  tbl
}

#' @describeIn cmt01a_2 Preprocessing
#'
#' @inheritParams cmt01a_2_main
#'
#' @export
#'
cmt01a_2_pre <- function(adam_db, medcat_var = "ATC2", medname_var = "CMDECOD", ...) {
  checkmate::assert_class(adam_db, "dm")

  adam_db <- adam_db %>%
    dm_zoom_to("adcm") %>%
    filter(.data$ANL01FL == "Y") %>%
    mutate(CMSEQ = as.factor(.data$CMSEQ)) %>%
    dm_update_zoomed()

  fmt_ls <- list(
    medcat_var = rule(
      "No Coding available" = c("", NA)
    ),
    medname_var = rule(
      "No Coding available" = c("", NA)
    )
  )

  names(fmt_ls) <- c(medcat_var, medname_var)
  new_format <- list(adcm = fmt_ls)

  dunlin::reformat(adam_db, new_format, na_last = TRUE)
}

#' @describeIn cmt01a_2 Postprocessing
#'
#' @inheritParams cmt01a_main
#' @inheritParams gen_args
#'
#' @export
#'
cmt01a_2_post <- function(tlg, prune_0 = TRUE, medcat_var = "ATC2", medname_var = "CMDECOD", ...) {
  if (prune_0) {
    tlg <- smart_prune(tlg)
  }

  tbl_sorted <- tlg %>%
    sort_at_path(
      medcat_var,
      scorefun = cont_n_onecol(ncol(tlg))
    ) %>%
    sort_at_path(
      path = c(medcat_var, "*", medname_var),
      scorefun = score_occurrences
    )


  std_postprocess(tbl_sorted)
}

#' `CMT01A` Table 2 (Supplementary) Concomitant Medication by Medication Class and Preferred Name (Classes sorted by
#' frequency).
#'
#' A concomitant medication table with the number of subjects and the total number of treatments by
#' medication class and medication name sorted by frequencies.
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' library(magrittr)
#' library(dm)
#'
#' db <- syn_data %>%
#'   dm_zoom_to("adcm") %>%
#'   filter(.data$ATIREL == "CONCOMITANT") %>%
#'   dm_update_zoomed()
#'
#' run(cmt01a_2, db)
cmt01a_2 <- chevron_t(
  main = cmt01a_2_main,
  preprocess = cmt01a_2_pre,
  postprocess = cmt01a_2_post,
  adam_datasets = c("adsl", "adcm")
)


# cmt01a_3 ----

#' @describeIn cmt01a_3 Main TLG function
#'
#' @inheritParams gen_args
#' @param medcat_var (`character`) the variable defining the medication category. By default `ATC2`.
#' @param lbl_medcat_var (`character`) the label for the medication category.
#' @param medname_var (`character`) the variable defining the medication name. By default `CMDECOD`.
#' @param lbl_medname_var (`character`) the label for the medication name.
#'
#' @details
#'  * Data should be filtered for concomitant medication. `(ATIREL == "CONCOMITANT")`.
#'  * Numbers represent absolute numbers of subjects and fraction of `N`, or absolute numbers when specified.
#'  * Remove zero-count rows unless overridden with `prune_0 = FALSE`.
#'  * Split columns by arm.
#'  * Does not include a total column by default.
#'  * Sort by medication class alphabetically and within medication class by decreasing total number of patients with
#'  the specific medication.
#'
#' @note
#'  * `adam_db` object must contain an `adcm` table with the columns specified in `medcat_var` and `medname_var` as well
#'  as `"CMSEQ"`.
#'
#' @export
#'
cmt01a_3_main <- function(adam_db,
                          arm_var = "ARM",
                          medcat_var = "ATC2", # Anatomical therapeutic category
                          lbl_medcat_var = "ATC Class Level 2",
                          medname_var = "CMDECOD",
                          lbl_medname_var = "Other Treatment",
                          lbl_overall = NULL,
                          deco = std_deco("CMT01A"),
                          ...) {
  assert_colnames(adam_db$adcm, c(medcat_var, medname_var))

  dbsel <- get_db_data(adam_db, "adsl", "adcm")

  lyt <- cmt01a_3_lyt(
    arm_var = arm_var,
    lbl_overall = lbl_overall,
    medcat_var = medcat_var,
    lbl_medcat_var = lbl_medcat_var,
    medname_var = medname_var,
    lbl_medname_var = lbl_medname_var,
    deco = deco
  )

  tbl <- build_table(lyt, dbsel$adcm, alt_counts_df = dbsel$adsl)

  tbl
}

#' @describeIn cmt01a_3 Layout
#'
#' @inheritParams cmt01a_3_main
#'
#' @export
#'
cmt01a_3_lyt <- function(arm_var = "ARM",
                         lbl_overall = NULL,
                         medcat_var = "ATC2",
                         lbl_medcat_var = "ATC Class Level 2",
                         medname_var = "CMDECOD",
                         lbl_medname_var = "Other Treatment",
                         deco = std_deco("CMT01A")) {
  basic_table_deco(deco) %>%
    split_cols_by(var = arm_var) %>%
    add_colcounts() %>%
    ifneeded_add_overall_col(lbl_overall) %>%
    summarize_num_patients(
      var = "USUBJID",
      count_by = "CMSEQ",
      .stats = c("unique", "nonunique"),
      .labels = c(
        unique = "Total number of patients with at least one treatment",
        nonunique = "Total number of treatments"
      )
    ) %>%
    split_rows_by(
      medcat_var,
      child_labels = "visible",
      nested = FALSE,
      indent_mod = -1L,
      split_fun = drop_split_levels,
      label_pos = "topleft",
      split_label = lbl_medcat_var
    ) %>%
    summarize_num_patients(
      var = "USUBJID",
      count_by = "CMSEQ",
      .stats = c("unique"),
      .labels = c(
        unique = "Total number of patients with at least one treatment"
      )
    ) %>%
    count_occurrences(
      vars = medname_var,
      .indent_mods = -1L
    ) %>%
    append_topleft(paste0("  ", lbl_medname_var))
}

#' @describeIn cmt01a_3 Preprocessing
#'
#' @inheritParams cmt01a_3_main
#'
#' @export
#'
cmt01a_3_pre <- function(adam_db, medcat_var = "ATC2", medname_var = "CMDECOD", ...) {
  checkmate::assert_class(adam_db, "dm")

  adam_db <- adam_db %>%
    dm_zoom_to("adcm") %>%
    filter(.data$ANL01FL == "Y") %>%
    mutate(CMSEQ = as.factor(.data$CMSEQ)) %>%
    dm_update_zoomed()

  fmt_ls <- list(
    medcat_var = rule(
      "No Coding available" = c("", NA)
    ),
    medname_var = rule(
      "No Coding available" = c("", NA)
    )
  )

  names(fmt_ls) <- c(medcat_var, medname_var)
  new_format <- list(adcm = fmt_ls)

  dunlin::reformat(adam_db, new_format, na_last = TRUE)
}

#' @describeIn cmt01a_3 Preprocessing
#'
#' @inheritParams cmt01a_3_main
#' @inheritParams gen_args
#'
#' @export
#'
cmt01a_3_post <- function(tlg, prune_0 = TRUE, medcat_var = "ATC2", medname_var = "CMDECOD", ...) {
  if (prune_0) {
    tlg <- smart_prune(tlg)
  }

  tbl_sorted <- tlg %>%
    sort_at_path(
      path = c(medcat_var, "*", medname_var),
      scorefun = score_occurrences
    )

  std_postprocess(tbl_sorted)
}
#' `CMT01A` Table 3 (Supplementary) Concomitant Medication by Medication Class and Preferred Name (Total number of
#' treatments per medication class suppressed).
#'
#' A concomitant medication table with the number of subjects and the total
#' number of treatments by medication class sorted alphabetically and medication name sorted by frequencies presented
#' without the total number of treatments per medication.
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' library(magrittr)
#' library(dm)
#'
#' db <- syn_data %>%
#'   dm_zoom_to("adcm") %>%
#'   filter(.data$ATIREL == "CONCOMITANT") %>%
#'   dm_update_zoomed()
#'
#' run(cmt01a_3, db)
cmt01a_3 <- chevron_t(
  main = cmt01a_3_main,
  preprocess = cmt01a_3_pre,
  postprocess = cmt01a_3_post,
  adam_datasets = c("adsl", "adcm")
)
