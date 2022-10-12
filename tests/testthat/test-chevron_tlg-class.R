# chevron tlg class

test_that("chevron_tlg constructor creates valid object with default value", {
  res <- expect_silent(chevron_tlg())
  expect_true(validObject(res))
})

test_that("chevron_tlg constructor accepts pre-data table layout as lyt argument", {
  lyt <- rtables::basic_table() %>% rtables::split_cols_by("ARM")
  res <- expect_silent(chevron_tlg(lyt = lyt))
  expect_true(validObject(res))
})

test_that("chevron_tlg constructor accepts list of lunctions as lyt argument", {
  foo <- function(...) rtables::basic_table() %>% rtables::split_cols_by("ARM")
  bar <- function(...) rtables::basic_table()
  lyt <- list(foo, bar)

  res <- expect_silent(chevron_tlg(lyt = lyt))
  expect_true(validObject(res))
})
