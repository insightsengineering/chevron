# ext01_1 ----
test_that("ext01 works", {
  tlg <- expect_silent(run(ext01_1, syn_data))
  expect_snapshot(tlg)

  tlg <- expect_silent(run(ext01_1, syn_data, prune_0 = FALSE))
  expect_snapshot(tlg)
})

# ext02_1 ----
test_that("ext02_1 works for selected parameters", {
  syn_data <- syn_data %>%
    dm_zoom_to("adex") %>%
    filter(PARAMCD == "TDOSE") %>%
    dm_update_zoomed()
  expect_snapshot(run(ext01_2, syn_data, prune_0 = TRUE))
})
