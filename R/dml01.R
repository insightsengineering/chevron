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
                       key_cols = "ARM",
                       disp_cols = names(adam_db[[dataset]]),
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
    key_cols = key_cols,
    disp_cols = disp_cols,
    default_formatting = default_formatting,
    col_formatting = col_formatting,
    unique_rows = unique_rows
  )
}

#' @describeIn dml01 Preprocessing
#'
#' @inheritParams dml01_main
#' @param summaryvars (`character`) variables summarized in demographic table. The label attribute of the corresponding
#'   column in `adsl` table of `adam_db` is used as label.
#'
#' @export
#'
dml01_pre <- function(adam_db,
                      dataset = "adsl",
                      summaryvars = c(
                        "AGEGR1",
                        "ETHNIC"
                      ),
                      by = "ARM",
                      ...) {
  adam_db[[dataset]] <- adam_db[[dataset]] %>%
    mutate(
      ID = with_label(paste(.data$SITEID, .data$SUBJID, sep = "/"), "Center/Patient ID"),
      ASR = with_label(paste(.data$AGE, .data$SEX, .data$RACE, sep = "/"), "Age/Sex/Race")
    ) %>%
    select(all_of(c("ID", "ASR", summaryvars, by)))

  adam_db
}

#' @describeIn dml01 Postprocessing
#'
#' @inheritParams gen_args
#'
dml01_post <- function(tlg, ...) {
  if (nrow(tlg) == 0) tlg <- null_report

  tlg
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
  preprocess = dml01_pre,
  postprocess = dml01_post
)
