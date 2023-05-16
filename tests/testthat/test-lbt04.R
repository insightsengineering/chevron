# lbt04 functions ----

test_that("lbt04 functions with default argument value return expected result with test data", {
  pre_data <- lbt04_pre(syn_data)
  raw_res <- lbt04_main(pre_data)
  res <- lbt04_post(raw_res)
  expect_snapshot(res)
})

# lbt04 ----

test_that("lbt04 can handle all NA values", {
  proc_data <- syn_data
  proc_data$adlb <- proc_data$adlb %>%
    mutate(
      ANRIND = NA_character_
    )

  res <- expect_silent(run(lbt04, proc_data))
  expect_snapshot(res)
})

test_that("lbt04 can handle some NA values", {
  new_anrind <- c(NA_character_, "", as.character(syn_data$adlb$ANRIND[-c(1, 2)]))

  proc_data <- syn_data
  proc_data$adlb <- proc_data$adlb %>%
    mutate(
      ANRIND = .env$new_anrind,
    )

  res <- expect_silent(run(lbt04, proc_data))
  expect_snapshot(res)
})

test_that("lbt04 fails on incomlete date", {
  proc_data <- syn_data
  proc_data$adlb <- proc_data$adlb %>%
    mutate(PARCAT1 = NULL)

  expect_error(run(lbt04, proc_data))
})
