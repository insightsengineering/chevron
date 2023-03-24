# aet02 ----

test_that("aet02 fails on incomplete data input", {
  syn_data <- syn_data %>%
    dm_zoom_to("adae") %>%
    mutate(
      AEDECOD = NULL
    ) %>%
    dm_update_zoomed()
  expect_error(
    run(aet02_1, syn_data),
    "AEDECOD not in adam_db"
  )
})

test_that("aet02 handle empty data input", {
  syn_data <- syn_data %>%
    dm_zoom_to("adae") %>%
    filter(
      AEDECOD == ""
    ) %>%
    dm_update_zoomed()
  expect_silent(run(aet02_1, syn_data))
})
