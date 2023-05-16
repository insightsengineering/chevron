# egt03 functions ----

test_that("egt03 functions with default argument value return expected result with test data", {
  pre_data <- egt03_pre(syn_data)
  raw_res <- egt03_main(pre_data)
  res <- egt03_post(raw_res)
  expect_snapshot(cat(formatters::export_as_txt(res, lpp = 100)))
})

# egt03 ----

test_that("egt03 errors on all NA values", {
  proc_data <- syn_data
  proc_data$adeg <- proc_data$adeg %>%
    mutate(
      BNRIND = NA_character_,
      ANRIND = NA_character_,
    )

  expect_error(run(egt03, proc_data))
})

test_that("egt03 can handle some NA values", {
  proc_data <- syn_data
  proc_data$adeg[1:2, c("ANRIND", "BNRIND")] <- NA

  res <- expect_silent(run(egt03, proc_data))
  expect_snapshot(cat(formatters::export_as_txt(res, lpp = 100)))
})

test_that("egt03 fails on incomplete data", {
  proc_data <- syn_data
  proc_data$adeg <- proc_data$adeg %>%
    mutate(PARAMCD = NULL)

  expect_error(
    run(egt03, proc_data)
  )
})
