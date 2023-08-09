# cfbt01 functions ----

test_that("cfbt01 functions with default argument value return expected result with test data", {
  pre_data <- cfbt01_pre(syn_data, dataset = "advs")
  raw_res <- cfbt01_main(pre_data, dataset = "advs")
  res <- cfbt01_post(raw_res)
  expect_snapshot(cat(export_as_txt(res, lpp = 100)))
})

# cfbt01 ----

test_that("cfbt01 can handle n = 0 and outputs NE instead of infs and NAs", {
  proc_data <- dunlin::log_filter(
    syn_data,
    PARAMCD %in% c("DIABP", "SYSBP"), "advs"
  )

  res <- expect_silent(
    run(cfbt01, proc_data, dataset = "advs")
  )

  expect_snapshot(cat(export_as_txt(res, lpp = 100)))
})
