# mht01 functions ----

test_that("mht01 functions with default argument value return expected result with test data", {
  pre_data <- mht01_pre(syn_data)
  raw_res <- mht01_main(pre_data)
  res <- mht01_post(raw_res)
  expect_snapshot(cat(export_as_txt(res, lpp = 100)))
})

# mht01 ----

test_that("mht01 works", {
  skip_on_os("windows")
  proc_data <- syn_data
  res <- run(mht01, proc_data)
  expect_snapshot(cat(export_as_txt(res, lpp = 100)))
})

test_that("mht01 works on NULL in lbl_mhbodsys or lbl_mhdecod", {
  skip_on_os("windows")
  proc_data <- syn_data
  res <- run(mht01, proc_data, lbl_mhbodsys = NULL, lbl_mhdecod = NULL)
  expect_snapshot(cat(export_as_txt(res, lpp = 100)))
})

test_that("mht01 works with other row_split_var", {
  skip_on_os("windows")
  proc_data <- syn_data
  res <- run(mht01, proc_data, row_split_var = c("SEX", "ETHNIC"))
  expect_snapshot(cat(export_as_txt(res, lpp = 100)))
})
