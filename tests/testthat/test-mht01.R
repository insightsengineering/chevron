# mht01 functions ----

test_that("mht01_1 functions with default argument value return expected result with test data", {
  pre_data <- mht01_pre(syn_data)
  raw_res <- mht01_main(pre_data)
  res <- mht01_post(raw_res)
  expect_snapshot(res)
})

# mht01_1 ----

test_that("mht01 works", {
  proc_data <- syn_data
  expect_snapshot(run(mht01, proc_data))
})

test_that("mht01 works on NULL in lbl_mhbodsys or lbl_mhdecod", {
  proc_data <- syn_data
  expect_snapshot(run(mht01, proc_data, lbl_mhbodsys = NULL, lbl_mhdecod = NULL))
})
