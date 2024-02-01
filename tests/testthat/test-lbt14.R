# lbt14 functions ----

syn_lab <- syn_data[c("adsl", "adlb")]
syn_lab$adlb <- syn_lab$adlb[syn_data$adlb$PARAMCD == "ALT", ]


test_that("lbt14 functions with default argument value return expected result with test data", {
  pre_data <- lbt14_pre(syn_lab)
  raw_res <- lbt14_main(pre_data)
  res <- lbt14_post(raw_res)
  expect_snapshot(cat(export_as_txt(res, lpp = 100)))
})

test_that("lbt14 functions with default argument value return expected result with test data when direction = high", {
  pre_data <- lbt14_pre(syn_lab, direction = "high")
  raw_res <- lbt14_main(pre_data, direction = "high")
  res <- lbt14_post(raw_res, direction = "high")
  expect_snapshot(cat(export_as_txt(res, lpp = 100)))
})

test_that("lbt14 functions with `gr_missing = excl` return expected result with test data", {
  pre_data <- lbt14_pre(syn_lab, gr_missing = "excl")
  raw_res <- lbt14_main(pre_data)
  res <- lbt14_post(raw_res)
  expect_snapshot(cat(export_as_txt(res, lpp = 100)))
})

test_that("lbt14 functions with `gr_missing = gr_0` return expected result with test data", {
  pre_data <- lbt14_pre(syn_lab, gr_missing = "gr_0")
  raw_res <- lbt14_main(pre_data)
  res <- lbt14_post(raw_res)
  expect_snapshot(cat(export_as_txt(res, lpp = 100)))
})

# lbt14 ----
test_that("lbt14 can handle all NA values", {
  proc_data <- syn_lab
  proc_data$adlb <- proc_data$adlb %>%
    mutate(
      BTOXGR = NA_character_,
      ATOXGR = NA_character_
    )

  res <- expect_silent(run(lbt14, proc_data))
  expect_snapshot(cat(export_as_txt(res, lpp = 100)))
})

test_that("lbt14 can handle some NA values", {
  set.seed(1)
  new_btoxgr <- syn_lab$adlb$BTOXGR
  new_btoxgr[sample(seq_along(new_btoxgr), 20)] <- NA
  new_atoxgr <- syn_lab$adlb$ATOXGR
  new_atoxgr[sample(seq_along(new_atoxgr), 20)] <- NA

  proc_data <- syn_lab

  proc_data$adlb <- proc_data$adlb %>%
    mutate(
      BTOXGR = factor(.env$new_btoxgr),
      ATOXGR = factor(.env$new_atoxgr)
    )

  res <- expect_silent(run(lbt14, proc_data))
  expect_snapshot(cat(export_as_txt(res, lpp = 100)))
})

test_that("lbt14 can accept different gr_missing", {
  res1 <- run(lbt14, syn_lab, gr_missing = "incl")
  res2 <- run(lbt14, syn_lab, gr_missing = "excl")
  res3 <- run(lbt14, syn_lab, gr_missing = "gr_0")
  expect_snapshot(cat(export_as_txt(res1, lpp = 100)))
  expect_snapshot(cat(export_as_txt(res2, lpp = 100)))
  expect_snapshot(cat(export_as_txt(res3, lpp = 100)))
})

test_that("lbt14 fails on incomlete data", {
  proc_data <- syn_lab

  proc_data$adlb <- proc_data$adlb %>%
    mutate(ATOXGR = NULL)

  expect_error(run(lbt14, proc_data))
})

# lbt14 direction = "high" ----
test_that("lbt14 can handle all NA values with direction = high", {
  proc_data <- syn_lab

  proc_data$adlb <- proc_data$adlb %>%
    mutate(
      BTOXGR = factor(NA),
      ATOXGR = factor(NA)
    )

  res <- expect_silent(run(lbt14, proc_data, direction = "high"))
  expect_snapshot(cat(export_as_txt(res, lpp = 100)))
})

test_that("lbt14 can handle some NA values with direction = high", {
  set.seed(1)
  new_btoxgr <- syn_lab$adlb$BTOXGR
  new_btoxgr[sample(seq_along(new_btoxgr), 20)] <- NA
  new_atoxgr <- syn_lab$adlb$ATOXGR
  new_atoxgr[sample(seq_along(new_atoxgr), 20)] <- NA

  proc_data <- syn_lab

  proc_data$adlb <- proc_data$adlb %>%
    mutate(
      BTOXGR = factor(.env$new_btoxgr),
      ATOXGR = factor(.env$new_atoxgr)
    )

  res <- expect_silent(run(lbt14, proc_data, direction = "high"))
  expect_snapshot(cat(export_as_txt(res, lpp = 100)))
})

test_that("lbt14 can accept different gr_missing with direction = high", {
  proc_data <- syn_lab
  res1 <- run(lbt14, proc_data, gr_missing = "incl", direction = "high")
  res2 <- run(lbt14, proc_data, gr_missing = "excl", direction = "high")
  res3 <- run(lbt14, proc_data, gr_missing = "gr_0", direction = "high")
  expect_snapshot(cat(export_as_txt(res1, lpp = 100)))
  expect_snapshot(cat(export_as_txt(res2, lpp = 100)))
  expect_snapshot(cat(export_as_txt(res3, lpp = 100)))
})

test_that("lbt14 fails on incomlete data", {
  proc_data <- syn_lab

  proc_data$adlb <- proc_data$adlb %>%
    mutate(ATOXGR = NULL)

  expect_error(run(lbt14, proc_data, direction = "high"))
})
