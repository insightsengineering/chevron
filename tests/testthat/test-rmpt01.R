test_that("rmpt01 can handle different time units", {
  # Simulate ADEX records with PARAMCD == "TDURD" as they are not in sample dataset.
  set.seed(1)
  proc_data <- syn_data
  proc_data$adex <- proc_data$adex %>%
    group_by(USUBJID) %>%
    mutate(
      id = seq_along(AVAL),
      AVAL = sample(x = seq(0, 10), size = n(), replace = TRUE)
    ) %>%
    ungroup() %>%
    mutate(
      PARAMCD = factor(case_when(id == 1 ~ "TDURD", TRUE ~ .data$PARAMCD)),
      AVALU = factor(case_when(PARAMCD == "TDURD" ~ "MONTHS", TRUE ~ .data$AVALU))
    ) %>%
    filter(.data$PARAMCD == "TDURD")

  res <- expect_silent(run(rmpt01_1, proc_data))
  expect_snapshot(res)
})

test_that("rmpt01 can handle NA values", {
  # Simulate ADEX records with PARAMCD == "TDURD" as they are not in sample dataset.
  proc_data <- syn_data
  proc_data$adex <- proc_data$adex %>%
    group_by(USUBJID) %>%
    mutate(
      id = seq_along(AVAL)
    ) %>%
    ungroup() %>%
    mutate(
      PARAMCD = factor(case_when(id == 1 ~ "TDURD", TRUE ~ .data$PARAMCD)),
      AVAL = NA,
      AVALU = NA_character_
    ) %>%
    filter(.data$PARAMCD == "TDURD")

  res <- expect_silent(run(rmpt01_1, proc_data))
  expect_snapshot(res)
})

test_that("rmpt01 can handle some NA values", {
  # Simulate ADEX records with PARAMCD == "TDURD" as they are not in sample dataset.
  set.seed(1)
  proc_data <- syn_data
  proc_data$adex <- proc_data$adex %>%
    group_by(USUBJID) %>%
    mutate(
      id = seq_along(AVAL),
      new_aval = sample(x = seq(1, 200), size = n(), replace = TRUE),
      AVAL = ifelse(new_aval < 100, NA, new_aval)
    ) %>%
    ungroup() %>%
    mutate(
      PARAMCD = factor(case_when(id == 1 ~ "TDURD", TRUE ~ .data$PARAMCD)),
      AVALU = factor(case_when(PARAMCD == "TDURD" ~ "DAYS", TRUE ~ .data$AVALU))
    ) %>%
    filter(.data$PARAMCD == "TDURD")

  res <- expect_silent(run(rmpt01_1, proc_data))
  expect_snapshot(res)
})

test_that("rmpt01 fails on incomlete date", {
  proc_data <- syn_data
  proc_data$adex <- proc_data$adex %>%
    mutate(
      PARAMCD = NULL
    )

  expect_error(run(rmpt01_1, proc_data))
})
