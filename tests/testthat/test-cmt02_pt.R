test_that("cmt02_pt_1 can handle all NA values", {
  data <- syn_test_data()

  proc_data <- data %>%
    dm_zoom_to("adcm") %>%
    mutate(
      CMSEQ = NA,
      CMDECOD = NA
    ) %>%
    dm_update_zoomed()

  res <- expect_silent(run(cmt02_pt_1, proc_data))
  expect_snapshot(res)
})

test_that("cmt02_pt_1 can handle some NA values", {
  data <- syn_test_data()

  new_cmseq <- c(NA, "", as.character(data$adcm$CMSEQ[-c(1, 2)]))
  new_cmdecod <- c(NA, "", as.character(data$adcm$CMDECOD[-c(1, 2)]))

  proc_data <- data %>%
    dm_zoom_to("adcm") %>%
    mutate(
      CMSEQ = .env$new_cmseq,
      CMDECOD = .env$new_cmdecod
    ) %>%
    dm_update_zoomed()

  res <- expect_silent(run(cmt02_pt_1, proc_data))
  expect_snapshot(res)
})
