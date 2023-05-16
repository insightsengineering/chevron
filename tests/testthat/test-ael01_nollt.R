# ael01_nollt ----

test_that("ael01_nollt works with admh dataset", {
  res <- expect_silent(
    run(ael01_nollt, syn_data, dataset = "admh", key_cols = c("MHBODSYS", "MHDECOD"), disp_cols = "MHTERM")
  )
  expect_snapshot(cat(export_as_txt(res, lpp = 100)))
})

test_that("ael01_nollt works with non-default label", {
  proc_data <- syn_data
  attr(proc_data$adae$AETERM, "label") <- "Investigator-Specified\n Adverse Event Term"
  res <- expect_silent(
    run(
      ael01_nollt,
      syn_data
    )
  )
  expect_snapshot(cat(export_as_txt(res, lpp = 100)))
})

test_that("ael01_nollt can handle all missing values", {
  proc_data <- syn_data
  proc_data$adae <- proc_data$adae %>%
    mutate(
      AEBODSYS = with_label("", formatters::var_labels(syn_data$adae)[["AEBODSYS"]]),
      AEDECOD = with_label("", formatters::var_labels(syn_data$adae)[["AEDECOD"]]),
      AETERM = with_label("", formatters::var_labels(syn_data$adae)[["AETERM"]])
    )

  res <- expect_silent(run(ael01_nollt, proc_data))
  expect_snapshot(cat(export_as_txt(res, lpp = 100)))
})

test_that("ael01_nollt can handle some missing values", {
  new_aebodsys <- c(NA, "", as.character(syn_data$adae$AEBODSYS[-c(1, 2)]))
  new_aedecod <- c(NA, "", as.character(syn_data$adae$AEDECOD[-c(1, 2)]))

  proc_data <- syn_data
  proc_data$adae <- proc_data$adae %>%
    mutate(
      AEBODSYS = with_label(.env$new_aebodsys, formatters::var_labels(syn_data$adae)[["AEBODSYS"]]),
      AEDECOD = with_label(.env$new_aedecod, formatters::var_labels(syn_data$adae)[["AEDECOD"]])
    )

  res <- expect_silent(run(ael01_nollt, proc_data))
  expect_snapshot(cat(export_as_txt(res, lpp = 100)))
})
