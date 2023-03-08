test_that("pdt02_1 can handle all NA values", {
  proc_data <- syn_data %>%
    dm_zoom_to("addv") %>%
    mutate(
      DVREAS = NA_character_,
      DVTERM = NA_character_,
    ) %>%
    dm_update_zoomed()

  res <- expect_silent(run(pdt02_1, proc_data))
  expect_snapshot(res)
})

test_that("pdt02_1 can handle some NA values", {
  new_dvreas <- c(NA_character_, "", as.character(syn_data$addv$DVREAS[-c(1, 2)]))
  new_dvterm <- c(NA_character_, "", as.character(syn_data$addv$DVTERM[-c(1, 2)]))

  proc_data <- syn_data %>%
    dm_zoom_to("addv") %>%
    mutate(
      DVREAS = new_dvreas,
      DVTERM = new_dvterm
    ) %>%
    dm_update_zoomed()

  res <- expect_silent(run(pdt02_1, proc_data))
  expect_snapshot(res)
})
