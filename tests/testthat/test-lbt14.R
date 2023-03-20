# lbt14_1 ----
test_that("lbt14_1 can handle all NA values", {
  proc_data <- syn_data %>%
    dm_zoom_to("adlb") %>%
    mutate(
      BTOXGR = NA_character_,
      ATOXGR = NA_character_
    ) %>%
    dm_update_zoomed()

  res <- expect_silent(run(lbt14_1, proc_data))
  expect_snapshot(res)
})

test_that("lbt14_1 can handle some NA values", {
  set.seed(1)
  new_btoxgr <- syn_data$adlb$BTOXGR
  new_btoxgr[sample(seq_along(new_btoxgr), 20)] <- NA
  new_atoxgr <- syn_data$adlb$ATOXGR
  new_atoxgr[sample(seq_along(new_atoxgr), 20)] <- NA

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

test_that("lbt14_1 can accept different gr_missing", {
  expect_snapshot(run(lbt14_1, syn_data, gr_missing = "incl"))
  expect_snapshot(run(lbt14_1, syn_data, gr_missing = "excl"))
  expect_snapshot(run(lbt14_1, syn_data, gr_missing = "gr_0"))
})

test_that("lbt14_1 fails on incomlete data", {
  syn_data <- syn_data %>%
    dm_zoom_to("adlb") %>%
    mutate(ATOXGR = NULL) %>%
    dm_update_zoomed()
  expect_error(run(lbt14_1, syn_data))
})

# lbt14_2 ----
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
  new_btoxgr[sample(seq_along(new_btoxgr), 20)] <- NA
  new_atoxgr <- syn_data$adlb$ATOXGR
  new_atoxgr[sample(seq_along(new_atoxgr), 20)] <- NA

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

test_that("lbt14_2 can accept different gr_missing", {
  expect_snapshot(run(lbt14_2, syn_data, gr_missing = "incl"))
  expect_snapshot(run(lbt14_2, syn_data, gr_missing = "excl"))
  expect_snapshot(run(lbt14_2, syn_data, gr_missing = "gr_0"))
})

test_that("lbt14_2 fails on incomlete data", {
  syn_data <- syn_data %>%
    dm_zoom_to("adlb") %>%
    mutate(ATOXGR = NULL) %>%
    dm_update_zoomed()
  expect_error(run(lbt14_2, syn_data))
})
