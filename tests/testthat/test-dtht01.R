# NA values ----

test_that("dtht01 can handle all NA values", {
  proc_data <- as.list(syn_data)

  proc_data$adsl <- proc_data$adsl %>%
    mutate(
      DTHCAT = NA_character_,
      DTHCAUS = NA_character_
    )

  res <- expect_silent(run(dtht01_1, proc_data, time_since_last_dose = TRUE, other_category = TRUE))
  expect_snapshot(res)
})

test_that("dtht01 can handle some NA values", {
  new_dthcat <- c(NA_character_, "", as.character(syn_data$adsl$DTHCAT[-c(1, 2)]))
  new_dthcaus <- c(NA_character_, "", as.character(syn_data$adsl$DTHCAUS[-c(1, 2)]))

  proc_data <- as.list(syn_data)

  proc_data$adsl <- proc_data$adsl %>%
    mutate(
      DTHCAT = .env$new_dthcat,
      DTHCAUS = .env$new_dthcaus
    )

  res <- expect_silent(run(dtht01_1, proc_data, time_since_last_dose = TRUE, other_category = TRUE))
  expect_snapshot(res)
})

# Arguments ----

test_that("dtht01 can be parametrize as expected", {
  proc_data <- as.list(syn_data)


  pre_data <- dtht01_1_pre(proc_data)
  raw_res <- dtht01_1_main(pre_data, time_since_last_dose = TRUE, other_category = TRUE)
  res <- dtht01_1_post(raw_res)
  expect_snapshot(res)
})
