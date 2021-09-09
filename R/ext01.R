#' Exposure Summary Table
#'
#'
#'
#' @inheritParams gen_args
#' @param summaryvars
#'
#' @details
#'  * Default Exposure table
#'  * Split columns by arm, typically `ACTARM`.

#'
#' @export
#'
#' @examples
#' library(scda)
#' library(dplyr)
#' sd <- synthetic_cdisc_data("rcd_2021_03_22")
#' adsl <- sd$adsl
#' adex <- sd$adex |>
#'  mutate(ANL01FL = 'Y')
#'
#' ext01_1(adex)
#'
ext01_1 <- function(adex,
                    armvar = .study$armvar,
                    summaryvars = "AVAL",
                    lbl_overall = .study$lbl_overall,
                    prune_0 = TRUE,
                    deco = std_deco("EXT01"),
                    .study = list(
                      armvar = "ACTARM",
                      lbl_overall = ""
                    )) {

    # provide a clearer error message in the case of missing variable
    missing_var = setdiff(summaryvars,colnames(adex))
    if(length(missing_var) > 0){

      stop(paste0("\nVariable(s) does not exist in the dataset: \n",
                  paste(missing_var, "\n", collapse = "")
                  )
           )
    }


  lyt <- ext01_1_lyt(
    armvar = armvar,
    summaryvars = summaryvars,
    summaryvars_lbls = var_labels_for(adex, summaryvars),
    lbl_overall = lbl_overall,
    deco = deco
  )

  tbl <- build_table(lyt, adex)

  if (prune_0)
    prune_table(tbl)
  else
    tbl
}


ext01_1_lyt <- function(armvar = .study$armvar,
                        summaryvars = summaryvars,
                        summaryvars_lbls = summaryvars_lbls,
                        lbl_overall = .study$lbl_overall,
                        deco = std_deco("EXT01"),
                        .study = list(
                          armvar = "ACTARM",
                          overall_col = ""
                        )) {

  basic_table(title = deco$title, subtitles = deco$subtitles, main_footer = deco$main_footer) |>
    split_cols_by(var = armvar) |>
    add_colcounts() |>
    split_rows_by(
      "PARAM",
      split_fun = drop_split_levels
    ) |>
    summarize_vars(vars = summaryvars, var_labels = summaryvars_lbls)
}
