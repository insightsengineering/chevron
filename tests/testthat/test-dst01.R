# NA values ----

test_that("dst01 can handle all NA values", {
  proc_data <- syn_data
  proc_data$adsl <- proc_data$adsl %>%
    mutate(
      EOSSTT = NA_character_,
      DCSREAS = NA_character_
    )

  res <- expect_silent(run(dst01_1, proc_data))
  expect_snapshot(res)
})

test_that("dst01_1 can handle all NA values in disc_reason_var", {
  proc_data <- syn_data
  proc_data$adsl <- proc_data$adsl %>%
    mutate(
      DCSREAS = NA_character_
    )

  res <- expect_silent(run(dst01_1, proc_data))
  expect_snapshot(res)
})

test_that("dst01_1 can handle some NA values", {
  proc_data <- syn_data
  proc_data$adsl <- proc_data$adsl %>%
    mutate(
      EOSSTT = c(NA_character_, "", as.character(.data$EOSSTT[-c(1, 2)])),
      DCSREAS = c(NA_character_, "", as.character(.data$DCSREAS[-c(1, 2)]))
    )

  res <- expect_silent(run(dst01_1, proc_data))
  expect_snapshot(res)
})

test_that("dst01_1 can handle missing levels in status_var", {
  proc_data <- syn_data
  proc_data$adsl <- proc_data$adsl %>%
    mutate(
      EOSSTT = factor(.data$EOSSTT, levels = "ONGOING"),
    )

  res <- expect_silent(run(dst01_1, proc_data))
  expect_snapshot(res)
})

test_that("dst01_1 can handle missing levels in disc_reason_var", {
  proc_data <- syn_data
  proc_data$adsl <- proc_data$adsl %>%
    mutate(
      DCSREAS = factor(.data$DCSREAS, levels = "DEATH")
    )

  res <- expect_silent(run(dst01_1, proc_data))
  expect_snapshot(res)
})


# dst01_2 ----

test_that("dst01_2 can handle all NA values", {
  proc_data <- syn_data
  proc_data$adsl <- proc_data$adsl %>%
    mutate(
      EOSSTT = NA_character_,
      DCSREAS = NA_character_
    )

  res <- expect_silent(run(dst01_2, proc_data))
  expect_snapshot(res)
})

test_that("dst01_2 can handle all NA values in disc_reason_var", {
  proc_data <- syn_data
  proc_data$adsl <- proc_data$adsl %>%
    mutate(
      DCSREAS = NA_character_
    )

  res <- expect_silent(run(dst01_2, proc_data))
  expect_snapshot(res)
})

test_that("dst01_2 can handle some NA values", {
  proc_data <- syn_data
  proc_data$adsl <- proc_data$adsl %>%
    mutate(
      EOSSTT = c(NA_character_, "", as.character(.data$EOSSTT[-c(1, 2)])),
      DCSREAS = c(NA_character_, "", as.character(.data$DCSREAS[-c(1, 2)]))
    )

  res <- expect_silent(run(dst01_2, proc_data))
  expect_snapshot(res)
})

test_that("dst01_2 can handle missing levels in disc_reason_var", {
  proc_data <- syn_data
  proc_data$adsl <- proc_data$adsl %>%
    mutate(
      DCSREAS = factor(.data$DCSREAS, levels = "DEATH")
    )

  res <- expect_silent(run(dst01_2, proc_data))
  expect_snapshot(res)
})

# dst01_3 ----

test_that("dst01_3 can handle all NA values", {
  proc_data <- syn_data
  proc_data$adsl <- proc_data$adsl %>%
    mutate(
      EOSSTT = NA_character_,
      DCSREAS = NA_character_,
      EOTSTT = NA_character_,
    )

  res <- expect_silent(run(dst01_3, proc_data))
  expect_snapshot(res)
})

test_that("dst01_3 can handle all NA values in status_treatment_var", {
  proc_data <- syn_data
  proc_data$adsl <- proc_data$adsl %>%
    mutate(
      EOTSTT = NA_character_
    )

  res <- expect_silent(run(dst01_3, proc_data))
  expect_snapshot(res)
})

test_that("dst01_3 can handle some NA values in status_treatment_var", {
  proc_data <- syn_data
  proc_data$adsl <- proc_data$adsl %>%
    mutate(
      EOTSTT = c(NA_character_, "", as.character(.data$EOTSTT[-c(1, 2)]))
    )

  res <- expect_silent(run(dst01_3, proc_data))
  expect_snapshot(res)
})

test_that("dst01_3 can handle missing levels in status_treatment_var", {
  proc_data <- syn_data
  proc_data$adsl <- proc_data$adsl %>%
    mutate(
      EOTSTT = factor(.data$EOTSTT, levels = "ONGOING")
    )

  res <- expect_silent(run(dst01_3, proc_data))
  expect_snapshot(res)
})
