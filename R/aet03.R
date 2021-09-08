
#' Advert Events by Greatest Intensity
#'
#' An adverse events table categorized by System Organ Class, Dictionary-Derived Term  and Greatest intensity
#'
#' @inheritParams gen_args
#'
#'
#' @details
#'  * Default Adverse Events by Greatest Intensity table
#'  * Numbers represent absolute numbers of patients and fraction of `N`
#'  * Remove zero-count rows unless overridden with `prune_0 = FALSE`.
#'  * Split columns by arm
#'  * Does not include a total column by default
#'  * Sort by Body System or Organ Class (SOC) and Dictionary-Derived Term (PT)
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
#' aet03_1(adsl, adae)
#' aet02_1(adsl, adae, lbl_overall = "All Patients")
#'
aet03_1 <- function(adsl, adae,
                    armvar = .study$armvar,
                    lbl_overall = .study$lbl_overall,
                    prune_0 = TRUE,
                    deco = std_deco("AET03"),
                    .study = list(
                      armvar = "ACTARM",
                      lbl_overall = ""
                    )){

  adae <- adae |>
    filter(bol_YN(ANL01FL))


  # specific to AET03: enable top-left table labeling
  lbl_AEBODSYS <- var_labels_for(adae, "AEBODSYS")
  lbl_AEDECOD <-  var_labels_for(adae, "AEDECOD")
  lbl_AESEV <-  var_labels_for(adae, "AESEV")

  # specific to AET03: avoid error if some severity levels are not present
  gradation_severity = as.character(unique(adae$AESEV))

  lyt <- aet03_1_lyt(
    armvar = armvar,
    lbl_overall = lbl_overall,
    lbl_AEBODSYS = lbl_AEBODSYS,
    lbl_AEDECOD = lbl_AEDECOD,
    lbl_AESEV = lbl_AESEV,
    gradation = gradation_severity,
    deco = deco
  )

  # build table
  tbl <- build_table(
    lyt,
    df = adae,
    alt_counts_df = adsl
  )

  if(prune_0) tbl <- tbl |> trim_rows()


  tbl_sorted <- tbl |>
    # trim_rows() |>
    sort_at_path(
      path = "AEBODSYS",
      scorefun = cont_n_allcols,
      decreasing = TRUE
    ) |>
    sort_at_path(
      path = c("AEBODSYS", "*", "AEDECOD"),
      scorefun = cont_n_allcols,
      decreasing = TRUE
    )

  # remove the column of all observations if lbl_overall is an empty string
  if (identical(lbl_overall,""))
    tbl_sorted[, -ncol(tbl_sorted)]
  else
    tbl_sorted

}


aet03_1_lyt <- function(armvar = .study$armvar,
                        lbl_overall = .study$lbl_overall,
                        lbl_AEBODSYS = "",
                        lbl_AEDECOD = "",
                        lbl_AESEV = "",
                        gradation = .study$gradation,

                        deco = std_deco("AET03"),
                        .study = list(
                          armvar = "ACTARM",
                          lbl_overall = "",
                          gradation = c("MILD", "MODERATE", "SEVERE", "LIFE THREATENING")
                        )) {


  # create a Pre-data Table Layout
  basic_table(title = deco$title, subtitles = deco$subtitles, main_footer = deco$main_footer)  |>
    split_cols_by(var = armvar) |>
    add_colcounts() |>
    add_overall_col(label = lbl_overall) |>

    summarize_occurrences_by_grade(
      var = "AESEV",
      grade_groups = list("- Any Intensity -" = gradation
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

    summarize_occurrences_by_grade(
      var = "AESEV",
      grade_groups = list("- Any Intensity -" = gradation
      )
    ) |>

    split_rows_by(
      "AEDECOD",
      child_labels = "visible",
      nested = TRUE,
      indent_mod = -1L,
      split_fun = drop_split_levels,
      label_pos = "topleft",
      split_label = lbl_AEDECOD
    ) |>

    summarize_occurrences_by_grade(
      var = "AESEV",
      grade_groups = list("- Any Intensity -" = gradation
      )
    ) |>

    # count_occurrences_by_grade(
    #   var = "AESEV",
    #   .indent_mods = -1L
    # ) |>
    append_topleft(paste0("  ", lbl_AESEV))

}




