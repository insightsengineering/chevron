# report_null ----

test_that("report_null works as expected with `NULL`", {
  expect_silent(res <- report_null(NULL))
  rep <- null_report
  rtables::table_inset(rep) <- 2L
  expect_identical(res, rep)
})

test_that("report_null works as expected with `VTableTree`", {

  lyt <- basic_table() %>% analyze("Species")
  tab <- build_table(lyt, iris)
  rtables::table_inset(tab) <- 2L
  expect_identical(tab, report_null(tab))

  tab <- build_table(basic_table(), data.frame())
  expect_silent(res <- report_null(tab))
  rep <- null_report
  rtables::table_inset(rep) <- 2L
  expect_identical(res, rep)
})

test_that("report_null works as expected with `listing_df`", {
  lst <- rlistings::as_listing(iris, "Species", "Sepal.Length")
  expect_identical(lst, report_null(lst))

  lst <- rlistings::as_listing(iris[NULL, ], "Species", "Sepal.Length")
  expect_silent(lst <- report_null(lst))
  rep <- null_report
  rtables::table_inset(rep) <- 2L
  expect_identical(lst, rep)
})

test_that("report_null works as expected with `list`", {
  lst <- rlistings::as_listing(iris, "Species", "Sepal.Length", split_into_pages_by_var = "Species")
  expect_identical(lst, report_null(lst))

  lst <- rlistings::as_listing(iris[NULL, ], "Species", "Sepal.Length", split_into_pages_by_var = "Species")
  expect_silent(lst <- report_null(lst))
  rep <- null_report
  rtables::table_inset(rep) <- 2L
  expect_identical(lst, rep)
})

test_that("report_null works as expected with by default", {
  expect_silent(int <- report_null(1L))
  expect_identical(int, 1L)
})
