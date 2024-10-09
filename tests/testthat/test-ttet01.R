test_that("ttet01 works as expected", {
  filter_data <- dunlin::log_filter(syn_data, PARAMCD == "PFS", "adtte")
  pre_data <- expect_silent(ttet01_pre(filter_data, dataset = "adtte"))
  res <- expect_silent(ttet01_main(pre_data,
    dataset = "adtte",
    conf_type = "log-log",
    time_point = c(180, 360),
    method = "both"
  ))
  expect_snapshot(cat(export_as_txt(res, lpp = 100)))
})

test_that("ttet01 works as expected for stratified and unstratified analysis", {
  skip_on_os("windows")
  filter_data <- dunlin::log_filter(syn_data, PARAMCD == "PFS", "adtte")
  res <- expect_silent(run(ttet01, filter_data,
    summarize_event = FALSE,
    perform_analysis = "unstrat",
    conf_type = "log-log",
    time_point = c(6, 12),
    method = "both"
  ))
  expect_snapshot(cat(export_as_txt(res, lpp = 100)))
  res <- expect_silent(run(ttet01, filter_data,
    summarize_event = TRUE,
    perform_analysis = c("strat", "unstrat"),
    strata = c("STRATA1", "STRATA2"),
    conf_type = "log-log",
    time_point = c(6, 12),
    method = "both"
  ))
  expect_snapshot(cat(export_as_txt(res, lpp = 100)))
})

test_that("ttet01 works as expected for stratified analysis only", {
  skip_on_os("windows")
  filter_data <- dunlin::log_filter(syn_data, PARAMCD == "PFS", "adtte")
  res <- expect_silent(run(ttet01, filter_data,
    summarize_event = FALSE,
    perform_analysis = "strat",
    strata = c("STRATA1", "STRATA2"),
    conf_type = "log-log",
    time_point = c(6, 12),
    method = "both"
  ))
  expect_snapshot(cat(export_as_txt(res, lpp = 100)))
  res <- expect_silent(run(ttet01, filter_data,
    summarize_event = TRUE,
    perform_analysis = "strat",
    strata = c("STRATA1", "STRATA2"),
    conf_type = "log-log",
    time_point = c(6, 12),
    method = "both"
  ))
  expect_snapshot(cat(export_as_txt(res, lpp = 100)))
})

test_that("ttet01 works if change reference group", {
  skip_on_os("windows")
  filter_data <- dunlin::log_filter(syn_data, PARAMCD == "PFS", "adtte")
  res <- expect_silent(run(ttet01, filter_data,
    summarize_event = FALSE,
    ref_group = "B: Placebo",
    perform_analysis = "unstrat",
    conf_type = "log-log",
    time_point = c(6, 12),
    method = "both"
  ))
  expect_snapshot(cat(export_as_txt(res, lpp = 100)))
  res <- expect_silent(run(ttet01, filter_data,
    summarize_event = TRUE,
    ref_group = "B: Placebo",
    perform_analysis = c("strat", "unstrat"),
    strata = c("STRATA1", "STRATA2"),
    conf_type = "log-log",
    time_point = c(6, 12),
    method = "both"
  ))
  expect_snapshot(cat(export_as_txt(res, lpp = 100)))
})
