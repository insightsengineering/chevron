# egt03_1 ----
test_that("egt03_1 can handle all NA values", {
  proc_data <- syn_data
  proc_data$adeg <- proc_data$adeg %>%
    mutate(
      BNRIND = NA_character_,
      ANRIND = NA_character_,
    )

  res <- expect_silent(run(egt03_1, proc_data))
  expect_snapshot(res)

  res <- expect_silent(run(egt03_1, proc_data, prune_0 = TRUE))
  expect_snapshot(res)
})

test_that("egt03_1 can handle some NA values", {
  new_bnrind <- c(NA_character_, "", as.character(syn_data$adeg$BNRIND[-c(1, 2)]))
  new_anrind <- c(NA_character_, "", as.character(syn_data$adeg$ANRIND[-c(1, 2)]))

  proc_data <- syn_data
  proc_data$adeg <- proc_data$adeg %>%
    mutate(
      BNRIND = .env$new_bnrind,
      ANRIND = .env$new_anrind
    )

  res <- expect_silent(run(egt03_1, proc_data))
  expect_snapshot(res)
})

# egt03_2 ----
test_that("egt03_2 can handle all NA values", {
  proc_data <- syn_data
  proc_data$adeg <- proc_data$adeg %>%
    mutate(
      BNRIND = NA_character_,
      ANRIND = NA_character_,
    )

  res <- expect_silent(run(egt03_2, proc_data))
  expect_snapshot(res)
})

test_that("egt03_2 can handle some NA values", {
  new_bnrind <- c(NA_character_, "", as.character(syn_data$adeg$BNRIND[-c(1, 2)]))
  new_anrind <- c(NA_character_, "", as.character(syn_data$adeg$ANRIND[-c(1, 2)]))

  proc_data <- syn_data
  proc_data$adeg <- proc_data$adeg %>%
    mutate(
      BNRIND = .env$new_bnrind,
      ANRIND = .env$new_anrind
    )

  res <- expect_silent(run(egt03_2, proc_data))
  expect_snapshot(res)
})

# egt03 checks ----

test_that("egt03_1 fails on incomplete data", {
  proc_data <- syn_data
  proc_data$adeg <- proc_data$adeg %>%
    mutate(PARAMCD = NULL)

  expect_error(
    run(egt03_1, proc_data)
  )
})
