test_that("TLG function with default argument value return expected result with test data", {
  data <- syn_test_data()

  res <- run(aet01_1, data)
  expect_snapshot(res)

  res <- run(aet01_2, data)
  expect_snapshot(res)

  res <- run(aet02_1, data)
  expect_snapshot(res)

  res <- run(aet02_2, data)
  expect_snapshot(res)

  res <- run(aet02_3, data)
  expect_snapshot(res)

  res <- run(aet03_1, data)
  expect_snapshot(res)

  res <- run(aet04_1, data)
  expect_snapshot(res)

  res <- run(cmt01a_1, data)
  expect_snapshot(res)

  res <- run(cmt01a_2, data)
  expect_snapshot(res)

  res <- run(cmt01a_3, data)
  expect_snapshot(res)

  res <- run(cmt02_pt_1, data)
  expect_snapshot(res)

  res <- run(dmt01_1, data)
  expect_snapshot(res)

  res <- run(dst01_1, data)
  expect_snapshot(res)

  res <- run(dst01_2, data)
  expect_snapshot(res)

  res <- run(dst01_3, data)
  expect_snapshot(res)

  res <- run(dtht01_1, data)
  expect_snapshot(res)

  res <- run(egt01_1, data)
  expect_snapshot(res)

  res <- run(egt02_1, data)
  expect_snapshot(res)

  res <- run(egt02_2, data)
  expect_snapshot(res)

  res <- run(ext01_1, data)
  expect_snapshot(res)

  res <- run(ext01_2, data)
  expect_snapshot(res)

  res <- run(lbt01_1, data)
  expect_snapshot(res)

  res <- run(mht01_1, data)
  expect_snapshot(res)

  res <- run(vst01_1, data)
  expect_snapshot(res)

  res <- run(vst01_1, data)
  expect_snapshot(res)

  res <- run(vst02_1, data)
  expect_snapshot(res)

  res <- run(vst02_2, data)
  expect_snapshot(res)
})
