# fstg02 functions ----

test_that("fstg02 works as expected", {
  proc_data <- dunlin::log_filter(syn_data, PARAMCD == "OS" & ARM %in% c("A: Drug X", "B: Placebo"), "adtte")
  pre_data <- expect_silent(fstg02_pre(proc_data, dataset = "adtte"))
  raw_res <- expect_silent(fstg02_main(pre_data, dataset = "adtte"))
  checkmate::assert_true(grid::is.grob(raw_res))
})

# fstg02 ----

test_that("fstg02 works as expected with custom color set", {
  proc_data <- dunlin::log_filter(syn_data, PARAMCD == "OS" & ARM %in% c("A: Drug X", "B: Placebo"), "adtte")

  res1 <- expect_silent(run(fstg02, proc_data, dataset = "adtte", col = "gray"))
  checkmate::assert_true(grid::is.grob(res1))

  res2 <- expect_silent(run(fstg02, proc_data, dataset = "adtte", col_symbol_size = NULL))
  checkmate::assert_true(grid::is.grob(res2))
})

test_that("fstg02 works if changes are in subgroups, strata_var, conf_level, and label_all", {
  proc_data <- dunlin::log_filter(syn_data, PARAMCD == "OS" & ARM %in% c("A: Drug X", "B: Placebo"), "adtte")

  res1 <- expect_silent(run(fstg02, proc_data, subgroups = NULL, dataset = "adtte"))
  checkmate::assert_true(grid::is.grob(res1))

  res2 <- expect_silent(run(fstg02, proc_data,
    subgroups = c("SEX"), strata_var = c("AGEGR1"),
    conf_level = 0.9, label_all = "All Patients", dataset = "adtte"
  ))
  checkmate::assert_true(grid::is.grob(res2))
})

test_that("fstg02 can handle some NA values in subgroups", {
  proc_data <- dunlin::log_filter(syn_data, PARAMCD == "OS" & ARM %in% c("A: Drug X", "B: Placebo"), "adtte")
  proc_data$adtte[1:2, "SEX"] <- NA
  proc_data$adtte[3:4, "AGEGR1"] <- NA
  proc_data$adtte[5:6, "RACE"] <- NA

  res <- expect_silent(run(fstg02, proc_data, dataset = "adtte"))
  checkmate::assert_true(grid::is.grob(res))
})
