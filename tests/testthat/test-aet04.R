test_that("aet04 can handle all NA values", {
  proc_data <- syn_data %>%
    dm_zoom_to("adae") %>%
    mutate(
      AEBODSYS = factor(NA),
      AEDECOD = factor(NA),
    ) %>%
    dm_update_zoomed()

  res <- expect_silent(run(aet04_1, proc_data))
  expect_snapshot(res)
})

test_that("aet04 can handle some NA values", {
  new_aebodsys <- c(NA, "", as.character(syn_data$adae$AEBODSYS[-c(1, 2)]))
  new_aedecod <- c(NA, "", as.character(syn_data$adae$AEDECOD[-c(1, 2)]))
  new_aetoxgr <- c(NA, "", as.character(syn_data$adae$AETOXGR[-c(1, 2)]))

  proc_data <- syn_data %>%
    dm_zoom_to("adae") %>%
    mutate(
      AEBODSYS = factor(.env$new_aebodsys),
      AEDECOD = factor(.env$new_aedecod),
      AETOXGR = factor(.env$new_aetoxgr)
    ) %>%
    dm_update_zoomed()

  res <- expect_silent(run(aet04_1, proc_data))
  expect_snapshot(res)
})
