# lbt14_1 ----
test_that("lbt14_1 can handle all NA values", {
  proc_data <- as.list(syn_data)

  proc_data$adlb <- proc_data$adlb %>%
    mutate(
      BTOXGR = NA_character_,
      ATOXGR = NA_character_
    )

  res <- expect_silent(run(lbt14_1, proc_data))
  expect_snapshot(res)
})

test_that("lbt14_1 can handle some NA values", {
  set.seed(1)
  new_btoxgr <- syn_data$adlb$BTOXGR
  new_btoxgr[sample(seq_along(new_btoxgr), 20)] <- NA
  new_atoxgr <- syn_data$adlb$ATOXGR
  new_atoxgr[sample(seq_along(new_atoxgr), 20)] <- NA

  proc_data <- as.list(syn_data)

  proc_data$adlb <- proc_data$adlb %>%
    mutate(
      BTOXGR = factor(.env$new_btoxgr),
      ATOXGR = factor(.env$new_atoxgr)
    )

  res <- expect_silent(run(lbt14_1, proc_data))
  expect_snapshot(res)
})

test_that("lbt14_1 can accept different gr_missing", {

    proc_data <- as.list(syn_data)

  expect_snapshot(run(lbt14_1, proc_data, gr_missing = "incl"))
  expect_snapshot(run(lbt14_1, proc_data, gr_missing = "excl"))
  expect_snapshot(run(lbt14_1, proc_data, gr_missing = "gr_0"))
})

test_that("lbt14_1 fails on incomlete data", {
  proc_data <- as.list(syn_data)

  proc_data$adlb <- proc_data$adlb %>%
    mutate(ATOXGR = NULL)

  expect_error(run(lbt14_1, proc_data))
})

# lbt14_2 ----
test_that("lbt14_2 can handle all NA values", {
  proc_data <- as.list(syn_data)

  proc_data$adlb <- proc_data$adlb %>%
    mutate(
      BTOXGR = factor(NA),
      ATOXGR = factor(NA)
    )

  res <- expect_silent(run(lbt14_2, proc_data))
  expect_snapshot(res)
})

test_that("lbt14_2 can handle some NA values", {
  set.seed(1)
  new_btoxgr <- syn_data$adlb$BTOXGR
  new_btoxgr[sample(seq_along(new_btoxgr), 20)] <- NA
  new_atoxgr <- syn_data$adlb$ATOXGR
  new_atoxgr[sample(seq_along(new_atoxgr), 20)] <- NA

  proc_data <- as.list(syn_data)

  proc_data$adlb <- proc_data$adlb %>%
    mutate(
      BTOXGR = factor(.env$new_btoxgr),
      ATOXGR = factor(.env$new_atoxgr)
    )

  res <- expect_silent(run(lbt14_2, proc_data))
  expect_snapshot(res)
})

test_that("lbt14_2 can accept different gr_missing", {

    proc_data <- as.list(syn_data)


  expect_snapshot(run(lbt14_2, proc_data, gr_missing = "incl"))
  expect_snapshot(run(lbt14_2, proc_data, gr_missing = "excl"))
  expect_snapshot(run(lbt14_2, proc_data, gr_missing = "gr_0"))
})

test_that("lbt14_2 fails on incomlete data", {
  proc_data <- as.list(syn_data)

  proc_data$adlb <- proc_data$adlb %>%
    mutate(ATOXGR = NULL)

  expect_error(run(lbt14_2, proc_data))
})
