# NA values ----

test_that("dtht01 can handle all NA values", {
  proc_data <- syn_data
  proc_data$adsl <- proc_data$adsl %>%
    mutate(
      DTHCAT = NA_character_,
      DTHCAUS = NA_character_
    )

  res <- expect_silent(run(dtht01, proc_data, time_since_last_dose = FALSE, other_category = FALSE, prune_0 = FALSE))
  expect_snapshot(cat(formatters::export_as_txt(res, lpp = 100)))
})

test_that("dtht01 can handle some NA values", {
  proc_data <- syn_data
  proc_data$adsl[1:2, c("DTHCAT", "DTHCAUS")] <- NA
  res <- expect_silent(run(dtht01, proc_data, time_since_last_dose = TRUE, other_category = TRUE))
  expect_snapshot(cat(formatters::export_as_txt(res, lpp = 100)))
})

# Arguments ----

test_that("dtht01 can be parametrize as expected", {
  proc_data <- syn_data

  pre_data <- dtht01_pre(proc_data)
  raw_res <- dtht01_main(pre_data, time_since_last_dose = TRUE, other_category = TRUE)
  res <- dtht01_post(raw_res)
  expect_snapshot(cat(formatters::export_as_txt(res, lpp = 100)))
})
