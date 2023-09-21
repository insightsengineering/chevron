# h_pad_or_round ----

test_that("h_format_dec works as exected", {
  fun <- expect_silent(h_format_dec(10, "%s"))
  res <- fun(123.1234)
  expect_identical(res, "123.1234000000")

  fun <- expect_silent(h_format_dec(0, "%s"))
  res <- fun(123.1234)
  expect_identical(res, "123")

  fun <- expect_silent(h_format_dec(1, "%s"))
  res <- fun(123.06)
  expect_identical(res, "123.1")

  fun <- expect_silent(h_format_dec(3, "%s"))
  res <- fun(123)
  expect_identical(res, "123.000")

  fun <- expect_silent(h_format_dec(0, "%s"))
  res <- fun(123)
  expect_identical(res, "123")

  fun <- expect_silent(h_format_dec(0, "%s"))
  res <- fun(0.9)
  expect_identical(res, "1")
})

test_that("h_format_dec works as expected with more than one value", {
  fun <- h_format_dec(c(3, 3), "%s - %s")
  res <- fun(c(123, 222))
  expect_identical(res, "123.000 - 222.000")

  fun <- h_format_dec(rep(3, 3), "%s /// %s /// %s")
  res <- fun(c(123, 222.2, 555.12345))
  expect_identical(res, "123.000 /// 222.200 /// 555.123")
})

test_that("h_format_dec works as expected with NA digits", {
  fun <- h_format_dec(format = "%s - %s", digits = rep(NA, 2))
  res <- fun(c(123, 222.21))
  expect_identical(res, "")
})

# fuse_sequentially ----

test_that("fuse_sequentially works", {
  expect_identical(
    fuse_sequentially(list(a = 1)),
    list(a = 1)
  )
  expect_identical(
    fuse_sequentially(list(a = 1), list(b = 2)),
    list(a = 1, b = 2)
  )
})

# grob_list ----

test_that("grob_list works", {
  grob <- grid::grob()
  grobs <- expect_silent(
    grob_list(grob, grob, grob)
  )
  expect_s3_class(grobs, "grob_list")
  expect_identical(length(grobs), 3L)
  expect_identical(grobs[[1]], grob)
})

# ifneeded_split_row ----

test_that("ifneeded_split_row works as expected", {
  var <- "PARCAT2"
  lyt <- rtables::basic_table() %>% ifneeded_split_row(var, lbl_var = "Parameter Category")
  expect_identical(rtables::vars_in_layout(lyt), var)

  var <- NULL
  lyt <- rtables::basic_table() %>% ifneeded_split_row(var, lbl_var = "Parameter Category")

  expect_null(rtables::vars_in_layout(lyt))
})

# split_cols_by_with_overall ----

res1 <- rtables::basic_table() %>%
  split_cols_by_with_overall(col_var = "Species", lbl_overall = "All") %>%
  build_table(iris)
expect_snapshot(res1)

res2 <- rtables::basic_table() %>%
  split_cols_by_with_overall(col_var = "Species", lbl_overall = NULL) %>%
  build_table(iris)
expect_snapshot(res2)

res3 <- rtables::basic_table() %>%
  split_cols_by_with_overall(col_var = "Species", lbl_overall = "") %>%
  build_table(iris)
expect_snapshot(res3)

res4 <- rtables::basic_table() %>%
  split_cols_by_with_overall(col_var = NULL, lbl_overall = "All") %>%
  build_table(iris)
expect_snapshot(res4)

# droplevels.character ----

test_that("droplevels.character works as expected", {
  char <- LETTERS
  res <- expect_silent(droplevels(char))
  expect_identical(res, char)
})

# lvls ----

test_that("lvls.character works as expected", {
  x <- c("b", "a", NA)
  res <- expect_silent(lvls(x))
  expect_identical(res, c("a", "b"))
})

test_that("lvls.factor works as expected", {
  x <- factor(c("a", "b", NA), levels = c("b", "a", "x"))
  res <- expect_silent(lvls(x))
  expect_identical(res, c("b", "a", "x"))
})

test_that("lvls.default works as expected", {
  x <- 1:10
  res <- expect_silent(lvls(x))
  expect_null(res)
})

# quote_str  ----

test_that("quote_str works as expected", {
  x <- c("abc")
  res <- expect_silent(quote_str(x))
  expect_identical(res, "`abc`")

  expect_error(quote_str(NA))
})

# modify_default_args ----

test_that("modify_default_args works as expected", {
  foo <- function(a = 1, b = 2, ...) {
    NULL
  }
  bar <- expect_silent(modify_default_args(foo, a = FALSE, c = 4, d = NULL))

  expect_identical(
    formals(bar),
    as.pairlist(
      alist(
        a = FALSE,
        b = 2,
        ... = ,
        c = 4,
        d = NULL
      )
    )
  )
})

# execute_with_args ----

test_that("execute_with_args works as expected", {
  foo <- function(a = 1, b = 2, ...) {
    sum(a, b, ...)
  }

  res <- expect_silent(execute_with_args(foo))
  expect_equal(res, 3)

  res <- expect_silent(execute_with_args(foo, 10))
  expect_equal(res, 3)

  res <- expect_silent(execute_with_args(foo, b = 10))
  expect_equal(res, 11)

  res <- expect_silent(execute_with_args(foo, a = NA))
  expect_true(is.na(res))

  res <- expect_silent(execute_with_args(foo, a = NA, na.rm = TRUE))
  expect_true(is.na(res))

  bar <- function(a = 1, b = 2, na_rm = FALSE, ...) {
    sum(a, b, na.rm = na_rm, ...)
  }

  res <- expect_silent(execute_with_args(bar, a = NA, na_rm = TRUE))
  expect_equal(res, 2)
})

# do_call ----

test_that("do_call work as expected", {
  a <- function(x, y, z) {
    list(x = x, y = y, z = z)
  }
  expect_identical(
    expect_silent(do_call(a, list(x = 1, 2, y = 3))),
    list(x = 1, y = 3, z = 2)
  )
})

test_that("do_call errors as expected", {
  a <- function(x, y, z) {
    list(x = x, y = y, z = z)
  }
  expect_error(do_call(a, list(x = 1, 2, y = 3, 4)))
  b <- function() {
    stop("error")
  }
  expect_error(do_call(b, list()))
})

# convert_to_month ----

test_that("convert_to_month work as expected", {
  expect_identical(expect_silent(convert_to_month(30.4375, "DAYS")), 1)
  expect_identical(expect_silent(convert_to_month(1, "MONTHS")), 1)
  expect_identical(expect_silent(convert_to_month(1, "YEARS")), 12)
})

test_that("convert_to_month warning messages as expected", {
  expect_warning(convert_to_month(1, "xxx"))
})

# gg_theme_chevron ----

test_that("gg_theme_chevron works as expected", {
  p <- ggplot2::ggplot(mtcars, ggplot2::aes(x = mpg, y = hp)) +
    ggplot2::geom_point()

  res <- expect_silent(gg_theme_chevron())
  expect_class(res, "theme")
  expect_silent(p + res)

  res <- expect_silent(gg_theme_chevron(TRUE, FALSE, "bottom", 22))
  expect_class(res, "theme")
  expect_silent(p + res)
})

# modify_character ----

test_that("modify_character works", {
  expect_identical(
    modify_character(c(a = "a", b = "b"), c(b = "B")),
    c(a = "a", b = "B")
  )
  expect_identical(
    modify_character(c(a = "a", b = "b"), c(b = "B", a = "A")),
    c(a = "A", b = "B")
  )
})

# expand_list ----

test_that("expand_list works", {
  expect_identical(
    expand_list(list(a = c(x = "1")), "b"),
    list(a = c(x = "1"))
  )
  expect_identical(
    expand_list(list(all = c(x = "1")), "b"),
    list(b = c(x = "1"))
  )
})

# set_section_div ----

test_that("set_section_div works", {
  expect_error(set_section_div(123))
  expect_silent(set_section_div("123"))
  expect_identical(
    getOption("chevron.section_div"),
    "123"
  )
})

# get_section_div ----

test_that("get_section_div works", {
  options("chevron.section_div" = NULL)
  expect_identical(get_section_div(), NA_character_)
})
