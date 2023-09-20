#' No Coding Available rule
#' @export
nocoding <- rule("No Coding Available" = c("", NA))

#' Missing rule
#' @export
missing_rule <- rule("<Missing>" = c("", NA), .drop = TRUE)

#' Empty rule
#' @export
empty_rule <- rule(.to_NA = "")

#' Yes/No rule in title case
#' @export
Yes_No_rule <- rule("Yes" = c("Y", "y", "yes"), "No" = c("N", "n", "no")) # nolint

#' Get grade rule
#' @param direction (`string`) of abnormality direction.
#' @param missing (`string`) method to deal with missing
#' @export
get_grade_rule <- function(direction = "high", missing = "incl") {
  assert_choice(direction, c("high", "low"))
  assert_choice(missing, c("incl", "gr_0", "excl"))
  rule_arg <- list()
  if (direction == "high") {
    rule_arg[["Not High"]] <- c("0", "-1", "-2", "-3", "-4")
    rule_arg[as.character(1:4)] <- as.character(1:4)
  } else {
    rule_arg[["Not Low"]] <- c("0", "1", "2", "3", "4")
    rule_arg[as.character(1:4)] <- as.character(-1:-4)
  }
  if (missing == "incl") {
    rule_arg$Missing <- c(NA, "", "<Missing>")
  } else if (missing == "gr_0") {
    rule_arg[[1]] <- c(rule_arg[[1]], NA, "")
  }
  rule(.lst = rule_arg)
}
