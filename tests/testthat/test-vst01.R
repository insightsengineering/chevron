# vst12 functions ----

test_that("vst01 functions with default argument value return expected result with test data", {
  proc_data <- dunlin::log_filter(
    syn_data,
    PARAMCD %in% c("DIABP", "SYSBP"), "advs"
  )
  pre_data <- vst01_pre(proc_data)
  raw_res <- vst01_main(pre_data)
  res <- cfbt01_post(raw_res)
  expect_snapshot(cat(export_as_txt(res, lpp = 200)))
})

# vst01 ----

test_that("run vst01 works as expected", {
  skip_on_os("windows")
  proc_data <- dunlin::log_filter(
    syn_data,
    PARAMCD %in% c("DIABP", "SYSBP"), "advs"
  )
  res <- expect_silent(run(vst01, proc_data, precision = list(default = 0)))
  expect_snapshot(cat(export_as_txt(res, lpp = 200)))
})
