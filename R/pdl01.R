# pdl01 ----

#' @describeIn pdl01 Main TLG function
#'
#' @inheritParams gen_args
#' @param dataset (`character`) the name of a table in the `adam_db` object.
#'
#' @export
#'
pdl01_main <- function(adam_db,
                       dataset = "addv",
                       arm_var = "ARM",
                       disp_cols = c("ID", arm_var, "DVDECOD", "DVTERM", "DVSTDTC"),
                       ...) {
  assert_all_tablenames(adam_db, dataset)
  assert_valid_variable(adam_db[[dataset]], c(disp_cols, arm_var), label = paste0("adam_db$", dataset))

  execute_with_args(
    as_listing,
    df = adam_db[[dataset]],
    key_cols = arm_var,
    disp_cols = disp_cols,
    ...,
    col_formatting = list(DVSTDTC = fmt_config(format = format_date(), align = "left")),
    default_formatting = listing_format_chevron(),
    unique_rows = TRUE
  )
}

#' @describeIn pdl01 Preprocessing
#'
#' @inheritParams pdl01_main
#'
#' @export
#'
pdl01_pre <- function(adam_db,
                      dataset = "addv",
                      arm_var = "ARM",
                      ...) {
  adam_db[[dataset]] <- adam_db[[dataset]] %>%
    filter(.data$DVCAT == "MAJOR") %>%
    mutate(
      ID = create_id_listings(.data$SITEID, .data$SUBJID),
      !!arm_var := with_label(.data[[arm_var]], "Treatment"),
      DVDECOD = with_label(.data$DVDECOD, "Category"),
      DVTERM = with_label(.data$DVTERM, "Description"),
      DVSTDTC = with_label(.data$DVSTDTC, "Date")
    )

  adam_db
}

#' `PDL01` Listing 1 (Default) Major Protocol Deviations.
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' proc_data <- syn_data
#' proc_data$addv$DVSTDTC <- as.character(proc_data$addv$ASTDT)
#' res <- run(pdl01, proc_data)
pdl01 <- chevron_l(
  main = pdl01_main,
  preprocess = pdl01_pre
)
