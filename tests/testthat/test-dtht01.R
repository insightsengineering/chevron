test_that("dtht01 can handle all NA values", {
  proc_data <- data %>%
    dm_zoom_to("adsl") %>%
    mutate(
      DTHCAT = NA,
      DTHCAUS = NA
    ) %>%
    dm_update_zoomed()

  res <- expect_silent(run(dtht01_1, proc_data, time_since_last_dose = TRUE, other_category = TRUE))
  expect_snapshot(res)
})

test_that("dtht01 can handle some NA values", {
  new_dthcat <- c(NA, "", as.character(data$adsl$DTHCAT[-c(1, 2)]))
  new_dthcaus <- c(NA, "", as.character(data$adsl$DTHCAUS[-c(1, 2)]))

  proc_data <- data %>%
    dm_zoom_to("adsl") %>%
    mutate(
      DTHCAT = .env$new_dthcat,
      DTHCAUS = .env$new_dthcaus
    ) %>%
    dm_update_zoomed()

  res <- expect_silent(run(dtht01_1, proc_data, time_since_last_dose = TRUE, other_category = TRUE))
  expect_snapshot(res)
})
