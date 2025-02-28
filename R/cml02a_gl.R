# cml02a_gl_main ----

#' @describeIn cml02a_gl Main TLG function
#'
#' @inheritParams gen_args
#' @returns the main function returns an `rlistings` or a `list` object.
#' @export
#'
cml02a_gl_main <- modify_default_args(std_listing,
  dataset = "adcm",
  key_cols = c("ATC2", "CMDECOD"),
  disp_cols = c("ATC2", "CMDECOD", "CMTRT"),
  split_into_pages_by_var = NULL,
  unique_rows = TRUE
)

#' @describeIn cml02a_gl Preprocessing
#'
#' @inheritParams cml02a_gl_main
#' @inheritParams gen_args
#' @returns the preprocessing function returns a `list` of `data.frame`.
#'
#' @export
#'
cml02a_gl_pre <- function(adam_db,
                          dataset = "adcm",
                          disp_cols = c("ATC2", "CMDECOD", "CMTRT"),
                          ...) {
  adam_db[[dataset]] <- adam_db[[dataset]] %>%
    mutate(across(all_of(disp_cols), ~ reformat(.x, nocoding))) %>%
    mutate(
      ATC2 = with_label(.data$ATC2, "ATC Class Level 2"),
      CMDECOD = with_label(.data$CMDECOD, "WHODrug Preferred Name"),
      CMTRT = with_label(.data$CMTRT, "Investigator-Specified Treatment Term")
    )

  adam_db
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
  dataset = c("adcm", "adsl")
)
