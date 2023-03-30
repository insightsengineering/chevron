test_that("lbt05 give all 0 count if ANRIND are all missing", {
  proc_data <- as.list(syn_data)

  proc_data$adlb <- proc_data$adlb %>%
    mutate(
      ANRIND = NA_character_
    )
  res <- run(lbt05_1, proc_data)
  res <- smart_prune(res)
  expect_identical(nrow(res), 0L)
})

test_that("lbt05 can handle some NA values", {
  new_anrind <- c(NA, "", as.character(syn_data$adlb$ANRIND[-c(1, 2)]))

  proc_data <- as.list(syn_data)

  proc_data$adlb <- proc_data$adlb %>%
    mutate(
      ANRIND = factor(.env$new_anrind),
    )

  res <- expect_silent(run(lbt05_1, proc_data))
  expect_snapshot(res)
})

test_that("lbt05 fails on incomlete date", {
  proc_data <- as.list(syn_data)

  proc_data$adlb <- proc_data$adlb %>%
    mutate(PARCAT2 = NULL)
  expect_error(run(lbt05_1, proc_data))
})
