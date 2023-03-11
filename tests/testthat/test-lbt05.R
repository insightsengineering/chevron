test_that("lbt05 give all 0 count if ANRIND are all missing", {
  proc_data <- syn_data %>%
    dm_zoom_to("adlb") %>%
    mutate(
      ANRIND = NA_character_
    ) %>%
    dm_update_zoomed()
  res <- run(lbt05_1, proc_data)
  res <- smart_prune(res)
  expect_identical(nrow(res), 0L)
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
