# aet10_1 ----

#' @describeIn aet10_1 Main TLG function
#'
#' @inheritParams gen_args
#'
#' @details
#'  * Numbers represent absolute numbers of subject and fraction of `N`, or absolute number of event when specified.
#'  * Remove zero-count rows unless overridden with `prune_0 = FALSE`.
#'  * Split columns by arm.
#'  * Does not include a total column by default.
#'  * Sort Dictionary-Derived Code (`AEDECOD`) by highest overall frequencies.
#'  * Missing values in `AEDECOD` are labeled by `No Coding available`.
#'
#' @note
#'  * `adam_db` object must contain an `adae` table with the columns `"AEDECOD"`.
#'
#' @export
#'
aet10_1_main <- function(adam_db,
                         arm_var = "ACTARM",
                         lbl_overall = NULL,
                         deco = std_deco("AET10")) {
  dbsel <- get_db_data(adam_db, "adsl", "adae")

  assert_colnames(adam_db$adae, c("AEDECOD"))

  lyt <- aet10_1_lyt(
    arm_var = arm_var,
    lbl_overall = lbl_overall,
    deco = deco
  )

  tbl <- build_table(lyt, dbsel$adae, alt_counts_df = dbsel$adsl)

  tbl
}

#' @describeIn aet10_1 Layout
#'
#' @inheritParams gen_args
#' @param lbl_aedecod (`character`) text label for `AEDECOD`.
#'
#' @export
#'
aet10_1_lyt <- function(arm_var,
                        lbl_overall,
                        lbl_aedecod = "MedDRA Preferred Term",
                        deco) {
  basic_table_deco(deco) %>%
    split_cols_by(var = arm_var) %>%
    add_colcounts() %>%
    ifneeded_add_overall_col(lbl_overall) %>%
    count_occurrences(
      vars = "AEDECOD",
      .indent_mods = -1L
    ) %>%
    append_topleft(paste0("\n", lbl_aedecod))
}

#' @describeIn aet10_1 Preprocessing
#'
#' @inheritParams gen_args
#'
#' @export
#'
aet10_1_pre <- function(adam_db) {
  checkmate::assert_class(adam_db, "dm")

  aet10_1_check(adam_db)

  adam_db %>%
    dm_zoom_to("adae") %>%
    filter(.data$ANL01FL == "Y") %>%
    mutate(
      AEDECOD = tern::explicit_na(tern::sas_na(.data$AEDECOD), label = "No Coding available")
    ) %>%
    dm_update_zoomed()
}

#' @describeIn aet10_1 Checks
#'
#' @inheritParams gen_args
#'
aet10_1_check <- function(adam_db,
                          req_tables = c("adsl", "adae"),
                          arm_var = "ACTARM") {
  assert_all_tablenames(adam_db, req_tables)

  msg <- NULL
  msg <- c(msg, check_all_colnames(adam_db$adae, c(arm_var, "USUBJID", "AEDECOD")))
  msg <- c(msg, check_all_colnames(adam_db$adsl, c(arm_var, "USUBJID")))

  if (is.null(msg)) {
    TRUE
  } else {
    stop(paste(msg, collapse = "\n  "))
  }
}

#' @describeIn aet10_1 Postprocessing
#'
#' @inheritParams gen_args
#' @param atleast given cut-off default is `0.05`
#'
#' @export
#'
aet10_1_post <- function(tlg, prune_0 = TRUE, atleast = 0.05) {
  if (prune_0) {
    tlg <- prune_table(
      tt = tlg,
      prune_func = keep_rows(
        has_fraction_in_any_col(
          atleast = atleast, # specify threshold
          col_names = names(tlg)
        )
      )
    )
  }

  tbl_sorted <- tlg %>%
    sort_at_path(
      path = c("AEDECOD"),
      scorefun = score_occurrences
    )
  std_postprocess(tbl_sorted)
}

#' `AET10` Table 1 (Default) Most Common (xx%) Adverse Events Preferred Terms Table 1
#'
#' The `AET10` table Include Adverse Events occurring with user-specified threshold X% in at least
#'  one of the treatment groups. Standard table summarized by preferred term (PT).
#' Order the data by total column frequency from most to least frequently reported PT (regardless of SOC).
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' run(aet10_1, syn_data)
aet10_1 <- chevron_t(
  main = aet10_1_main,
  lyt = aet10_1_lyt,
  preprocess = aet10_1_pre,
  postprocess = aet10_1_post,
  adam_datasets = c("adsl", "adae")
)
