# fstg01 functions ----

test_that("fstg01 works as expected", {
  pre_data <- log_filter(syn_data, ARM %in% c("A: Drug X", "B: Placebo"), "adrs")
  pre_data$adrs$ARM <- droplevels(pre_data$adrs$ARM)
  proc_data <- log_filter(pre_data, PARAMCD == "OVRINV", "adrs")

  pre_data <- expect_silent(fstg01_pre(proc_data, dataset = "adrs"))
  raw_res <- expect_silent(fstg01_main(pre_data, dataset = "adrs"))
  checkmate::assert_true(grid::is.grob(raw_res))
})

# fstg01 ----
