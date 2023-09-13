# dml02 ----

test_that("dml02 works with adsl dataset", {
  proc_data <- syn_data
  proc_data$addv$DVSTDTC <- proc_data$addv$ASTDT
  expect_message(res <- run(dml02, proc_data))
  expect_snapshot(cat(export_as_txt(res, lpp = 100)))
})

# dml02 functions ----

test_that("dml02 functions work as expected", {
  proc_data <- syn_data
  proc_data$addv$DVSTDTC <- proc_data$addv$ASTD
  expect_message(
    res <- dml02_pre(proc_data) %>%
      dml02_main() %>%
      dml02_post()
  )
  expect_snapshot(cat(export_as_txt(res, lpp = 100)))
})
