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
#' ext01_1(adex, lbl_overall = "haha")
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


  if(prune_0) tbl <- tbl %>% prune_table()

  #TDOD: sort
  tbl_sorted <- tbl

  if (identical(lbl_overall,""))
    tbl_sorted[, -ncol(tbl_sorted)]
  else
    tbl_sorted

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

  basic_table(title = deco$title, subtitles = deco$subtitles, main_footer = deco$main_footer) %>%
    split_cols_by(var = armvar) %>%
    add_overall_col(lbl_overall) %>%
    add_colcounts() %>%
    split_rows_by(
      "PARAM",
      split_fun = drop_split_levels
    ) %>%
    summarize_vars(vars = summaryvars, var_labels = summaryvars_lbls)
}


# Version 2 ----

#' Exposure Summary Table with grouping options
#'
#' @inheritParams gen_args
#' @param summaryvars
#' @param group
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
#' ext01_2(adex)
#'
ext01_2 <- function(adex,
                    armvar = .study$armvar,
                    group = .study$group,
                    summaryvars = "AVAL",
                    lbl_overall = .study$lbl_overall,
                    prune_0 = TRUE,
                    deco = std_deco("EXT01"),
                    .study = list(
                      armvar = "ACTARM",
                      group = list(list("Dose administered during constant dosing interval",
                                          c(-Inf,700,900,1200,Inf),
                                          c("<700","700-900","900-1200",">1200")
                                           ),
                                       list("Total dose administered",
                                          c(-Inf,5000,7000,9000,Inf),
                                          c("<5000","5000-7000","7000-9000",">9000")
                                            )
                                        ),
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



  adex$AVAL_gp = NA

  for(g in group){

    for(i in 1:nrow(adex)){

      if(adex$PARAM[i] == g[[1]]){

        adex$AVAL_gp[i] = as.character(cut(adex$AVAL[i], breaks = g[[2]], labels = g[[3]]))
      }
    }
  }

  lyt <- ext01_2_lyt(
    armvar = armvar,
    summaryvars = summaryvars,
    summaryvars_lbls = var_labels_for(adex, summaryvars),
    lbl_overall = lbl_overall,
    deco = deco
  )

  tbl <- build_table(lyt, adex)

  if(prune_0) tbl <- tbl %>% prune_table()

  #TDOD: sort
  tbl_sorted <- tbl

  if (identical(lbl_overall,""))
    tbl_sorted[, -ncol(tbl_sorted)]
  else
    tbl_sorted
}


ext01_2_lyt <- function(armvar = .study$armvar,
                        summaryvars = summaryvars,
                        summaryvars_lbls = summaryvars_lbls,
                        lbl_overall = .study$lbl_overall,
                        deco = std_deco("EXT01"),
                        .study = list(
                          armvar = "ACTARM",
                          overall_col = ""
                        )) {

  basic_table(title = deco$title, subtitles = deco$subtitles, main_footer = deco$main_footer)  %>%
    split_cols_by(var = armvar)  %>%
    add_overall_col(lbl_overall) %>%
    add_colcounts()  %>%
    split_rows_by(
      "PARAM",
      split_fun = NULL
    ) %>%
    summarize_vars(vars = c("AVAL","AVAL_gp"))

}








