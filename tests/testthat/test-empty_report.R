# NULL report ----

test_that("tlg functions return null reports when domain table is empty", {
  dat_empty <- syn_data %>%
    dunlin::dm_explicit_na() %>%
    dm_filter(adsl = (USUBJID == ""))

  empty_report <- rtables::rtable(
    header = "",
    rrow("Null Report: No observations met the reporting criteria for inclusion in this output.")
  )

  empty_listing <- rlistings::as_listing(
    df = data.frame(x = formatters::with_label(
      "Null Report: No observations met the reporting criteria for inclusion in this output.", ""
    ))
  )

  rtables::table_inset(empty_report) <- 2L

  res <- run(aet01_1, dat_empty, prune_0 = TRUE)
  expect_identical(res, empty_report)

  res <- run(aet01_2, dat_empty, prune_0 = TRUE)
  expect_identical(res, empty_report)

  res <- run(aet01_aesi_1, dat_empty, prune_0 = TRUE)
  expect_identical(res, empty_report)

  res <- run(aet02_1, dat_empty)
  expect_identical(res, empty_report)

  res <- run(aet02_2, dat_empty)
  expect_identical(res, empty_report)

  res <- run(aet02_3, dat_empty)
  expect_identical(res, empty_report)

  res <- run(aet03_1, dat_empty)
  expect_identical(res, empty_report)

  res <- run(aet04_1, dat_empty)
  expect_identical(res, empty_report)

  res <- run(cmt01a_1, dat_empty)
  expect_identical(res, empty_report)

  res <- run(cmt01a_2, dat_empty)
  expect_identical(res, empty_report)

  res <- run(cmt01a_3, dat_empty)
  expect_identical(res, empty_report)

  res <- run(cmt02_pt_1, dat_empty)
  expect_identical(res, empty_report)

  res <- run(dmt01_1, dat_empty, summaryvars = c("Age (yo)" = "AGE"))
  expect_identical(res, empty_report)

  res <- run(dst01_1, dat_empty)
  expect_identical(res, empty_report)

  res <- run(dst01_2, dat_empty)
  expect_identical(res, empty_report)

  res <- run(dst01_3, dat_empty)
  expect_identical(res, empty_report)

  res <- run(dtht01_1, dat_empty)
  expect_identical(res, empty_report)

  res <- run(egt01_1, dat_empty)
  expect_identical(res, empty_report)

  res <- run(egt02_1, dat_empty)
  expect_identical(res, empty_report)

  res <- run(egt02_2, dat_empty)
  expect_identical(res, empty_report)

  res <- suppressWarnings(run(egt03_1, dat_empty))
  expect_identical(res, empty_report)

  res <- suppressWarnings(run(egt03_2, dat_empty))
  expect_identical(res, empty_report)

  res <- run(egt05_qtcat_1, dat_empty)
  expect_identical(res, empty_report)

  res <- run(ext01_1, dat_empty)
  expect_identical(res, empty_report)

  res <- run(ext01_2, dat_empty)
  expect_identical(res, empty_report)

  res <- run(lbt01_1, dat_empty)
  expect_identical(res, empty_report)

  res <- run(lbt05_1, dat_empty, prune_0 = TRUE)
  expect_identical(res, empty_report)

  res <- run(mht01_1, dat_empty)
  expect_identical(res, empty_report)

  res <- run(pdt01_1, dat_empty)
  expect_identical(res, empty_report)

  res <- run(vst01_1, dat_empty)
  expect_identical(res, empty_report)

  res <- run(vst01_1, dat_empty)
  expect_identical(res, empty_report)

  res <- run(vst02_1, dat_empty)
  expect_identical(res, empty_report)

  res <- run(vst02_2, dat_empty)
  expect_identical(res, empty_report)

  res <- run(ael01_nollt_1, dat_empty)
  expect_identical(res, empty_listing)
})
