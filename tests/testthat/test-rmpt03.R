# rmpt03 functions ----

prop_data <- dunlin::propagate(syn_data, "adsl", "AGEGR1", "USUBJID")

test_that("rmpt03 function with default argument value return expected result with test data", {
  pre_data <- rmpt01_pre(prop_data)
  raw_res <- rmpt03_main(pre_data)
  res <- rmpt01_post(raw_res)
  expect_snapshot(cat(export_as_txt(res, lpp = 100)))
})

# rmpt03 ----

test_that("rmpt03 can handle NA values", {
  proc_data <- prop_data
  proc_data$adex$AVAL <- NA_real_

  res1 <- expect_silent(run(rmpt03, proc_data))
  expect_snapshot(cat(export_as_txt(res1, lpp = 100)))

  res2 <- expect_silent(run(rmpt03, proc_data, split_var = "PARCAT2"))
  expect_snapshot(cat(export_as_txt(res2, lpp = 100)))
})

test_that("rmpt03 can handle some NA values", {
  proc_data <- prop_data
  proc_data$adex <- proc_data$adex %>%
    mutate(
      AVAL = case_when(PARAMCD == "TDURD" & AVAL %% 2 == 0 ~ NA, TRUE ~ .data$AVAL)
    )

  res1 <- expect_silent(run(rmpt03, proc_data))
  expect_snapshot(cat(export_as_txt(res1, lpp = 100)))

  res2 <- expect_silent(run(rmpt03, proc_data, split_var = "PARCAT2"))
  expect_snapshot(cat(export_as_txt(res2, lpp = 100)))
})

test_that("rmpt03 fails on incomlete data", {
  proc_data <- prop_data
  proc_data$adex <- proc_data$adex %>%
    mutate(
      PARAMCD = NULL
    )

  expect_error(run(rmpt03, proc_data))
  expect_error(run(rmpt03, proc_data, split_var = "PARCAT2"))

  proc_data <- prop_data
  proc_data$adex <- proc_data$adex %>%
    mutate(
      SEX = case_when(PARAMCD == "TDURD" & AVAL %% 2 == 0 ~ NA, TRUE ~ .data$SEX)
    )

  expect_error(run(rmpt03, proc_data))
})
