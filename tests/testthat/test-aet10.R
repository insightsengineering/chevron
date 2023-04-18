test_that("aet10_1 can handle NA values", {
  proc_data <- syn_data

  proc_data$adae <- proc_data$adae %>%
    mutate(
      AEBODSYS = factor(NA, levels = "<Missing>"),
      AEDECOD = factor(NA, levels = "<Missing>")
    )

  res <- expect_silent(run(aet10_1, proc_data))
  expect_snapshot(res)
})

test_that("aet10_1 can handle some NA values", {
  new_aedecod <- c(NA, "", as.character(syn_data$adae$AEDECOD[-c(1, 2)]))

  proc_data <- syn_data

  proc_data$adae <- proc_data$adae %>%
    mutate(
      AEDECOD = .env$new_aedecod
    )

  res <- expect_silent(run(aet10_1, proc_data))
  expect_snapshot(res)
})
