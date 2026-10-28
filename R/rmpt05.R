# rmpt05 ----

#' @describeIn rmpt05 Main TLG function
#'
#' @inheritParams gen_args
#' @inheritParams rmpt01
#' @returns the main function returns an `rtables` object.
#'
#' @details
#'   * Person time is the sum of exposure across all patients.
#'   * Summary statistics are by default based on the number of patients in the corresponding `N` row
#'   (number of non-missing values).
#'   * Does not remove zero-count rows unless overridden with `prune_0 = TRUE`.
#'
#' @export
#'
rmpt05_main <- function(adam_db,
                        summaryvars = "RACE",
                        show_tot = TRUE,
                        row_split_var = NULL,
                        col_split_var = NULL,
                        overall_col_lbl = NULL,
                        ...) {
  rmpt01_main(
    adam_db = adam_db,
    summaryvars = summaryvars,
    show_tot = show_tot,
    row_split_var = row_split_var,
    col_split_var = col_split_var,
    overall_col_lbl = overall_col_lbl,
    ...
  )
}

#' @describeIn rmpt05 Preprocessing
#'
#' @inheritParams gen_args
#' @inheritParams rmpt05_main
#' @returns the preprocessing function returns a `list` of `data.frame`.
#' @export
#'
rmpt05_pre <- modify_default_args(
  rmpt01_pre,
  summaryvars = "RACE"
)

#' `RMPT05` Extent of Exposure by Race for Risk Management Plan Table.
#'
#' The `RMPT05` table provides an overview of duration of exposure extent.
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' run(rmpt05, syn_data)
rmpt05 <- chevron_t(
  main = rmpt05_main,
  preprocess = rmpt05_pre,
  postprocess = rmpt01_post,
  dataset = c("adsl", "adex")
)
