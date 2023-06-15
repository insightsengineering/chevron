# rmpt04 functions ----

test_that("rmpt04 function with default argument value return expected result with test data", {
  pre_data <- rmpt01_pre(syn_data)
  raw_res <- rmpt04_main(pre_data)
  res <- rmpt01_post(raw_res)
  expect_snapshot(cat(export_as_txt(res, lpp = 100)))
})

# rmpt04 ----

test_that("rmpt04 can handle NA values", {
  proc_data <- syn_data
  proc_data$adex$AVAL <- NA_real_

  res1 <- expect_silent(run(rmpt04, proc_data))
  expect_snapshot(cat(export_as_txt(res1, lpp = 100)))

  res2 <- expect_silent(run(rmpt04, proc_data, prune_0 = FALSE))
  expect_snapshot(cat(export_as_txt(res2, lpp = 100)))
})

test_that("rmpt04 can handle some NA values", {
  proc_data <- syn_data
  proc_data$adex <- proc_data$adex %>%
    mutate(
      AVAL = case_when(
        .data$ETHNIC == "HISPANIC OR LATINO" & .data$PARAMCD == "TDURD" ~ NA,
        .default = .data$AVAL
      )
    )

  res1 <- expect_silent(run(rmpt04, proc_data))
  expect_snapshot(cat(export_as_txt(res1, lpp = 100)))
})

test_that("rmpt04 fails on incomlete data", {
  proc_data <- syn_data
  proc_data$adex$ETHNIC <- as.character(proc_data$adex$ETHNIC)
  proc_data$adex$ETHNIC[1:2] <- c(NA_character_, "")

  expect_error(run(rmpt04, proc_data))

  proc_data <- syn_data
  proc_data$adex <- proc_data$adex %>%
    mutate(
      ETHNIC = NULL
    )

  expect_error(run(rmpt04, proc_data))
})
