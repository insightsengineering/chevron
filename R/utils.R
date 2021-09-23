# as we use NSE
globalVariables(c("ANL01FL", "adae", "ANL01FL"))

#' Retrieve Variables for Certain variables
#'
#' @param df data froma
#' @param vars variable names in data frame `df`
#'
#' @importFrom assertthat assert_that
#' @importFrom rtables var_labels
#' @export
var_labels_for <- function(df, vars) {
  assert_that(all(vars %in% names(df)))
  unname(var_labels(df, fill = TRUE)[vars])
}


#' Standard Documentation Lookup
#'
#' @param id standard id of output
#' @param ... not used at the moment
#'
#' @export
std_deco <- function(id, ...) {
  list(
    title = "Main Title",
    subtitles = "Protocol: {{protocol}}, Snapshot: {{snapshot}}, Snapshot Date: {{snapshot-date}}, Cutoff Date: {{cutoff-date}}",
    main_footer = "Footnotes go here"
  )
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
bol_YN <- function(x) {
  if (is.logical(x)) {
    x
  } else {
    y <- x == "Y"
    y[x == ""] <- NA
    y
  }
}

#' Cut by group
#'
#' @param df (`dataframe`) with a column of data to be cut and a column specifying the group of each observation.
#' @param col_data (`string`) the column containing the data to be cut.
#' @param col_group (`string`) the column containing the names of the groups according to which the data should be
#'   split.
#' @param group  (`nested list`) providing for each parameter value that should be analyzed in a categorical way: the
#'   name of the parameter (`string`), a series of breakpoints (`vector`) where the first breakpoints is typically
#'   `-Inf` and the last `Inf`, and a series of name which will describe each category (`vector`).
#' @param new_col (`string`) the name of the new column in which the cut label should he stored.
#' @param as_factor (`logical`) if TRUE, the new column is of type `factor` else `character`.
#'
#' @return
#' @export
#'
#' @examples
#' group <- list(list("Dose administered during constant dosing interval",
#'                                          c(-Inf, 700, 900, 1200, Inf),
#'                                          c("<700", "700-900", "900-1200", ">1200")
#'                                           ),
#'                                       list("Total dose administered",
#'                                          c(-Inf, 5000, 7000, 9000, Inf),
#'                                          c("<5000", "5000-7000", "7000-9000", ">9000")
#'                                            )
#'                                        )
#'
#' library(scda)
#' library(dplyr)
#' sd <- synthetic_cdisc_data("rcd_2021_03_22")
#' adsl <- sd$adsl
#' adex <- sd$adex %>%
#'  mutate(ANL01FL = 'Y')
#'
#' adex_gp <- cut_by_group(adex, "AVAL", "PARAM", group, "AVAL_gp")
#'
#' head(adex_gp[,c("PARAM","AVAL","AVAL_gp")])
#'
#'
#'
cut_by_group <- function(df,
                         col_data,
                         col_group,
                         group,
                         new_col,
                         as_factor = FALSE
) {


  df[new_col] <- "<Missing>"

  for (g in group) {

    selected_row <- df[[col_group]] == g[[1]]

    df[selected_row, new_col] <- as.character(cut(df[[col_data]][selected_row], breaks = g[[2]], labels = g[[3]]))

  }

  if (as_factor) {

      cut_levels <- c(unlist(lapply(group, "[[", 3)), "<Missing>")

      df[, new_col] <- factor(df[[new_col]], levels = cut_levels)

  }

  df

}


#' Check if strings are column names of a data frame
#'
#' @param df (`data frame`)
#' @param x (`vector of strings`)
#'
#' @return
#' @export
#'
#' @examples
#'
#' assert_colnames(mtcars, c("mpg","cyl"))
#'
assert_colnames <- function(df, x) {
  # provide a clearer error message in the case of missing variable
  missing_var <- setdiff(x, colnames(df))
  if (length(missing_var) > 0) {
    stop(paste(
      "Variable(s) not a column name in",
      deparse(substitute(df)),
      ":\n",
      paste(missing_var, "\n", collapse = "")
    ))

  } else{

    invisible(TRUE)

  }

}

#' Reorder PARAM and PARAMCD Levels Simultaneously
#'
#' @param df data.frame with PARAM and PARAMCD variables
#' @param paramcd_levels ordered levels of PARAMCD
#'
#' @importFrom dplyr mutate
#'
#' @export
#'
#' @examples
#'
#' df <- data.frame(PARAMCD = factor(c("A", "B", "C")), PARAM = factor(paste("letter", LETTERS[1:3])))
#'
#' str(relevel_params(df, paramcd_levels = c("B", "A", "C")))
#' str(relevel_params(df, paramcd_levels = c("B", "A")))
#'
#'
relevel_params <- function(df, paramcd_levels) {

  # todo throw errors
  stopifnot(
    all(c("PARAM", "PARAMCD") %in% names(df))
  )

  dfs <- df[, c("PARAMCD", "PARAM")]
  dfsd <- dfs[!duplicated(dfs),]

  if (any(duplicated(dfsd[,"PARAM"])) || any(duplicated(dfsd[,"PARAMCD"])))
    stop(".... are not unique") ## assuming 1:1 mapping

  x <- setNames(as.character(dfsd$PARAM), dfsd$PARAMCD)

  new_levels <- c(paramcd_levels, setdiff(levels(df$PARAMCD), paramcd_levels))

  levels(df$PARAMCD) <- new_levels
  levels(df$PARAM) <- x[new_levels]

  df
}
