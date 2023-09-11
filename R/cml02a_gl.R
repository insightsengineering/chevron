# cml02a_gl ----

#' @describeIn cml02a_gl Main TLG function
#'
#' @inheritParams gen_args
#' @param dataset (`character`) the name of a table in the `adam_db` object.
#' @param default_formatting (`list`) the default format of the listing columns. See [`rlistings::as_listing`].
#' @param col_formatting (`list`) the format of specific listing columns. See [`rlistings::as_listing`].
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
cml02a_gl_main <- function(adam_db,
                           dataset = "adcm",
                           key_cols = c("ATC2", "CMDECOD", "CMTRT"),
                           disp_cols = names(adam_db[[dataset]]),
                           default_formatting = list(
                             all = fmt_config(align = "left"),
                             numeric = fmt_config(align = "center")
                           ),
                           col_formatting = NULL,
                           unique_rows = TRUE,
                           ...) {
  assert_all_tablenames(adam_db, dataset)
  assert_valid_variable(adam_db[[dataset]], c(key_cols, disp_cols), label = paste0("adam_db$", dataset))
  assert_list(default_formatting, types = "fmt_config", names = "unique")
  assert_list(col_formatting, null.ok = TRUE, types = "fmt_config", names = "unique")
  assert_flag(unique_rows)

  as_listing(
    adam_db[[dataset]],
    key_cols = key_cols,
    disp_cols = disp_cols,
    default_formatting = default_formatting,
    col_formatting = col_formatting,
    unique_rows = unique_rows
  )
}

#' @describeIn cml02a_gl Preprocessing
#'
#' @inheritParams cml02a_gl_main
#'
#' @export
#'
cml02a_gl_pre <- function(adam_db,
                          dataset = "adcm",
                          key_cols = c("ATC2", "CMDECOD", "CMTRT"),
                          ...) {
  adam_db[[dataset]] <- adam_db[[dataset]] %>%
    mutate(
      ATC2 = with_label(.data$ATC2, "ATC Class Level 2"),
      CMDECOD = with_label(.data$CMDECOD, "WHODrug Preferred Name"),
      CMTRT = with_label(.data$CMTRT, "Investigator-Specified\nTreatment Term")
    ) %>%
    select(all_of(key_cols))

  adam_db
}

#' @describeIn cml02a_gl Postprocessing
#'
#' @inheritParams gen_args
#'
cml02a_gl_post <- function(tlg, ...) {
  if (nrow(tlg) == 0) tlg <- null_report

  tlg
}

#' `CML02A_GL` Listing 1 (Default) Concomitant Medication Class Level 2, Preferred Name, and Investigator-Specified
#' Terms.
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' run(cml02a_gl, syn_data)
cml02a_gl <- chevron_l(
  main = cml02a_gl_main,
  preprocess = cml02a_gl_pre,
  postprocess = cml02a_gl_post
)
