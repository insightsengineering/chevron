
#' General Argument Name Convention
#'
#' @param adam_db (`dm`) object containing the `ADaM` datasets
#' @param lyt_ls (`list of functions` returning `PreDataTableLayout` object. Typically one of the `_lyt` function of
#'   `chevron` stored in a `list`.
#' @param plot_ls (`list of functions`) creating a `ggplot` object.
#' @param armvar (`character`) variable used for column splitting
#' @param deco (`character`) decoration with `title`, `subtitles` and `main_footer` content
#' @param lbl_overall (`character`) label used for overall column, if set to `NULL` the overall column is omitted
#' @param prune_0 (`logical`) remove 0 count rows
#' @param req_tables (`character`) names of the required tables.
#' @param tlg (`TableTree`, `Listing` or `ggplot`) object typically produced by a `main` function.
#' @param tlgfname (`character`) function name of TLG function
#' @param group (`list of lists`) for group-dependent data binning
#'
#' @details the following arguments are better provided through the study object: `lbl_overall`, `armvar`.
#'
gen_args <- function(adam_db, lyt_ls, plot_ls, armvar, lbl_overall, prune_0, req_tables, deco, group,
                     tlg, tlgfname) {
  NULL
}
