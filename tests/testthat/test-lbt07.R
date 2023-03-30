test_that("lbt07 can handle some NA values", {
  new_grade_dir <- c(NA_character_, "", as.character(syn_data$adlb$ATOXGR[-c(1, 2)]))

  proc_data <- as.list(syn_data)

  proc_data$adlb <- proc_data$adlb %>%
    mutate(
      GRADE_DIR = factor(.env$new_grade_dir),
    )

  res <- expect_silent(run(lbt07_1, proc_data))
  expect_snapshot(res)
})

test_that("lbt07 fails on incomlete data", {
  proc_data <- as.list(syn_data)

  proc_data$adlb <- proc_data$adlb %>%
    mutate(ATOXGR = NULL)

  expect_error(run(lbt07_1, proc_data))
})
