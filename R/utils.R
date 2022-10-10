# as we use NSE
globalVariables(c("."))

#' Retrieve labels for certain variables
#'
#' @param df data frame
#' @param vars variable names in `df`
#'
#' @export
var_labels_for <- function(df, vars) {
  assert_colnames(df, vars)
  unname(formatters::var_labels(df, fill = TRUE)[vars])
}


#' Standard documentation lookup
#'
#' @param id standard id of output
#' @param ... not used at the moment
#'
#' @export
std_deco <- function(id, ...) {
  list(
    title = "",
    subtitles = "",
    main_footer = ""
  )
}

basic_table_deco <- function(deco, ...) {
  checkmate::assert_set_equal(names(deco), c("title", "subtitles", "main_footer"))

  basic_table(title = deco$title, subtitles = deco$subtitles, main_footer = deco$main_footer, ...)
}

ifelse_layout <- function(lyt, test, fun_lyt_yes = identity, fun_lyt_no = identity) {
  checkmate::assert_flag(test)

  if (test) {
    fun_lyt_yes(lyt)
  } else {
    fun_lyt_no(lyt)
  }
}

lyt_fun <- function(fun, ...) {
  function(lyt) {
    fun(lyt, ...)
  }
}

has_overall_col <- function(lbl_overall) {
  !is.null(lbl_overall) && !identical(lbl_overall, "")
}

ifneeded_add_overall_col <- function(lyt, lbl_overall) {
  if (has_overall_col(lbl_overall)) {
    add_overall_col(lyt, label = lbl_overall)
  } else {
    lyt
  }
}

#' Get Data from a DB
#'
#' @param db a named list or a `dm` object.
#' @param ... not used.
#'
#' @return named list of datasets
#'
#' @examples
#' \dontrun{
#' get_db_data(list(iris = iris, mtcars = mtcars, CO2 = CO2))
#' get_db_data(list(iris = iris, mtcars = mtcars, CO2 = CO2), "iris")
#' get_db_data(list(iris = iris, mtcars = mtcars, CO2 = CO2), "iris", "CO2")
#'
#' db <- dm::dm_nycflights13() %>%
#'   dm_filter(airports, name == "John F Kennedy Intl")
#'
#' get_db_data(db, "airports")
#' }
get_db_data <- function(db, ...) { # TODO: revisit
  datasets <- c(...)

  if (length(datasets) == 0) {
    return(list())
  }

  checkmate::assert_subset(datasets, names(db))

  db[datasets]
}


#' Retrieve Synthetic Test Data Used For Examples
#' @export
syn_test_data <- function() {
  sd <- scda::synthetic_cdisc_data("rcd_2021_03_22")

  # to avoid bug
  attr(sd, "data_from") <- NULL

  # useful for ext01
  group <- list(
    list(
      "Dose administered during constant dosing interval",
      c(-Inf, 700, 900, 1200, Inf),
      c("<700", "700-900", "900-1200", ">1200")
    ),
    list(
      "Total dose administered",
      c(-Inf, 5000, 7000, 9000, Inf),
      c("<5000", "5000-7000", "7000-9000", ">9000")
    )
  )
  sd$adex <- dunlin::cut_by_group(as.data.frame(sd$adex), "AVAL", "PARAM", group, "AVALCAT1")
  sd$adex$AVALCAT1 <- forcats::fct_explicit_na(sd$adex$AVALCAT1, na_level = "<Missing>") # nolint

  # useful for dmt01
  adsub <- sd$adsub
  adsub_wide_ls <- dunlin::poly_pivot_wider(
    adsub,
    id = "USUBJID",
    param_from = "PARAMCD",
    value_from = "AVAL",
    labels_from = "PARAM"
  )
  adsub_wide_aval <- adsub_wide_ls[["AVAL"]]

  sd$adsl <- sd$adsl %>% left_join(adsub_wide_aval, by = "USUBJID")

  # useful for dst01
  sd$adsl[["EOSSTT"]] <- as.factor(toupper(sd$adsl[["EOSSTT"]]))

  set.seed(321)
  sd$adsl <- sd$adsl %>%
    mutate(EOTSTT = as.factor(sample(
      c("ONGOING", "COMPLETED", "DISCONTINUED"),
      nrow(sd$adsl),
      replace = TRUE
    )))

  db <- new_dm(sd) %>%
    dm_add_pk("adsl", c("USUBJID", "STUDYID")) %>%
    dm_add_fk("adae", c("USUBJID", "STUDYID"), ref_table = "adsl") %>%
    dm_add_pk("adae", "AESEQ")

  db <- db %>%
    dm_zoom_to("adsl") %>%
    mutate(ANL01FL = "Y") %>%
    dm_update_zoomed()

  db <- db %>%
    dm_zoom_to("adae") %>%
    mutate(AEBODSYS = formatters::with_label(.data$AEBODSYS, "MedDRA System Organ Class")) %>%
    mutate(AEDECOD = formatters::with_label(.data$AEDECOD, "MedDRA Preferred Term")) %>%
    dm_update_zoomed()

  db <- db %>%
    dm_zoom_to("admh") %>%
    mutate(MHBODSYS = formatters::with_label(.data$MHBODSYS, "MedDRA System Organ Class")) %>%
    mutate(MHDECOD = formatters::with_label(.data$MHDECOD, "MedDRA Preferred Term")) %>%
    dm_update_zoomed()

  db <- db %>%
    dm_zoom_to("adae") %>%
    mutate(ANL01FL = "Y") %>%
    mutate(ASEV = .data$AESEV) %>%
    mutate(AREL = .data$AEREL) %>%
    mutate(ATOXGR = .data$AETOXGR) %>%
    dm_update_zoomed()

  db <- db %>%
    dm_zoom_to("advs") %>%
    mutate(ANL01FL = "Y") %>%
    dm_update_zoomed()

  db <- db %>%
    dm_zoom_to("adcm") %>%
    mutate(ANL01FL = "Y") %>%
    dm_update_zoomed()

  db <- db %>%
    dm_zoom_to("admh") %>%
    mutate(ANL01FL = "Y") %>%
    dm_update_zoomed()

  db
}

#' Temporary function to add decorator to a table
#'
#' @param x (`rtables`) object.
#' @param deco (`list`) typically generated with `std_deco()`.
#'
#' @return `rtables` with set title, subtitle and footnotes. If one of this attribute is NULL, the slot is empty.
set_decoration <- function(x, deco) {
  checkmate::assert_multi_class(x, c("TableTree", "ElementaryTable"))
  checkmate::assert_list(deco, types = "character", max.len = 3, names = "unique")
  checkmate::assert_subset(names(deco), c("title", "subtitles", "main_footer"))

  x@main_title <- deco$title
  x@subtitles <- deco$subtitles
  x@main_footer <- deco$main_footer
  x
}

#' Create a Null Report
#'
#' @param tlg (`TableTree`) object.
#' @param ... not used.
#'
#' @export
#'
#' @return original `TableTree` or a null report if no observation are found in the table.
#'
report_null <- function(tlg, ...) {
  if (nrow(tlg) == 0L) {
    rtables::rtable(header = "Null Report: No observations met the reporting criteria for inclusion in this output.")
  } else {
    checkmate::assert_multi_class(tlg, c("TableTree"))
    tlg
  }
}


#' Prune Table up to an `ElementaryTable`
#'
#' Avoid returning `NULL` when the `table` is empty.
#'
#' @param tlg (`TableTree`) object.
#'
#' @return pruned `TableTree`.
#'
smart_prune <- function(tlg) {
  res <- prune_table(tlg)

  if (is.null(res)) {
    res <- build_table(rtables::basic_table(), df = data.frame())
    col_info(res) <- col_info(tlg)
  }

  res
}

#' Unite Columns of a Table in a `dm` object.
#'
#' @inheritParams gen_args
#' @param dataset (`string`) the name of a table in the `adam_db` object.
#' @param cols (`character`) the name of the columns to unite.
#' @param sep (`string`) the separator for the new column name.
#' @param new (`string`) the name of the new column. If `NULL` the concatenation of `cols` separated by `sep` is used.
#'
#' @return `dm` object with a united column.
#'
dm_unite <- function(adam_db, dataset, cols, sep = ".", new = NULL) {
  checkmate::assert_class(adam_db, "dm")
  checkmate::assert_string("dataset")
  checkmate::assert_character(cols, min.len = 1)
  checkmate::assert_string(sep)

  int_df <- adam_db %>%
    dm_zoom_to(!!dataset)

  x_interaction <- paste(cols, collapse = sep)

  x_df <- int_df %>%
    select(all_of(cols)) %>%
    pull_tbl()

  lvl <- lapply(x_df, function(y) if (is.factor(y)) levels(y) else unique(y))
  all_lvl_df <- as.data.frame(Reduce(expand.grid, lvl))
  colnames(all_lvl_df) <- cols

  all_lvl <- all_lvl_df %>%
    unite("res", cols, sep = sep) %>%
    pull("res")

  x_vec <- x_df %>%
    unite("res", cols, sep = sep) %>%
    pull(res)

  existing_lvl <- intersect(all_lvl, x_vec)
  levels(x_vec) <- existing_lvl

  x_interaction <- if (!is.null(new)) new else x_interaction

  int_df %>%
    mutate(!!x_interaction := .env$x_vec) %>%
    dm_update_zoomed()
}
