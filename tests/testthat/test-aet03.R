test_that("aet03 can handle all NA values", {
  data <- syn_test_data()

  proc_data <- data %>%
    dm_zoom_to("adae") %>%
    mutate(
      AEBODSYS = NA,
      AEDECOD = NA,
      AESEV = NA
    ) %>%
    dm_update_zoomed()

  res <- expect_silent(run(aet03_1, proc_data))
  expect_snapshot(res)
})

test_that("aet03 can handle some NA values", {
  data <- syn_test_data()

  new_aebodsys <- c(NA, "", as.character(data$adae$AEBODSYS[-c(1, 2)]))
  new_aedecod <- c(NA, "", as.character(data$adae$AEDECOD[-c(1, 2)]))
  new_aesev <- c(NA, "", as.character(data$adae$AESEV[-c(1, 2)]))

  proc_data <- data %>%
    dm_zoom_to("adae") %>%
    mutate(
      AEBODSYS = .env$new_aebodsys,
      AEDECOD = .env$new_aedecod,
      AESEV = .env$new_aesev
    ) %>%
    dm_update_zoomed()

  res <- expect_silent(run(aet03_1, proc_data))
  expect_snapshot(res)
})
