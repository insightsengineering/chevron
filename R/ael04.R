# ael04_main ----

#' @describeIn ael04 Main TLG function
#'
#' @inheritParams gen_args
#' @returns the main function returns an `rlistings` or a `list` object.
#' @export
#'
ael04_main <- modify_default_args(
  std_listing,
  dataset = "adsl",
  key_cols = "ID",
  disp_cols = c("ASR", "TRTSDTM", "EOSDY", "DTHADY", "DTHCAUS", "ADTHAUT"),
  split_into_pages_by_var = "ACTARM"
)


#' @describeIn ael04 Preprocessing
#'
#' @inheritParams ael04_main
#' @inheritParams gen_args
#'
#' @export
#'
ael04_pre <- function(adam_db,
                      dataset = "adsl",
                      split_into_pages_by_var = "ACTARM",
                      ...) {
  adam_db[[dataset]] <- adam_db[[dataset]] %>%
    filter(!is.na(.data$DTHADY)) %>%
    mutate(
      across(
        all_of(c(split_into_pages_by_var, "DTHCAUS", "ADTHAUT")),
        ~ reformat(.x, missing_rule)
      )
    ) %>%
    mutate(
      ID = create_id_listings(.data$SITEID, .data$SUBJID),
      ASR = with_label(paste(.data$AGE, .data$SEX, .data$RACE, sep = "/"), "Age/Sex/Race"),
      TRTSDTM = with_label(
        .data$TRTSDTM,
        "Date of\nFirst Study\nDrug\nAdministration"
      ),
      !!split_into_pages_by_var := with_label(.data[[split_into_pages_by_var]], "Treatment"),
      EOSDY = with_label(.data$EOSDY, "Day of Last\nStudy Drug\nAdministration"),
      DTHADY = with_label(.data$DTHADY, "Day of\nDeath"),
      DTHCAUS = with_label(.data$DTHCAUS, "Cause of Death"),
      ADTHAUT = with_label(.data$ADTHAUT, "Autopsy\nPerformed?")
    )

  adam_db
}

#' `AEL04` Listing 1 (Default) Listing of Patient Deaths.
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' res <- run(ael04, syn_data)
ael04 <- chevron_l(
  main = ael04_main,
  preprocess = ael04_pre
)
