# dsl02 ----

#' @describeIn dsl02 Main TLG function
#'
#' @inheritParams gen_args
#' @param dataset (`character`) the name of a table in the `adam_db` object.
#' @param default_formatting (`list`) the default format of the listing columns. See [`rlistings::as_listing`].
#' @param col_formatting (`list`) the format of specific listing columns. See [`rlistings::as_listing`].
#'
#' @export
#'
dsl02_main <- function(adam_db,
                       dataset = "adsl",
                       arm_var = "ACTARM",
                       disp_cols = c("ID", "ASR", arm_var, "TRTSDTM", "EOSDY", "SSAEDY", "EOSRDY", "DCSREAS"),
                       ...) {
  assert_all_tablenames(adam_db, dataset)
  assert_valid_variable(adam_db[[dataset]], c(disp_cols), label = paste0("adam_db$", dataset))
  assert_list(default_formatting, types = "fmt_config", names = "unique")
  assert_flag(unique_rows)

  execute_with_args(
    as_listing,
    adam_db[[dataset]],
    key_cols = arm_var,
    disp_cols = disp_cols,
    ...,
    default_formatting = listing_format_chevron(),
    unique_rows = TRUE
  )
}

#' @describeIn dsl02 Preprocessing
#'
#' @inheritParams dsl02_main
#'
#' @export
#'
dsl02_pre <- function(adam_db,
                      dataset = "adsl",
                      arm_var = "ACTARM",
                      ...) {
  adam_db[[dataset]] <- adam_db[[dataset]] %>%
    filter(.data$AEWITHFL == "Y") %>%
    mutate(
      ID = create_id_listings(.data$SITEID, .data$SUBJID),
      ASR = with_label(paste(.data$AGE, .data$SEX, .data$RACE, sep = "/"), "Age/Sex/Race"),
      DISCONT = ifelse(!is.na(.data$DCSREAS) & .data$EOSSTT != "COMPLETED", "Yes", "No"),
      TRTSDTM = with_label(
        .data$TRTSDTM,
        "Date of First\nStudy Drug\nAdministration"
      ),
      SSAEDY = with_label(
        as.numeric(ceiling(difftime(.data$EOSDT, .data$TRTSDTM, units = "days"))),
        "Day of Study\nDiscontinuation\nRelative to First\nStudy Drug\nAdministration"
      ),
      EOSRDY = with_label(
        as.numeric(ceiling(difftime(.data$EOSDT, .data$RANDDT, units = "days"))),
        "Day of Study\nDiscontinuation\nRelative to\nRandomization"
      ),
      !!arm_var := with_label(.data[[arm_var]], "Treatment"),
      EOSDY = with_label(.data$EOSDY, "Day of Last\nStudy Drug\nAdministration"),
      DCSREAS = with_label(.data$DCSREAS, "Reason for\nDiscontinuation")
    ) %>%
    filter(.data$DISCONT == "Yes") %>%
    select(all_of(c("ID", "ASR", arm_var, "TRTSDTM", "EOSDY", "SSAEDY", "EOSRDY", "DCSREAS")))

  adam_db
}

#' `dsl02` Listing 1 (Default) Patients Who Discontinued Early from Study.
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' res <- run(dsl02, syn_data)
dsl02 <- chevron_l(
  main = dsl02_main,
  preprocess = dsl02_pre
)
