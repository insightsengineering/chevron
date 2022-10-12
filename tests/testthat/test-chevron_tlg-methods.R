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

# lyt<- ----

test_that("layout setter works as expected with pre-data table layout", {
  my_tab <- rtables::basic_table() %>% rtables::split_cols_by("ARM")
  lyt(aet04_1) <- my_tab
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
