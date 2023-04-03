#' General Argument Name Convention
#'
#' @param adam_db (`dm`) object containing the `ADaM` datasets
#' @param main (`function`) returning a `tlg`, with `adam_db` as first argument. Typically one of the `_main` function
#'   of `chevron`.
#' @param preprocess (`function`) returning a pre-processed `dm` object, with `adam_db` as first argument. Typically one
#'   of the `_pre` function of `chevron`.
#' @param postprocess (`function`) returning a post-processed `tlg`, with `tlg` as first argument.
#' @param adam_datasets (`character`) representing the names of the tables from an `ADaM` data set required for `tlg`
#'   creation.
#' @param type (`string`) indicating the subclass.
#' @param arm_var (`string`) variable used for column splitting
#' @param deco (`character`) decoration with `title`, `subtitles` and `main_footer` content
#' @param lbl_overall (`string`) label used for overall column, if set to `NULL` the overall column is omitted
#' @param prune_0 (`flag`) remove 0 count rows
#' @param req_tables (`character`) names of the required tables.
#' @param tlg (`TableTree`, `Listing` or `ggplot`) object typically produced by a `main` function.
#' @param tlgfname (`character`) function name of TLG function
#' @param group (`list of lists`) for group-dependent data binning
#' @param visit_var Analysis Visit variable.
#' @param paramcd_value Value of PARAMCD variable.
#' @param visit_value Value of visit variable.
#' @param key_cols (`character`) names of columns that should be treated as key columns when rendering the listing.
#'   Key columns allow you to group repeat occurrences.
#' @param disp_cols (`character`) names of non-key columns which should be displayed when the listing is rendered.
#' @param ... not used.
#'
#' @details the following arguments are better provided through the study object: `lbl_overall`, `arm_var`.
#'
gen_args <- function(adam_db, main, preprocess, postprocess, adam_datasets,
                     type, arm_var, lbl_overall, prune_0, req_tables, deco, group,
                     tlg, tlgfname, visit_var, visit_value, paramcd_value, ...) {
}
