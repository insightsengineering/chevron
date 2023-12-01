test_that("aet05 can handle NA values", {
  proc_data <- syn_data
  proc_data$adsaftte$AVAL <- NA_real_
  proc_data$adsaftte$CNSR <- NA_real_

  res <- expect_silent(run(aet05, proc_data))
  expect_snapshot(cat(export_as_txt(res, lpp = 100)))
})

test_that("aet05 can handle some NA values", {
  new_paramcd <- c(
    as.character(syn_data$adsaftte$PARAMCD[1:4]), NA, "",
    as.character(syn_data$adsaftte$PARAMCD[-rep(1:6)])
  )

  proc_data <- syn_data

  proc_data$adsaftte <- proc_data$adsaftte %>%
    mutate(
      PARAMCD = with_label(.env$new_paramcd, var_labels_for(syn_data$adsaftte, "PARAMCD"))
    )

  res1 <- expect_silent(run(aet05, proc_data))
  expect_snapshot(cat(export_as_txt(res1, lpp = 100)))

  res2 <- expect_silent(run(aet05, proc_data, conf_level = 0.90, conf_type = "byar"))
  expect_snapshot(cat(export_as_txt(res2, lpp = 100)))
})
