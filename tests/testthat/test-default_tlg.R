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

test_that("aet01_aesi_1 function with default argument value return expected result with test data", {
  pre_data <- aet01_aesi_1_pre(syn_data)
  raw_res <- aet01_aesi_1_main(pre_data)
  res <- aet01_aesi_post(raw_res)
  expect_snapshot(res)
})

test_that("ael01_nollt_1 function with default argument value return expected result with test data", {
  pre_data <- ael01_nollt_1_pre(syn_data)
  raw_res <- ael01_nollt_1_main(pre_data)
  res <- ael01_nollt_1_post(raw_res)
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

test_that("aet10_1 functions with default argument value return expected result with test data", {
  pre_data <- aet10_1_pre(syn_data)
  raw_res <- aet10_1_main(pre_data)
  res <- aet10_1_post(raw_res)
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
  # Simulate ADEX records with PARAMCD == "TDURD" as they are not in sample dataset.
  set.seed(1)
  proc_data <- syn_data
  proc_data$adex <- proc_data$adex %>%
    group_by(USUBJID) %>%
    mutate(
      id = seq_along(AVAL),
      AVAL = sample(x = seq(1, 200), size = n(), replace = TRUE)
    ) %>%
    ungroup() %>%
    mutate(
      PARAMCD = factor(case_when(id == 1 ~ "TDURD", TRUE ~ .data$PARAMCD)),
      AVALU = factor(case_when(PARAMCD == "TDURD" ~ "DAYS", TRUE ~ .data$AVALU))
    ) %>%
    filter(.data$PARAMCD == "TDURD")

  pre_data <- rmpt01_1_pre(proc_data)
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
