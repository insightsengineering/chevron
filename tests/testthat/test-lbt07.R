# lbt07 functions ----

test_that("lbt07 functions with default argument value return expected result with test data", {
  pre_data <- lbt07_pre(syn_data)
  raw_res <- lbt07_main(pre_data)
  res <- lbt07_post(raw_res)
  expect_snapshot(res)
})

# lbt07 ----

test_that("lbt07 can handle some NA values", {
  new_grade_dir <- c(NA_character_, "", as.character(syn_data$adlb$ATOXGR[-c(1, 2)]))

  proc_data <- syn_data
  proc_data$adlb <- proc_data$adlb %>%
    mutate(
      GRADE_DIR = factor(.env$new_grade_dir),
    )

  res <- expect_silent(run(lbt07, proc_data))
  expect_snapshot(res)
})

test_that("lbt07 fails on incomlete data", {
  proc_data <- syn_data
  proc_data$adlb <- proc_data$adlb %>%
    mutate(ATOXGR = NULL)

  expect_error(run(lbt07, proc_data))
})
