# dsl01 ----

#' @describeIn dsl01 Main TLG function
#'
#' @inheritParams gen_args
#' @param dataset (`character`) the name of a table in the `adam_db` object.
#' @param default_formatting (`list`) the default format of the listing columns. See [`rlistings::as_listing`].
#' @param col_formatting (`list`) the format of specific listing columns. See [`rlistings::as_listing`].
#'
#' @export
#'
dsl01_main <- function(adam_db,
                       dataset = "adsl",
                       arm_var = "ACTARM",
                       disp_cols = c("ID", "ASR", arm_var, "SSADM", "STDWD", "DISCONT"),
                       default_formatting = list(
                         all = fmt_config(align = "left"),
                         numeric = fmt_config(align = "center")
                       ),
                       col_formatting = NULL,
                       unique_rows = TRUE,
                       ...) {
  assert_all_tablenames(adam_db, dataset)
  assert_valid_variable(adam_db[[dataset]], c(disp_cols), label = paste0("adam_db$", dataset))
  assert_list(default_formatting, types = "fmt_config", names = "unique")
  assert_list(col_formatting, null.ok = TRUE, types = "fmt_config", names = "unique")
  assert_flag(unique_rows)

  as_listing(
    adam_db[[dataset]],
    disp_cols = disp_cols,
    default_formatting = default_formatting,
    col_formatting = col_formatting,
    unique_rows = unique_rows
  )
}

#' @describeIn dsl01 Preprocessing
#'
#' @inheritParams dsl01_main
#'
#' @export
#'
dsl01_pre <- function(adam_db,
                      dataset = "adsl",
                      ...) {
  adam_db[[dataset]] <- adam_db[[dataset]] %>%
    filter(.data$AEWITHFL == "Y") %>%
    mutate(
      ID = with_label(paste(.data$SITEID, .data$SUBJID, sep = "/"), render_safe("Center/{Patient_label} ID")),
      ASR = with_label(paste(.data$AGE, .data$SEX, .data$RACE, sep = "/"), "Age/Sex/Race"),
      !!arm_var := with_label(.data[[arm_var]], "Treatment"),
      SSADM = with_label(
        sort_str_time(.data$TRTSDTM),
        "Date of First\nStudy Drug\nAdministration"
      ),
      STDWD = with_label(
        as.numeric(ceiling(difftime(.data$TRTEDTM, .data$TRTSDTM, units = "days"))),
        "Study Day\nof Withdrawal"
      ),
      DISCONT = with_label(
        ifelse(!is.na(.data$DCSREAS) & toupper(.data$EOSSTT) == "DISCONTINUED", "Yes", "No"),
        "Discontinued\nEarly from Study?"
      )
    ) %>%
    select(all_of(c("ID", "ASR", arm_var, "SSADM", "STDWD", "DISCONT")))

  adam_db
}

#' @describeIn dsl01 Postprocessing
#'
#' @inheritParams gen_args
#'
dsl01_post <- report_null

#' `DSL01` Listing 1 (Default) Patients with Study Drug Withdrawn Due to Adverse Events.
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' res <- run(dsl01, syn_data)
dsl01 <- chevron_l(
  main = dsl01_main,
  preprocess = dsl01_pre,
  postprocess = dsl01_post
)
