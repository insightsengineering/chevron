# dml01 ----

#' @describeIn dml01 Main TLG function
#'
#' @inheritParams gen_args
#' @param dataset (`character`) the name of a table in the `adam_db` object.
#'
#' @export
#'
dml01_main <- function(adam_db,
                       dataset = "adsl",
                       arm_var = "ARM",
                       disp_cols = c("ID", "ASR", "AGEGR1", "ETHNIC", arm_var),
                       ...) {
  assert_all_tablenames(adam_db, dataset)
  assert_valid_variable(adam_db[[dataset]], c(disp_cols), label = paste0("adam_db$", dataset))

  execute_with_args(
    as_listing,
    df = adam_db[[dataset]],
    disp_cols = disp_cols,
    ...,
    default_formatting = listing_format_chevron(),
    unique_rows = TRUE
  )
}

#' @describeIn dml01 Preprocessing
#'
#' @inheritParams dml01_main
#'
#' @export
#'
dml01_pre <- function(adam_db,
                      dataset = "adsl",
                      ...) {
  adam_db[[dataset]] <- adam_db[[dataset]] %>%
    mutate(
      ID = create_id_listings(.data$SITEID, .data$SUBJID),
      ASR = with_label(paste(.data$AGE, .data$SEX, .data$RACE, sep = "/"), "Age/Sex/Race")
    )

  adam_db
}

#' `DML01` Listing 1 (Default) Demographics and Baseline Characteristics.
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' res <- run(dml01, syn_data)
dml01 <- chevron_l(
  main = dml01_main,
  preprocess = dml01_pre
)
