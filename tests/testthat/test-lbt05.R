test_that("lbt05 displays correct error message when ANRIND contains all NA values", {
  proc_data <- syn_data %>%
    dm_zoom_to("adlb") %>%
    mutate(
      ANRIND = factor(NA)
    ) %>%
    dm_update_zoomed()

  expect_error(
    run(lbt05_1, proc_data),
    "Abnormality mapping cannot be constructed if all values of ANRIND or AVALCAT1 are missing."
  )
})

test_that("lbt05 can handle some NA values", {
  new_anrind <- c(NA, "", as.character(syn_data$adlb$ANRIND[-c(1, 2)]))

  proc_data <- syn_data %>%
    dm_zoom_to("adlb") %>%
    mutate(
      ANRIND = factor(.env$new_anrind),
    ) %>%
    dm_update_zoomed()

  res <- expect_silent(run(lbt05_1, proc_data))
  expect_snapshot(res)
})
