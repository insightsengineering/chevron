# dml01 ----

#' @describeIn dml01 Main TLG function
#'
#' @inheritParams gen_args
#' @param dataset (`character`) the name of a table in the `adam_db` object.
#' @param default_formatting (`list`) the default format of the listing columns. See [`rlistings::as_listing`].
#' @param col_formatting (`list`) the format of specific listing columns. See [`rlistings::as_listing`].
#'
#' @export
#'
dml01_main <- function(adam_db,
                       dataset = "adsl",
                       arm_var = "ARM",
                       disp_cols = c("ID", "ASR", "AGEGR1", "ETHNIC", arm_var),
                       default_formatting = list(
                         all = fmt_config(align = "left"),
                         numeric = fmt_config(align = "center")
                       ),
                       unique_rows = TRUE,
                       ...) {
  assert_all_tablenames(adam_db, dataset)
  assert_valid_variable(adam_db[[dataset]], c(disp_cols), label = paste0("adam_db$", dataset))
  assert_list(default_formatting, types = "fmt_config", names = "unique")
  assert_flag(unique_rows)

  execute_with_args(
    as_listing,
    adam_db[[dataset]],
    disp_cols = disp_cols,
    default_formatting = default_formatting,
    unique_rows = unique_rows,
    ...
  )
}

#' @describeIn dml01 Preprocessing
#'
#' @inheritParams dml01_main
#'
#' @export
#'
dml01_pre <- function(adam_db,
                      dataset = "adsl",
                      arm_var = "ARM",
                      disp_cols = c("ID", "ASR", "AGEGR1", "ETHNIC", arm_var),
                      ...) {
  adam_db[[dataset]] <- adam_db[[dataset]] %>%
    mutate(
      ID = create_id_listings(.data$SITEID, .data$SUBJID),
      ASR = with_label(paste(.data$AGE, .data$SEX, .data$RACE, sep = "/"), "Age/Sex/Race")
    ) %>%
    select(all_of(disp_cols))

  adam_db
}

#' `DML01` Listing 1 (Default) Demographics and Baseline Characteristics.
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' res <- run(dml01, syn_data)
dml01 <- chevron_l(
  main = dml01_main,
  preprocess = dml01_pre
)
