test_that("mng01_1 works as expected", {
  pre_data <- mng01_1_pre(syn_data, dataset = "adlb")
  raw_res <- mng01_1_main(pre_data, dataset = "adlb", )
  checkmate::expect_list(raw_res, len = 3, types = "ggplot")
})

test_that("mng01_1 works as expected with custom color set", {
  col <- c(
    "A: Drug X" = "black",
    "B: Placebo" = "blue",
    "C: Combination" = "gray"
  )

  res <- run(mng01_1, syn_data, dataset = "adlb", line_col = col)
  checkmate::expect_list(res, len = 3, types = "ggplot")
})
