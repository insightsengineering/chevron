# ael04_main ----

#' @describeIn ael04 Main TLG function
#'
#' @inheritParams gen_args
#' @param dataset (`string`) the name of a table in the `adam_db` object.
#' @param default_formatting (`list`) the default format of the listing columns. See [`rlistings::as_listing`].
#' @param col_formatting (`list`) the format of specific listing columns. See [`rlistings::as_listing`].
#'
#' @export
#'
ael04_main <- function(adam_db,
                       dataset = "adsl",
                       arm_var = "ACTARM",
                       key_cols = "ID",
                       disp_cols = c("ASR", arm_var, "TRTSDTM", "EOSDY", "DTHADY", "DTHCAUS", "ADTHAUT"),
                       default_formatting = list(
                         all = fmt_config(align = "left"),
                         numeric = fmt_config(align = "center"),
                         Date = fmt_config(format = format_date(), align = "left"),
                         POSIXct = fmt_config(format = format_date(), align = "left"),
                         POSIXt = fmt_config(format = format_date(), align = "left")
                       ),
                       unique_rows = TRUE,
                       ...) {
  assert_all_tablenames(adam_db, dataset)
  assert_valid_variable(adam_db[[dataset]], c(arm_var, key_cols, disp_cols), label = paste0("adam_db$", dataset))
  assert_list(default_formatting, types = "fmt_config", names = "unique")
  assert_flag(unique_rows)

  execute_with_args(
    as_listing,
    adam_db[[dataset]],
    key_cols = key_cols,
    disp_cols = disp_cols,
    default_formatting = default_formatting,
    unique_rows = unique_rows,
    ...
  )
}

#' @describeIn ael04 Preprocessing
#'
#' @inheritParams ael04_main
#'
#' @export
#'
ael04_pre <- function(adam_db,
                      dataset = "adsl",
                      arm_var = "ACTARM",
                      ...) {
  adam_db[[dataset]] <- adam_db[[dataset]] %>%
    filter(!is.na(.data$DTHADY)) %>%
    mutate(
      across(
        all_of(c(arm_var, "DTHCAUS", "ADTHAUT")),
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
      !!arm_var := with_label(.data[[arm_var]], "Treatment"),
      EOSDY = with_label(.data$EOSDY, "Day of Last\nStudy Drug\nAdministration"),
      DTHADY = with_label(.data$DTHADY, "Day of\nDeath"),
      DTHCAUS = with_label(.data$DTHCAUS, "Cause of Death"),
      ADTHAUT = with_label(.data$ADTHAUT, "Autopsy\nPerformed?")
    ) %>%
    select(all_of(c(
      "ID", "ASR", arm_var, "TRTSDTM", "EOSDY", "DTHADY", "DTHCAUS", "ADTHAUT"
    )))

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
