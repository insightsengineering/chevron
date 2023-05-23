# lbt05 functions ----

test_that("lbt05 functions with default argument value return expected result with test data", {
  pre_data <- lbt05_pre(syn_data)
  raw_res <- lbt05_main(pre_data)
  res <- lbt05_post(raw_res)
  expect_snapshot(cat(formatters::export_as_txt(res, lpp = 100)))

  res_prune <- lbt05_post(raw_res, prune_0 = TRUE)
  expect_snapshot(cat(formatters::export_as_txt(res_prune, lpp = 100)))
})

# lbt05 ----

test_that("lbt05 give all 0 count if ANRIND are all missing", {
  proc_data <- syn_data
  proc_data$adlb <- proc_data$adlb %>%
    mutate(
      ANRIND = NA_character_
    )
  res <- run(lbt05, proc_data)
  res <- smart_prune(res)
  expect_identical(nrow(res), 0L)
})

test_that("lbt05 can handle some NA values", {
  new_anrind <- c(NA, "", as.character(syn_data$adlb$ANRIND[-c(1, 2)]))

  proc_data <- syn_data
  proc_data$adlb <- proc_data$adlb %>%
    mutate(
      ANRIND = factor(.env$new_anrind),
    )

  res <- expect_silent(run(lbt05, proc_data))
  expect_snapshot(cat(formatters::export_as_txt(res, lpp = 100)))
})

test_that("lbt05 fails on incomlete data", {
  proc_data <- syn_data
  proc_data$adlb <- proc_data$adlb %>%
    mutate(PARCAT2 = NULL)
  expect_error(run(lbt05, proc_data))
})
