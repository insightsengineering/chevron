test_that("rmpt01 can handle NA values", {
  # Simulate ADEX records with PARAMCD == "TDURD" as they are not in sample dataset.
  proc_data <- syn_data %>%
    dm_zoom_to("adex") %>%
    group_by(USUBJID) %>%
    mutate(
      id = seq_along(AVAL)
    ) %>%
    ungroup() %>%
    mutate(
      PARAMCD = case_when(
        id == 1 ~ "TDURD",
        TRUE ~ PARAMCD
      ),
      AVAL = NA
    ) %>%
    dm_update_zoomed()

  res <- expect_silent(run(rmpt01_1, proc_data))
  expect_snapshot(res)
})

test_that("rmpt01 can handle some NA values", {
  # Simulate ADEX records with PARAMCD == "TDURD" as they are not in sample dataset.
  set.seed(1)
  proc_data <- syn_data %>%
    dm_zoom_to("adex") %>%
    group_by(USUBJID) %>%
    mutate(
      id = seq_along(AVAL),
      PARAMCD = case_when(
        id == 1 ~ "TDURD",
        TRUE ~ PARAMCD
      ),
      new_aval = sample(x = seq(1, 200), size = n(), replace = TRUE),
      AVAL = ifelse(new_aval < 100, NA, new_aval)
    ) %>%
    dm_update_zoomed()

  res <- expect_silent(run(rmpt01_1, proc_data))
  expect_snapshot(res)
})

test_that("rmpt01 fails on incomlete date", {
  proc_data <- syn_data %>%
    dm_zoom_to("adex") %>%
    mutate(
      PARAMCD = NULL,
      PARCAT2 = NULL,
      SAFFL = NULL
    ) %>%
    dm_update_zoomed()

  expect_error(run(rmpt01_1, proc_data))
})
