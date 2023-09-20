# cml02a_gl ----

test_that("cml02a_gl works with adcm dataset", {
  expect_message(res <- run(cml02a_gl, syn_data))
  expect_snapshot(cat(export_as_txt(res, lpp = 100)))
})

test_that("cml02a_gl works with missing data", {
  proc_data <- syn_data
  proc_data$adcm$ATC2 <- NA_character_
  expect_message(res <- run(cml02a_gl, proc_data))
  expect_snapshot(cat(export_as_txt(res, lpp = 100)))
})

# cml02a_gl functions ----

test_that("cml02a_gl functions work as expected", {
  expect_message(
    res <- cml02a_gl_pre(syn_data) %>%
      cml02a_gl_main()
  )
  expect_snapshot(cat(export_as_txt(res, lpp = 100)))
})
