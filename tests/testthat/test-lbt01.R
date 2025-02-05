# lbt01 functions ----

test_that("lbt01 functions with default argument value return expected result with test data", {
  proc_data <- syn_data[c("adsl", "adlb")]
  proc_data$adlb <- proc_data$adlb %>%
    dplyr::mutate(PARAMCD = paste0(PARAMCD, "SI"))

  pre_data <- lbt01_pre(proc_data)
  raw_res <- lbt01_main(pre_data)
  res <- cfbt01_post(raw_res)
  expect_snapshot(cat(export_as_txt(res, lpp = 200)))
})

# lbt01 functions ----

test_that("lbt01 functions with row_split_var return expected result with test data", {
  skip_on_os("windows")
  pre_data <- lbt01_pre(syn_data)
  raw_res <- lbt01_main(pre_data, row_split_var = "LBCAT", precision = list("ALT" = 0))
  res <- cfbt01_post(raw_res)
  expect_snapshot(cat(export_as_txt(res, lpp = 200)))
})

# lbt01 ----

test_that("lbt01 can handle n = 0 and outputs NE instead of infs and NAs", {
  skip_on_os("windows")
  proc_data <- syn_data
  proc_data$adlb <- proc_data$adlb %>%
    filter(PARAM != "ALT" & ACTARM != "A: Drug X")

  res <- expect_silent(
    run(lbt01, proc_data, precision = list("ALT" = 0, "CRP" = 1))
  )
  expect_snapshot(cat(export_as_txt(res, lpp = 200)))
})
