# ael03 ----

test_that("ael03 works with adae dataset", {
  res <- expect_silent(
    run(ael03, syn_data, dataset = "adae")
  )
  expect_snapshot(cat(export_as_txt(res[1:100, ], lpp = 100)))
})

test_that("ael03 can handle all missing values", {
  proc_data <- syn_data
  proc_data$adae <- proc_data$adae %>%
    mutate(
      AEDECOD = NA_character_,
      TRT01A = NA_character_,
      AESEV = NA_character_
    )

  res <- expect_silent(run(ael03, proc_data))
  expect_snapshot(cat(export_as_txt(res[1:100, ], lpp = 100)))
})

# ael03 functions ----

test_that("ael03 functions work as expected", {
  res <- expect_silent(
    ael03_pre(syn_data) %>%
      ael03_main() %>%
      ael03_post()
  )
  expect_snapshot(cat(export_as_txt(res[1:100, ], lpp = 100)))
})
