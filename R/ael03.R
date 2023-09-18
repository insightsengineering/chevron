# ael03_main ----

#' @describeIn ael03 Main TLG function
#'
#' @inheritParams gen_args
#' @param dataset (`string`) the name of a table in the `adam_db` object.
#' @param default_formatting (`list`) the default format of the listing columns. See [`rlistings::as_listing`].
#' @param col_formatting (`list`) the format of specific listing columns. See [`rlistings::as_listing`].
#'
#' @export
#'
ael03_main <- function(adam_db,
                       dataset = "adae",
                       arm_var = "ACTARM",
                       key_cols = c("CPID", "ASR", arm_var),
                       disp_cols = c(
                         "AEDECOD", "DATE_FIRST", "ASTDY", "ADURN","AESEV",
                         "AEREL", "OUTCOME", "AECONTRT", "ACTION", "SERREAS"
                       ),
                       default_formatting = list(
                         all = fmt_config(align = "left"),
                         numeric = fmt_config(align = "center")
                       ),
                       col_formatting = NULL,
                       unique_rows = TRUE,
                       ...) {
  assert_all_tablenames(adam_db, dataset)
  assert_valid_variable(adam_db[[dataset]], c(arm_var, key_cols, disp_cols), label = paste0("adam_db$", dataset))
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
        all_of(c(arm_var, "AEDECOD", "AESEV", "AEOUT", "AEACN")),
        ~ reformat(.x, missing_rule)
      )
    ) %>%
    mutate(
      CPID = with_label(paste(.data$SITEID, .data$SUBJID, sep = "/"), "Center/Patient ID"),
      ASR = with_label(paste(.data$AGE, .data$SEX, .data$RACE, sep = "/"), "Age/Sex/Race"),
      DATE_FIRST = with_label(
        toupper(format(as.Date(.data$TRTSDTM), "%d%b%Y")),
        "Date of\nFirst Study\nDrug\nAdministration"
      ),
      ADURN = with_label(.data$AENDY - .data$ASTDY + 1, "AE\nDuration\nin Days"),
      AEREL = with_label(
        reformat(.data$AEREL, Yes_No_rule),
        "Caused by\nStudy\nDrug"
      ),
      OUTCOME = with_label(case_when(
        AEOUT == "FATAL" ~ 1,
        AEOUT == "NOT RECOVERED/NOT RESOLVED" ~ 2,
        AEOUT == "RECOVERED/RESOLVED" ~ 3,
        AEOUT == "RECOVERED/RESOLVED WITH SEQUELAE" ~ 4,
        AEOUT == "RECOVERING/RESOLVING" ~ 5,
        AEOUT == "UNKNOWN" ~ 6
      ), "Outcome\n(1)"),
      AECONTRT = with_label(
        reformat(.data$AECONTRT, Yes_No_rule),
        "Treatment\nfor AE"
      ),
      ACTION = with_label(case_when(
        AEACN == "DOSE INCREASED" ~ 1,
        AEACN == "DOSE NOT CHANGED" ~ 2,
        AEACN == "DOSE REDUCED" | AEACN == "DOSE RATE REDUCED" ~ 3,
        AEACN == "DRUG INTERRUPTED" ~ 4,
        AEACN == "DRUG WITHDRAWN" ~ 5,
        AEACN == "NOT APPLICABLE" | AEACN == "NOT EVALUABLE" ~ 6,
        AEACN == "UNKNOWN" ~ 7
      ), "Action\nTaken\n(2)"),
      SERREAS = with_label(case_when(
        AESDTH == "Y" ~ "1",
        AESLIFE == "Y" ~ "2",
        AESHOSP == "Y" ~ "3",
        AESDISAB == "Y" ~ "4",
        AESCONG == "Y" ~ "5",
        AESMIE == "Y" ~ "6",
        TRUE ~ " "
      ), "Reason\nClassified\nas Serious\n(3)"),
      !!arm_var := with_label(.data[[arm_var]], "Treatment"),
      AEDECOD = with_label(reformat(as.factor(.data$AEDECOD), nocoding), "Adverse\nEvent MedDRA\nPreferred Term"),
      ASTDY = with_label(.data$ASTDY, "Study\nDay of\nOnset"),
      AESEV = with_label(.data$AESEV, "Most\nExtreme\nIntensity")
    ) %>%
    select(all_of(c(
      "CPID", "ASR", arm_var, "AEDECOD", "DATE_FIRST", "ASTDY", "ADURN",
      "AESEV", "AEREL", "OUTCOME", "AECONTRT", "ACTION", "SERREAS"
    )))

  adam_db
}

#' @describeIn ael03 Postprocessing
#'
#' @inheritParams gen_args
#'
ael03_post <- function(tlg, ...) {
  if (nrow(tlg) == 0) tlg <- null_report

  tlg
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
  preprocess = ael03_pre,
  postprocess = ael03_post
)
