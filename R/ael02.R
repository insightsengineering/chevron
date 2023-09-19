# ael02_main ----

#' @describeIn ael02 Main TLG function
#'
#' @inheritParams gen_args
#' @param dataset (`string`) the name of a table in the `adam_db` object.
#' @param default_formatting (`list`) the default format of the listing columns. See [`rlistings::as_listing`].
#' @param col_formatting (`list`) the format of specific listing columns. See [`rlistings::as_listing`].
#'
#' @export
#'
ael02_main <- function(adam_db,
                       dataset = "adae",
                       arm_var = "ACTARM",
                       key_cols = c("CPID", "ASR", arm_var),
                       disp_cols = c(
                         "AEDECOD", "TRTSDTM", "ASTDY", "ADURN", "AESER",
                         "AESEV", "RELATED", "OUTCOME", "TREATED", "ACTION"
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
        all_of(c("TRT01A", "AEDECOD", "AESEV", "AEOUT", "AEACN")),
        ~ reformat(.x, missing_rule)
      )
    ) %>%
    mutate(
      CPID = with_label(paste(.data$SITEID, .data$SUBJID, sep = "/"), "Center/Patient ID"),
      ASR = with_label(paste(.data$AGE, .data$SEX, .data$RACE, sep = "/"), "Age/Sex/Race"),
      TRTSDTM = with_label(
        toupper(format(as.Date(.data$TRTSDTM), "%d%b%Y")),
        "Date of\nFirst Study\nDrug\nAdministration"
      ),
      ADURN = with_label(.data$AENDY - .data$ASTDY + 1, "AE\nDuration\nin Days"),
      AESER = with_label(reformat(.data$AESER, Yes_No_rule), "Serious"),
      RELATED = with_label(
        ifelse(.data$AEREL == "Y", "Yes", ifelse(.data$AEREL == "N", "No", "")),
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
      TREATED = with_label(
        ifelse(.data$AECONTRT == "Y", "Yes", ifelse(.data$AECONTRT == "N", "No", "")),
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
      !!arm_var := with_label(.data[[arm_var]], "Treatment"),
      AEDECOD = with_label(reformat(.data$AEDECOD, nocoding), "Adverse\nEvent MedDRA\nPreferred Term"),
      ASTDY = with_label(.data$ASTDY, "Study\nDay of\nOnset"),
      AESEV = with_label(.data$AESEV, "Most\nExtreme\nIntensity")
    ) %>%
    select(all_of(c(
      "CPID", "ASR", arm_var, "AEDECOD", "TRTSDTM", "ASTDY", "ADURN",
      "AESER", "AESEV", "RELATED", "OUTCOME", "TREATED", "ACTION"
    )))

  adam_db
}

#' @describeIn ael02 Postprocessing
#'
#' @inheritParams gen_args
#'
ael02_post <- report_null

#' `AEL02` Listing 1 (Default) Listing of Adverse Events.
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' res <- run(ael02, syn_data)
ael02 <- chevron_l(
  main = ael02_main,
  preprocess = ael02_pre,
  postprocess = ael02_post
)
