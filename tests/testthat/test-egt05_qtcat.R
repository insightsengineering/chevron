# egt05_qtcat functions ----

test_that("egt05_qtcat functions with default argument value return expected result with test data", {
  pre_data <- egt05_qtcat_pre(syn_data)
  raw_res <- egt05_qtcat_main(pre_data)
  res <- egt05_qtcat_post(raw_res)
  expect_snapshot(cat(export_as_txt(res, lpp = 100)))
})

# egt05_qtcat ----

test_that("egt05_qtcat erros on all NA values", {
  proc_data <- syn_data
  proc_data$adeg <- proc_data$adeg %>%
    mutate(
      AVISIT = NA_character_,
    )

  expect_error(run(egt05_qtcat, proc_data))
})

test_that("egt05_qtcat can handle some NA values", {
  proc_data <- syn_data
  proc_data$adeg <- proc_data$adeg %>%
    filter(PARAMCD == "QT")
  proc_data$adeg[1:2, c("AVALCAT1", "CHGCAT1")] <- NA
  res <- expect_silent(run(egt05_qtcat, proc_data))
  expect_snapshot(cat(export_as_txt(res, lpp = 100)))
})
