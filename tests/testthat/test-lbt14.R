test_that("lbt14_1 can handle all NA values", {
  proc_data <- syn_data %>%
    dm_zoom_to("adlb") %>%
    mutate(
      BTOXGR = factor(NA),
      ATOXGR = factor(NA)
    ) %>%
    dm_update_zoomed()

  res <- expect_silent(run(lbt14_1, proc_data))
  expect_snapshot(res)
})

test_that("lbt14_1 can handle some NA values", {
  set.seed(1)
  new_btoxgr <- syn_data$adlb$BTOXGR
  new_btoxgr[sample(seq_along(length(new_btoxgr)), 20)] <- NA
  new_atoxgr <- syn_data$adlb$ATOXGR
  new_atoxgr[sample(seq_along(length(new_atoxgr)), 20)] <- NA

  proc_data <- syn_data %>%
    dm_zoom_to("adlb") %>%
    mutate(
      BTOXGR = factor(.env$new_btoxgr),
      ATOXGR = factor(.env$new_atoxgr)
    ) %>%
    dm_update_zoomed()

  res <- expect_silent(run(lbt14_1, proc_data))
  expect_snapshot(res)
})

test_that("lbt14_2 can handle all NA values", {
  proc_data <- syn_data %>%
    dm_zoom_to("adlb") %>%
    mutate(
      BTOXGR = factor(NA),
      ATOXGR = factor(NA)
    ) %>%
    dm_update_zoomed()

  res <- expect_silent(run(lbt14_2, proc_data))
  expect_snapshot(res)
})

test_that("lbt14_2 can handle some NA values", {
  set.seed(1)
  new_btoxgr <- syn_data$adlb$BTOXGR
  new_btoxgr[sample(seq_along(length(new_btoxgr)), 20)] <- NA
  new_atoxgr <- syn_data$adlb$ATOXGR
  new_atoxgr[sample(seq_along(length(new_atoxgr)), 20)] <- NA

  proc_data <- syn_data %>%
    dm_zoom_to("adlb") %>%
    mutate(
      BTOXGR = factor(.env$new_btoxgr),
      ATOXGR = factor(.env$new_atoxgr)
    ) %>%
    dm_update_zoomed()

  res <- expect_silent(run(lbt14_2, proc_data))
  expect_snapshot(res)
})
