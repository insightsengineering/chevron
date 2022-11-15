test_that("dmt01_1 can handle NA values", {
    proc_data <- syn_data %>%
    dm_zoom_to("adsl") %>%
    mutate(
      AAGE = NA,
      AGEGR1 = NA
    ) %>%
    dm_update_zoomed()

  res <- expect_silent(run(dmt01_1, proc_data, prune_0 = FALSE))
  expect_snapshot(res)
})

test_that("dmt01_1 can handle some NA values", {
    proc_data <- syn_data %>%
    dm_zoom_to("adsl") %>%
    mutate(
      AAGE = c(NA, .data$AGE[-1]),
      AGEGR1 = c(NA, .data$AGE[-1])
    ) %>%
    dm_update_zoomed()

  res <- expect_silent(run(dmt01_1, proc_data, prune_0 = FALSE))
  expect_snapshot(res)
})
