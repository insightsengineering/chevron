# ael02 ----

test_that("ael02 works with adae dataset", {
  res <- expect_silent(
    run(ael02, syn_data, dataset = "adae")
  )
  expect_snapshot(cat(export_as_txt(res[1:100, ], lpp = 100)))
})

test_that("ael02 can handle all missing values", {
  proc_data <- syn_data
  proc_data$adae <- proc_data$adae %>%
    mutate(
      AEDECOD = NA_character_,
      TRT01A = NA_character_,
      AESEV = NA_character_
    )

  res <- expect_silent(run(ael02, proc_data))
  expect_snapshot(cat(export_as_txt(res[1:100, ], lpp = 100)))
})
