# lbt14 functions ----

test_that("lbt14 functions with default argument value return expected result with test data", {
  pre_data <- lbt14_pre(syn_data)
  raw_res <- lbt14_main(pre_data)
  res <- lbt14_post(raw_res)
  expect_snapshot(res)
})

test_that("lbt14 functions with default argument value return expected result with test data when direction = high", {
  pre_data <- lbt14_pre(syn_data, direction = "high")
  raw_res <- lbt14_main(pre_data, direction = "high")
  res <- lbt14_post(raw_res, direction = "high")
  expect_snapshot(res)
})

# lbt14 ----
test_that("lbt14 can handle all NA values", {
  proc_data <- syn_data
  proc_data$adlb <- proc_data$adlb %>%
    mutate(
      BTOXGR = NA_character_,
      ATOXGR = NA_character_
    )

  res <- expect_silent(run(lbt14, proc_data))
  expect_snapshot(res)
})

test_that("lbt14 can handle some NA values", {
  set.seed(1)
  new_btoxgr <- syn_data$adlb$BTOXGR
  new_btoxgr[sample(seq_along(new_btoxgr), 20)] <- NA
  new_atoxgr <- syn_data$adlb$ATOXGR
  new_atoxgr[sample(seq_along(new_atoxgr), 20)] <- NA

  proc_data <- syn_data

  proc_data$adlb <- proc_data$adlb %>%
    mutate(
      BTOXGR = factor(.env$new_btoxgr),
      ATOXGR = factor(.env$new_atoxgr)
    )

  res <- expect_silent(run(lbt14, proc_data))
  expect_snapshot(res)
})

test_that("lbt14 can accept different gr_missing", {
  proc_data <- syn_data

  expect_snapshot(run(lbt14, proc_data, gr_missing = "incl"))
  expect_snapshot(run(lbt14, proc_data, gr_missing = "excl"))
  expect_snapshot(run(lbt14, proc_data, gr_missing = "gr_0"))
})

test_that("lbt14 fails on incomlete data", {
  proc_data <- syn_data

  proc_data$adlb <- proc_data$adlb %>%
    mutate(ATOXGR = NULL)

  expect_error(run(lbt14, proc_data))
})

# lbt14 direction = "high" ----
test_that("lbt14 can handle all NA values with direction = high", {
  proc_data <- syn_data

  proc_data$adlb <- proc_data$adlb %>%
    mutate(
      BTOXGR = factor(NA),
      ATOXGR = factor(NA)
    )

  res <- expect_silent(run(lbt14, proc_data, direction = "high"))
  expect_snapshot(res)
})

test_that("lbt14 can handle some NA values with direction = high", {
  set.seed(1)
  new_btoxgr <- syn_data$adlb$BTOXGR
  new_btoxgr[sample(seq_along(new_btoxgr), 20)] <- NA
  new_atoxgr <- syn_data$adlb$ATOXGR
  new_atoxgr[sample(seq_along(new_atoxgr), 20)] <- NA

  proc_data <- syn_data

  proc_data$adlb <- proc_data$adlb %>%
    mutate(
      BTOXGR = factor(.env$new_btoxgr),
      ATOXGR = factor(.env$new_atoxgr)
    )

  res <- expect_silent(run(lbt14, proc_data, direction = "high"))
  expect_snapshot(res)
})

test_that("lbt14 can accept different gr_missing with direction = high", {
  proc_data <- syn_data
  expect_snapshot(run(lbt14, proc_data, gr_missing = "incl", direction = "high"))
  expect_snapshot(run(lbt14, proc_data, gr_missing = "excl", direction = "high"))
  expect_snapshot(run(lbt14, proc_data, gr_missing = "gr_0", direction = "high"))
})

test_that("lbt14 fails on incomlete data", {
  proc_data <- syn_data

  proc_data$adlb <- proc_data$adlb %>%
    mutate(ATOXGR = NULL)

  expect_error(run(lbt14, proc_data, direction = "high"))
})
