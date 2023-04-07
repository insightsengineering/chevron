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
  res <- expect_silent(run(aet01_1, proc_data, prune_0 = TRUE))
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

test_that("aet01 can use custom lbl_safety_var", {
  res <- expect_silent(run(aet01_1, syn_data, safety_var = list("FATAL"), lbl_safety_var = list("Fatal AE")))
  expect_snapshot(res)
})

test_that("aet01 fails on incomplete data input", {
  syn_data <- syn_data %>%
    dm_zoom_to("adae") %>%
    mutate(AESER = NULL) %>%
    dm_update_zoomed()
  expect_error(
    run(aet01_1, syn_data),
    "AESER not in adam_db"
  )
})
# aet01_2 ----
test_that("aet01_2 can use custom medconcept_var", {
  res <- expect_silent(run(aet01_2, syn_data, medconcept_var = list("SMQ01"), lbl_medconcept_var = list("SMQ 01")))
  expect_snapshot(res)
})
