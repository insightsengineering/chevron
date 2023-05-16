# vst02 functions ----

test_that("vst02 functions with default argument value return expected result with test data", {
  pre_data <- vst02_pre(syn_data)
  raw_res <- vst02_1_main(pre_data)
  res <- vst02_post(raw_res)
  expect_snapshot(cat(export_as_txt(res, lpp = 100)))
})

test_that("vst02 functions return expected result with test data when excluding subject with baseline abnormality", {
  pre_data <- vst02_pre(syn_data)
  raw_res <- vst02_2_main(pre_data)
  res <- vst02_post(raw_res)
  expect_snapshot(cat(export_as_txt(res, lpp = 100)))
})
