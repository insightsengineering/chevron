test_that("lbt08 can handle some missing values", {
  new_param <- c(NA, "", as.character(syn_data$adlb$PARAMCD[-c(1, 2)]))

  proc_data <- syn_data %>%
    dm_zoom_to("adlb") %>%
    mutate(
      PARAMCD = factor(.env$new_param),
    ) %>%
    dm_update_zoomed()

  res <- expect_silent(run(lbt08_1, proc_data))
  expect_snapshot(res)
})
