# egt03_1 ----
test_that("egt03_1 can handle all NA values", {
  proc_data <- syn_data %>%
    dm_zoom_to("adeg") %>%
    mutate(
      BNRIND = NA_character_,
      ANRIND = NA_character_,
    ) %>%
    dm_update_zoomed()

  res <- expect_silent(run(egt03_1, proc_data))
  expect_snapshot(res)

  res <- expect_silent(run(egt03_1, proc_data, prune_0 = TRUE))
  expect_snapshot(res)
})

test_that("egt03_1 can handle some NA values", {
  new_bnrind <- c(NA_character_, "", as.character(syn_data$adeg$BNRIND[-c(1, 2)]))
  new_anrind <- c(NA_character_, "", as.character(syn_data$adeg$ANRIND[-c(1, 2)]))

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

# egt03_2 ----
test_that("egt03_2 can handle all NA values", {
  proc_data <- syn_data %>%
    dm_zoom_to("adeg") %>%
    mutate(
      BNRIND = NA_character_,
      ANRIND = NA_character_,
    ) %>%
    dm_update_zoomed()

  res <- expect_silent(run(egt03_2, proc_data))
  expect_snapshot(res)
})

test_that("egt03_2 can handle some NA values", {
  new_bnrind <- c(NA_character_, "", as.character(syn_data$adeg$BNRIND[-c(1, 2)]))
  new_anrind <- c(NA_character_, "", as.character(syn_data$adeg$ANRIND[-c(1, 2)]))

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

# egt03 checks ----

test_that("egt03_1 fails on incomplete data", {
  syn_data <- syn_data %>%
    dm_zoom_to("adeg") %>%
    mutate(PARAMCD = NULL) %>%
    dm_update_zoomed()
  expect_error(
    run(egt03_1, syn_data)
  )
})