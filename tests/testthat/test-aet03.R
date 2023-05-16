test_that("aet03 can handle NA values", {
  proc_data <- syn_data
  proc_data$adae <- proc_data$adae %>%
    mutate(
      AEBODSYS = with_label(NA_character_, var_labels_for(syn_data$adae, "AEBODSYS")),
      AEDECOD = with_label(NA_character_, var_labels_for(syn_data$adae, "AEDECOD"))
    )

  res1 <- expect_silent(run(aet03, proc_data))
  expect_snapshot(cat(formatters::export_as_txt(res1, lpp = 100)))
})

test_that("aet03 can handle some NA values", {
  new_aebodsys <- c(NA, "", as.character(syn_data$adae$AEBODSYS[-c(1, 2)]))
  new_aedecod <- c(NA, "", as.character(syn_data$adae$AEDECOD[-c(1, 2)]))
  new_asev <- c(NA, "", as.character(syn_data$adae$ASEV[-c(1, 2)]))

  proc_data <- syn_data
  proc_data$adae <- proc_data$adae %>%
    mutate(
      AEBODSYS = with_label(.env$new_aebodsys, var_labels_for(syn_data$adae, "AEBODSYS")),
      AEDECOD = with_label(.env$new_aedecod, var_labels_for(syn_data$adae, "AEDECOD")),
      ASEV = .env$new_asev
    )

  res1 <- expect_silent(run(aet03, proc_data))
  expect_snapshot(cat(formatters::export_as_txt(res1, lpp = 100)))
})
