test_that("cmt01a can handle all NA values", {
  proc_data <- syn_data
  proc_data$adcm <- proc_data$adcm %>%
    mutate(
      ATC2 = with_label(NA_character_, var_labels_for(syn_data$adcm, "ATC2")),
      CMDECOD = with_label(NA_character_, var_labels_for(syn_data$adcm, "CMDECOD"))
    )

  res <- expect_silent(run(cmt01a, proc_data))
  expect_snapshot(cat(formatters::export_as_txt(res, lpp = 100)))
})

test_that("cmt01a can handle some NA values", {
  proc_data <- syn_data
  proc_data$adcm$ATC2[1:2] <- NA
  proc_data$adcm$CMDECOD[1:2] <- NA
  res <- expect_silent(run(cmt01a, proc_data))
  expect_snapshot(cat(formatters::export_as_txt(res, lpp = 100)))
})
