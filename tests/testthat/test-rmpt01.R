# rmp01 functions ----

test_that("rmpt01 function with default argument value return expected result with test data", {
  pre_data <- rmpt01_pre(syn_data)
  raw_res <- rmpt01_main(pre_data)
  res <- rmpt01_post(raw_res)
  expect_snapshot(cat(formatters::export_as_txt(res, lpp = 100)))
})

# rmp01 ----

test_that("rmpt01 can handle NA values", {
  proc_data <- syn_data
  proc_data$adex$AVAL <- NA_real_

  res1 <- expect_silent(run(rmpt01, proc_data))
  expect_snapshot(cat(formatters::export_as_txt(res1, lpp = 100)))

  res2 <- expect_silent(run(rmpt01, proc_data, indication = "PARCAT2"))
  expect_snapshot(cat(formatters::export_as_txt(res2, lpp = 100)))
})

test_that("rmpt01 can handle some NA values", {
  proc_data <- syn_data
  proc_data$adex <- proc_data$adex %>%
    mutate(
      AVAL = case_when(PARAMCD == "TDURD" & AVAL %% 2 == 0 ~ NA, TRUE ~ .data$AVAL)
    )

  res1 <- expect_silent(run(rmpt01, proc_data))
  expect_snapshot(cat(formatters::export_as_txt(res1, lpp = 100)))

  res2 <- expect_silent(run(rmpt01, proc_data, indication = "PARCAT2"))
  expect_snapshot(cat(formatters::export_as_txt(res2, lpp = 100)))
})

test_that("rmpt01 fails on incomlete data", {
  proc_data <- syn_data
  proc_data$adex <- proc_data$adex %>%
    mutate(
      PARAMCD = NULL
    )

  expect_error(run(rmpt01, proc_data))
  expect_error(run(rmpt01, proc_data, indication = "PARCAT2"))
})
