# aet01_1 ----

test_that("aet01 can handle all NA values", {

  proc_data <- syn_data %>%
    dm_zoom_to("adae") %>%
    mutate(
      AESDTH = NA,
      AESER = NA
    ) %>%
    dm_update_zoomed()

  res <- expect_silent(run(aet01_1, proc_data))
  expect_snapshot(res)
})

test_that("aet01 can handle some NA values", {

  new_aesdth <- c(NA, "", as.character(syn_data$adae$AESDTH[-c(1, 2)]))
  new_aeser <- c(NA, "", as.character(syn_data$adae$AESER[-c(1, 2)]))

  proc_data <- syn_data %>%
    dm_zoom_to("adae") %>%
    mutate(
      AESDTH = .env$new_aesdth,
      AESER = .env$new_aeser
    ) %>%
    dm_update_zoomed()

  res <- expect_silent(run(aet01_1, proc_data))
  expect_snapshot(res)
})
