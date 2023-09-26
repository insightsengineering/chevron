# ael02_main ----

#' @describeIn ael02 Main TLG function
#'
#' @inheritParams gen_args
#' @param dataset (`string`) the name of a table in the `adam_db` object.
#'
#' @export
#'
ael02_main <- function(adam_db,
                       dataset = "adae",
                       arm_var = "ACTARM",
                       key_cols = c("ID", "ASR", arm_var),
                       disp_cols = c(
                         "AEDECOD", "TRTSDTM", "ASTDY", "ADURN", "AESER",
                         "ASEV", "AREL", "AEOUT", "AECONTRT", "AEACN"
                       ),
                       ...) {
  assert_all_tablenames(adam_db, dataset)
  assert_valid_variable(adam_db[[dataset]], c(arm_var, key_cols, disp_cols), label = paste0("adam_db$", dataset))

  execute_with_args(
    as_listing,
    df = adam_db[[dataset]],
    key_cols = key_cols,
    disp_cols = disp_cols,
    ...,
    default_formatting = listing_format_chevron(),
    unique_rows = TRUE
  )
}

#' @describeIn ael02 Preprocessing
#'
#' @inheritParams ael02_main
#'
#' @export
#'
ael02_pre <- function(adam_db,
                      dataset = "adae",
                      arm_var = "ACTARM",
                      ...) {
  adam_db[[dataset]] <- adam_db[[dataset]] %>%
    filter(.data$ANL01FL == "Y") %>%
    mutate(
      across(
        all_of(c(arm_var, "AEDECOD", "ASEV", "AEOUT", "AEACN")),
        ~ reformat(.x, missing_rule)
      )
    ) %>%
    mutate(
      !!arm_var := with_label(.data[[arm_var]], "Treatment"),
      ID = create_id_listings(.data$SITEID, .data$SUBJID),
      ASR = with_label(paste(.data$AGE, .data$SEX, .data$RACE, sep = "/"), "Age/Sex/Race"),
      TRTSDTM = with_label(
        .data$TRTSDTM,
        "Date of\nFirst Study\nDrug\nAdministration"
      ),
      AEDECOD = with_label(reformat(.data$AEDECOD, nocoding), "Adverse\nEvent MedDRA\nPreferred Term"),
      ASTDY = with_label(.data$ASTDY, "Study\nDay of\nOnset"),
      ADURN = with_label(.data$ADURN, "AE\nDuration\nin Days"),
      AESER = with_label(reformat(.data$AESER, yes_no_rule), "Serious"),
      ASEV = with_label(.data$ASEV, "Most\nExtreme\nIntensity"),
      AREL = with_label(reformat(.data$AREL, yes_no_rule), "Caused by\nStudy\nDrug"),
      AEOUT = with_label(as.numeric(reformat(.data$AEOUT, outcome_rule)), "Outcome\n(1)"),
      AECONTRT = with_label(reformat(.data$AECONTRT, yes_no_rule), "Treatment\nfor AE"),
      AEACN = with_label(as.numeric(reformat(.data$AEACN, dose_change_rule)), "Action\nTaken\n(2)")
    )

  adam_db
}

#' `AEL02` Listing 1 (Default) Listing of Adverse Events.
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' res <- run(ael02, syn_data)
ael02 <- chevron_l(
  main = ael02_main,
  preprocess = ael02_pre
)
