# egt01 functions ----

test_that("egt01 functions with default argument value return expected result with test data", {
  pre_data <- egt01_pre(syn_data)
  raw_res <- egt01_main(pre_data)
  res <- cfbt01_post(raw_res)
  expect_snapshot(cat(export_as_txt(res, lpp = 100)))
})

# egt01 ----

test_that("egt01 can handle n = 0 and outputs NE instead of infs and NAs", {
  skip_on_os("windows")
  proc_data <- syn_data
  proc_data$adeg <- proc_data$adeg %>%
    filter(PARAM != "HR" & ACTARM != "A: Drug X")

  res <- expect_silent(
    run(egt01, proc_data, precision = list("HR" = 1, default = 0))
  )
  expect_snapshot(cat(export_as_txt(res, lpp = 100)))
})
