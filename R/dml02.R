# dml02 ----

#' @describeIn dml02 Main TLG function
#'
#' @inheritParams gen_args
#' @param dataset (`character`) the name of a table in the `adam_db` object.
#' @param default_formatting (`list`) the default format of the listing columns. See [`rlistings::as_listing`].
#' @param col_formatting (`list`) the format of specific listing columns. See [`rlistings::as_listing`].
#'
#' @export
#'
dml02_main <- function(adam_db,
                       dataset = "adsl",
                       arm_var = "ARM",
                       disp_cols = c("ID", arm_var, "RANDDT", "TRTSDT"),
                       ...) {
  assert_all_tablenames(adam_db, dataset)
  assert_valid_variable(adam_db[[dataset]], c(disp_cols, arm_var), label = paste0("adam_db$", dataset))

  execute_with_args(
    as_listing,
    adam_db[[dataset]],
    key_cols = arm_var,
    disp_cols = disp_cols,
    ...,
    default_formatting = listing_format_chevron(),
    unique_rows = TRUE
  )
}

#' @describeIn dml02 Preprocessing
#'
#' @inheritParams dml02_main
#'
#' @export
#'
dml02_pre <- function(adam_db,
                      dataset = "adsl",
                      arm_var = "ARM",
                      ...) {
  adam_db[[dataset]] <- adam_db[[dataset]] %>%
    mutate(
      ID = create_id_listings(.data$SITEID, .data$SUBJID),
      !!arm_var := with_label(.data[[arm_var]], "Randomized Treatment"),
      RANDDT = with_label(
        .data$RANDDT,
        "Date of\nRandomization"
      ),
      TRTSDT = with_label(
        .data$TRTSDTM,
        "Date of\nFirst Study Drug\nAdministration"
      )
    )

  adam_db
}

#' `DML02` Listing 1 (Default) Randomization.
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' res <- run(dml02, syn_data)
dml02 <- chevron_l(
  main = dml02_main,
  preprocess = dml02_pre
)
