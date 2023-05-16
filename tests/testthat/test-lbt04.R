# lbt04 functions ----

test_that("lbt04 functions with default argument value return expected result with test data", {
  pre_data <- lbt04_pre(syn_data)
  raw_res <- lbt04_main(pre_data)
  res <- lbt04_post(raw_res)
  expect_snapshot(cat(export_as_txt(res, lpp = 100)))
})

# lbt04 ----

test_that("lbt04 can handle all NA values", {
  proc_data <- syn_data
  proc_data$adlb <- proc_data$adlb %>%
    mutate(
      ANRIND = NA_character_
    )

  res <- expect_silent(run(lbt04, proc_data))
  expect_snapshot(cat(export_as_txt(res, lpp = 100)))
})

test_that("lbt04 can handle some NA values", {
  proc_data <- syn_data
  proc_data$adlb[1:2, "ANRIND"] <- NA

  res <- expect_silent(run(lbt04, proc_data))
  expect_snapshot(cat(export_as_txt(res, lpp = 100)))
})

test_that("lbt04 fails on incomlete date", {
  proc_data <- syn_data
  proc_data$adlb <- proc_data$adlb %>%
    mutate(PARCAT1 = NULL)

  expect_error(run(lbt04, proc_data))
})
