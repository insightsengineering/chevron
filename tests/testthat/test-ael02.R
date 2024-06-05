# ael02 ----

test_that("ael02 works with adae dataset", {
  res <- expect_silent(
    run(ael02, syn_data, dataset = "adae")
  )
  expect_list(res, len = 3)
  res <- lapply(res, "[", 1:10, )
  expect_snapshot(cat(export_as_txt(res, lpp = 100, cpp = 110)))
})

test_that("ael02 can handle all missing values", {
  proc_data <- syn_data
  proc_data$adae <- proc_data$adae %>%
    mutate(
      AEDECOD = NA_character_,
      ACTARM = NA_character_,
      ASEV = NA_character_
    )

  res <- expect_silent(run(ael02, proc_data))
  expect_list(res, len = 1)
  expect_snapshot(cat(export_as_txt(res[[1]][1:50, ], lpp = 100, cpp = 110)))
})

# ael02 functions ----


test_that("ael02 functions work as expected", {
  res <- expect_silent(
    ael02_pre(syn_data) %>%
      ael02_main()
  )

  expect_list(res, len = 3)
  res <- lapply(res, "[", 1:10, )
  expect_snapshot(cat(export_as_txt(res, lpp = 100, cpp = 110)))
})
