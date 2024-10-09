# ael03 ----

test_that("ael03 works with adae dataset", {
  skip_on_os("windows")
  res <- expect_silent(
    run(ael03, syn_data, dataset = "adae")
  )
  expect_list(res, len = 3)
  res <- lapply(res, "[", 1:10, )
  expect_snapshot(cat(export_as_txt(res, lpp = 100, cpp = 110)))
})

test_that("ael03 can handle all missing values", {
  proc_data <- syn_data
  proc_data$adae <- proc_data$adae %>%
    mutate(
      AEDECOD = NA_character_,
      ACTARM = NA_character_,
      ASEV = NA_character_
    )

  res <- expect_silent(run(ael03, proc_data))
  expect_list(res, len = 1)

  expect_snapshot(cat(export_as_txt(res[[1]][1:50, ], lpp = 100, cpp = 110)))
})

# ael03 functions ----

test_that("ael03 functions work as expected", {
  skip_on_os("windows")
  res <- expect_silent(
    ael03_pre(syn_data) %>%
      ael03_main()
  )

  expect_list(res, len = 3)
  res <- lapply(res, "[", 1:10, )
  expect_snapshot(cat(export_as_txt(res, lpp = 100, cpp = 110)))
})
