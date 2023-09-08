test_that("dmt01 can handle NA values", {
  proc_data <- syn_data
  proc_data$adsl <- proc_data$adsl %>%
    mutate(
      AAGE = with_label(NA, "Age")
    )
  res <- expect_silent(run(dmt01, proc_data))
  expect_snapshot(cat(export_as_txt(res, lpp = 100)))
})

test_that("dmt01 can handle numeric NA values", {
  proc_data <- syn_data
  proc_data$adsl$AGE[1] <- NA
  res <- expect_silent(run(dmt01, proc_data))
  expect_snapshot(cat(export_as_txt(res, lpp = 100)))
})

test_that("dmt01 works as expected with setting default precision", {
  res <- expect_silent(run(dmt01, syn_data, summaryvars = c("RACE", "AAGE", "BBMISI"), precision = list(default = 3)))
  expect_snapshot(cat(export_as_txt(res, lpp = 100)))
})

test_that("dmt01 works as expected with auto precision settings", {
  res <- expect_silent(run(dmt01, syn_data, summaryvars = c("RACE", "AAGE", "BBMISI"), precision = list()))
  expect_snapshot(cat(export_as_txt(res, lpp = 100)))
})

test_that("dmt01 works as expected with auto precision settings and defined precision", {
  res <- expect_silent(run(dmt01, syn_data, summaryvars = c("RACE", "AAGE", "BBMISI"), precision = list(AAGE = 2)))
  expect_snapshot(cat(export_as_txt(res, lpp = 100)))
})

test_that("dmt01 works as expected with auto precision settings and defined precision and default", {
  res <- expect_silent(
    run(dmt01, syn_data, summaryvars = c("RACE", "AAGE", "BBMISI"), precision = list(AAGE = 2, default = 5))
  )
  expect_snapshot(cat(export_as_txt(res, lpp = 100)))
})
