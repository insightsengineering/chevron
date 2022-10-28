
# chevron_t class ----

test_that("chevron_t constructor accepts pre-data table layout as lyt argument", {
  lyt <- rtables::basic_table() %>% rtables::split_cols_by("ARM")
  res <- expect_silent(chevron_t(lyt = lyt))
  expect_true(validObject(res))
})

test_that("chevron_t constructor accepts functions as lyt argument", {
  foo <- function(...) rtables::basic_table() %>% rtables::split_cols_by("ARM")
  res <- expect_silent(chevron_t(lyt = foo))
  expect_true(validObject(res))
})

test_that("chevron_t constructor accepts list of functions as lyt argument", {
  foo <- function(...) rtables::basic_table() %>% rtables::split_cols_by("ARM")
  bar <- function(...) rtables::basic_table()
  lyt <- list(foo, bar)

  res <- expect_silent(chevron_t(lyt = lyt))
  expect_true(validObject(res))
})

test_that("chevron_t constructor accepts list of  pre-data table layout as lyt argument", {
  lyt1 <- rtables::basic_table() %>% rtables::split_cols_by("ARM")
  lyt2 <- rtables::basic_table()
  lyt <- list(lyt1, lyt2)

  res <- expect_silent(chevron_t(lyt = lyt))
  expect_true(validObject(res))
})

test_that("chevron_t constructor accepts list of pre-data table layout and function as lyt argument", {
  lyt1 <- rtables::basic_table() %>% rtables::split_cols_by("ARM")
  foo <- function(...) rtables::basic_table() %>% rtables::split_cols_by("ARM")
  lyt <- list(lyt1, foo)

  res <- expect_silent(chevron_t(lyt = lyt))
  expect_true(validObject(res))
})

test_that("chevron_t constructor returns an error if lyt function doesn't have the formal argument ...", {
  foo <- function(x) rtables::basic_table() %>% rtables::split_cols_by("ARM")
  expect_error(chevron_t(lyt = foo), "Assertion on 'lyt' failed: Must have formal arguments: ....")
})

test_that("chevron_t constructor returns an error if lyt functions in list don't have the formal argument ...", {
  foo <- function(...) rtables::basic_table() %>% rtables::split_cols_by("ARM")
  bar <- function(y) rtables::basic_table()
  lyt <- list(foo, bar)

  expect_error(lyt(aet01_1) <- lyt)

  aet01_1@lyt <- lyt
  expect_error(validObject(aet01_1))
})
