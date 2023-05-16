# egt03 functions ----

test_that("egt03 functions with default argument value return expected result with test data", {
  pre_data <- egt03_pre(syn_data)
  raw_res <- egt03_main(pre_data)
  res <- egt03_post(raw_res)
  expect_snapshot(res)
})

test_that("egt03 functions with `minmax = max` value return expected result with test data", {
  pre_data <- egt03_pre(syn_data, minmax = "max")
  raw_res <- egt03_main(pre_data)
  res <- egt03_post(raw_res)
  expect_snapshot(res)
})

# egt03 ----

test_that("egt03 can handle all NA values", {
  proc_data <- syn_data
  proc_data$adeg <- proc_data$adeg %>%
    mutate(
      BNRIND = NA_character_,
      ANRIND = NA_character_,
    )

  res <- expect_silent(run(egt03, proc_data))
  expect_snapshot(res)

  res <- expect_silent(run(egt03, proc_data, prune_0 = TRUE))
  expect_snapshot(res)
})

test_that("egt03 can handle some NA values", {
  new_bnrind <- c(NA_character_, "", as.character(syn_data$adeg$BNRIND[-c(1, 2)]))
  new_anrind <- c(NA_character_, "", as.character(syn_data$adeg$ANRIND[-c(1, 2)]))

  proc_data <- syn_data
  proc_data$adeg <- proc_data$adeg %>%
    mutate(
      BNRIND = .env$new_bnrind,
      ANRIND = .env$new_anrind
    )

  res <- expect_silent(run(egt03, proc_data))
  expect_snapshot(res)
})

test_that("egt03 fails on incomplete data", {
  proc_data <- syn_data
  proc_data$adeg <- proc_data$adeg %>%
    mutate(PARAMCD = NULL)

  expect_error(
    run(egt03, proc_data)
  )
})
