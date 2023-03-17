# aet01_aesi_1 ----

test_that("aet01_aesi can handle all NA values", {
  proc_data <- syn_data %>%
    dm_zoom_to("adae") %>%
    mutate(
      AETOXGR = factor(NA, levels = 1:5),
      ALL_RESOLVED = NA,
      NOT_RESOLVED = NA,
      AEACN = NA,
      AECONTRT = NA,
      AEREL = NA,
      AESER = NA
    ) %>%
    dm_update_zoomed()

  res <- expect_silent(run(aet01_aesi_1, proc_data))
  expect_snapshot(res)
  res <- expect_silent(run(aet01_aesi_1, proc_data, prune_0 = TRUE))
  expect_snapshot(res)
})

test_that("aet01_aesi can handle some NA values", {
  proc_data <- syn_data %>%
    dm_zoom_to("adae") %>%
    mutate(
      AEACN = c(NA, as.character(syn_data$adae$AEACN)[-1])
    ) %>%
    dm_update_zoomed()

  res <- expect_silent(run(aet01_aesi_1, proc_data))
  expect_snapshot(res)
})

test_that("aet01_aesi works with `ALL` argument", {
  res <- expect_silent(run(aet01_aesi_1, syn_data, aesi_vars = "ALL"))
  expect_snapshot(res)
})

test_that("aet01_aesi_1_check fails on incomplete data input", {
  syn_data <- syn_data %>%
    dm_zoom_to("adae") %>%
    mutate(AEOUT = NULL) %>%
    dm_update_zoomed()
  expect_error(
    run(aet01_aesi_1, syn_data, aesi_vars = "ALL"),
    "AEOUT not in adam_db"
  )
})