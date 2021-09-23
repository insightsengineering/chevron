
#' General Argument Name Convention
#'
#' @param armvar (`string`) variable used for column splitting
#' @param lbl_overall (`string`) label used for overall column, if set to `NULL` the overall column is omitted
#' @param prune_0 (`logical`) remove 0 count rows
#' @param deco (`list`) decoration with `title`, `subtitles` and `main_footer` content
#' @param .study (`list`)  with default values for the arguments of the function
#' @param ad_bl (`data.frame`) subject baseline dataset with one row per patient
#' @param adsl (`data.frame`) Subject Level Analysis Dataset
#' @param adeg (`data.frame`) ECG Analysis Dataset
#' @param adae (`data.frame`) Adverse Events Analysis Dataset
#' @param adcm (`data.frame`) Concomitant Medications Analysis Dataset
#' @param admh (`data.frame`) Medical History Analysis Dataset
#' @param aag (`data.frame`) Adverse Event Grouping Defs Dataset
#' @param advs (`data.frame`) Vital Signs Analysis Dataset
#' @param adlb (`data.frame`) Laboratory Analysis Dataset
#' @param adex (`data.frame`) Exposure Analysis Dataset
#' @param adsub (`data.frame`) Subcategory Analysis Dataset
#' @param adrs (`data.frame`) Response Analysis Dataset
#' @param adtte (`data.frame`) Time to Event Analysis Dataset
#' @param adhy (`data.frame`) Hys Law Analysis Dataset
#' @param adsaftte (`data.frame`) Safety Time to Event Analysis Dataset
#' @param addv (`data.frame`) Protocol Deviations Analysis Dataset
#' @param adcssrs (`data.frame`) C-SSRS Analysis Dataset
#' @param adqlqc (`data.frame`) EORTC QLQ-C30 V3 Analysis Dataset
#' @param acg (`data.frame`) Concomitant Med. Grouping Defs Dataset
#' @param adic (`data.frame`) Interval Censoring Analysis Dataset
#'
#' @param group (`list of lists`) for group-dependent data binning
#'
#' @param group nest list for group-dependent data binning
#'
gen_args <- function(
  armvar, lbl_overall, prune_0, deco, .study,
  ad_bl, adsl, adeg, adae, adcm, admh, aag, advs, adlb, adex, adsub, adrs, adtte,
  adhy, adsaftte, addv, adcssrs, adqlqc, acg, adic, group
) {
  NULL
}
