# rmpt05 functions ----

test_that("rmpt05 function with default argument value return expected result with test data", {
  pre_data <- rmpt05_pre(syn_data)
  raw_res <- rmpt05_main(pre_data)
  res <- rmpt05_post(raw_res)
  expect_snapshot(cat(export_as_txt(res, lpp = 100)))
})

# rmpt05 ----

test_that("rmpt05 can handle NA values", {
  proc_data <- syn_data
  proc_data$adex$AVAL <- NA_real_

  res1 <- expect_silent(run(rmpt05, proc_data))
  expect_snapshot(cat(export_as_txt(res1, lpp = 100)))

  res2 <- expect_silent(run(rmpt05, proc_data, prune_0 = FALSE))
  expect_snapshot(cat(export_as_txt(res2, lpp = 100)))
})

test_that("rmpt05 can handle some NA values", {
  proc_data <- syn_data
  proc_data$adex <- proc_data$adex %>%
    mutate(
      AVAL = case_when(
        .data$RACE == "HISPANIC OR LATINO" & .data$PARAMCD == "TDURD" ~ NA,
        .default = .data$AVAL
      )
    )

  res1 <- expect_silent(run(rmpt05, proc_data))
  expect_snapshot(cat(export_as_txt(res1, lpp = 100)))
})

test_that("rmpt05 fails on incomlete data", {
  proc_data <- syn_data
  proc_data$adex$RACE <- as.character(proc_data$adex$RACE)
  proc_data$adex$RACE[1:2] <- c(NA_character_, "")

  expect_error(run(rmpt05, proc_data))

  proc_data <- syn_data
  proc_data$adex <- proc_data$adex %>%
    mutate(
      RACE = NULL
    )

  expect_error(run(rmpt05, proc_data))
})
