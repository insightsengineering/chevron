test_that("lbt07 can handle some NA values", {
  new_grade_dir <- c(NA, "", as.character(syn_data$adlb$ATOXGR[-c(1, 2)]))

  proc_data <- syn_data %>%
    dm_zoom_to("adlb") %>%
    mutate(
      GRADE_DIR = factor(.env$new_grade_dir),
    ) %>%
    dm_update_zoomed()

  res <- expect_silent(run(lbt07_1, proc_data))
  expect_snapshot(res)
})
