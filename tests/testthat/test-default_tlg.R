test_that("ael01_nollt function with default argument value return expected result with test data", {
  pre_data <- ael01_nollt_pre(syn_data)
  raw_res <- ael01_nollt_main(pre_data)
  res <- ael01_nollt_post(raw_res)
  expect_snapshot(res)
})

test_that("aet01 function with default argument value return expected result with test data", {
  pre_data <- aet01_pre(syn_data)
  raw_res <- aet01_main(pre_data)
  res <- aet01_post(raw_res)
  expect_snapshot(res)
})

test_that("aet01_aesi function with default argument value return expected result with test data", {
  pre_data <- aet01_aesi_pre(syn_data)
  raw_res <- aet01_aesi_main(pre_data)
  res <- aet01_aesi_post(raw_res)
  expect_snapshot(res)
})

test_that("aet02 functions with default argument value return expected result with test data", {
  pre_data <- aet02_pre(syn_data)
  raw_res <- aet02_main(pre_data)
  res <- aet02_post(raw_res)
  expect_snapshot(res)
})

test_that("aet03 functions with default argument value return expected result with test data", {
  pre_data <- aet03_pre(syn_data)
  raw_res <- aet03_main(pre_data)
  res <- aet03_post(raw_res)
  expect_snapshot(res)
})

test_that("aet04 functions with default argument value return expected result with test data", {
  pre_data <- aet04_pre(syn_data)
  raw_res <- aet04_main(pre_data)
  res <- aet04_post(raw_res)
  expect_snapshot(res)
})

test_that("aet10 functions with default argument value return expected result with test data", {
  pre_data <- aet10_pre(syn_data)
  raw_res <- aet10_main(pre_data)
  res <- aet10_post(raw_res)
  expect_snapshot(res)
})

test_that("cmt01a_1 functions with default argument value return expected result with test data", {
  pre_data <- cmt01a_pre(syn_data)
  raw_res <- cmt01a_main(pre_data)
  res <- cmt01a_post(raw_res)
  expect_snapshot(res)
})

test_that("cmt02_pt functions with default argument value return expected result with test data", {
  pre_data <- cmt02_pt_pre(syn_data)
  raw_res <- cmt02_pt_main(pre_data)
  res <- cmt02_pt_post(raw_res)
  expect_snapshot(res)
})

test_that("coxt02 functions with default argument value return expected result with test data", {
  proc_data <- dunlin::log_filter(syn_data, PARAMCD == "CRSD", "adtte")
  pre_data <- coxt02_pre(proc_data)
  raw_res <- coxt02_main(pre_data)
  res <- coxt02_post(raw_res)
  expect_snapshot(res)
})

test_that("dmt01 functions with default argument value return expected result with test data", {
  pre_data <- dmt01_pre(syn_data)
  raw_res <- dmt01_main(pre_data)
  res <- dmt01_post(raw_res)
  expect_snapshot(res)
})

test_that("dst01 functions with default argument value return expected result with test data", {
  pre_data <- dst01_pre(syn_data)
  raw_res <- dst01_main(pre_data)
  res <- dst01_post(raw_res)
  expect_snapshot(res)
})

test_that("dtht01 functions with default argument value return expected result with test data", {
  pre_data <- dtht01_pre(syn_data)
  raw_res <- dtht01_main(pre_data)
  res <- dtht01_post(raw_res)
  expect_snapshot(res)
})

test_that("egt01_1 functions with default argument value return expected result with test data", {
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

test_that("egt03_1 functions with default argument value return expected result with test data", {
  pre_data <- egt03_1_pre(syn_data)
  raw_res <- egt03_1_main(pre_data)
  res <- egt03_1_post(raw_res)
  expect_snapshot(res)
})

test_that("egt03_2 functions with default argument value return expected result with test data", {
  pre_data <- egt03_2_pre(syn_data)
  raw_res <- egt03_2_main(pre_data)
  res <- egt03_2_post(raw_res)
  expect_snapshot(res)
})

test_that("egt05_qtcat_1 functions with default argument value return expected result with test data", {
  pre_data <- egt05_qtcat_1_pre(syn_data)
  raw_res <- egt05_qtcat_1_main(pre_data)
  res <- egt05_qtcat_1_post(raw_res)
  expect_snapshot(res)
})

test_that("ext01_1 functions with default argument value return expected result with test data", {
  pre_data <- ext01_1_pre(syn_data)
  raw_res <- ext01_1_main(pre_data)
  res <- ext01_1_post(raw_res)
  expect_snapshot(res)
})

test_that("ext01_2 functions with default argument value return expected result with test data", {
  proc_data <- dunlin::log_filter(syn_data, PARAMCD == "TDOSE", "adex")
  pre_data <- ext01_2_pre(proc_data)
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

test_that("lbt05_1 functions with default argument value return expected result with test data", {
  pre_data <- lbt05_1_pre(syn_data)
  raw_res <- lbt05_1_main(pre_data)
  res <- lbt05_1_post(raw_res)
  expect_snapshot(res)
})

test_that("lbt07_1 functions with default argument value return expected result with test data", {
  pre_data <- lbt07_1_pre(syn_data)
  raw_res <- lbt07_1_main(pre_data)
  res <- lbt07_1_post(raw_res)
  expect_snapshot(res)
})

test_that("lbt14_1 functions with default argument value return expected result with test data", {
  pre_data <- lbt14_1_pre(syn_data)
  raw_res <- lbt14_1_main(pre_data)
  res <- lbt14_1_post(raw_res)
  expect_snapshot(res)
})

test_that("lbt14_2 functions with default argument value return expected result with test data", {
  pre_data <- lbt14_2_pre(syn_data)
  raw_res <- lbt14_2_main(pre_data)
  res <- lbt14_2_post(raw_res)
  expect_snapshot(res)
})

test_that("mht01_1 functions with default argument value return expected result with test data", {
  pre_data <- mht01_1_pre(syn_data)
  raw_res <- mht01_1_main(pre_data)
  res <- mht01_1_post(raw_res)
  expect_snapshot(res)
})

test_that("pdt01_1 function with default argument value return expected result with test data", {
  pre_data <- pdt01_1_pre(syn_data)
  raw_res <- pdt01_1_main(pre_data)
  res <- pdt01_1_post(raw_res)
  expect_snapshot(res)
})

test_that("pdt02_1 function with default argument value return expected result with test data", {
  pre_data <- pdt02_1_pre(syn_data)
  raw_res <- pdt02_1_main(pre_data)
  res <- pdt02_1_post(raw_res)
  expect_snapshot(res)
})

test_that("rmpt01_1 function with default argument value return expected result with test data", {
  pre_data <- rmpt01_1_pre(syn_data)
  raw_res <- rmpt01_1_main(pre_data)
  res <- rmpt01_1_post(raw_res)
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
