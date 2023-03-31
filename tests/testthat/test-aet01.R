# aet01_1 ----

test_that("aet01 can handle all NA values", {
  proc_data <- syn_data
  proc_data$adae <- proc_data$adae %>%
    mutate(
      AESDTH = NA,
      AESER = NA
    )

  res <- expect_silent(run(aet01_1, proc_data))
  expect_snapshot(res)
  res <- expect_silent(run(aet01_1, proc_data, prune_0 = TRUE))
  expect_snapshot(res)
})

test_that("aet01 can handle some NA values", {
  new_aesdth <- c(NA, "", as.character(syn_data$adae$AESDTH[-c(1, 2)]))
  new_aeser <- c(NA, "", as.character(syn_data$adae$AESER[-c(1, 2)]))

  proc_data <- syn_data
  proc_data$adae <- proc_data$adae %>%
    mutate(
      AESDTH = .env$new_aesdth,
      AESER = .env$new_aeser
    )

  res <- expect_silent(run(aet01_1, proc_data))
  expect_snapshot(res)
})

test_that("aet01 can use custom lbl_safety_var", {
  proc_data <- syn_data
  res <- expect_silent(run(aet01_1, proc_data, safety_var = list("FATAL"), lbl_safety_var = list("Fatal AE")))
  expect_snapshot(res)
})

test_that("aet01 fails on incomplete data input", {
  proc_data <- syn_data
  proc_data$adae <- proc_data$adae %>%
    mutate(AESER = NULL)

  expect_error(
    run(aet01_1, proc_data),
    "Expected column names: AESER not in adam_db$adae",
    fixed = TRUE
  )
})
# aet01_2 ----
test_that("aet01_2 can use custom medconcept_var", {
  proc_data <- syn_data
  res <- expect_silent(run(aet01_2, proc_data, medconcept_var = list("SMQ01"), lbl_medconcept_var = list("SMQ 01")))
  expect_snapshot(res)
})
