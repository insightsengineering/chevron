test_that("mng01 works as expected", {
  proc_data <- syn_data
  pre_data <- mng01_pre(proc_data, dataset = "adlb")
  raw_res <- mng01_main(pre_data, dataset = "adlb")
  checkmate::expect_list(raw_res, len = 3, types = "ggplot")
  vdiffr::expect_doppelganger(title = "mng01_plot1", fig = raw_res[[1]])
  vdiffr::expect_doppelganger(title = "mng01_plot2", fig = raw_res[[2]])
})

test_that("mng01 works as expected with custom color set", {
  col <- list(
    "B: Placebo" = "black",
    "A: Drug X" = "blue",
    "C: Combination" = "gray"
  )

  proc_data <- syn_data
  res <- run(mng01, proc_data, dataset = "adlb", line_col = col)
  checkmate::expect_list(res, len = 3, types = "ggplot")
  vdiffr::expect_doppelganger(title = "mng01_plot1_col", fig = res[[1]])


  res <- run(mng01, proc_data, dataset = "adlb", line_col = unname(col))
  checkmate::expect_list(res, len = 3, types = "ggplot")
  vdiffr::expect_doppelganger(title = "mng01_plot1_unname_col", fig = res[[1]])
})

test_that("mng01 works if show_v_grid/show_h_grid is TRUE", {
  proc_data <- syn_data
  res <- run(mng01, proc_data, dataset = "adlb", show_v_grid = TRUE, show_h_grid = TRUE)
  checkmate::expect_list(res, len = 3, types = "ggplot")
  vdiffr::expect_doppelganger(title = "mng01_plot1_grid", fig = res[[1]])
})

test_that("mng01 works with combination of x variables", {
  proc_data <- syn_data
  res <- run(
    mng01,
    proc_data,
    dataset = "adlb",
    x_var = c("AVISIT", "AVISITN"),
    show_v_grid = TRUE,
    show_h_grid = TRUE
  )
  checkmate::expect_list(res, len = 3, types = "ggplot")
  vdiffr::expect_doppelganger(title = "mng01_plot1_xcombination", fig = res[[1]])
})
