test_that("egt03_1 can handle all NA values", {
  proc_data <- syn_data %>%
    dm_zoom_to("adeg") %>%
    mutate(
      BNRIND = NA,
      ANRIND = NA,
    ) %>%
    dm_update_zoomed()

  res <- expect_silent(run(egt03_1, proc_data))
  expect_snapshot(res)
})

test_that("egt03_1 can handle some NA values", {
  new_bnrind <- c(NA, "", as.character(syn_data$adeg$BNRIND[-c(1, 2)]))
  new_anrind <- c(NA, "", as.character(syn_data$adeg$ANRIND[-c(1, 2)]))

  proc_data <- syn_data %>%
    dm_zoom_to("adeg") %>%
    mutate(
      BNRIND = .env$new_bnrind,
      ANRIND = .env$new_anrind
    ) %>%
    dm_update_zoomed()

  res <- expect_silent(run(egt03_1, proc_data))
  expect_snapshot(res)
})

test_that("egt03_2 can handle all NA values", {
  proc_data <- syn_data %>%
    dm_zoom_to("adeg") %>%
    mutate(
      BNRIND = NA,
      ANRIND = NA,
    ) %>%
    dm_update_zoomed()

  res <- expect_silent(run(egt03_2, proc_data))
  expect_snapshot(res)
})

test_that("egt03_2 can handle some NA values", {
  new_bnrind <- c(NA, "", as.character(syn_data$adeg$BNRIND[-c(1, 2)]))
  new_anrind <- c(NA, "", as.character(syn_data$adeg$ANRIND[-c(1, 2)]))

  proc_data <- syn_data %>%
    dm_zoom_to("adeg") %>%
    mutate(
      BNRIND = .env$new_bnrind,
      ANRIND = .env$new_anrind
    ) %>%
    dm_update_zoomed()

  res <- expect_silent(run(egt03_2, proc_data))
  expect_snapshot(res)
})
