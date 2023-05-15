# NULL report ----

test_that("tlg functions return null reports when domain table is empty", {
  dat_empty <- lapply(syn_data, tern::df_explicit_na) %>%
    lapply(filter, USUBJID == "")

  empty_report <- rtables::rtable(
    header = "",
    rrow("Null Report: No observations met the reporting criteria for inclusion in this output.")
  )

  empty_listing <- rlistings::as_listing(
    df = data.frame(x = with_label(
      "Null Report: No observations met the reporting criteria for inclusion in this output.", ""
    ))
  )

  rtables::table_inset(empty_report) <- 2L

  res <- run(aet01, dat_empty, prune_0 = TRUE)
  expect_identical(res, empty_report)

  res <- run(aet01_aesi, dat_empty, prune_0 = TRUE)
  expect_identical(res, empty_report)

  res <- run(aet02, dat_empty)
  expect_identical(res, empty_report)

  res <- run(aet03, dat_empty)
  expect_identical(res, empty_report)

  res <- run(aet04, dat_empty)
  expect_identical(res, empty_report)

  res <- run(cmt01a, dat_empty)
  expect_identical(res, empty_report)

  res <- run(cmt02_pt, dat_empty)
  expect_identical(res, empty_report)

  res <- run(dst01, dat_empty)
  expect_identical(res, empty_report)

  res <- run(dtht01, dat_empty)
  expect_identical(res, empty_report)

  res <- run(egt01_1, dat_empty)
  expect_identical(res, empty_report)

  res <- run(egt02, dat_empty)
  expect_identical(res, empty_report)

  res <- run(egt02, dat_empty, exclude_base_abn = TRUE)
  expect_identical(res, empty_report)

  res <- suppressWarnings(run(egt03, dat_empty))
  expect_identical(res, empty_report)

  res <- suppressWarnings(run(egt03, dat_empty, minmax = "max"))
  expect_identical(res, empty_report)

  res <- run(egt05_qtcat, dat_empty)
  expect_identical(res, empty_report)

  res <- run(ext01, dat_empty)
  expect_identical(res, empty_report)

  res <- run(ext01, dat_empty, summaryvars = c("AVAL", "AVALCAT1"))
  expect_identical(res, empty_report)

  res <- run(lbt01, dat_empty)
  expect_identical(res, empty_report)

  res <- run(lbt05, dat_empty, prune_0 = TRUE)
  expect_identical(res, empty_report)

  res <- run(mht01, dat_empty)
  expect_identical(res, empty_report)

  res <- run(pdt01, dat_empty)
  expect_identical(res, empty_report)

  res <- run(vst01, dat_empty)
  expect_identical(res, empty_report)

  res <- run(vst02, dat_empty)
  expect_identical(res, empty_report)

  res <- run(vst02, dat_empty, exclude_base_abn = TRUE)
  expect_identical(res, empty_report)

  res <- run(ael01_nollt, dat_empty)
  expect_identical(res, empty_listing)
})
