test_that("coxt02 can handle some NA values", {
  set.seed(1)
  new_sex <- as.character(syn_data$adtte$SEX)
  new_sex[sample(seq_along(new_sex), 20)] <- NA
  new_race <- as.character(syn_data$adtte$RACE)
  new_race[sample(seq_along(new_race), 15)] <- NA
  new_cnsr <- syn_data$adtte$CNSR
  new_cnsr[sample(seq_along(new_cnsr), 10)] <- NA
  new_aval <- syn_data$adtte$AVAL
  new_aval[sample(seq_along(new_aval), 15)] <- NA
  new_age <- syn_data$adtte$AGE
  new_age[sample(seq_along(new_age), 15)] <- NA

  proc_data <- syn_data
  proc_data$adtte <- proc_data$adtte %>%
    mutate(
      SEX = factor(.env$new_sex),
      RACE = factor(.env$new_race),
      CNSR = factor(.env$new_cnsr),
      AVAL = factor(.env$new_aval),
      AGE = factor(.env$new_age),
    )

  res1 <- expect_silent(run(coxt02_1, proc_data))
  expect_snapshot(res1)

  res2 <- expect_silent(run(coxt02_1, proc_data, conf_level = .90))
  expect_snapshot(res2)
})

test_that("coxt02 fails on incomlete date", {
  proc_data <- syn_data
  proc_data$adtte <- proc_data$adtte %>%
    mutate(PARAMCD = NULL)

  expect_error(run(coxt02_1, proc_data))
})
