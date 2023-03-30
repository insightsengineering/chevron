test_that("mng01_1 works as expected", {
  proc_data <- as.list(syn_data)

  pre_data <- mng01_1_pre(proc_data, dataset = "adlb")
  raw_res <- mng01_1_main(pre_data, dataset = "adlb", )
  checkmate::expect_list(raw_res, len = 3, types = "ggplot")
})

test_that("mng01_1 works as expected with custom color set", {
  col <- list(
    "A: Drug X" = "black",
    "B: Placebo" = "blue",
    "C: Combination" = "gray"
  )

  proc_data <- as.list(syn_data)

  res <- run(mng01_1, proc_data, dataset = "adlb", line_col = col)
  checkmate::expect_list(res, len = 3, types = "ggplot")
  res <- run(mng01_1, proc_data, dataset = "adlb", line_col = unname(col))
  checkmate::expect_list(res, len = 3, types = "ggplot")
})

test_that("mng01_1 works if show_v_grid/show_h_grid is TRUE", {
  proc_data <- as.list(syn_data)

  res <- run(mng01_1, proc_data, dataset = "adlb", show_v_grid = TRUE, show_h_grid = TRUE)
  checkmate::expect_list(res, len = 3, types = "ggplot")
})

test_that("mng01_1 works on custom color with named line_col", {
  proc_data <- as.list(syn_data)

  res <- run(mng01_1, proc_data, dataset = "adlb", show_v_grid = TRUE, show_h_grid = TRUE)
  checkmate::expect_list(res, len = 3, types = "ggplot")
})

test_that("mng01_1 works with combination of x variables", {
  proc_data <- as.list(syn_data)

  res <- run(mng01_1, proc_data, dataset = "adlb", x_var = c("AVISIT", "AVISITN"), show_v_grid = TRUE, show_h_grid = TRUE)
  checkmate::expect_list(res, len = 3, types = "ggplot")
})
