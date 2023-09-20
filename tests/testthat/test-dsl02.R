# dsl02 ----

test_that("dsl02 works with adsl dataset", {
  expect_message(res <- run(dsl02, syn_data))
  expect_snapshot(cat(export_as_txt(res, lpp = 100)))
})

# dsl02 functions ----

test_that("dsl02 functions work as expected", {
  expect_message(
    res <- dsl02_pre(syn_data) %>%
      dsl02_main()
  )
  expect_snapshot(cat(export_as_txt(res, lpp = 100)))
})
