
#' General Argument Name Convention
#'
#' @param armvar variable used for column splitting
#' @param lbl_overall label used for overall column, if set to `NULL` the overall column is omitted
#' @param prune_0 remove 0 count rows
#' @param deco decoration list with `title`, `subtitles` and `main_footer` content
#' @param .study a list with default values for the arguments of the function
#' @param ad_bl subject baseline dataset with one row per patient
#' @param adsl Subject Level Analysis Dataset
#' @param adeg ECG Analysis Dataset
#' @param adae Adverse Events Analysis Dataset
#' @param adcm Concomitant Medications Analysis Dataset
#' @param admh Medical History Analysis Dataset
#' @param aag Adverse Event Grouping Defs Dataset
#' @param advs Vital Signs Analysis Dataset
#' @param adlb Laboratory Analysis Dataset
#' @param adex Exposure Analysis Dataset
#' @param adsub Subcategory Analysis Dataset
#' @param adrs Response Analysis Dataset
#' @param adtte Time to Event Analysis Dataset
#' @param adhy Hys Law Analysis Dataset
#' @param adsaftte Safety Time to Event Analysis Dataset
#' @param addv Protocol Deviations Analysis Dataset
#' @param adcssrs C-SSRS Analysis Dataset
#' @param adqlqc EORTC QLQ-C30 V3 Analysis Dataset
#' @param acg Concomitant Med. Grouping Defs Dataset
#' @param adic Interval Censoring Analysis Dataset
#'
gen_args <- function(
  armvar, lbl_overall, prune_0, deco, .study,
  ad_bl, adsl, adeg, adae, adcm, admh, aag, advs, adlb, adex, adsub, adrs, adtte,
  adhy, adsaftte, addv, adcssrs, adqlqc, acg, adic
) {
  NULL
}
