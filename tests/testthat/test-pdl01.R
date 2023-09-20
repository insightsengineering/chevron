# pdl01 ----

test_that("pdl01 works with adsl dataset", {
  proc_data <- syn_data
  proc_data$addv$DVSTDTC <- proc_data$addv$ASTDT
  expect_message(res <- run(pdl01, proc_data))
  expect_snapshot(cat(export_as_txt(res, lpp = 100)))
})

# pdl01 functions ----

test_that("pdl01 functions work as expected", {
  proc_data <- syn_data
  proc_data$addv$DVSTDTC <- proc_data$addv$ASTDT
  expect_message(
    res <- pdl01_pre(proc_data) %>%
      pdl01_main()
  )
  expect_snapshot(cat(export_as_txt(res, lpp = 100)))
})
