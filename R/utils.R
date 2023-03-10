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
get_db_data <- function(db, ...) {
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
  sd$adex$AVALCAT1 <- forcats::fct_na_value_to_level(sd$adex$AVALCAT1, level = "<Missing>") # nolint

  # Add AVALCAT1 CHGCAT1 for adeg
  sd$adeg <- sd$adeg %>%
    mutate(
      AVALCAT1 = case_when(
        PARAMCD == "QT" & AVAL <= 450 ~ paste("<=450", " ", AVALU),
        PARAMCD == "QT" & AVAL > 450 & AVAL <= 480 ~ paste(">450 to <=480", " ", AVALU),
        PARAMCD == "QT" & AVAL > 480 & AVAL <= 500 ~ paste(">480 to <=500", " ", AVALU),
        PARAMCD == "QT" & AVAL > 500 ~ paste(">500", " ", AVALU),
        PARAMCD == "QT" & is.na(AVAL) ~ "<Missing>"
      ),
      CHGCAT1 = case_when(
        PARAMCD == "QT" & CHG <= 30 ~ paste("<=30", " ", AVALU),
        PARAMCD == "QT" & CHG > 30 & CHG <= 60 ~ paste(">30 to <=60", " ", AVALU),
        PARAMCD == "QT" & CHG > 60 ~ paste(">60", " ", AVALU),
        PARAMCD == "QT" & is.na(CHG) ~ "<Missing>"
      ),
      AVALCAT1 = factor(AVALCAT1),
      CHGCAT1 = factor(CHGCAT1)
    )

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

  sd$adsl <- sd$adsl %>%
    mutate(EOTSTT = {
      set.seed(321)
      as.factor(sample(c("ONGOING", "COMPLETED", "DISCONTINUED"), nrow(sd$adsl), replace = TRUE))
    })

  # useful for lbt04, lbt05
  qntls <- sd$adlb %>%
    group_by(PARAMCD) %>%
    summarise(as_tibble(t(quantile(AVAL, probs = c(0.1, 0.9)))), .groups = "drop_last") %>%
    rename(q1 = 2, q2 = 3)

  sd$adlb <- qntls %>%
    left_join(sd$adlb, by = "PARAMCD") %>%
    group_by(USUBJID, PARAMCD, BASETYPE) %>%
    mutate(
      ANRIND = factor(
        case_when(
          ANRIND == "LOW" & AVAL <= q1 ~ "LOW LOW",
          ANRIND == "HIGH" & AVAL >= q2 ~ "HIGH HIGH",
          TRUE ~ as.character(ANRIND)
        ),
        levels = c("", "HIGH", "HIGH HIGH", "LOW", "LOW LOW", "NORMAL")
      ),
      AVALCAT1 = factor(
        case_when(
          ANRIND %in% c("HIGH HIGH", "LOW LOW") ~ {
            set.seed(1)
            sample(x = c("LAST", "REPLICATED", "SINGLE"), size = n(), replace = TRUE, prob = c(0.3, 0.6, 0.1))
          },
          TRUE ~ ""
        ),
        levels = c("", "LAST", "REPLICATED", "SINGLE")
      )
    ) %>%
    ungroup() %>%
    mutate(
      PARCAT1 = {
        set.seed(2)
        as.factor(sample(c("CHEMISTRY", "COAGULATION", "HEMATOLOGY"), n(), replace = TRUE))
      },
      PARCAT2 = as.factor(case_when(
        ANRIND %in% c("HIGH HIGH", "LOW LOW") ~ "LS",
        TRUE ~ {
          set.seed(3)
          sample(c("LS", "CV", "SI"), size = n(), replace = TRUE)
        }
      ))
    ) %>%
    select(-q1, -q2)

  db <- new_dm(sd) %>%
    dm_add_pk("adsl", c("USUBJID", "STUDYID"))
  for (k in setdiff(names(sd), "adsl")) {
    db <- eval(bquote(dm_add_fk(db, .(k), c("USUBJID", "STUDYID"), ref_table = "adsl")))
  }

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
#'
#' @export
#'
#' @return original `TableTree` or a null report if no observation are found in the table.
#'
report_null <- function(tlg) {
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
#' @param ... not used at the moment.
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

#' Decimal Formatting
#'
#' @param digits (`integer`) number of digits.
#' @param format (`string`) describing how the numbers should be formatted following the `sprintf` syntax.
#'
#' @return `function` formatting numbers with the defined format or `NULL` if the format is not defined.
#'
#' @export
#'
#' @examples
#' fun <- h_format_dec(1, "%f - %f")
#' fun(c(123, 567.89))
#'
h_format_dec <- function(digits = NA, format = NA) {
  checkmate::assert_integerish(digits, lower = 0, len = 1)
  checkmate::assert_string(format, na.ok = TRUE)

  if (is.na(format)) {
    NULL
  } else {
    function(x, ...) {
      checkmate::assert_numeric(x)

      digit_string <- ifelse(is.na(digits), "", paste0(".", digits))
      new_format <- gsub("%([a-z])", paste0("%", digit_string, "\\1"), format)

      formatters::sprintf_format(new_format)(x)
    }
  }
}

#' Fuse list elements
#'
#' @param x (`list`) to fuse.
#' @param y (`list`) to fuse. Elements with names already existing in `x` are discarded.
#'
#' @keywords internal
#'
fuse_sequentially <- function(x, y) {
  if (missing(y)) {
    return(x)
  }

  names_x <- names(x)
  sel_names_y <- setdiff(names(y), names_x)

  c(x, y[sel_names_y])
}

#' List of grob object
#' @param ... (`grob`) objects
#' @export
grob_list <- function(...) {
  ret <- list(...)
  checkmate::assert_list(ret, types = c("grob"))
  structure(
    ret,
    class = c("grob_list", "list")
  )
}

#' List of `gg` object
#' @param ... (`ggplot`) objects
#' @export
gg_list <- function(...) {
  ret <- list(...)
  checkmate::assert_list(ret, types = c("ggplot"))
  structure(
    ret,
    class = c("gg_list", "list")
  )
}
