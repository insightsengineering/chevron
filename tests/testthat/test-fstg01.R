# fstg01 functions ----

test_that("fstg01 works as expected", {
  proc_data <- log_filter(syn_data, PARAMCD == "OVRINV" & ARM %in% c("A: Drug X", "B: Placebo"), "adrs")
  proc_data$adrs$ARM <- droplevels(proc_data$adrs$ARM)

  pre_data <- expect_silent(fstg01_pre(proc_data, dataset = "adrs", response = c("CR", "PR")))
  raw_res <- expect_silent(fstg01_main(pre_data, dataset = "adrs"))
  checkmate::assert_true(grid::is.grob(raw_res))
})

# fstg01 ----

test_that("fstg01 works as expected with custom color set", {
  proc_data <- log_filter(syn_data, PARAMCD == "BESRSPI" & ARM %in% c("A: Drug X", "B: Placebo"), "adrs")
  proc_data$adrs$ARM <- droplevels(proc_data$adrs$ARM)

  res1 <- expect_silent(run(fstg01, proc_data, response = c("CR", "PR"), dataset = "adrs", col = "gray"))
  checkmate::assert_true(grid::is.grob(res1))

  res2 <- expect_silent(run(fstg01, proc_data, response = c("CR", "PR"), dataset = "adrs", col_symbol_size = NULL))
  checkmate::assert_true(grid::is.grob(res2))
})

test_that("kmg01 works if changes are in subgroups, strata_var, conf_level, and label_all", {
  proc_data <- log_filter(syn_data, PARAMCD == "BESRSPI" & ARM %in% c("A: Drug X", "B: Placebo"), "adrs")
  proc_data$adrs$ARM <- droplevels(proc_data$adrs$ARM)

  res1 <- expect_silent(run(fstg01, proc_data, response = c("CR", "PR"), subgroups = NULL, dataset = "adrs"))
  checkmate::assert_true(grid::is.grob(res1))

  res2 <- expect_silent(run(fstg01, proc_data, response = c("CR", "PR"), subgroups = c("SEX"), strata_var = c("AGEGR1"),
                           conf_level = 0.9, label_all = "All Patients", dataset = "adrs"))
  checkmate::assert_true(grid::is.grob(res2))
})
