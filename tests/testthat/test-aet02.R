# aet02 ----

test_that("aet02_1 fails on incomplete data input", {
  proc_data <- syn_data %>%
    dm_zoom_to("adae") %>%
    mutate(
      AEDECOD = NULL
    ) %>%
    dm_update_zoomed()

  expect_error(
    run(aet02_1, proc_data),
    "AEDECOD not in adam_db"
  )
})

test_that("aet02_1 handle empty data input", {
  proc_data <- syn_data %>%
    dm_zoom_to("adae") %>%
    filter(
      AEDECOD == ""
    ) %>%
    dm_update_zoomed()

  expect_silent(run(aet02_1, proc_data))
})

test_that("aet02_1 can handle correct ordering", {
  new_aebodsys <- c("cl YZ.1", "cl YY.1", as.character(syn_data$adae$AEBODSYS[-c(1, 2)]))
  new_aedecod <- c("dcd YZ.1.1.1.1", "dcd YY.1.1.1.1", as.character(syn_data$adae$AEDECOD[-c(1, 2)]))

  proc_data <- syn_data %>%
    dm_zoom_to("adae") %>%
    mutate(
      AEBODSYS = .env$new_aebodsys,
      AEDECOD = .env$new_aedecod
    ) %>%
    dm_update_zoomed()

  res <- expect_silent(run(aet02_1, proc_data))
  expect_snapshot(res)
})

test_that("aet02_1 can handle NA values", {
  proc_data <- syn_data %>%
    dm_zoom_to("adae") %>%
    mutate(
      AEBODSYS = NA_character_,
      AEDECOD = NA_character_
    ) %>%
    dm_update_zoomed()

  res <- expect_silent(run(aet02_1, proc_data))
  expect_snapshot(res)
})

test_that("aet02_1 can handle some NA values", {
  new_aebodsys <- c(NA_character_, "", as.character(syn_data$adae$AEBODSYS[-c(1, 2)]))
  new_aedecod <- c(NA_character_, "", as.character(syn_data$adae$AEDECOD[-c(1, 2)]))

  proc_data <- syn_data %>%
    dm_zoom_to("adae") %>%
    mutate(
      AEBODSYS = .env$new_aebodsys,
      AEDECOD = .env$new_aedecod
    ) %>%
    dm_update_zoomed()

  res <- expect_silent(run(aet02_1, proc_data))
  expect_snapshot(res)
})

test_that("aet02_2 can handle NA values", {
  proc_data <- syn_data %>%
    dm_zoom_to("adae") %>%
    mutate(
      AEBODSYS = NA_character_,
      AEDECOD = NA_character_,
      AEHLT = NA_character_
    ) %>%
    dm_update_zoomed()

  res <- expect_silent(run(aet02_2, proc_data))
  expect_snapshot(res)
})

test_that("aet02_2 can handle some NA values", {
  new_aebodsys <- c(NA_character_, "", as.character(syn_data$adae$AEBODSYS[-c(1, 2)]))
  new_aedecod <- c(NA_character_, "", as.character(syn_data$adae$AEDECOD[-c(1, 2)]))
  new_aehlt <- c(NA_character_, "", as.character(syn_data$adae$AEHLT[-c(1, 2)]))

  proc_data <- syn_data %>%
    dm_zoom_to("adae") %>%
    mutate(
      AEBODSYS = .env$new_aebodsys,
      AEDECOD = .env$new_aedecod,
      AEHLT = .env$new_aehlt
    ) %>%
    dm_update_zoomed()

  res <- expect_silent(run(aet02_2, proc_data))
  expect_snapshot(res)
})

test_that("aet02_3 can handle NA values", {
  proc_data <- syn_data %>%
    dm_zoom_to("adae") %>%
    mutate(
      AEDECOD = NA_character_
    ) %>%
    dm_update_zoomed()

  res <- expect_silent(run(aet02_3, proc_data))
  expect_snapshot(res)
})

test_that("aet02_3 can handle some NA values", {
  new_aedecod <- c(NA_character_, "", as.character(syn_data$adae$AEDECOD[-c(1, 2)]))

  proc_data <- syn_data %>%
    dm_zoom_to("adae") %>%
    mutate(
      AEDECOD = .env$new_aedecod
    ) %>%
    dm_update_zoomed()

  res <- expect_silent(run(aet02_3, proc_data))
  expect_snapshot(res)
})
