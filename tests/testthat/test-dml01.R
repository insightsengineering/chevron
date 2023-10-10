# dml01 ----

test_that("dml01 works with adsl dataset", {
  expect_message(res <- run(dml01, syn_data))
  expect_snapshot(cat(export_as_txt(res[1:50, ], lpp = 100)))
})

# dml01 functions ----

test_that("dml01 functions work as expected", {
  expect_message(
    res <- dml01_pre(syn_data) %>%
      dml01_main()
  )
  expect_snapshot(cat(export_as_txt(res[1:50, ], lpp = 100)))
})
