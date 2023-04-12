test_that("coxt02 can handle some NA values", {
  new_race <- c(NA, "", as.character(syn_data$adtte$RACE[-c(1, 2)]))

  proc_data <- syn_data
  proc_data$adtte <- proc_data$adtte %>%
    mutate(
      RACE = factor(.env$new_race),
    )

  res <- expect_silent(run(coxt02_1, proc_data))
  expect_snapshot(res)
})

test_that("coxt02 fails on incomlete date", {
  proc_data <- syn_data
  proc_data$adtte <- proc_data$adtte %>%
    mutate(PARAMCD = NULL)

  expect_error(run(coxt02_1, proc_data))
})
