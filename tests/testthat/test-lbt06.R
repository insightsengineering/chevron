test_that("lbt06 gives all 0 count if ANRIND and BNRIND are all missing", {
  proc_data <- syn_data
  proc_data$adlb <- proc_data$adlb %>%
    mutate(
      ANRIND = NA_character_,
      BNRIND = NA_character_
    )
  df_pre <- lbt06_pre(proc_data)
  tlg <- lbt06_main(df_pre)
  res <- smart_prune(tlg)
  expect_identical(nrow(res), 0L)
})

test_that("lbt06 can handle some NA values", {
  skip_on_os("windows")
  proc_data <- syn_data
  proc_data$adlb[1:4, c("ANRIND", "BNRIND")] <- NA
  df_pre <- lbt06_pre(proc_data)
  tlg <- lbt06_main(df_pre)
  res <- lbt06_post(tlg, prune_0 = TRUE)
  expect_snapshot(cat(export_as_txt(res, lpp = 100)))
})

test_that("lbt06 fails on incomplete data", {
  skip_on_os("windows")
  proc_data <- syn_data
  proc_data$adlb <- proc_data$adlb %>%
    mutate(PARCAT2 = NULL)
  expect_error(lbt06_pre(proc_data))
})
