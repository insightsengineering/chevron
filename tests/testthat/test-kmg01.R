test_that("kmg01_1 works as expected", {
  pre_data <- expect_silent(kmg01_1_pre(syn_data, dataset = "adtte"))
  raw_res <- expect_silent(kmg01_1_main(pre_data, dataset = "adtte"))
  checkmate::assert_true(grid::is.grob(raw_res))
})



test_that("kmg01_1 works as expected with custom color set", {
  col <- list(
    "A: Drug X" = "black",
    "B: Placebo" = "blue",
    "C: Combination" = "gray"
  )

  res <- expect_silent(run(kmg01_1, syn_data, dataset = "adtte", line_col = col))
  checkmate::assert_true(grid::is.grob(res))
  res <- expect_silent(run(kmg01_1, syn_data, dataset = "adtte", line_col = unname(col)))
  checkmate::assert_true(grid::is.grob(res))
})

test_that("kmg01_1 works if show_statis/show_censor is FALSE", {
  res <- expect_silent(run(kmg01_1, syn_data, dataset = "adtte", show_statis = FALSE, show_censor = FALSE))
  checkmate::assert_true(grid::is.grob(res))
})
