test_that("aet03 can handle NA values", {
  proc_data <- as.list(syn_data)

  proc_data$adae <- proc_data$adae %>%
    mutate(
      AEBODSYS = NA_character_,
      AEDECOD = NA_character_
    )

  res1 <- expect_silent(run(aet03_1, proc_data))
  expect_snapshot(res1)
})

test_that("aet03 can handle some NA values", {
  new_aebodsys <- c(NA, "", as.character(syn_data$adae$AEBODSYS[-c(1, 2)]))
  new_aedecod <- c(NA, "", as.character(syn_data$adae$AEDECOD[-c(1, 2)]))
  new_asev <- c(NA, "", as.character(syn_data$adae$ASEV[-c(1, 2)]))

  proc_data <- as.list(syn_data)

  proc_data$adae <- proc_data$adae %>%
    mutate(
      AEBODSYS = .env$new_aebodsys,
      AEDECOD = .env$new_aedecod,
      ASEV = .env$new_asev
    )

  res1 <- expect_silent(run(aet03_1, proc_data))
  expect_snapshot(res1)
})
