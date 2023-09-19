# pdl01 ----

#' @describeIn pdl01 Main TLG function
#'
#' @inheritParams gen_args
#' @param dataset (`character`) the name of a table in the `adam_db` object.
#' @param default_formatting (`list`) the default format of the listing columns. See [`rlistings::as_listing`].
#' @param col_formatting (`list`) the format of specific listing columns. See [`rlistings::as_listing`].
#'
#' @export
#'
pdl01_main <- function(adam_db,
                       dataset = "addv",
                       arm_var = "ARM",
                       disp_cols = names(adam_db[[dataset]]),
                       default_formatting = list(
                         all = fmt_config(align = "left"),
                         numeric = fmt_config(align = "center")
                       ),
                       col_formatting = NULL,
                       unique_rows = TRUE,
                       ...) {
  assert_all_tablenames(adam_db, dataset)
  assert_valid_variable(adam_db[[dataset]], c(disp_cols, arm_var), label = paste0("adam_db$", dataset))
  assert_list(default_formatting, types = "fmt_config", names = "unique")
  assert_list(col_formatting, null.ok = TRUE, types = "fmt_config", names = "unique")
  assert_flag(unique_rows)

  as_listing(
    adam_db[[dataset]],
    key_cols = arm_var,
    disp_cols = disp_cols,
    default_formatting = default_formatting,
    col_formatting = col_formatting,
    unique_rows = unique_rows
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
      ID = with_label(paste(.data$SITEID, .data$SUBJID, sep = "/"), "Center/Patient ID"),
      !!arm_var := with_label(.data[[arm_var]], "Treatment"),
      DVDECOD = with_label(.data$DVDECOD, "Category"),
      DVTERM = with_label(.data$DVTERM, "Description"),
      DVSTDTC = with_label(
        toupper(strftime(.data$DVSTDTC, format = "%d%b%Y")),
        "Date"
      ),
    ) %>%
    select(all_of(c("ID", arm_var, "DVDECOD", "DVTERM", "DVSTDTC")))

  adam_db
}

#' @describeIn pdl01 Postprocessing
#'
#' @inheritParams gen_args
#'
pdl01_post <- report_null

#' `PDL01` Listing 1 (Default) Major Protocol Deviations.
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' proc_data <- syn_data
#' proc_data$addv$DVSTDTC <- proc_data$addv$ASTDT
#' res <- run(pdl01, proc_data)
pdl01 <- chevron_l(
  main = pdl01_main,
  preprocess = pdl01_pre,
  postprocess = pdl01_post
)
