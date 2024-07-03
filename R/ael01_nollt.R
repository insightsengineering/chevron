# ael01_nollt ----

#' @describeIn ael01_nollt Main TLG function
#'
#' @inheritParams std_listing
#' @returns the main function returns an `rlistings` or a `list` object.
#'
#' @details
#'  * Removes duplicate rows.
#'  * By default, uses dataset `adae`, sorting by key columns `AEBODSYS` and `AEDECOD`.
#'  * If using with a dataset other than `adae`, be sure to specify the desired labels for variables in
#'    `key_cols` and `disp_cols`, and pre-process missing data.
#'
#' @note
#'  * `adam_db` object must contain the `dataset` table with columns specified by `key_cols` and `disp_cols`.
#'
#' @export
#'
ael01_nollt_main <- modify_default_args(
  std_listing,
  dataset = "adae",
  key_cols = c("AEBODSYS", "AEDECOD"),
  disp_cols = "AETERM",
  split_into_pages_by_var = NULL
)

#' @describeIn ael01_nollt Preprocessing
#'
#' @inheritParams ael01_nollt_main
#' @returns the preprocessing function returns a `list` of `data.frame`.
#'
#' @export
#'
ael01_nollt_pre <- function(adam_db,
                            dataset = "adae",
                            key_cols = c("AEBODSYS", "AEDECOD"),
                            disp_cols = "AETERM",
                            ...) {
  adam_db[[dataset]] <- adam_db[[dataset]] %>%
    mutate(
      across(all_of(c(key_cols, disp_cols)), ~ reformat(.x, nocoding))
    ) %>%
    arrange(pick(all_of(c(key_cols, disp_cols))))

  adam_db
}

#' `AEL01_NOLLT` Listing 1 (Default) Glossary of Preferred Terms and Investigator-Specified Terms.
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' run(ael01_nollt, syn_data)
ael01_nollt <- chevron_l(
  main = ael01_nollt_main,
  preprocess = ael01_nollt_pre
)
