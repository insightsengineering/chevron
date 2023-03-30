# aet02 ----

test_that("aet02 fails on incomplete data input", {
  proc_data <- as.list(syn_data)

  proc_data$adae <- proc_data$adae %>%
    mutate(
      AEDECOD = NULL
    )

  expect_error(
    run(aet02_1, proc_data),
    "AEDECOD not in adam_db$adae",
    fixed = TRUE
  )
})

test_that("aet02 handle empty data input", {
  proc_data <- as.list(syn_data)

  proc_data$adae <- proc_data$adae %>%
    filter(
      AEDECOD == ""
    )

  expect_silent(run(aet02_1, proc_data))
})

# aet02_2 ----

test_that("aet02_2 fails on incomplete data input", {
  proc_data <- as.list(syn_data)

  proc_data$adae <- proc_data$adae %>%
    mutate(
      AEDECOD = NULL
    )

  expect_error(
    run(aet02_2, proc_data)
  )
})

test_that("aet02_2 handle empty data input", {
  proc_data <- as.list(syn_data)

  proc_data$adae <- proc_data$adae %>%
    filter(
      AEDECOD == ""
    )

  expect_silent(run(aet02_2, proc_data))
})
