# aet02 ----

test_that("aet02 fails on incomplete data input", {
  proc_data <- syn_data
  proc_data$adae <- proc_data$adae %>%
    mutate(
      AEDECOD = NULL
    )

  expect_error(
    run(aet02, proc_data),
    "object 'AEDECOD' not found",
    fixed = TRUE
  )
})

test_that("aet02 handle empty data input", {
  proc_data <- syn_data
  proc_data$adae <- proc_data$adae %>%
    filter(
      AEDECOD == ""
    )

  expect_silent(run(aet02, proc_data))
})

test_that("aet02 can have different levels of row_split", {
  expect_snapshot(run(aet02, syn_data, row_split_var = NULL))
  expect_snapshot(run(aet02, syn_data, row_split_var = c("AEBODSYS", "AEDECOD")))
})
