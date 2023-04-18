# ext01_1 ----
test_that("ext01 works", {
  proc_data <- syn_data
  tlg <- expect_silent(run(ext01_1, proc_data))
  expect_snapshot(tlg)

  tlg <- expect_silent(run(ext01_1, proc_data, prune_0 = FALSE))
  expect_snapshot(tlg)
})

# ext02_1 ----
test_that("ext02_1 works for selected parameters", {
  proc_data <- syn_data
  proc_data$adex <- proc_data$adex %>%
    filter(PARAMCD == "TDOSE")

  expect_snapshot(run(ext01_2, proc_data, prune_0 = TRUE))
})
