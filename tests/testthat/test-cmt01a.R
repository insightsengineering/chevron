test_that("cmt01a can handle all NA values", {
  proc_data <- syn_data %>%
    dm_zoom_to("adcm") %>%
    mutate(
      ATC2 = NA_character_,
      CMDECOD = NA_character_,
    ) %>%
    dm_update_zoomed()

  res <- expect_silent(run(cmt01a_1, proc_data))
  expect_snapshot(res)
})

test_that("cmt01a can handle some NA values", {
  new_atc2 <- c(NA, "", as.character(syn_data$adcm$ATC2[-c(1, 2)]))
  new_cmdecod <- c(NA, "", as.character(syn_data$adcm$CMDECOD[-c(1, 2)]))

  proc_data <- syn_data %>%
    dm_zoom_to("adcm") %>%
    mutate(
      ATC2 = .env$new_atc2,
      CMDECOD = .env$new_cmdecod
    ) %>%
    dm_update_zoomed()

  res <- expect_silent(run(cmt01a_1, proc_data))
  expect_snapshot(res)
})

test_that("cmt01a_2 can handle all NA values", {
  proc_data <- syn_data %>%
    dm_zoom_to("adcm") %>%
    mutate(
      ATC2 = NA,
      CMDECOD = NA,
    ) %>%
    dm_update_zoomed()

  res <- expect_silent(run(cmt01a_2, proc_data))
  expect_snapshot(res)
})

test_that("cmt01a_2 can handle some NA values", {
  new_atc2 <- c(NA, "", as.character(syn_data$adcm$ATC2[-c(1, 2)]))
  new_cmdecod <- c(NA, "", as.character(syn_data$adcm$CMDECOD[-c(1, 2)]))

  proc_data <- syn_data %>%
    dm_zoom_to("adcm") %>%
    mutate(
      ATC2 = .env$new_atc2,
      CMDECOD = .env$new_cmdecod
    ) %>%
    dm_update_zoomed()

  res <- expect_silent(run(cmt01a_2, proc_data))
  expect_snapshot(res)
})

test_that("cmt01a_3 can handle all NA values", {
  proc_data <- syn_data %>%
    dm_zoom_to("adcm") %>%
    mutate(
      ATC2 = NA,
      CMDECOD = NA,
    ) %>%
    dm_update_zoomed()

  res <- expect_silent(run(cmt01a_3, proc_data))
  expect_snapshot(res)
})

test_that("cmt01a_3 can handle some NA values", {
  new_atc2 <- c(NA, "", as.character(syn_data$adcm$ATC2[-c(1, 2)]))
  new_cmdecod <- c(NA, "", as.character(syn_data$adcm$CMDECOD[-c(1, 2)]))

  proc_data <- syn_data %>%
    dm_zoom_to("adcm") %>%
    mutate(
      ATC2 = .env$new_atc2,
      CMDECOD = .env$new_cmdecod
    ) %>%
    dm_update_zoomed()

  res <- expect_silent(run(cmt01a_3, proc_data))
  expect_snapshot(res)
})
