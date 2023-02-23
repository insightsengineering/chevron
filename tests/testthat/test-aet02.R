test_that("aet02_1 can handle NA values", {
  proc_data <- syn_data %>%
    dm_zoom_to("adae") %>%
    mutate(
      AEBODSYS = factor(NA),
      AEDECOD = factor(NA)
    ) %>%
    dm_update_zoomed()

  res <- expect_silent(run(aet02_1, proc_data))
  expect_snapshot(res)
})

test_that("aet02_2 can handle NA values", {
  proc_data <- syn_data %>%
    dm_zoom_to("adae") %>%
    mutate(
      AEBODSYS = factor(NA),
      AEDECOD = factor(NA),
      AEHLT = factor(NA)
    ) %>%
    dm_update_zoomed()

  res <- expect_silent(run(aet02_2, proc_data))
  expect_snapshot(res)
})

test_that("aet02_3 can handle NA values", {
  proc_data <- syn_data %>%
    dm_zoom_to("adae") %>%
    mutate(
      DOMAIN = factor(NA),
      AEDECOD = factor(NA)
    ) %>%
    dm_update_zoomed()

  res <- expect_silent(run(aet02_3, proc_data))
  expect_snapshot(res)
})
