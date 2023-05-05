test_that("dmt01_1 can handle NA values", {
  proc_data <- syn_data
  proc_data$adsl <- proc_data$adsl %>%
    mutate(
      AAGE = with_label(NA, "Age"),
      AGEGR1 = with_label(NA_character_, "Age Group")
    )

  res <- expect_silent(run(dmt01_1, proc_data))
  expect_snapshot(res)
})

test_that("dmt01_1 can handle some NA values", {
  proc_data <- syn_data
  proc_data$adsl <- proc_data$adsl %>%
    mutate(
      AAGE = with_label(c(NA, .data$AGE[-1]), "Age"),
      AGEGR1 = with_label(c(NA, as.character(.data$AGEGR1[-1])), "Age Group")
    )

  res <- expect_silent(run(dmt01_1, proc_data))
  expect_snapshot(res)
})
