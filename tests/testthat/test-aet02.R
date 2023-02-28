test_that("aet02_1 can handle NA values", {
  proc_data <- syn_data %>%
    dm_zoom_to("adae") %>%
    mutate(
      AEBODSYS = factor(NA),
      AEDECOD = factor(NA)
    ) %>%
    dm_update_zoomed()

  res <- expect_silent(run(aet02_1, proc_data))
  expect_snapshot(res)
})

test_that("aet02_1 can handle some NA values", {
  new_aebodsys <- c(NA, "", as.character(syn_data$adae$AEBODSYS[-c(1, 2)]))
  new_aedecod <- c(NA, "", as.character(syn_data$adae$AEDECOD[-c(1, 2)]))

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
      AEBODSYS = factor(NA),
      AEDECOD = factor(NA),
      AEHLT = factor(NA)
    ) %>%
    dm_update_zoomed()

  res <- expect_silent(run(aet02_2, proc_data))
  expect_snapshot(res)
})

test_that("aet02_2 can handle some NA values", {
  new_aebodsys <- c(NA, "", as.character(syn_data$adae$AEBODSYS[-c(1, 2)]))
  new_aedecod <- c(NA, "", as.character(syn_data$adae$AEDECOD[-c(1, 2)]))
  new_aehlt <- c(NA, "", as.character(syn_data$adae$AEHLT[-c(1, 2)]))

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
      AEDECOD = factor(NA)
    ) %>%
    dm_update_zoomed()

  res <- expect_silent(run(aet02_3, proc_data))
  expect_snapshot(res)
})

test_that("aet02_3 can handle some NA values", {
  new_aedecod <- c(NA, "", as.character(syn_data$adae$AEDECOD[-c(1, 2)]))

  proc_data <- syn_data %>%
    dm_zoom_to("adae") %>%
    mutate(
      AEDECOD = .env$new_aedecod
    ) %>%
    dm_update_zoomed()

  res <- expect_silent(run(aet02_3, proc_data))
  expect_snapshot(res)
})
