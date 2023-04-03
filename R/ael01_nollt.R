# ael01_nollt_1 ----

#' @describeIn ael01_nollt_1 Main TLG function
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
ael01_nollt_1_main <- function(adam_db,
                               dataset = "adae",
                               key_cols = c("AEBODSYS", "AEDECOD"),
                               disp_cols = "AETERM",
                               deco = std_deco("AEL01_NOLLT"),
                               ...) {
  df <- adam_db[[dataset]]

  lsting <- as_listing(
    df,
    key_cols = key_cols,
    disp_cols = disp_cols
  )

  lsting
}

#' @describeIn ael01_nollt_1 Preprocessing
#'
#' @inheritParams ael01_nollt_1_main
#' @param new_lbls (named `list` of `strings`) list where names correspond to variable names in `dataset` and
#'   strings to the new labels to apply to the named variables. Set to `NULL` to use default labels.
#'
#' @export
#'
ael01_nollt_1_pre <- function(adam_db,
                              dataset = "adae",
                              key_cols = c("AEBODSYS", "AEDECOD"),
                              disp_cols = "AETERM",
                              new_lbls = NULL,
                              ...) {
  checkmate::assert_class(adam_db, "dm")

  ael01_nollt_1_check(adam_db, dataset = dataset, vars = c(key_cols, disp_cols, names(new_lbls)))

  missing_rule <- rule("No Coding Available" = c("", NA))
  new_format <- list()
  new_format[[dataset]] <- rep(list(missing_rule), length(c(key_cols, disp_cols)))
  names(new_format[[dataset]]) <- c(key_cols, disp_cols)

  db <- dunlin::reformat(adam_db, new_format, na_last = TRUE)

  db <- db %>%
    dm_zoom_to(!!dataset) %>%
    select(all_of(c(key_cols, disp_cols))) %>%
    distinct() %>%
    arrange(pick(all_of(c(key_cols, disp_cols)))) %>%
    mutate(across(names(new_lbls), function(x) formatters::with_label(x, new_lbls[[cur_column()]]))) %>%
    dm_update_zoomed()

  db
}

#' @describeIn ael01_nollt_1 Checks
#'
#' @inheritParams gen_args
#' @param vars (`character`) variables to be included in the listing.
#'
ael01_nollt_1_check <- function(adam_db,
                                dataset,
                                vars) {
  assert_all_tablenames(adam_db, dataset)

  msg <- c(NULL, check_all_colnames(adam_db[[dataset]], vars))

  if (is.null(msg)) {
    TRUE
  } else {
    stop(paste(msg, collapse = "\n  "))
  }
}

#' @describeIn ael01_nollt_1 Postprocessing
#'
#' @inheritParams gen_args
#'
ael01_nollt_1_post <- function(tlg, ...) {
  if (nrow(tlg) == 0) tlg <- null_listing

  tlg
}

#' `AEL01_NOLLT` Listing 1 (Default) Glossary of Preferred Terms and Investigator-Specified Terms.
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' run(ael01_nollt_1, syn_data, new_lbls = list(AETERM = "Investigator-Specified\n Adverse Event Term"))
ael01_nollt_1 <- chevron_l(
  main = ael01_nollt_1_main,
  preprocess = ael01_nollt_1_pre,
  postprocess = ael01_nollt_1_post
)
