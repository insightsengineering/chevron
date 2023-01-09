# as we use NSE
globalVariables(c(".", ":="))

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
#' @rdname syn_test_data
syn_test_data <- function() {
  sd <- scda::synthetic_cdisc_data("rcd_2022_06_27")

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
  sd$adsl$AAGE <- sd$adsl$AGE
  attr(sd$adsl$AAGE, "label") <- "Age (yr)"
  sd$adsl$AGEGR1 <- cut(sd$adsl$AGE, c(0, 65, 200), c("<65", ">=65"))
  attr(sd$adsl$AGEGR1, "label") <- "Age Group"
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

  # useful for lbt04
  set.seed(321)
  sd$adlb <- sd$adlb %>%
    mutate(
      PARCAT1 = as.factor(sample(c("CHEMISTRY", "COAGULATION", "HEMATOLOGY"), nrow(sd$adlb), replace = TRUE)),
      PARCAT2 = as.factor(sample(c("LS", "CV", "SI"), nrow(sd$adlb), replace = TRUE))
    )

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

#' example data generated with syn_test_data()
#' @export
#' @rdname syn_test_data
syn_data <- syn_test_data()

#' Temporary function to add decorator to a table
#'
#' @param x (`rtables`) object.
#' @param deco (`list`) typically generated with `std_deco()`.
#'
#' @keywords internal
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
#' @rdname report_null
#' @aliases null_report
#' @param tlg (`TableTree`) object.
#' @param ... not used.
#'
#' @export
#'
#' @return original `TableTree` or a null report if no observation are found in the table.
#'
report_null <- function(tlg, ...) {
  if (nrow(tlg) == 0L) {
    null_report
  } else {
    checkmate::assert_multi_class(tlg, c("TableTree"))
    tlg
  }
}

#' @export
#' @rdname report_null
null_report <- rtables::rtable(
  header = "",
  rrow("Null Report: No observations met the reporting criteria for inclusion in this output.")
)

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

#' Get Labels
#'
#' @param df (`data.frame`).
#' @param x (`character`) the names of column in the `df` data frame.
#'
#' @return the name of each element in the `x` vector where missing names are replaced with the value of the label
#'   attribute for the corresponding column in the `df` data frame.
#'
#' @keywords internal
#'
get_labels <- function(df, x) {
  checkmate::assert_character(x)
  assert_colnames(df, x)

  labels <- var_labels_for(df, x)

  all_names <- names(x)

  if (is.null(all_names)) {
    labels
  } else {
    if_else(all_names == "", labels, all_names)
  }
}

#' Standard Post processing
#'
#' @param tlg (`TableTree`) object.
#' @param ind (`integer`) the indentation of the table.
#'
#' @note Standard post processing includes:
#' * `NULL` report creation if necessary
#' * indentation
#'
#' @return a post-processed `tlg`.
#'
#' @keywords internal
#'
std_postprocess <- function(tlg, ind = 2L, ...) {
  checkmate::assert_integerish(ind, lower = 0L)

  res <- report_null(tlg)
  table_inset(res) <- ind

  res
}

# Special formats ----

#' Padding or Rounding Numbers and Deviation
#'
#' @inheritParams h_pad_or_round
#' @param x (`numeric`) representing the main value and its error.
#'
#' @export
#'
#' @examples
#' h_pad_or_round_dev(c(1.11111, 0.5), 3)
h_pad_or_round_dev <- function(x, digits = NA, ...) {
  checkmate::assert_numeric(x, len = 2)

  if (x[1] == 0 && x[2] == 0) {
    return("0")
  }

  main <- h_pad_or_round(x[1], digits = digits)
  err <- h_pad_or_round(x[2], digits = digits)

  paste0(main, " (", err, ")")
}

#' Padding or Rounding Numbers with Separator
#'
#' @inheritParams h_pad_or_round
#' @param x (`numeric`) to format.
#' @param sep (`string`) separating the formatted values.
#'
#' @export
#'
#' @examples
#' h_pad_or_round_sep(c(1.11111, 2.22222), 3)
h_pad_or_round_sep <- function(x, digits = NA, sep = " - ", ...) {
  checkmate::assert_numeric(x)
  checkmate::assert_string(sep)

  res <- vapply(x, h_pad_or_round, digits = digits, FUN.VALUE = character(1))
  paste(res, collapse = sep)
}

#' Padding or Rounding Numbers
#'
#' @param x (`numeric`) to format.
#' @param digits (`integer`) number of digits.
#' @param ... not used.
#'
#' @return `string` corresponding to the number with the desired numbers of digits.
#'
#' @export
#'
#' @examples
#' h_pad_or_round(123.1234, 10)
#' h_pad_or_round(123.15, 1)
#' h_pad_or_round(123, 1)
#' h_pad_or_round(123, 3)
h_pad_or_round <- function(x, digits = NA, ...) {
  checkmate::assert_numeric(x, len = 1)
  checkmate::assert_integerish(digits, lower = 0)

  if (is.na(x) || is.na(digits)) {
    return(as.character(x))
  }

  sprintf(paste0("%.", digits, "f"), x)
}
