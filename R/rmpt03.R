# rmpt03 ----

#' @describeIn rmpt03 Main TLG function
#'
#' @inheritParams rmpt01
#' @returns the main function returns an `rtables` object.
#' @details
#'   * Person time is the sum of exposure across all patients.
#'   * Summary statistics are by default based on the number of patients in the corresponding `N` row
#'   (number of non-missing values).
#'   * Does not remove zero-count rows unless overridden with `prune_0 = TRUE`.
#'
#' @export
#'
rmpt03_main <- modify_default_args(
  rmpt01_main,
  summaryvars = "AGEGR1",
  col_split_var = "SEX",
  overall_col_lbl = "All Genders"
)

#' @describeIn rmpt03 Preprocessing
#'
#' @inheritParams gen_args
#' @inheritParams rmpt03_main
#' @returns the preprocessing function returns a `list` of `data.frame`.
#' @export
#'
rmpt03_pre <- modify_default_args(
  rmpt01_pre,
  summaryvars = "AGEGR1"
)

#' `rmpt03`Duration of Exposure for Risk Management Plan Table.
#'
#' The `rmpt03` table provides an overview of duration of exposure.
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' pre_data <- dunlin::propagate(syn_data, "adsl", "AGEGR1", "USUBJID")
#' run(rmpt03, pre_data)
rmpt03 <- chevron_t(
  main = rmpt03_main,
  preprocess = rmpt03_pre,
  postprocess = rmpt01_post,
  dataset = c("adsl", "adex")
)
