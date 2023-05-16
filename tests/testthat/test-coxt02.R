test_that("coxt02 can handle some NA values", {
  proc_data <- dunlin::log_filter(syn_data, PARAMCD == "CRSD", "adtte")
  proc_data$adtte[1:4, c("SEX", "RACE", "CNSR", "AVAL", "AAGE")] <- NA
  res1 <- expect_silent(run(coxt02, proc_data))
  expect_snapshot(cat(export_as_txt(res1, lpp = 100)))

  res2 <- expect_silent(run(coxt02, proc_data, conf_level = .90))
  expect_snapshot(cat(export_as_txt(res2, lpp = 100)))

  res3 <- expect_silent(run(coxt02, proc_data, covariates = c("SEX", "AAGE")))
  expect_snapshot(cat(export_as_txt(res3, lpp = 100)))

  res4 <- expect_silent(run(coxt02, proc_data, covariates = c("SEX", "AAGE"), strata = c("RACE")))
  expect_snapshot(cat(export_as_txt(res4, lpp = 100)))
})

test_that("coxt02 fails on incomlete date", {
  proc_data <- syn_data
  proc_data$adtte <- proc_data$adtte %>%
    mutate(PARAMCD = NULL)
  expect_error(run(coxt02, proc_data))
})
