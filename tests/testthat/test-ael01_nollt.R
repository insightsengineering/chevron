# ael01_nollt_1 ----

test_that("ael01_nollt works with admh dataset", {
  res <- expect_silent(
    run(ael01_nollt_1, syn_data, dataset = "admh", key_cols = c("MHBODSYS", "MHDECOD"), disp_cols = "MHTERM")
  )
  expect_snapshot(res)
})

test_that("ael01_nollt works with non-default label", {
  res <- expect_silent(
    run(
      ael01_nollt_1,
      syn_data,
      new_lbls = list(AETERM = "Investigator-Specified\n Adverse Event Term")
    )
  )
  expect_snapshot(res)
})

test_that("ael01_nollt can handle all missing values", {
  proc_data <- syn_data %>%
    dm_zoom_to("adae") %>%
    mutate(
      AEBODSYS = formatters::with_label("", formatters::var_labels(syn_data$adae)[["AEBODSYS"]]),
      AEDECOD = formatters::with_label("", formatters::var_labels(syn_data$adae)[["AEDECOD"]]),
      AETERM = formatters::with_label("", formatters::var_labels(syn_data$adae)[["AETERM"]])
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
      AEBODSYS = formatters::with_label(.env$new_aebodsys, formatters::var_labels(syn_data$adae)[["AEBODSYS"]]),
      AEDECOD = formatters::with_label(.env$new_aedecod, formatters::var_labels(syn_data$adae)[["AEDECOD"]])
    ) %>%
    dm_update_zoomed()

  res <- expect_silent(run(ael01_nollt_1, proc_data))
  expect_snapshot(res)
})
