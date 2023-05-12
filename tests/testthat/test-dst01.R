# NA values ----

test_that("dst01 create empty table on all NA values", {
  proc_data <- syn_data
  proc_data$adsl <- proc_data$adsl %>%
    mutate(
      EOSSTT = NA_character_,
      DCSREAS = NA_character_
    )

  expect_snapshot(run(dst01, proc_data, detail_vars = list()))
})

test_that("dst01 can handle all NA values in DCSREAS", {
  proc_data <- syn_data
  proc_data$adsl <- proc_data$adsl %>%
    mutate(
      DCSREAS = factor(NA_character_)
    )

  res <- expect_silent(run(dst01, proc_data, detail_vars = list()))
  expect_snapshot(res)
})

test_that("dst01 can handle some NA values", {
  proc_data <- syn_data
  proc_data$adsl[1:2, c("EOSSTT", "DCSREAS")] <- NA
  res <- expect_silent(run(dst01, proc_data))
  expect_snapshot(res)
})

test_that("dst01 can handle missing levels in status_var", {
  proc_data <- syn_data
  proc_data$adsl <- proc_data$adsl %>%
    mutate(
      EOSSTT = with_label(factor(.data$EOSSTT, levels = "ONGOING"), var_labels_for(syn_data$adsl, "EOSSTT")),
    )
  res <- expect_silent(run(dst01, proc_data, detail_vars = list()))
  expect_snapshot(res)
})

test_that("dst01 can create variants", {
  res <- expect_silent(run(dst01, syn_data, detail_vars = list(Ongoing = "STDONS", Discontinued = "DCSREAS")))
  expect_snapshot(res)
})

test_that("dst01 can create variants", {
  res <- expect_silent(run(dst01, syn_data, detail_vars = list(Discontinued = c("DCSREASGP", "DCSREAS"))))
  expect_snapshot(res)
})

test_that("dst01 can create variants", {
  res <- expect_silent(
    run(dst01, syn_data, detail_vars = list(Discontinued = c("DCSREASGP", "DCSREAS")), trt_status_var = "EOTSTT")
  )
  expect_snapshot(res)
})
