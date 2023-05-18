test_that("lbt06 gives all 0 count if ANRIND and BNRIND are all missing", {
  proc_data <- syn_data
  proc_data$adlb <- proc_data$adlb %>%
    mutate(
      ANRIND = NA_character_,
      BNRIND = NA_character_
    )
  res <- run(lbt06, proc_data)
  res <- smart_prune(res)
  expect_identical(nrow(res), 0L)
})

test_that("lbt06 can handle some NA values", {
  proc_data <- syn_data
  proc_data$adlb[1:4, c("ANRIND", "BNRIND")] <- NA

  res <- expect_silent(run(lbt06, proc_data))
  expect_snapshot(res)
})

test_that("lbt06 fails on incomlete data", {
  proc_data <- syn_data
  proc_data$adlb <- proc_data$adlb %>%
    mutate(PARCAT2 = NULL)
  expect_error(run(lbt06, proc_data))
})
