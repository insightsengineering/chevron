# ael04 ----

test_that("ael04 works with adsl dataset", {
  expect_message(
    res <- run(ael04, syn_data, dataset = "adsl")
  )
  expect_snapshot(cat(export_as_txt(res, lpp = 100)))
})

test_that("ael04 can handle all missing values", {
  proc_data <- syn_data
  proc_data$adsl <- proc_data$adsl %>%
    mutate(
      ACTARM = NA_character_,
      DTHCAUS = NA_character_
    )

  expect_message(res <- run(ael04, proc_data))
  expect_snapshot(cat(export_as_txt(res, lpp = 100)))
})

# ael04 functions ----

test_that("ael04 functions work as expected", {
  expect_message(res <-
    ael04_pre(syn_data) %>%
    ael04_main()
  )
  expect_snapshot(cat(export_as_txt(res, lpp = 100)))
})
