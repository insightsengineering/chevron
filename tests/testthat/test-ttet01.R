test_that("ttet01 works as expected", {
  filter_data <- dunlin::log_filter(syn_data, PARAMCD == "PFS", "adtte")
  pre_data <- expect_silent(ttet01_pre(filter_data, dataset = "adtte"))
  res <- expect_silent(ttet01_main(pre_data, dataset = "adtte", timepoint = c(180, 360)))
  expect_snapshot(res)
})
