# cmt02_pt ----

#' @describeIn cmt02_pt Main TLG function
#'
#' @inherit cmt01a_main
#' @source `cmt01a.R`
#' @export
#'
cmt02_pt_main <- modify_default_args(cmt01a_main, row_split_var = NULL)

#' @describeIn cmt02_pt Preprocessing
#'
#' @inherit cmt01a_pre
#'
#' @export
#'
cmt02_pt_pre <- cmt01a_pre

#' @describeIn cmt02_pt Postprocessing
#'
#' @inherit cmt01a_post
#'
#' @export
#'
cmt02_pt_post <- modify_default_args(cmt01a_post, row_split_var = NULL)

#' `CMT02_PT` Table 1 (Default) Concomitant Medications by Preferred Name.
#'
#' A concomitant medication table with the
#' number of subjects and the total number of treatments by medication name sorted by frequencies.
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' run(cmt02_pt, syn_data)
cmt02_pt <- chevron_t(
  main = cmt02_pt_main,
  lyt = cmt02_pt_lyt,
  preprocess = cmt02_pt_pre,
  postprocess = cmt02_pt_post,
  adam_datasets = c("adsl", "adcm")
)
