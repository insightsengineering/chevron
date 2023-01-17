test_that("aet03 can handle all NA values", {
  proc_data <- syn_data %>%
    dm_zoom_to("adae") %>%
    mutate(
      AEBODSYS = NA,
      AEDECOD = NA
    ) %>%
    dm_update_zoomed()

  res1 <- expect_silent(run(aet03_1, proc_data))
  expect_snapshot(res1)

  intensity_grade <- c("MILD", "MODERATE", "SEVERE")
  res2 <- expect_silent(run(aet03_1, proc_data, intensity_grade = intensity_grade))
  expect_snapshot(res2)
})

test_that("aet03 can handle some NA values", {
  new_aebodsys <- c(NA, "", as.character(syn_data$adae$AEBODSYS[-c(1, 2)]))
  new_aedecod <- c(NA, "", as.character(syn_data$adae$AEDECOD[-c(1, 2)]))
  new_asev <- c(NA, "", as.character(syn_data$adae$ASEV[-c(1, 2)]))

  proc_data <- syn_data %>%
    dm_zoom_to("adae") %>%
    mutate(
      AEBODSYS = .env$new_aebodsys,
      AEDECOD = .env$new_aedecod,
      ASEV = .env$new_asev
    ) %>%
    dm_update_zoomed()

  res1 <- expect_silent(run(aet03_1, proc_data))
  expect_snapshot(res1)

  intensity_grade <- c("MILD", "MODERATE", "SEVERE")
  res2 <- expect_silent(run(aet03_1, proc_data, intensity_grade = intensity_grade))
  expect_snapshot(res2)

  intensity_grade <- c("MILD", "MODERATE", "SEVERE", "LIFE THREATENING")
  expect_error(run(aet03_1, proc_data, intensity_grade = intensity_grade))
})
