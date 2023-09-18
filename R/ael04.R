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
                       key_cols = "CPID",
                       disp_cols = c("ASR", arm_var, "DATE_FIRST", "EOSDY", "DTHADY", "DTHCAUS", "ADTHAUT"),
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
      CPID = with_label(paste(.data$SITEID, .data$SUBJID, sep = "/"), "Center/Patient ID"),
      ASR = with_label(paste(.data$AGE, .data$SEX, .data$RACE, sep = "/"), "Age/Sex/Race"),
      DATE_FIRST = with_label(
        toupper(format(as.Date(.data$TRTSDTM), "%d%b%Y")),
        "Date of\nFirst Study\nDrug\nAdministration"
      ),
      !!arm_var := with_label(.data[[arm_var]], "Treatment"),
      EOSDY = with_label(.data$EOSDY, "Day of Last\nStudy Drug\nAdministration"),
      DTHADY = with_label(.data$DTHADY, "Day of\nDeath"),
      DTHCAUS = with_label(.data$DTHCAUS, "Cause of Death"),
      ADTHAUT = with_label(.data$ADTHAUT, "Autopsy\nPerformed?")
    ) %>%
    select(all_of(c(
      "CPID", "ASR", arm_var, "DATE_FIRST", "EOSDY", "DTHADY", "DTHCAUS", "ADTHAUT"
    )))

  adam_db
}

#' @describeIn ael04 Postprocessing
#'
#' @inheritParams gen_args
#'
ael04_post <- function(tlg, ...) {
  if (nrow(tlg) == 0) tlg <- null_report

  tlg
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
  preprocess = ael04_pre,
  postprocess = ael04_post
)
