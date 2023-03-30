# mht01_1 ----

test_that("mht01_1 works", {
  proc_data <- as.list(syn_data)

  expect_snapshot(run(mht01_1, proc_data))
})

test_that("mht01_1 works on NULL in lbl_mhbodsys or lbl_mhdecod", {
  proc_data <- as.list(syn_data)

  expect_snapshot(run(mht01_1, proc_data, lbl_mhbodsys = NULL, lbl_mhdecod = NULL))
})
