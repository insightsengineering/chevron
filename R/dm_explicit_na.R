
#' Encode Categorical Missing Values in a `DM` Object
#'
#' @details This is a helper function to encode missing entries across groups of categorical variables in potentially
#'   all tables of a `dm` object.
#'
#' @param data (`dm`) object to be transformed.
#' @param omit_tables (`character`) the names of the table to omit from processing.
#' @param omit_columns (`character`) the names of the columns to omit from processing.
#' @param char_as_factor (`logical`) should character columns be transformed into factor.
#' @param logical_as_factor (`logical`) should logical columns be transformed into factor.
#' @param na_level (`character`) the label to encode missing levels.
#'
#' @importFrom checkmate assert_class assert_character assert_logical
#' @importFrom dm dm_zoom_to dm_update_zoomed
#' @importFrom dplyr mutate across
#' @importFrom tern explicit_na sas_na
#'
#' @return `dm` object with explicit missing levels
#' @export
#'
#' @examples
#' library(dm)
#'
#' df1 <- data.frame(
#'   "char" = c("a", "b", NA, "a", "k", "x"),
#'   "fact" = factor(c("f1", "f2", NA, NA, "f1", "f1")),
#'   "logi" = c(NA, FALSE, TRUE, NA, FALSE, NA)
#' )
#' df2 <- data.frame(
#'   "char" = c("a", "b", NA, "a", "k", "x"),
#'   "fact" = factor(c("f1", "f2", NA, NA, "f1", "f1")),
#'   "num" = 1:6
#' )
#'
#' db <- dm(df1, df2)
#'
#' dm_fact <- dm_explicit_na(db)
#' dm_fact$df1
#' dm_fact$df2
dm_explicit_na <- function(data,
                           omit_tables = NULL,
                           omit_columns = NULL,
                           char_as_factor = TRUE,
                           logical_as_factor = FALSE,
                           na_level = "<Missing>") {
  assert_class(data, "dm")
  assert_character(omit_tables, null.ok = TRUE)
  assert_character(omit_columns, null.ok = TRUE)
  assert_logical(char_as_factor, len = 1)
  assert_logical(logical_as_factor, len = 1)
  assert_character(na_level, len = 1)

  target_tables <- setdiff(names(data), omit_tables)

  if (length(target_tables) == 0) {
    return(data)
  }

  for (tab in target_tables) {
    tab_sym <- sym(tab)

    current_tab <- data[[tab]]
    names_current_tab <- colnames(current_tab)

    char_col <- mapply(function(x, y) is.character(x) & y, current_tab, list(char_as_factor))
    logi_col <- mapply(function(x, y) is.logical(x) & y, current_tab, list(logical_as_factor))
    fact_col <- unlist(lapply(current_tab, is.factor))

    names_char_col <- setdiff(names(which(char_col)), omit_columns)
    names_logi_col <- setdiff(names(which(logi_col)), omit_columns)
    names_fact_col <- setdiff(names(which(fact_col)), omit_columns)

    if (length(names_char_col) > 0L) {
      data <- data %>%
        dm_zoom_to(!!tab_sym) %>%
        mutate(across(names_char_col, function(x) h_as_factor(x, na_level))) %>%
        dm_update_zoomed()
    }

    if (length(names_logi_col) > 0L) {
      data <- data %>%
        dm_zoom_to(!!tab_sym) %>%
        mutate(across(names_logi_col, function(x) h_as_factor(x, na_level))) %>%
        dm_update_zoomed()
    }

    if (length(names_fact_col) > 0L) {
      data <- data %>%
        dm_zoom_to(!!tab_sym) %>%
        mutate(across(names_fact_col, function(x) tern::explicit_na(sas_na(x), label = na_level))) %>%
        dm_update_zoomed()
    }
  }
  data
}


#' Helper Coercion Function to Factor with explicit missing levels
#'
#' @details This function preserves labels.
#'
#' @param x (`character` or `logical`) input to be turned into factor with explicit missing level.
#' @param na_label (`character`) the label to encode missing levels.
#'
#' @importFrom checkmate assert_true
#' @importFrom tern explicit_na sas_na
h_as_factor <- function(x, na_label) {
  assert_true(is.character(x) || is.logical(x))

  init_lab <- attr(x, "label")

  x_chr <- as.character(x)
  res <- tern::explicit_na(sas_na(x_chr), label = na_label)

  lvl_x <- setdiff(sort(unique(res)), na_label)

  # is na_level in res
  if (na_label %in% unique(res)) {
    lvl_x <- c(lvl_x, na_label)
  }

  res <- factor(res, levels = lvl_x)

  formatters::with_label(res, init_lab)
}
