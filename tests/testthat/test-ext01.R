# ext01 functions ----

test_that("ext01 functions with default argument value return expected result with test data", {
  pre_data <- ext01_pre(syn_data)
  raw_res <- ext01_main(pre_data)
  res <- ext01_post(raw_res)
  expect_snapshot(cat(export_as_txt(res, lpp = 100)))
})

test_that("ext01 functions with categorical data return expected result with test data", {
  proc_data <- dunlin::log_filter(syn_data, PARAMCD == "TDOSE", "adex")
  pre_data <- ext01_pre(proc_data)
  raw_res <- ext01_main(pre_data, summaryvars = c("AVAL", "AVALCAT1"))
  res <- ext01_post(raw_res)
  expect_snapshot(cat(export_as_txt(res, lpp = 100)))
})

# ext01 ----

test_that("ext01 works", {
  proc_data <- syn_data
  res1 <- expect_silent(run(ext01, proc_data))
  expect_snapshot(cat(export_as_txt(res1, lpp = 100)))

  res2 <- expect_silent(run(ext01, proc_data, prune_0 = FALSE))
  expect_snapshot(cat(export_as_txt(res2, lpp = 100)))
})

# ext01 with categorical variables functions ----

test_that("ext01 works for selected parameters and categorical variables", {
  proc_data <- syn_data
  proc_data$adex <- proc_data$adex %>%
    filter(PARAMCD == "TDOSE")
  res <- run(ext01, proc_data, prune_0 = TRUE, summaryvars = c("AVAL", "AVALCAT1"))
  expect_snapshot(cat(export_as_txt(res, lpp = 100)))
})

# ext01 with custom mapping

test_that("ext01 works with custom mapping order", {
  map <- data.frame(
    PARAMCD = "TDURD",
    AVALCAT1 = c("< 1 month", "3 to <6 months", "1 to <3 months", ">=6 months")
  )
  res <- run(ext01, syn_data, prune_0 = FALSE, summaryvars = c("AVAL", "AVALCAT1"), map = map)
  expect_snapshot(cat(export_as_txt(res, lpp = 100)))
})

test_that("ext01 works with custom mapping order for a single split", {
  map <- data.frame(
    PARCAT2 = "Drug A",
    PARAMCD = "TDURD",
    AVALCAT1 = c("< 1 month", "3 to <6 months", "1 to <3 months", ">=6 months")
  )
  res <- run(ext01, syn_data, prune_0 = FALSE, summaryvars = c("AVAL", "AVALCAT1"), map = map)
  expect_snapshot(cat(export_as_txt(res, lpp = 100)))
})

test_that("ext01 works with custom mapping fill in value", {
  map <- data.frame(
    PARAMCD = "TDURD",
    AVALCAT1 = c("< 1 month", "3 to <6 months", "1 to <3 months", ">=6 months", "> 12 months")
  )
  proc_data <- syn_data
  levels(proc_data$adex$AVALCAT1) <- c(levels(proc_data$adex$AVALCAT1), "> 12 months")
  res <- run(ext01, proc_data, prune_0 = FALSE, summaryvars = c("AVAL", "AVALCAT1"), map = map)
  expect_snapshot(cat(export_as_txt(res, lpp = 100)))
})
