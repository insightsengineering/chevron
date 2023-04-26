test_that("rmpt01 can handle NA values", {
  proc_data <- syn_data
  proc_data$adex <- proc_data$adex %>%
    mutate(
      AVAL = NA
    )

  res1 <- expect_silent(run(rmpt01_1, proc_data))
  expect_snapshot(res1)

  res2 <- expect_silent(run(rmpt01_1, proc_data, parcat = "PARCAT2"))
  expect_snapshot(res2)
})

test_that("rmpt01 can handle some NA values", {
  proc_data <- syn_data
  proc_data$adex <- proc_data$adex %>%
    mutate(
      AVAL = case_when(PARAMCD == "TDURD" & AVAL %% 2 == 0 ~ NA, TRUE ~ .data$AVAL)
    )

  res1 <- expect_silent(run(rmpt01_1, proc_data))
  expect_snapshot(res1)

  res2 <- expect_silent(run(rmpt01_1, proc_data, parcat = "PARCAT2"))
  expect_snapshot(res2)
})

test_that("rmpt01 fails on incomlete data", {
  proc_data <- syn_data
  proc_data$adex <- proc_data$adex %>%
    mutate(
      PARAMCD = NULL
    )

  expect_error(run(rmpt01_1, proc_data))

  expect_error(run(rmpt01_1, proc_data, parcat = "PARCAT2"))
})
