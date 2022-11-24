test_that("lbt04 can handle all NA values", {
  proc_data <- syn_data %>%
    dm_zoom_to("adlb") %>%
    mutate(
      ANRIND = factor(NA)
    ) %>%
    dm_update_zoomed()

  res <- expect_silent(run(lbt04_1, proc_data))
  expect_snapshot(res)
})

test_that("lbt04 can handle some NA values", {
  new_anrind <- c(NA, "", as.character(syn_data$adlb$ANRIND[-c(1, 2)]))

  proc_data <- syn_data %>%
    dm_zoom_to("adlb") %>%
    mutate(
      ANRIND = factor(.env$new_anrind),
    ) %>%
    dm_update_zoomed()

  res <- expect_silent(run(lbt04_1, proc_data))
  expect_snapshot(res)
})
