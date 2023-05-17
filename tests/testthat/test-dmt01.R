test_that("dmt01 can handle NA values", {
  proc_data <- syn_data
  proc_data$adsl <- proc_data$adsl %>%
    mutate(
      AAGE = with_label(NA, "Age")
    )
  res <- expect_silent(run(dmt01, proc_data))
  expect_snapshot(cat(formatters::export_as_txt(res, lpp = 100)))
})

test_that("dmt01 can handle numeric NA values", {
  proc_data <- syn_data
  proc_data$adsl$AGE[1] <- NA
  res <- expect_silent(run(dmt01, proc_data))
  expect_snapshot(cat(formatters::export_as_txt(res, lpp = 100)))
})
