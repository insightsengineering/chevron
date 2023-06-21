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
