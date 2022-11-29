test_that("pdt01_1 can handle all NA values", {
  proc_data <- syn_data %>%
    dm_zoom_to("addv") %>%
    mutate(
      DVDECOD = NA,
      DVTERM = NA,
    ) %>%
    dm_update_zoomed()

  res <- expect_silent(run(pdt01_1, proc_data))
  expect_snapshot(res)
})

test_that("pdt01_1 can handle some NA values", {
  new_dvdecod <- c(NA, "", as.character(syn_data$addv$DVDECOD[-c(1, 2)]))
  new_dvterm <- c(NA, "", as.character(syn_data$addv$DVTERM[-c(1, 2)]))

  proc_data <- syn_data %>%
    dm_zoom_to("addv") %>%
    mutate(
      DVDECOD = .env$new_dvdecod,
      DVTERM = .env$new_dvterm
    ) %>%
    dm_update_zoomed()

  res <- expect_silent(run(pdt01_1, proc_data))
  expect_snapshot(res)
})
