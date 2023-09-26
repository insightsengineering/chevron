# as we use NSE
globalVariables(c(".", ":="))

#' Retrieve labels for certain variables
#'
#' @param df (`data.frame`) containing columns with label attribute.
#' @param vars (`character`) variable names in `df`.
#'
#' @details
#' The labels will be returned if the column has `label` attribute, otherwise the column name will be returned.
#' Any values between brackets {} will be replaced with `dunlin::render_safe`.
#'
#' @export
var_labels_for <- function(df, vars) {
  assert_names(colnames(df), must.include = vars, what = "colnames")
  render_safe(unname(formatters::var_labels(df, fill = TRUE)[vars]))
}

#' Prune table up to an `ElementaryTable`
#'
#' Avoid returning `NULL` when the `table` is empty.
#'
#' @param tlg (`TableTree`) object.
#'
#' @return pruned `TableTree`.
smart_prune <- function(tlg) {
  res <- prune_table(tlg)

  if (is.null(res)) {
    res <- build_table(rtables::basic_table(), df = data.frame())
    col_info(res) <- col_info(tlg)
  }

  res
}

#' Standard post processing
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
std_postprocess <- function(tlg, ind = 2L, ...) {
  assert_int(ind, lower = 0L)

  res <- report_null(tlg)
  table_inset(res) <- ind

  res
}

# Special formats ----

#' Decimal formatting
#'
#' @param digits (`integer`) number of digits.
#' @param format (`string`) describing how the numbers should be formatted following the `sprintf` syntax.
#' @param ne (`flag`) indicator whether to use "NE" to replace the actual value.
#'
#' @return `function` formatting numbers with the defined format.
#'
#' @export
#'
#' @examples
#' fun <- h_format_dec(c(1, 1), "%s - %s")
#' fun(c(123, 567.89))
h_format_dec <- function(digits, format, ne = FALSE) {
  assert_integerish(digits, lower = 0)
  assert_string(format)
  if (any(is.na(digits))) {
    function(x, ...) {
      ""
    }
  } else {
    if (ne) {
      ret <- function(x, ...) {
        do_call(sprintf, c(list(fmt = format), rep("NE", length(digits))))
      }
      return(ret)
    }
    digit_string <- paste0("%", ifelse(is.na(digits), "", paste0(".", digits)), "f")
    new_format <- do_call(sprintf, c(list(fmt = format), digit_string))
    formatters::sprintf_format(new_format)
  }
}

#' Fuse list elements
#'
#' @param x (`list`) to fuse.
#' @param y (`list`) to fuse. Elements with names already existing in `x` are discarded.
#'
#' @keywords internal
fuse_sequentially <- function(x, y) {
  if (missing(y)) {
    return(x)
  }

  names_x <- names(x)
  sel_names_y <- setdiff(names(y), names_x)

  c(x, y[sel_names_y])
}

#' List of `grob` object
#'
#' @param ... (`grob`) objects
#'
#' @export
grob_list <- function(...) {
  ret <- list(...)
  assert_list(ret, types = c("grob"))
  structure(
    ret,
    class = c("grob_list", "list")
  )
}

#' List of `gg` object
#'
#' @param ... (`ggplot`) objects
#'
#' @export
gg_list <- function(...) {
  ret <- list(...)
  assert_list(ret, types = c("ggplot"))
  structure(
    ret,
    class = c("gg_list", "list")
  )
}

#' @export
droplevels.character <- function(x, ...) {
  x
}

#' Obtain levels from vector
#'
#' @param x (`character`) or (`factor`) object to obtain levels.
#' @details
#' For factors, the levels will be returned. For characters, the sorted unique values will be returned.
#'
#' @export
lvls <- function(x) {
  UseMethod("lvls")
}
#' @export
lvls.default <- function(x) {
  NULL
}
#' @export
lvls.character <- function(x) {
  sort(unique(x))
}
#' @export
lvls.factor <- function(x) {
  levels(x)
}

#' @keywords internal
quote_str <- function(x) {
  assert_string(x)
  paste0("`", x, "`")
}

#' @keywords internal
modify_default_args <- function(fun, ...) {
  ret <- fun
  formals(ret) <- utils::modifyList(formals(fun), list(...), keep.null = TRUE)
  return(ret)
}

#' Execute function with given arguments
#'
#' @details If the function has `...`, this function will not pass other arguments to `...`.
#' Only named arguments are passed.
#'
#' @keywords internal
execute_with_args <- function(fun, ...) {
  args <- list(...)
  do_call(fun, args[intersect(names(args), formalArgs(fun))])
}

#' Execute a function call
#'
#' @keywords internal
do_call <- function(what, args) {
  arg_names <- names(args)
  if (is.null(arg_names)) {
    arg_names <- sprintf("var_%s", seq_along(args))
  } else if (any(arg_names == "")) {
    arg_names_random <- sprintf("var_%s", seq_along(args))
    arg_names[arg_names == ""] <- arg_names_random[arg_names == ""]
  }
  args_env <- as.environment(setNames(args, arg_names))
  parent.env(args_env) <- parent.frame()
  new_args <- lapply(arg_names, as.symbol)
  names(new_args) <- names(args)
  do.call(what, new_args, envir = args_env)
}

#' Modify character
#'
#' @keywords internal
modify_character <- function(x, y) {
  assert_character(x, names = "unique", null.ok = TRUE)
  assert_character(y, names = "unique", null.ok = TRUE)
  c(y, x)[unique(c(names(x), names(y)))]
}

#' Expand list to each split
#' @keywords internal
expand_list <- function(lst, split) {
  assert_list(lst, names = "unique")
  assert_character(split)
  if ("all" %in% names(lst)) {
    lst <- lapply(
      setNames(split, split),
      function(x) {
        modify_character(lst$all, lst[[x]])
      }
    )
  }
  lst
}

#' Helper function to convert to months if needed
#'
#' @param x (`numeric`) time.
#' @param unit (`character`) or (`factor`) time unit.
#'
#' @return A `numeric` vector with the time in months.
#'
#' @export
convert_to_month <- function(x, unit) {
  assert_multi_class(unit, c("character", "factor"))
  assert_numeric(x, len = length(unit))

  unit <- toupper(unit)
  diff <- setdiff(unique(unit), c("DAYS", "MONTHS", "YEARS"))
  if (length(diff) > 0) {
    rlang::warn(
      paste0(
        "Time unit ", toString(diff), " not covered. No unit conversion applied."
      )
    )
  }

  case_when(
    unit == "DAYS" ~ x / 30.4375,
    unit == "MONTHS" ~ x,
    unit == "YEARS" ~ x * 12,
    TRUE ~ x
  )
}

# themes and formats ----

#' Theme for Chevron Plot
#'
#' @param grid_y (`flag`) should horizontal grid be displayed.
#' @param grid_x (`flag`) should vertical grid be displayed.
#' @param legend_position (`string`) the position of the legend.
#' @param text_axis_x_rot (`numeric`) the x axis text rotation angle.
#'
#' @return a `theme` object.
#'
#' @export
#'
gg_theme_chevron <- function(grid_y = TRUE,
                             grid_x = FALSE,
                             legend_position = "top",
                             text_axis_x_rot = 45) {
  assert_flag(grid_y)
  assert_flag(grid_x)
  assert_choice(legend_position, c("top", "bottom", "right", "left"))
  assert_numeric(text_axis_x_rot, len = 1, lower = -90, upper = 90)

  ggtheme <- ggplot2::theme_bw() +
    ggplot2::theme(legend.position = legend_position) +
    ggplot2::theme(axis.title.x = ggplot2::element_blank())

  ggtheme <- if (!grid_x) {
    ggtheme + ggplot2::theme(
      panel.grid.major.x = ggplot2::element_blank(),
      panel.grid.minor.x = ggplot2::element_blank()
    )
  } else {
    ggtheme + ggplot2::theme(
      panel.grid.major.x = ggplot2::element_line(linewidth = ggplot2::rel(0.5)),
      panel.grid.minor.x = ggplot2::element_blank()
    )
  }

  ggtheme <- if (!grid_y) {
    ggtheme + ggplot2::theme(
      panel.grid.minor.y = ggplot2::element_blank(),
      panel.grid.major.y = ggplot2::element_blank()
    )
  } else {
    ggtheme + ggplot2::theme(
      panel.grid.minor.y = ggplot2::element_blank(),
      panel.grid.major.y = ggplot2::element_line(linewidth = ggplot2::rel(0.5))
    )
  }

  ggtheme <- ggtheme + ggplot2::theme(
    axis.text.x = ggplot2::element_text(
      angle = text_axis_x_rot,
      hjust = get_x_hjust(text_axis_x_rot),
      vjust = get_x_vjust(text_axis_x_rot)
    )
  )

  ggtheme
}

#' Get a harmonious value of horizontal justification for x axis
#'
#' @param x (`numeric`) angle between -90 and 90 degree.
#' @keywords internal
get_x_hjust <- function(x) {
  assert_numeric(x, upper = 90, lower = -90, len = 1)

  if (x == 0) {
    0.5
  } else if (x > 0) {
    1
  } else {
    0
  }
}

#' Get a harmonious value of vertical justification for x axis
#'
#' @param x (`numeric`) angle between -90 and 90 degree.
#' @keywords internal
get_x_vjust <- function(x) {
  assert_numeric(x, upper = 90, lower = -90, len = 1)

  if (x == 0) {
    0
  } else if (abs(x) == 90) {
    0.5
  } else {
    1
  }
}

#' Get Section dividers
#' @export
#' @return (`character`) value with section dividers at corresponding section.
get_section_div <- function() {
  x <- getOption("chevron.section_div", integer(0))
  if (!test_integerish(x)) {
    ret <- NA_character_
  } else {
    ret <- rep(NA_character_, max(x, 0))
    ret[x] <- ""
  }
  ret
}

#' Set Section Dividers
#' @export
#' @param x (`integerish`) value of at which the section divider should be added.
#' @details Section dividers are empty lines between sections in tables.
#' E.g. if 1 is used then for the first row split an empty line is added.
#' Currently it only works for `aet02`, `cmt01a` and `mht01` template.
#' @return NULL
#' @export
set_section_div <- function(x) {
  assert_integerish(x, min.len = 0L, any.missing = FALSE, lower = 1L)
  options("chevron.section_div" = x)
  invisible()
}

#' Format for Chevron Listings
#'
#' @return a `list` of `fmt_config`.
#'
listing_format_chevron <- function() {
  list(
    all = fmt_config(align = "left"),
    numeric = fmt_config(align = "center"),
    Date = fmt_config(format = format_date(), align = "left"),
    POSIXct = fmt_config(format = format_date(), align = "left"),
    POSIXt = fmt_config(format = format_date(), align = "left")
  )
}

#' Formatting of date
#'
#' @param date_format (`string`) the output format.
#'
#' @return a `function` converting a date into `string`.
#'
#' @export
#'
format_date <- function(date_format = "%d%b%Y") {
  function(x, ...) {
    toupper(strftime(as.Date(x, tz = ""), format = date_format))
  }
}

# report_null ----

#' Create a Null Report
#'
#' @rdname report_null
#' @aliases null_report
#' @param tlg (`TableTree`) object.
#' @param ... not used. Important to be used directly as post processing function.
#'
#' @export
#'
report_null <- function(tlg, ...) {
  UseMethod("report_null")
}

#' @rdname report_null
#' @export
#' @return original `TableTree` or a null report if no observation are found in the table.
report_null.TableTree <- function(tlg, ...) {
  if (nrow(tlg) == 0L) {
    return(null_report)
  }
  if (count_children(tlg) == 0) {
    return(null_report)
  }
  tlg
}

#' @rdname report_null
#' @export
#' @return original `listing_df` or a null report if no observation are found in the table.
report_null.listing_df <- function(tlg, ...) {
  if (nrow(tlg) == 0L) {
    return(null_report)
  }

  tlg
}

#' @rdname report_null
#' @export
#' @return a null report.
report_null.ElementaryTable <- function(tlg, ...) {
  if (nrow(tlg) == 0L) {
    return(null_report)
  }

  tlg
}

#' @rdname report_null
#' @export
#' @return a null report.
report_null.NULL <- function(tlg, ...) {
  return(null_report)
}

# listing_id ----

#' Concatenate Site and Subject ID
#'
#' @param site (`string`)
#' @param subject (`string`)
#' @param sep (`string`)
#'
#' @note the `{Patient_label}` whisker placeholder will be used in the label.
#'
#' @export
#' @examples
#' create_id_listings("BRA-1", "xxx-1234")
create_id_listings <- function(site, subject, sep = "/") {
  assert_character(site)
  assert_character(subject)
  assert_string(sep)

  subject_id <- stringr::str_split_i(subject, pattern = "-", i = -1)

  with_label(paste(site, subject_id, sep = sep), render_safe("Center/{Patient_label} ID"))
}
