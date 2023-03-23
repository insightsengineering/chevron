# ael01_nollt_1 ----

#' @describeIn ael01_nollt_1 Main TLG function
#'
#' @inheritParams gen_args
#' @param dataset (`string`) the name of a table in the `adam_db` object.
#'
#' @details
#'  * Removes duplicate rows.
#'  * Using dataset `adae`, sorts by key columns `AEBODSYS` and `AEDECOD`.
#'  * Using dataset `admh`, sorts by key columns `MHBODSYS` and `MHDECOD`.
#'
#' @note
#'  * `adam_db` object must contain an `adae` table with columns `AEBODSYS`, `AEDECOD`, and `AETERM`.
#'  * `adam_db` object must contain an `admh` table with columns `MHBODSYS`, `MHDECOD`, and `MHTERM`.
#'
#' @export
#'
ael01_nollt_1_main <- function(adam_db,
                               dataset = "adae",
                               deco = std_deco("AEL01_NOLLT"),
                               ...) {
  vars <- paste0(ifelse(dataset == "adae", "AE", "MH"), c("BODSYS", "DECOD", "TERM"))

  df <- adam_db[[dataset]]
  assert_colnames(df, vars)

  lsting <- as_listing(
    df,
    key_cols = vars[1:2],
    disp_cols = vars[-c(1:2)]
  )

  lsting
}

#' @describeIn ael01_nollt_1 Preprocessing
#'
#' @inheritParams ael01_nollt_1_main
#'
#' @export
#'
ael01_nollt_1_pre <- function(adam_db, dataset = "adae", ...) {
  checkmate::assert_class(adam_db, "dm")

  vars <- paste0(ifelse(dataset == "adae", "AE", "MH"), c("BODSYS", "DECOD", "TERM"))
  desc <- ifelse(dataset == "adae", "Adverse Event", "Medical History")
  ael01_nollt_1_check(adam_db, dataset = dataset, vars = vars)

  db <- adam_db %>%
    dm_zoom_to(!!dataset) %>%
    select(all_of(vars)) %>%
    distinct() %>%
    mutate(
      !!vars[1] := formatters::with_label(.data[[vars[1]]], "MedDRA System Organ Class"),
      !!vars[2] := formatters::with_label(.data[[vars[2]]], "MedDRA Preferred Term"),
      !!vars[3] := formatters::with_label(.data[[vars[3]]], paste("Investigator-Specified\n", desc, "Term"))
    ) %>%
    arrange(pick(vars)) %>%
    dm_update_zoomed()

  missing_rule <- rule("No Coding Available" = c("", NA))

  new_format <- list()
  new_format[[dataset]] <- list(
    missing_rule,
    missing_rule
  )
  names(new_format[[dataset]]) <- vars[1:2]

  db <- dunlin::reformat(db, new_format, na_last = TRUE)

  db
}

#' @describeIn ael01_nollt_1 Checks
#'
#' @inheritParams gen_args
#' @param vars (`character`) variables to be included in the listing.
#'
ael01_nollt_1_check <- function(adam_db,
                                dataset = "adae",
                                vars) {
  checkmate::assert_choice(dataset, c("adae", "admh"))
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
#' run(ael01_nollt_1, syn_data, dataset = "adae")
ael01_nollt_1 <- chevron_l(
  main = ael01_nollt_1_main,
  preprocess = ael01_nollt_1_pre,
  postprocess = ael01_nollt_1_post
)
