# mng01 functions ---

test_that("mng01 works as expected with default argument values", {
  pre_data <- mng01_pre(syn_data, dataset = "adlb")
  raw_res <- mng01_main(pre_data, dataset = "adlb")
  res <- mng01_post(raw_res)
  checkmate::expect_list(res, len = 3, types = "ggplot")
})

test_that("mng01 works as expected with custom argument values", {
  col <- c(
    "B: Placebo" = "black",
    "A: Drug X" = "blue",
    "C: Combination" = "gray"
  )

  pre_data <- mng01_pre(syn_data, dataset = "adlb")
  raw_res <- mng01_main(pre_data, dataset = "adlb", show_v_grid = FALSE, show_h_grid = FALSE, line_col = col)
  res <- mng01_post(raw_res)
  checkmate::expect_list(res, len = 3, types = "ggplot")

  bad_col <- c(
    "B: Placebo" = "black",
    "A: Drug X" = "blue"
  )

  expect_error(
    mng01_main(pre_data, dataset = "adlb", line_col = bad_col),
    "Missing color matching for C: Combination",
    fixed = TRUE
  )
})


# mng01 ----

test_that("mng01 works as expected with custom color set", {
  col <- c(
    "B: Placebo" = "black",
    "A: Drug X" = "blue",
    "C: Combination" = "gray"
  )

  proc_data <- syn_data
  res <- run(mng01, proc_data, dataset = "adlb", line_col = col)
  checkmate::expect_list(res, len = 3, types = "ggplot")

  res <- run(mng01, proc_data, dataset = "adlb", line_col = unname(col))
  checkmate::expect_list(res, len = 3, types = "ggplot")
})

test_that("mng01 works if show_v_grid/show_h_grid is TRUE", {
  proc_data <- syn_data
  res <- run(mng01, proc_data, dataset = "adlb", show_v_grid = TRUE, show_h_grid = TRUE)
  checkmate::expect_list(res, len = 3, types = "ggplot")
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
})
