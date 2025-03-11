# lbt05 functions ----

test_that("lbt05 functions with default argument value return expected result with test data", {
  pre_data <- lbt05_pre(syn_data)
  raw_res <- lbt05_main(pre_data)
  res <- lbt05_post(raw_res)
  expect_snapshot(cat(export_as_txt(res, lpp = 100)))
  skip_on_os("windows")
  res_prune <- lbt05_post(raw_res, prune_0 = TRUE)
  expect_snapshot(cat(export_as_txt(res_prune, lpp = 100)))
})

# lbt05 ----

test_that("lbt05 give all 0 count if ANRIND are all missing", {
  skip_on_os("windows")
  proc_data <- syn_data
  proc_data$adlb <- proc_data$adlb %>%
    mutate(
      ANRIND = NA_character_
    )
  res <- run(lbt05, proc_data, map = NULL)
  res <- smart_prune(res)
  expect_identical(nrow(res), 0L)
})

test_that("lbt05 can handle some NA values", {
  skip_on_os("windows")
  new_anrind <- c(NA, "", as.character(syn_data$adlb$ANRIND[-c(1, 2)]))

  proc_data <- syn_data
  proc_data$adlb <- proc_data$adlb %>%
    mutate(
      ANRIND = factor(.env$new_anrind),
    )

  res <- expect_silent(run(lbt05, proc_data))
  expect_snapshot(cat(export_as_txt(res, lpp = 100)))
})

test_that("lbt05 fails on incomlete data", {
  skip_on_os("windows")
  proc_data <- syn_data
  proc_data$adlb <- proc_data$adlb %>%
    mutate(PARCAT2 = NULL)
  expect_error(run(lbt05, proc_data))
})

test_that("lbt05 works with missing levels", {
  skip_on_os("windows")
  proc_data <- syn_data
  proc_data$adlb <- proc_data$adlb %>%
    filter(PARAM == "Immunoglobulin A Measurement")
  res <- expect_silent(run(lbt05, proc_data))
  expect_snapshot(cat(export_as_txt(res, lpp = 100)))
})

test_that("map argument works as expected", {
  skip_on_os("windows")
  map <- data.frame(PARAMCD = c("ALT", "ALT", "CRP", "IGA", "XXX"), ABN_DIR = c("Low", "High", "High", "Low", "Low"))
  res <- expect_silent(run(lbt05, syn_data, map = map))
  expect_snapshot(cat(export_as_txt(res, lpp = 100)))
})

test_that("incomplete map argument works as expected", {
  skip_on_os("windows")
  map <- data.frame(PARAMCD = c("ALT"), ABN_DIR = c("Low"))
  res <- expect_silent(run(lbt05, syn_data, map = map))
  expect_snapshot(cat(export_as_txt(res, lpp = 100)))
})
