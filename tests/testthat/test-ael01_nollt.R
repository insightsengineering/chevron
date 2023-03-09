# ael01_nollt_1 ----

test_that("ael01_nollt works with admh dataset", {
  res <- expect_silent(run(ael01_nollt_1, syn_data, dataset = "admh"))
  expect_snapshot(res)
})

test_that("ael01_nollt can handle all missing values", {
  proc_data <- syn_data %>%
    dm_zoom_to("adae") %>%
    mutate(
      AEBODSYS = "",
      AEDECOD = "",
      AETERM = ""
    ) %>%
    dm_update_zoomed()

  res <- expect_silent(run(ael01_nollt_1, proc_data))
  expect_snapshot(res)
})

test_that("ael01_nollt can handle some missing values", {
  new_aebodsys <- c(NA, "", as.character(syn_data$adae$AEBODSYS[-c(1, 2)]))
  new_aedecod <- c(NA, "", as.character(syn_data$adae$AEDECOD[-c(1, 2)]))

  proc_data <- syn_data %>%
    dm_zoom_to("adae") %>%
    mutate(
      AEBODSYS = .env$new_aebodsys,
      AEDECOD = .env$new_aedecod
    ) %>%
    dm_update_zoomed()

  res <- expect_silent(run(ael01_nollt_1, proc_data))
  expect_snapshot(res)
})
