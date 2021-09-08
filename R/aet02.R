#' Adverse Events by System Organ Class and Preferred Term Table
#'
#' The AET02 table provides an overview of the number of patients experiencing advert events and the number of advert
#' events categorized by Body System and Dictionary-Derived terms
#'
#' @inheritParams gen_args
#'
#' @details
#'  * Numbers represent absolute numbers of patients and fraction of `N`, or absolute number of event when specified.
#'  * Remove zero-count rows unless overridden with `prune_0 = FALSE`.
#'  * Split columns by arm.
#'  * Does not include a total column by default
#'  * Sort Dictionary-Derived Code (`AEDECOD`) by highest overall frequencies.
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
#' adae <- sd$adae |>
#'  mutate(ANL01FL = 'Y')
#'
#' aet02_1(adsl, adae)
#' aet02_1(adsl, adae, lbl_overall = "All Patients")
#'
#' adae <- adae |> var_relabel(AEBODSYS = "Medra System Organ Class")
#' aet02_1(adsl, adae)
#'
aet02_1 <- function(adsl, adae,
                    armvar = .study$armvar,
                    lbl_overall = .study$lbl_overall,
                    prune_0 = TRUE,
                    deco = std_deco("AET02"),
                    .study = list(
                      armvar = "ACTARM",
                      lbl_overall = ""
                    )) {

  # TODO: discuss if this is truly in the function body
  adae <- adae |>
    filter(bol_YN(ANL01FL))

  lbl_AEBODSYS <- var_labels_for(adae, "AEBODSYS")
  lbl_AEDECOD <-  var_labels_for(adae, "AEDECOD")

  lyt <- aet02_1_lyt(
    armvar = armvar,
    lbl_overall = lbl_overall,
    lbl_AEBODSYS = lbl_AEBODSYS,
    lbl_AEDECOD = lbl_AEDECOD,
    deco = deco
  )

  tbl <- build_table(
    lyt,
    df = adae,
    alt_counts_df = adsl
  )

  if(prune_0) tbl <- tbl |> prune_table()

  tbl_sorted <- tbl |>
    sort_at_path(
      path =  c("AEBODSYS"),
      scorefun = cont_n_onecol(ncol(tbl))
    ) |>
    sort_at_path(
      path = c("AEBODSYS", "*", "AEDECOD"),
      scorefun = score_occurrences
    )

  if (identical(lbl_overall,""))
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
                          lbl_overall = ""
                        )) {

  basic_table(title = deco$title, subtitles = deco$subtitles, main_footer = deco$main_footer)  |>
    split_cols_by(var = armvar) |>
    add_colcounts() |>
    add_overall_col(label = lbl_overall) |>
    summarize_num_patients(
      var = "USUBJID",
      .stats = c("unique", "nonunique"),
      .labels = c(
        unique = "Total number of patients with at least one adverse event",
        nonunique = "Overall total number of events"
      )
    ) |>
    split_rows_by(
      "AEBODSYS",
      child_labels = "visible",
      nested = FALSE,
      indent_mod = -1L,
      split_fun = drop_split_levels,
      label_pos = "topleft",
      split_label = lbl_AEBODSYS
    ) |>
    summarize_num_patients(
      var = "USUBJID",
      .stats = c("unique", "nonunique"),
      .labels = c(
        unique = "Total number of patients with at least one adverse event",
        nonunique = "Total number of events"
      )
    ) |>
    count_occurrences(
      vars = "AEDECOD",
      .indent_mods = -1L
    ) |>
    append_topleft(paste0(" ", lbl_AEDECOD))
}


# Version2 ----

#' Adverse Events by System Organ Class and Preferred Term Table
#'
#' The AET02_2 table provides an overview of the number of patients experiencing advert events and the number of advert
#' events categorized by Body System, High Level terms and Dictionary-Derived terms
#'
#' @inheritParams gen_args
#'
#' @details
#'  * Numbers represent absolute numbers of patients and fraction of `N`, or absolute number of event when specified.
#'  * Remove zero-count rows unless overridden with `prune_0 = FALSE`.
#'  * Split columns by arm.
#'  * Does not include a total column by default
#'  * Sort Dictionary-Derived Code (`AEDECOD`) by highest overall frequencies.
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
#' adae <- sd$adae |>
#'  mutate(ANL01FL = 'Y')
#'
#' aet02_2(adsl, adae)
#' aet02_2(adsl, adae, lbl_overall = "All Patients")
#'
#' adae <- adae |> var_relabel(AEBODSYS = "Medra System Organ Class")
#' aet02_2(adsl, adae)
#'
aet02_2 <- function(adsl, adae,
                    armvar = .study$armvar,
                    lbl_overall = .study$lbl_overall,
                    prune_0 = TRUE,
                    deco = std_deco("AET02"),
                    .study = list(
                      armvar = "ACTARM",
                      lbl_overall = ""
                    )) {

  # TODO: discuss if this is truly in the function body
  adae <- adae |>
    filter(bol_YN(ANL01FL))

  lbl_AEBODSYS <- var_labels_for(adae, "AEBODSYS")
  lbl_AEHLT <-  var_labels_for(adae, "AEHLT")
  lbl_AEDECOD <-  var_labels_for(adae, "AEDECOD")


  lyt <- aet02_2_lyt(
    armvar = armvar,
    lbl_overall = lbl_overall,
    lbl_AEBODSYS = lbl_AEBODSYS,
    lbl_AEHLT = lbl_AEHLT,
    lbl_AEDECOD = lbl_AEDECOD,
    deco = deco
  )

  tbl <- build_table(
    lyt,
    df = adae,
    alt_counts_df = adsl
  )

  if(prune_0) tbl <- tbl |> prune_table()

  tbl_sorted <- tbl |>
    sort_at_path(
      path =  c("AEBODSYS"),
      scorefun = cont_n_allcols
    ) |>
    sort_at_path(
      path =  c("AEBODSYS", "*", "AEHLT"),
      scorefun = cont_n_allcols
    ) |>
    sort_at_path(
      path =  c("AEBODSYS", "*", "AEHLT", "*", "AEDECOD"),
      scorefun = score_occurrences
    )



  if (identical(lbl_overall,""))
    tbl_sorted[, -ncol(tbl_sorted)]
  else
    tbl_sorted

}


aet02_2_lyt <- function(armvar = .study$armvar,
                        lbl_overall = .study$lbl_overall,
                        lbl_AEBODSYS = "AEBODSYS",
                        lbl_AEHLT = "AEHLT",
                        lbl_AEDECOD = "AEDECOD",
                        deco = std_deco("AET02"),
                        .study = list(
                          armvar = "ACTARM",
                          lbl_overall = ""
                        )) {

  basic_table(title = deco$title, subtitles = deco$subtitles, main_footer = deco$main_footer)  |>
    split_cols_by(var = armvar) |>
    add_colcounts() |>
    add_overall_col(label = lbl_overall) |>
    summarize_num_patients(
      var = "USUBJID",
      .stats = c("unique", "nonunique"),
      .labels = c(
        unique = "Total number of patients with at least one adverse event",
        nonunique = "Overall total number of events"
      )
    ) |>
    split_rows_by(
      "AEBODSYS",
      child_labels = "visible",
      nested = FALSE,
      indent_mod = -1L,
      split_fun = drop_split_levels,
      label_pos = "topleft",
      split_label = lbl_AEBODSYS
    ) |>
    summarize_num_patients(
      var = "USUBJID",
      .stats = c("unique", "nonunique"),
      .labels = c(
        unique = "Total number of patients with at least one adverse event",
        nonunique = "Total number of events"
      )
    ) |>
    split_rows_by(
      "AEHLT",
      child_labels = "visible",
      indent_mod = -1L,
      split_fun = drop_split_levels,
      label_pos = "topleft",
      split_label = lbl_AEHLT
    ) |>
    summarize_num_patients(
      var = "USUBJID",
      .stats = c("unique", "nonunique"),
      .labels = c(
        unique = "Total number of patients with at least one adverse event",
        nonunique = "Total number of events"
      )
    ) |>
    count_occurrences(
      vars = "AEDECOD",
      .indent_mods = -1L
    ) |>
    append_topleft(paste0(" ", lbl_AEDECOD))
}



