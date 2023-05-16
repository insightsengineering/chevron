# aet01_aesi ----

test_that("aet01_aesi can handle all NA values", {
  proc_data <- syn_data
  proc_data$adae <- proc_data$adae %>%
    mutate(
      AETOXGR = factor(NA, levels = 1:5),
      ALL_RESOLVED = NA,
      NOT_RESOLVED = NA,
      AEACN = NA,
      AECONTRT = NA,
      AEREL = NA,
      AESER = NA
    )

  res <- expect_silent(run(aet01_aesi, proc_data))
  expect_snapshot(cat(export_as_txt(res, lpp = 100)))
  res <- expect_silent(run(aet01_aesi, proc_data, prune_0 = TRUE))
  expect_snapshot(cat(export_as_txt(res, lpp = 100)))
})

test_that("aet01_aesi can handle some NA values", {
  proc_data <- syn_data
  proc_data$adae <- proc_data$adae %>%
    mutate(
      AEACN = c(NA, as.character(syn_data$adae$AEACN)[-1])
    )

  res <- expect_silent(run(aet01_aesi, proc_data))
  expect_snapshot(cat(export_as_txt(res, lpp = 100)))
})

test_that("aet01_aesi works with `ALL` argument", {
  proc_data <- syn_data
  res <- expect_silent(run(aet01_aesi, proc_data, aesi_vars = c("ALL")))
  expect_snapshot(cat(export_as_txt(res, lpp = 100)))
})

test_that("aet01_aesi_check fails on incomplete data input", {
  proc_data <- syn_data
  proc_data$adae <- proc_data$adae %>%
    mutate(AEOUT = NULL)

  expect_error(
    run(aet01_aesi, proc_data, aesi_vars = c("ALL")),
    "Column `AEOUT` not found in",
    fixed = TRUE
  )
})
