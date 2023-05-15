# aet01 ----

test_that("aet01 can handle all NA values", {
  proc_data <- syn_data
  proc_data$adae <- proc_data$adae %>%
    mutate(
      AESDTH = NA,
      AESER = NA
    )

  res <- expect_silent(run(aet01, proc_data))
  expect_snapshot(res)
  res <- expect_silent(run(aet01, proc_data, prune_0 = TRUE))
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

  res <- expect_silent(run(aet01, proc_data))
  expect_snapshot(res)
})

test_that("aet01 can use custom anl_vars", {
  proc_data <- syn_data
  res <- expect_silent(run(aet01, proc_data, anl_vars = list(safety_var = "FATAL")))
  expect_snapshot(res)
})

test_that("aet01 fails on incomplete data input", {
  proc_data <- syn_data
  proc_data$adae <- proc_data$adae %>%
    mutate(AESER = NULL)

  expect_error(
    run(aet01, proc_data),
    "Column `AESER` not found",
    fixed = TRUE
  )
})

test_that("aet01 can use custom medconcept_var", {
  proc_data <- syn_data
  proc_data$adae$SMQ01 <- with_label(proc_data$adae$SMQ01NAM != "", "SMQ 01")
  res <- expect_silent(
    run(
      aet01, proc_data,
      anl_vars = list(
        safety_var = c(
          "FATAL", "SER", "SERWD", "SERDSM",
          "RELSER", "WD", "DSM", "REL", "RELWD", "RELDSM", "SEV"
        ),
        medconcept = "SMQ01"
      )
    )
  )
  expect_snapshot(res)
})
