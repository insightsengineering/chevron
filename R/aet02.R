
#' Adverse Events by System Organ Class and Preferred Term Table
#'
#' @inheritParams gen_args
#'
#'
#' @details
#'  * No total column in the standards
#'  * sort `AEDECOD`  by highest overall frequencies
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
#' aet02_1(adsl, adae)
#' aet02_1(adsl, adae, lbl_overall = "All Patients")
#'
#' adae <- adae %>% var_relabel(AEBODSYS = "Medra System Organ Class")
#' aet02_1(adsl, adae)
#'
aet02_1 <- function(adsl, adae,
                    armvar = .study$armvar,
                    lbl_overall = .study$lbl_overall,
                    deco = std_deco("AET02"),
                    .study = list(
                      armvar = "ACTARM",
                      lbl_overall = NULL
                    )) {

  # TODO: discuss if this is truly in the function body
  adae <- adae %>%
    filter(bol_YN(ANL01FL))

  lbl_AEBODSYS <- var_labels_for(adae, "AEBODSYS")
  lbl_AEDECOD <-  var_labels_for(adae, "AEDECOD")

  lyt <- aet02_1_lyt(
    armvar = armvar,
    lbl_AEBODSYS = lbl_AEBODSYS,
    lbl_AEDECOD = lbl_AEDECOD,
    deco = deco
  )

  tbl <- build_table(
    lyt,
    df = adae,
    alt_counts_df = adsl
  )


  tbl_sorted <- tbl %>%
    prune_table() %>%
    sort_at_path(
      path =  c("AEBODSYS"),
      scorefun = cont_n_onecol(ncol(tbl))
    ) %>%
    sort_at_path(
      path = c("AEBODSYS", "*", "AEDECOD"),
      scorefun = score_occurrences
    )

  if (is.null(lbl_overall))
    tbl_sorted[, -ncol(tbl_sorted)]
  else
    tbl_sorted

}


aet02_1_lyt <- function(armvar = .study$armvar,
                        lbl_overall = .study$lbl_overall,
                        lbl_AEBODSYS = "AEBODSYS",
                        lbl_AEDECOD = "AEDECOD",
                        deco = std_deco("AET02"),
                        .study = list(
                          armvar = "ACTARM",
                          lbl_overall = NULL
                        )) {

  basic_table(title = deco$title, subtitles = deco$subtitles, main_footer = deco$main_footer)  %>%
    split_cols_by(var = armvar) %>%
    add_colcounts() %>%
    add_overall_col(label = lbl_overall) %>%
    summarize_num_patients(
      var = "USUBJID",
      .stats = c("unique", "nonunique"),
      .labels = c(
        unique = "Total number of patients with at least one adverse event",
        nonunique = "Overall total number of events"
      )
    ) %>%
    split_rows_by(
      "AEBODSYS",
      child_labels = "visible",
      nested = FALSE,
      indent_mod = -1L,
      split_fun = drop_split_levels,
      label_pos = "topleft",
      split_label = lbl_AEBODSYS
    ) %>%
    summarize_num_patients(
      var = "USUBJID",
      .stats = c("unique", "nonunique"),
      .labels = c(
        unique = "Total number of patients with at least one adverse event",
        nonunique = "Total number of events"
      )
    ) %>%
    count_occurrences(
      vars = "AEDECOD",
      .indent_mods = -1L
    ) %>%
    append_topleft(paste0("  ", lbl_AEDECOD))
}
