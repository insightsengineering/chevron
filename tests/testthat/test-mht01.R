# mht01_1 ----

test_that("mht01_1 works", {
  expect_snapshot(run(mht01_1, syn_data))
})

test_that("mht01_1 works on NULL in lbl_mhbodsys or lbl_mhdecod", {
  expect_snapshot(run(mht01_1, syn_data, lbl_mhbodsys = NULL, lbl_mhdecod = NULL))
})
