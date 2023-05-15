# egt02 functions ----

test_that("egt02_1 functions with default argument value return expected result with test data", {
  pre_data <- egt02_pre(syn_data)
  raw_res <- egt02_1_main(pre_data)
  res <- egt02_post(raw_res)
  expect_snapshot(res)
})

test_that("egt02_2 functions with default value return expected result with test data", {
  pre_data <- egt02_pre(syn_data)
  raw_res <- egt02_2_main(pre_data)
  res <- egt02_post(raw_res)
  expect_snapshot(res)
})
