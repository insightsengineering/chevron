test_that("rspt01 works as expected", {
  filter_data <- dunlin::log_filter(syn_data, PARAMCD == "BESRSPI", "adrs")
  pre_data <- expect_silent(rspt01_pre(filter_data, dataset = "adrs"))
  res <- expect_silent(rspt01_main(pre_data, dataset = "adrs", methods = list(diff_pval_method = "fisher")))
  expect_snapshot(res)
})

test_that("rspt01 works as expected for stratified and unstratified analysis", {
  filter_data <- dunlin::log_filter(syn_data, PARAMCD == "BESRSPI", "adrs")
  res <- expect_silent(run(rspt01, filter_data,
    dataset = "adrs",
    odds_ratio = FALSE,
    perform_analysis = c("unstrat", "strat"),
    strata = c("STRATA1", "STRATA2"),
    methods = list(diff_pval_method = "fisher")
  ))
  expect_snapshot(res)
  res <- expect_silent(run(rspt01, filter_data,
    dataset = "adrs",
    odds_ratio = TRUE,
    perform_analysis = c("strat", "unstrat"),
    strata = c("STRATA1", "STRATA2"),
    methods = list(diff_pval_method = "fisher")
  ))
  expect_snapshot(res)
})

test_that("rspt01 works as expected for unstratified analysis only", {
  filter_data <- dunlin::log_filter(syn_data, PARAMCD == "BESRSPI", "adrs")
  res <- expect_silent(run(rspt01, filter_data,
    dataset = "adrs",
    odds_ratio = FALSE,
    perform_analysis = c("unstrat"),
    methods = list(diff_pval_method = "fisher")
  ))
  expect_snapshot(res)
  res <- expect_silent(run(rspt01, filter_data,
    dataset = "adrs",
    odds_ratio = TRUE,
    perform_analysis = c("unstrat"),
    methods = list(diff_pval_method = "fisher")
  ))
  expect_snapshot(res)
})

test_that("rspt01 works as expected for stratified analysis only", {
  filter_data <- dunlin::log_filter(syn_data, PARAMCD == "BESRSPI", "adrs")
  res <- expect_silent(run(rspt01, filter_data,
    dataset = "adrs",
    odds_ratio = FALSE,
    perform_analysis = c("strat"),
    strata = c("STRATA1", "STRATA2"),
    methods = list(diff_pval_method = "fisher")
  ))
  expect_snapshot(res)
  res <- expect_silent(run(rspt01, filter_data,
    dataset = "adrs",
    odds_ratio = TRUE,
    perform_analysis = c("strat"),
    strata = c("STRATA1", "STRATA2"),
    methods = list(diff_pval_method = "fisher")
  ))
  expect_snapshot(res)
})

test_that("rspt01 works if change reference group", {
  filter_data <- dunlin::log_filter(syn_data, PARAMCD == "BESRSPI", "adrs")
  res <- expect_silent(run(rspt01, filter_data,
    dataset = "adrs",
    odds_ratio = TRUE,
    ref_group = "B: Placebo",
    methods = list(diff_pval_method = "fisher")
  ))
  expect_snapshot(res)
  res <- expect_silent(run(rspt01, filter_data,
    dataset = "adrs",
    odds_ratio = TRUE,
    perform_analysis = c("unstrat", "strat"),
    strata = c("STRATA1", "STRATA2"),
    ref_group = "B: Placebo",
    methods = list(diff_pval_method = "fisher")
  ))
  expect_snapshot(res)
})

test_that("rspt01 works if change statistic methods", {
  filter_data <- dunlin::log_filter(syn_data, PARAMCD == "BESRSPI", "adrs")
  res <- expect_silent(run(rspt01, filter_data,
    dataset = "adrs",
    odds_ratio = TRUE,
    methods = list(
      prop_conf_method = "wald",
      diff_conf_method = "wald",
      diff_pval_method = "fisher"
    )
  ))
  expect_snapshot(res)
  res <- expect_silent(run(rspt01, filter_data,
    dataset = "adrs",
    odds_ratio = TRUE,
    perform_analysis = c("unstrat", "strat"),
    strata = c("STRATA1", "STRATA2"),
    methods = list(
      prop_conf_method = "wald",
      diff_conf_method = "wald",
      strat_diff_conf_method = "ha",
      diff_pval_method = "fisher",
      strat_diff_pval_method = "schouten"
    )
  ))
  expect_snapshot(res)
})


test_that("rspt01 works if change confidence interval", {
  filter_data <- dunlin::log_filter(syn_data, PARAMCD == "BESRSPI", "adrs")
  res <- expect_silent(run(rspt01, filter_data,
    dataset = "adrs",
    odds_ratio = TRUE,
    conf_level = 0.9,
    methods = list(diff_pval_method = "fisher")
  ))
  expect_snapshot(res)
  res <- expect_silent(run(rspt01, filter_data,
    dataset = "adrs",
    odds_ratio = TRUE,
    perform_analysis = c("unstrat", "strat"),
    strata = c("STRATA1", "STRATA2"),
    conf_level = 0.9,
    methods = list(diff_pval_method = "fisher")
  ))
  expect_snapshot(res)
})
