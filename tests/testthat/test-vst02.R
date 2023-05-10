# vst02 functions ----

test_that("vst02 functions with default argument value return expected result with test data", {
  pre_data <- vst02_pre(syn_data)
  raw_res <- vst02_main(pre_data)
  res <- vst02_post(raw_res)
  expect_snapshot(res)
})

test_that("vst02 functions return expected result with test data when excluding subject with baseline abnormality", {
  pre_data <- vst02_pre(syn_data)
  raw_res <- vst02_main(pre_data, exclude_base_abn = TRUE)
  res <- vst02_post(raw_res)
  expect_snapshot(res)
})

# vst02 ----

test_that("vst02 works", {
  proc_data <- syn_data
  expect_snapshot(run(vst02, proc_data))
  expect_snapshot(run(vst02, proc_data, prune_0 = TRUE))
})

test_that("vst02 works when excluding subject with baseline abnormality", {
  proc_data <- syn_data
  expect_snapshot(run(vst02, proc_data, exclude_base_abn = TRUE))
  expect_snapshot(run(vst02, proc_data, prune_0 = TRUE, exclude_base_abn = TRUE))
})
