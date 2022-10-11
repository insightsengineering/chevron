# run ----

test_that("run works as expected", {
  res <- run(aet04_1, syn_test_data(), prune_0 = TRUE)
  expect_snapshot(res)
})

res <- run(aet04_1, syn_test_data(), prune_0 = FALSE)

# get_main ----

test_that("get_main works as expected", {
  res <- get_main(aet04_1)
  expect_identical(res, aet04_1_main)
})

# get_lyt ----

test_that("get_lyt works as expected", {
  res <- get_lyt(aet04_1)
  expect_identical(res, aet04_1_lyt)
})

# set_lyt ----

test_that("set_lyt works as expected with call", {
  my_call <- quote(rtables::basic_table() %>% rtables::split_cols_by("ARM"))
  aet04_1 <- expect_silent(set_lyt(aet04_1, my_call))
  expect_equal(
    deparse(aet04_1@lyt),
    deparse(function(...) rtables::basic_table() %>% rtables::split_cols_by("ARM"))
  )
})

test_that("set_lyt works as expected with pre-data table layout", {
  my_tab <- rtables::basic_table() %>% rtables::split_cols_by("ARM")
  get_lyt(aet04_1)
  aet04_1 <- set_lyt(aet04_1, my_fun)
  expect_equal(
    aet04_1@lyt(),
    my_tab
  )
})

# get_preprocess ----

test_that("get_preprocess works as expected", {
  res <- get_preprocess(aet04_1)
  expect_identical(res, aet04_1_pre)
})

# get_postprocess ----

test_that("get_postprocess works as expected", {
  res <- get_postprocess(aet04_1)
  expect_identical(res, report_null)
})

# get_adam_datasets ----

test_that("get_adam_datasets works as expected", {
  res <- get_adam_datasets(aet04_1)
  expect_identical(res, c("adsl", "adae"))
})
