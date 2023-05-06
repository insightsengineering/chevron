test_that("coxt02 can handle some NA values", {
  proc_data <- syn_data
  proc_data <- dunlin::log_filter(proc_data, PARAMCD == "CRSD", "adtte")

  set.seed(1)
  new_sex <- as.character(proc_data$adtte$SEX)
  new_sex[sample(seq_along(new_sex), 20)] <- NA
  new_race <- as.character(proc_data$adtte$RACE)
  new_race[sample(seq_along(new_race), 15)] <- NA
  new_cnsr <- proc_data$adtte$CNSR
  new_cnsr[sample(seq_along(new_cnsr), 10)] <- NA
  new_aval <- proc_data$adtte$AVAL
  new_aval[sample(seq_along(new_aval), 15)] <- NA
  new_age <- proc_data$adtte$AGE
  new_age[sample(seq_along(new_age), 15)] <- NA

  proc_data$adtte <- proc_data$adtte %>%
    mutate(
      SEX = factor(.env$new_sex),
      RACE = factor(.env$new_race),
      CNSR = .env$new_cnsr,
      AVAL = .env$new_aval,
      AGE = .env$new_age
    )

  res1 <- expect_silent(run(coxt02_1, proc_data))
  expect_snapshot(res1)

  res2 <- expect_silent(run(coxt02_1, proc_data, conf_level = .90))
  expect_snapshot(res2)

  res3 <- expect_silent(run(coxt02_1, proc_data, covariates = c("SEX", "AGE")))
  expect_snapshot(res3)
})

test_that("coxt02 fails on incomlete date", {
  proc_data <- syn_data
  proc_data$adtte <- proc_data$adtte %>%
    mutate(PARAMCD = NULL)

  expect_error(run(coxt02_1, proc_data))
})
