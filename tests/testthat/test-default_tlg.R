test_that("aet01_1 function with default argument value return expected result with test data", {
  pre_data <- aet01_1_pre(syn_data)
  raw_res <- aet01_1_main(pre_data)
  res <- aet01_post(raw_res)
  expect_snapshot(res)
})

test_that("aet01_2 functions with default argument value return expected result with test data", {
  pre_data <- aet01_2_pre(syn_data)
  raw_res <- aet01_2_main(pre_data)
  res <- aet01_post(raw_res)
  expect_snapshot(res)
})

test_that("aet02_1 functions with default argument value return expected result with test data", {
  pre_data <- aet02_1_pre(syn_data)
  raw_res <- aet02_1_main(pre_data)
  res <- aet02_1_post(raw_res)
  expect_snapshot(res)
})

test_that("aet02_2 functions with default argument value return expected result with test data", {
  pre_data <- aet02_2_pre(syn_data)
  raw_res <- aet02_2_main(pre_data)
  res <- aet02_2_post(raw_res)
  expect_snapshot(res)
})

test_that("aet02_3 functions with default argument value return expected result with test data", {
  pre_data <- aet02_3_pre(syn_data)
  raw_res <- aet02_3_main(pre_data)
  res <- aet02_3_post(raw_res)
  expect_snapshot(res)
})

test_that("aet03_1 functions with default argument value return expected result with test data", {
  pre_data <- aet03_1_pre(syn_data)
  raw_res <- aet03_1_main(pre_data)
  res <- aet03_1_post(raw_res)
  expect_snapshot(res)
})

test_that("aet04_1 functions with default argument value return expected result with test data", {
  pre_data <- aet04_1_pre(syn_data)
  raw_res <- aet04_1_main(pre_data)
  res <- aet04_1_post(raw_res)
  expect_snapshot(res)
})

test_that("cmt01a_1 functions with default argument value return expected result with test data", {
  pre_data <- cmt01a_1_pre(syn_data)
  raw_res <- cmt01a_1_main(pre_data)
  res <- cmt01a_1_post(raw_res)
  expect_snapshot(res)
})

test_that("cmt01a_2 functions with default argument value return expected result with test data", {
  pre_data <- cmt01a_2_pre(syn_data)
  raw_res <- cmt01a_2_main(pre_data)
  res <- cmt01a_2_post(raw_res)
  expect_snapshot(res)
})

test_that("cmt01a_3 functions with default argument value return expected result with test data", {
  pre_data <- cmt01a_3_pre(syn_data)
  raw_res <- cmt01a_3_main(pre_data)
  res <- cmt01a_3_post(raw_res)
  expect_snapshot(res)
})

test_that("cmt02_pt_1 functions with default argument value return expected result with test data", {
  pre_data <- cmt02_pt_1_pre(syn_data)
  raw_res <- cmt02_pt_1_main(pre_data)
  res <- cmt02_pt_1_post(raw_res)
  expect_snapshot(res)
})

test_that("dmt01_1 functions with default argument value return expected result with test data", {
  pre_data <- dmt01_1_pre(syn_data)
  raw_res <- dmt01_1_main(pre_data)
  res <- dmt01_1_post(raw_res)
  expect_snapshot(res)
})

test_that("dst01_1 functions with default argument value return expected result with test data", {
  pre_data <- dst01_1_pre(syn_data)
  raw_res <- dst01_1_main(pre_data)
  res <- dst01_1_post(raw_res)
  expect_snapshot(res)
})

test_that("dst01_2 functions with default argument value return expected result with test data", {
  pre_data <- dst01_2_pre(syn_data)
  raw_res <- dst01_2_main(pre_data)
  res <- dst01_2_post(raw_res)
  expect_snapshot(res)
})

test_that("dst01_3 functions with default argument value return expected result with test data", {
  pre_data <- dst01_3_pre(syn_data)
  raw_res <- dst01_3_main(pre_data)
  res <- dst01_3_post(raw_res)
  expect_snapshot(res)
})

test_that("dtht01_1 functions with default argument value return expected result with test data", {
  pre_data <- dtht01_1_pre(syn_data)
  raw_res <- dtht01_1_main(pre_data)
  res <- dtht01_1_post(raw_res)
  expect_snapshot(res)
})

test_that("gt01_1 functions with default argument value return expected result with test data", {
  pre_data <- egt01_1_pre(syn_data)
  raw_res <- egt01_1_main(pre_data)
  res <- egt01_1_post(raw_res)
  expect_snapshot(res)
})

test_that("egt02_1 functions with default argument value return expected result with test data", {
  pre_data <- egt02_1_pre(syn_data)
  raw_res <- egt02_1_main(pre_data)
  res <- egt02_1_post(raw_res)
  expect_snapshot(res)
})

test_that("egt02_2 functions with default argument value return expected result with test data", {
  pre_data <- egt02_2_pre(syn_data)
  raw_res <- egt02_2_main(pre_data)
  res <- egt02_2_post(raw_res)
  expect_snapshot(res)
})

test_that("ext01_1 functions with default argument value return expected result with test data", {
  pre_data <- ext01_1_pre(syn_data)
  raw_res <- ext01_1_main(pre_data)
  res <- ext01_1_post(raw_res)
  expect_snapshot(res)
})

test_that("ext01_2 functions with default argument value return expected result with test data", {
  pre_data <- ext01_2_pre(syn_data)
  raw_res <- ext01_2_main(pre_data)
  res <- ext01_2_post(raw_res)
  expect_snapshot(res)
})

test_that("lbt01_1 functions with default argument value return expected result with test data", {
  pre_data <- lbt01_1_pre(syn_data)
  raw_res <- lbt01_1_main(pre_data)
  res <- lbt01_1_post(raw_res)
  expect_snapshot(res)
})

test_that("lbt04_1 functions with default argument value return expected result with test data", {
  pre_data <- lbt04_1_pre(syn_data)
  raw_res <- lbt04_1_main(pre_data)
  res <- lbt04_1_post(raw_res)
  expect_snapshot(res)
})

test_that("mht01_1 functions with default argument value return expected result with test data", {
  pre_data <- mht01_1_pre(syn_data)
  raw_res <- mht01_1_main(pre_data)
  res <- mht01_1_post(raw_res)
  expect_snapshot(res)
})

test_that("vst01_1 functions with default argument value return expected result with test data", {
  pre_data <- vst01_1_pre(syn_data)
  raw_res <- vst01_1_main(pre_data)
  res <- vst01_1_post(raw_res)
  expect_snapshot(res)
})

test_that("vst01_1 functions with default argument value return expected result with test data", {
  pre_data <- vst01_1_pre(syn_data)
  raw_res <- vst01_1_main(pre_data)
  res <- vst01_1_post(raw_res)
  expect_snapshot(res)
})

test_that("vst02_1 functions with default argument value return expected result with test data", {
  pre_data <- vst02_1_pre(syn_data)
  raw_res <- vst02_1_main(pre_data)
  res <- vst02_1_post(raw_res)
  expect_snapshot(res)
})

test_that("vst02_2 functions with default argument value return expected result with test data", {
  pre_data <- vst02_2_pre(syn_data)
  raw_res <- vst02_2_main(pre_data)
  res <- vst02_2_post(raw_res)
  expect_snapshot(res)
})
