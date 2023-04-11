test_that("aet10_1 can handle NA values", {
  proc_data <- syn_data %>%
    dm_zoom_to("adae") %>%
    mutate(
      AEBODSYS = factor(NA),
      AEDECOD = factor(NA)
    ) %>%
    dm_update_zoomed()

  res <- expect_silent(run(aet10_1, proc_data))
  expect_snapshot(res)
})

test_that("aet10_1 can handle some NA values", {
  new_aedecod <- c(NA, "", as.character(syn_data$adae$AEDECOD[-c(1, 2)]))

  proc_data <- syn_data %>%
    dm_zoom_to("adae") %>%
    mutate(
      AEDECOD = .env$new_aedecod
    ) %>%
    dm_update_zoomed()

  res <- expect_silent(run(aet10_1, proc_data))
  expect_snapshot(res)
})
