test_that("cmt02_pt_1 can handle all NA values", {
  proc_data <- syn_data
  proc_data$adcm <- proc_data$adcm %>%
    mutate(
      CMSEQ = NA_character_,
      CMDECOD = NA_character_
    )

  res <- expect_silent(run(cmt02_pt_1, proc_data))
  expect_snapshot(res)
})

test_that("cmt02_pt_1 can handle some NA values", {
  new_cmseq <- c(NA, "", as.character(syn_data$adcm$CMSEQ[-c(1, 2)]))
  new_cmdecod <- c(NA, "", as.character(syn_data$adcm$CMDECOD[-c(1, 2)]))

  proc_data <- syn_data
  proc_data$adcm <- proc_data$adcm %>%
    mutate(
      CMSEQ = .env$new_cmseq,
      CMDECOD = .env$new_cmdecod
    )

  res <- expect_silent(run(cmt02_pt_1, proc_data))
  expect_snapshot(res)
})
