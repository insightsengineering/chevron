# dsl01 ----

test_that("dsl01 works with adsl dataset", {
  expect_message(res <- run(dsl01, syn_data))
  expect_snapshot(cat(export_as_txt(res, lpp = 100)))
})

# dsl01 functions ----

test_that("dsl01 functions work as expected", {
  expect_message(
    res <- dsl01_pre(syn_data) %>%
      dsl01_main() %>%
      dsl01_post()
  )
  expect_snapshot(cat(export_as_txt(res, lpp = 100)))
})
