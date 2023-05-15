# egt02 functions ----

test_that("egt02 functions with default argument value return expected result with test data", {
  pre_data <- egt02_pre(syn_data)
  raw_res <- egt02_main(pre_data)
  res <- egt02_post(raw_res)
  expect_snapshot(res)
})

test_that("egt02 functions with `exclude_base_abn = TRUE` value return expected result with test data", {
  pre_data <- egt02_pre(syn_data)
  raw_res <- egt02_main(pre_data, exclude_base_abn = TRUE)
  res <- egt02_post(raw_res)
  expect_snapshot(res)
})
