test_that("lbt01_1 can handle n = 0 and outputs NE instead of infs and NAs", {
  proc_data <- syn_data
  proc_data$adlb <- proc_data$adlb %>%
    filter(PARAM != "ALT" & ACTARM != "A: Drug X")

  res <- expect_silent(
    run(lbt01_1, proc_data, precision = list("ALT" = 0, "CRP" = 1))
  )
  res <- res[1:11, 1]
  expect_snapshot(res)
})
