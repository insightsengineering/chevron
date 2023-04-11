test_that("rmpt01 can handle NA values", {
  set.seed(1, kind = "Mersenne-Twister")
  new_adex <- syn_data$adex %>%
    distinct(USUBJID, .keep_all = TRUE) %>%
    mutate(
      PARAMCD = "TDURD"
    ) %>%
    bind_rows(syn_data$adex)

  proc_data <- syn_data %>%
    dm_zoom_to("adex") %>%
    mutate(
      AVAL = NA_character_,
      PARAMCD = .env$new_adex$PARAMCD,
    ) %>%
    dm_update_zoomed()

  res <- run(rmpt01_1, proc_data)
  expect_snapshot(res)
})

test_that("rmpt01 can handle some NA values", {
  set.seed(1, kind = "Mersenne-Twister")
  new_adex <- syn_data$adex %>%
    distinct(USUBJID, .keep_all = TRUE) %>%
    mutate(
      PARAMCD = "TDURD",
      AVAL = sample(x = seq(1, 200), size = n(), replace = TRUE)
    ) %>%
    bind_rows(syn_data$adex)

  new_aval <- c(NA, NA, new_adex$adex$AVAL[-c(1, 2)])

  proc_data <- syn_data %>%
    dm_zoom_to("adex") %>%
    mutate(
      AVAL = .env$new_aval,
      PARAMCD = .env$new_adex$PARAMCD
    ) %>%
    dm_update_zoomed()

  res <- expect_silent(run(rmpt01_1, proc_data))
  expect_snapshot(res)
})

test_that("rmpt01 fails on incomlete date", {
  syn_data <- syn_data %>%
    dm_zoom_to("adex") %>%
    mutate(
      PARAMCD = NULL,
      PARCAT2 = NULL,
      SAFFL = NULL
    ) %>%
    dm_update_zoomed()

  expect_error(run(rmpt01_1, syn_data))
})
