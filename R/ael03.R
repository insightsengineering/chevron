# ael03_main ----

#' @describeIn ael03 Main TLG function
#'
#' @inheritParams gen_args
#' @param dataset (`string`) the name of a table in the `adam_db` object.
#'
#' @export
#'
ael03_main <- function(adam_db,
                       dataset = "adae",
                       arm_var = "ACTARM",
                       key_cols = c("ID", "ASR", arm_var),
                       disp_cols = c(
                         "AEDECOD", "TRTSDTM", "ASTDY", "ADURN", "ASEV",
                         "AREL", "AEOUT", "AECONTRT", "AEACN", "SERREAS"
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

#' @describeIn ael03 Preprocessing
#'
#' @inheritParams ael03_main
#'
#' @export
#'
ael03_pre <- function(adam_db,
                      dataset = "adae",
                      arm_var = "ACTARM",
                      ...) {
  adam_db[[dataset]] <- adam_db[[dataset]] %>%
    filter(.data$ANL01FL == "Y") %>%
    filter(.data$AESER == "Y") %>%
    mutate(
      across(
        all_of(c(arm_var, "AEDECOD", "ASEV", "AEOUT", "AEACN")),
        ~ reformat(.x, missing_rule)
      )
    ) %>%
    mutate(
      !!arm_var := with_label(.data[[arm_var]], "Treatment"),
      ID = create_id_listings(.data$SITEID, .data$SUBJID),
      AEDECOD = with_label(reformat(.data$AEDECOD, nocoding), "Adverse\nEvent MedDRA\nPreferred Term"),
      ASR = with_label(paste(.data$AGE, .data$SEX, .data$RACE, sep = "/"), "Age/Sex/Race"),
      # Datetime of First Exposure to Treatment
      TRTSDTM = with_label(.data$TRTSDTM, "Date of\nFirst Study\nDrug\nAdministration"),
      ASTDY = with_label(.data$ASTDY, "Study\nDay of\nOnset"),
      ADURN = with_label(.data$AENDY - .data$ASTDY + 1, "AE\nDuration\nin Days"),
      AESER = with_label(.data$AESER, "Serious"),
      ASEV = with_label(.data$ASEV, "Most\nExtreme\nIntensity"),
      AREL = with_label(reformat(.data$AREL, yes_no_rule), "Caused by\nStudy\nDrug"), # Analysis Causality
      AEOUT = with_label(case_when(
        AEOUT == "FATAL" ~ 1,
        AEOUT == "NOT RECOVERED/NOT RESOLVED" ~ 2,
        AEOUT == "RECOVERED/RESOLVED" ~ 3,
        AEOUT == "RECOVERED/RESOLVED WITH SEQUELAE" ~ 4,
        AEOUT == "RECOVERING/RESOLVING" ~ 5,
        AEOUT == "UNKNOWN" ~ 6
      ), "Outcome\n(1)"),
      AECONTRT = with_label(reformat(.data$AECONTRT, yes_no_rule), "Treatment\nfor AE"),
      AEACN = with_label(case_when(
        AEACN == "DOSE INCREASED" ~ 1,
        AEACN == "DOSE NOT CHANGED" ~ 2,
        AEACN == "DOSE REDUCED" | AEACN == "DOSE RATE REDUCED" ~ 3,
        AEACN == "DRUG INTERRUPTED" ~ 4,
        AEACN == "DRUG WITHDRAWN" ~ 5,
        AEACN == "NOT APPLICABLE" | AEACN == "NOT EVALUABLE" ~ 6,
        AEACN == "UNKNOWN" ~ 7
      ), "Action\nTaken\n(2)"),
      # New derived column
      SERREAS = with_label(case_when(
        AESDTH == "Y" ~ "1",
        AESLIFE == "Y" ~ "2",
        AESHOSP == "Y" ~ "3",
        AESDISAB == "Y" ~ "4",
        AESCONG == "Y" ~ "5",
        AESMIE == "Y" ~ "6",
        TRUE ~ " "
      ), "Reason\nClassified\nas Serious\n(3)"),
    )

  adam_db
}

#' `AEL03` Listing 1 (Default) Listing of Serious Adverse Events.
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' res <- run(ael03, syn_data)
ael03 <- chevron_l(
  main = ael03_main,
  preprocess = ael03_pre
)
