# egt05_qtcat_1 ----

test_that("egt05_qtcat can handle all NA values", {
  proc_data <- syn_data
  proc_data$adeg <- proc_data$adeg %>%
    mutate(
      AVISIT = NA_character_,
    )

  res <- expect_silent(run(egt05_qtcat_1, proc_data))
  expect_snapshot(res)
})

test_that("egt05_qtcat can handle some NA values", {
  proc_data <- syn_data
  proc_data$adeg <- proc_data$adeg %>%
    filter(PARAMCD == "QT")

  new_avisit <- c(NA_character_, NA_character_, as.character(proc_data$adeg$AVISIT[-c(1, 2)]))
  new_avalcat1 <- c(NA_character_, NA_character_, as.character(proc_data$adeg$AVALCAT1[-c(1, 2)]))
  new_chgcat1 <- c(NA_character_, NA_character_, as.character(proc_data$adeg$CHGCAT1[-c(1, 2)]))

  proc_data$adeg <- proc_data$adeg %>%
    mutate(
      AVISIT = factor(.env$new_avisit),
      AVALCAT1 = .env$new_avalcat1,
      CHGCAT1 = .env$new_chgcat1
    )

  res <- expect_silent(run(egt05_qtcat_1, proc_data))
  expect_snapshot(res)
})
