# fstg01 functions ----

test_that("fstg01 works as expected", {
  proc_data <- dunlin::log_filter(syn_data, PARAMCD == "BESRSPI" & ARM %in% c("A: Drug X", "B: Placebo"), "adrs")
  pre_data <- expect_silent(fstg01_pre(proc_data, dataset = "adrs", response = c("CR", "PR")))
  raw_res <- expect_silent(fstg01_main(pre_data, dataset = "adrs"))
  expect_class(raw_res, "gg")
})

# fstg01 ----

test_that("fstg01 works as expected with custom color set", {
  skip_on_os("windows")
  proc_data <- dunlin::log_filter(syn_data, PARAMCD == "BESRSPI" & ARM %in% c("A: Drug X", "B: Placebo"), "adrs")

  res1 <- expect_silent(run(fstg01, proc_data, response = c("CR", "PR"), dataset = "adrs", col = "gray"))
  expect_class(res1, "gg")

  res2 <- expect_silent(run(fstg01, proc_data, response = c("CR", "PR"), dataset = "adrs", col_symbol_size = NULL))
  expect_class(res2, "gg")
})

test_that("fstg01 works if changes are in subgroups, conf_level, and label_all", {
  skip_on_os("windows")
  proc_data <- dunlin::log_filter(syn_data, PARAMCD == "BESRSPI" & ARM %in% c("A: Drug X", "B: Placebo"), "adrs")

  res1 <- expect_silent(run(fstg01, proc_data, response = c("CR", "PR"), subgroups = NULL, dataset = "adrs"))
  expect_class(res1, "gg")

  res2 <- expect_silent(run(fstg01, proc_data,
    response = c("CR", "PR"), subgroups = c("SEX"),
    conf_level = 0.9, label_all = "All Patients", dataset = "adrs"
  ))
  expect_class(res2, "gg")
})

test_that("fstg01 can handle some NA values in subgroups", {
  skip_on_os("windows")
  proc_data <- dunlin::log_filter(syn_data, PARAMCD == "BESRSPI" & ARM %in% c("A: Drug X", "B: Placebo"), "adrs")
  proc_data$adrs[1:2, "SEX"] <- NA
  proc_data$adrs[3:4, "AGEGR1"] <- NA
  proc_data$adrs[5:6, "RACE"] <- NA

  res <- expect_silent(run(fstg01, proc_data, response = c("CR", "PR"), dataset = "adrs"))
  expect_class(res, "gg")
})
