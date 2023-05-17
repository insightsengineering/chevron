test_that("lbt06 gives all 0 count if ANRIND are all missing", {
  proc_data <- syn_data
  proc_data$adlb <- proc_data$adlb %>%
    mutate(
      ANRIND = NA_character_
    )
  res1 <- run(lbt06, proc_data)
  res1 <- smart_prune(res1)
  expect_identical(nrow(res1), 0L)

  res2 <- run(lbt06, proc_data, paramcd = "PARAMCD")
  res2 <- smart_prune(res2)
  expect_identical(nrow(res2), 0L)
})

test_that("lbt06 can handle some NA values", {
  proc_data <- syn_data
  proc_data$adlb[1:4, c("ANRIND", "BNRIND")] <- NA

  res1 <- expect_silent(run(lbt06, proc_data))
  expect_snapshot(res1)

  res2 <- expect_silent(run(lbt06, proc_data, paramcd = "PARAMCD"))
  expect_snapshot(res2)
})

test_that("lbt06 fails on incomlete data", {
  proc_data <- syn_data
  proc_data$adlb <- proc_data$adlb %>%
    mutate(PARCAT2 = NULL)
  expect_error(run(lbt06, proc_data))
})
