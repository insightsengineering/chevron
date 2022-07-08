# as we use NSE
globalVariables(c("."))

#' Retrieve variables for certain variables
#'
#' @param df data frame
#' @param vars variable names in data frame `df`
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
<<<<<<< HEAD
  if (!is.null(gds_data[[id]])) {
    list(
      title = gds_data[[id]]$`Standard titles`[1],
      subtitles = c("Protocol: {{protocol}}", gds_data[[id]]$`Standard titles`[-1]), # nolint
      main_footer = paste(gds_data[[id]]$`Standard footnotes`, collapse = " ")
    )
  } else {
    list(
      title = "Main Title",
      subtitles = "Protocol: {{protocol}}",
      main_footer = "Footnotes go here"
    )
  }
=======
  list(
    title = "",
    subtitles = "",
    main_footer = ""
  )
>>>>>>> origin/main
}

#' Convert Y N values used in CDISC to R boolean object
#'
#' Empty strings are mapped to `NA`
#'
#' @param x character vector with Y and N
#'
#' @export
#'
#' @examples
#' \dontrun{
#' chevron:::bol_YN(c("Y", "Y", "N", "", NA))
#' }
bol_YN <- function(x) { # nolint

  .Deprecated(new = "apply_reformat", package = "dunlin")

  if (is.logical(x)) {
    x
  } else {
    y <- x == "Y"
    y[x == ""] <- NA
    y
  }
}

#' Reorder PARAM and PARAMCD Levels Simultaneously
#'
#' @param df data.frame with PARAM and PARAMCD variables
#' @param paramcd_levels ordered levels of PARAMCD
#'
#' @export
#'
#' @examples
#' df <- data.frame(PARAMCD = factor(c("A", "B", "C")), PARAM = factor(paste("letter", LETTERS[1:3])))
#'
#' \dontrun{
#' str(reorder_levels_params(df, paramcd_levels = c("B", "A", "C")))
#' str(reorder_levels_params(df, paramcd_levels = c("B", "A")))
#' }
reorder_levels_params <- function(df, paramcd_levels) {
  .Deprecated(new = "co_relevels", package = "dunlin")

  # todo throw errors
  stopifnot(
    all(c("PARAM", "PARAMCD") %in% names(df))
  )

  dfs <- df[c("PARAMCD", "PARAM")]
  dfsd <- dfs[!duplicated(dfs), ]

  if (any(duplicated(dfsd[, "PARAM"])) || any(duplicated(dfsd[, "PARAMCD"]))) {
    stop(".... are not unique")
  } ## assuming 1:1 mapping

  x <- setNames(as.character(dfsd$PARAM), dfsd$PARAMCD)

  new_levels <- c(paramcd_levels, setdiff(levels(df$PARAMCD), paramcd_levels))

  levels(df$PARAMCD) <- new_levels
  levels(df$PARAM) <- x[new_levels]

  df
}

<<<<<<< HEAD
#' Pivot wider a data frame while preserving labels.
#'
#' @param df (`data.frame`) to pivot.
#' @param names_from (`string`) the name of a column in `df` that will be used to name the columns of the pivoted data
#'   frame.
#' @param labels_from (`string`) the name of a column in `df` that will be used to label the columns of the pivoted
#'   data frame.
#' @param values_from (`string`) the name of a column in `df`containing the values to be pivoted.
#' @param keep  (`vector of strings`) containing the name of the columns to be conserved in the pivoted data frame.
#'   Typically a unique identifier for the pivoted observations, such as `USUBJID`.
#'
#' @importFrom dplyr select
#' @importFrom tidyr pivot_wider
#'
#' @return (`data.frame`)
#' @export
#'
#' @examples
#' library(scda)
#' adsub <- synthetic_cdisc_data("rcd_2021_03_22")$adsub
#' pivot_wider_labels(adsub, "PARAMCD", "PARAM", "AVAL", c("USUBJID", "SUBJID"))
pivot_wider_labels <- function(df,
                               names_from = "PARAMCD",
                               labels_from = "PARAM",
                               values_from = "AVAL",
                               keep = "USUBJID") {
  key_val <- df[!duplicated(df[, c(labels_from, names_from)]), c(labels_from, names_from)]

  checkmate::assert_true(all(!duplicated(key_val[[1]])))
  checkmate::assert_true(all(!duplicated(key_val[[2]])))

  df_wide <- df %>%
    select(keep, names_from, values_from) %>%
    pivot_wider(names_from = names_from, values_from = values_from)

  formatters::var_labels(df_wide[, key_val[[2]]]) <- as.character(key_val[[1]])

  df_wide
}

=======
>>>>>>> origin/main

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

  if (is(db, "dm")) {
    db <- db %>%
      dm_apply_filters() # TODO this might be computationally expensive
  }

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
  checkmate::assert_class(x, "TableTree")
  checkmate::assert_list(deco, types = "character", max.len = 3, names = "unique")
  checkmate::assert_subset(names(deco), c("title", "subtitles", "main_footer"))

  x@main_title <- deco$title
  x@subtitles <- deco$subtitles
  x@main_footer <- deco$main_footer
  x
}
