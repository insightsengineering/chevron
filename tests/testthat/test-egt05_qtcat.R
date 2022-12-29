# egt05_qtcat_1 ----
test_that("egt05_qtcat can handle all NA values", {
  proc_data <- syn_data %>%
    dm_zoom_to("adeg") %>%
    mutate(
      AVISIT = factor(NA),
    ) %>%
    dm_update_zoomed()

  res <- expect_silent(run(egt05_qtcat_1, proc_data))
  expect_snapshot(res)
})

test_that("egt05_qtcat can handle some NA values", {
  new_avisit <- c(NA, "", as.character(syn_data$adeg$AVISIT[-c(1, 2)]))
  new_aval <- c(NA, "", as.character(syn_data$adeg$AVAL[-c(1, 2)]))
  new_chg <- c(NA, "", as.character(syn_data$adeg$CHG[-c(1, 2)]))

  proc_data <- syn_data %>%
    dm_zoom_to("adeg") %>%
    mutate(
      AVISIT = .env$new_avisit,
      AVAL = .env$new_aval,
      CHG = .env$new_chg
    ) %>%
    dm_update_zoomed()

  res <- expect_silent(run(egt05_qtcat_1, proc_data))
  expect_snapshot(res)
})
