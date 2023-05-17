# ael01_nollt ----

#' @describeIn ael01_nollt Main TLG function
#'
#' @inheritParams gen_args
#' @param dataset (`character`) the name of a table in the `adam_db` object.
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
ael01_nollt_main <- function(adam_db,
                             dataset = "adae",
                             key_cols = c("AEBODSYS", "AEDECOD"),
                             disp_cols = "AETERM",
                             ...) {
  assert_all_tablenames(adam_db, dataset)
  assert_valid_variable(adam_db[[dataset]], c(key_cols, disp_cols), label = paste0("adam_db$", dataset))

  as_listing(
    adam_db[[dataset]],
    key_cols = key_cols,
    disp_cols = disp_cols
  )
}

#' @describeIn ael01_nollt Preprocessing
#'
#' @inheritParams ael01_nollt_main
#'
#' @export
#'
ael01_nollt_pre <- function(adam_db,
                            dataset = "adae",
                            key_cols = c("AEBODSYS", "AEDECOD"),
                            disp_cols = "AETERM",
                            ...) {
  adam_db[[dataset]] <- adam_db[[dataset]] %>%
    select(all_of(c(key_cols, disp_cols))) %>%
    distinct() %>%
    mutate(
      across(all_of(c(key_cols, disp_cols)), ~ reformat(.x, nocoding))
    ) %>%
    arrange(pick(all_of(c(key_cols, disp_cols))))

  adam_db
}

#' @describeIn ael01_nollt Postprocessing
#'
#' @inheritParams gen_args
#'
ael01_nollt_post <- function(tlg, ...) {
  if (nrow(tlg) == 0) tlg <- null_listing

  tlg
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
  preprocess = ael01_nollt_pre,
  postprocess = ael01_nollt_post
)
