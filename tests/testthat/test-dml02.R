# dml02 ----

test_that("dml02 works with adsl dataset", {
  expect_message(res <- run(dml02, syn_data))
  expect_snapshot(cat(export_as_txt(res[1:50, ], lpp = 100)))
})

# dml02 functions ----

test_that("dml02 functions work as expected", {
  expect_message(
    res <- dml02_pre(syn_data) %>%
      dml02_main()
  )
  expect_snapshot(cat(export_as_txt(res[1:50, ], lpp = 100)))
})
