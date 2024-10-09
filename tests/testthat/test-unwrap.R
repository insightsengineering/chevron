test_that("unwrap_layout works as expected with standard chevron_t main function", {
  res <- capture.output(unwrap_layout(aet01_main))
  expect_snapshot(cat(paste(res, collapse = "\n")))
})

test_that("unwrap_layout works as expected with standard chevron_g main function", {
  res <- capture.output(unwrap_layout(mng01_main))
  expect_identical(res, "")
})

test_that("unwrap_layout works as expected with standard chevron_l main function", {
  res <- capture.output(unwrap_layout(ael01_nollt_main))
  expect_identical(res, "")
})

test_that("unwrap_layout works as expected with a custom function without layout function", {
  res <- capture.output({
    foo <- function(adam_db, ...) {
      lyt <- basic_table() %>%
        split_cols_by("ARM") %>%
        analyze("AAGE", afun = function(x) {
          list(
            "mean (sd)" = rcell(c(mean(x), sd(x)), format = "xx.xx (xx.xx)"),
            "range" = diff(range(x))
          )
        })

      tbl <- build_table(lyt, adam_db$adsl)
    }
    unwrap_layout(foo)
  })
  expect_identical(res, "")
})

test_that("unwrap_layout works as expected with a custom function with layout function", {
  res <- capture_output({
    custom_lyt <- function() {
      basic_table() %>%
        split_cols_by("ARM") %>%
        analyze("AAGE", afun = function(x) {
          list(
            "mean (sd)" = rcell(c(mean(x), sd(x)), format = "xx.xx (xx.xx)"),
            "range" = diff(range(x))
          )
        })
    }

    foo <- function(adam_db, ...) {
      lyt <- custom_lyt()
      tbl <- build_table(lyt, adam_db$adsl)
    }
    unwrap_layout(foo)
  })

  expect_snapshot(cat(paste(res, collapse = "\n")))

  expect_match(
    res,
    paste(deparse(custom_lyt), collapse = "\n"),
    fixed = TRUE
  )
})

test_that("unwrap_layout works as expected with multiple layout function", {
  res <- capture_output({
    custom1_lyt <- function() {
      basic_table() %>%
        split_cols_by("ARM") %>%
        analyze("AAGE", afun = function(x) {
          list(
            "mean (sd)" = rcell(c(mean(x), sd(x)), format = "xx.xx (xx.xx)"),
            "range" = diff(range(x))
          )
        })
    }

    custom2_lyt <- function() {
      basic_table() %>%
        split_cols_by("ARM") %>%
        analyze("AAGE", afun = function(x) {
          list(
            "mean (sd)" = rcell(c(mean(x), sd(x)), format = "xx.xx (xx.xx)"),
            "range" = diff(range(x))
          )
        })
    }

    foo <- function(adam_db, ...) {
      lyt <- custom1_lyt()
      lyt2 <- custom2_lyt()
      tbl <- build_table(lyt, adam_db$adsl)
    }
    unwrap_layout(foo)
  })

  expect_snapshot(cat(paste(res, collapse = "\n")))
})

test_that("unwrap_layout works as expected on custom function with overwritten layout function", {
  res <- capture_output({
    aet04_lyt <- function() {
      basic_table() %>%
        split_cols_by("ARM") %>%
        analyze("AAGE", afun = function(x) {
          list(
            "mean (sd)" = rcell(c(mean(x), sd(x)), format = "xx.xx (xx.xx)"),
            "range" = diff(range(x))
          )
        })
    }


    foo <- function(adam_db, ...) {
      lyt <- aet04_lyt()
      tbl <- build_table(lyt, adam_db$adsl)
    }
    unwrap_layout(foo)
  })

  expect_snapshot(cat(paste(res, collapse = "\n")))

  expect_match(
    res,
    paste(deparse(aet04_lyt), collapse = "\n"),
    fixed = TRUE
  )
})
