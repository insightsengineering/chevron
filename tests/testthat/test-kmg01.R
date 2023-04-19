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

test_that("kmg01_1 works if change pvalue, ties and conf level", {
  res <- expect_silent(run(kmg01_1, syn_data,
    dataset = "adtte",
    pval_method = "log-rank",
    ties = "efron",
    conf_level = 0.99
  ))
  checkmate::assert_true(grid::is.grob(res))
})

test_that("kmg01_1 works if change legend postion", {
  res <- expect_silent(run(kmg01_1, syn_data, dataset = "adtte", legend_pos = "right"))
  checkmate::assert_true(grid::is.grob(res))
})

test_that("kmg01_1 works if change annotation position", {
  res <- expect_silent(run(kmg01_1, syn_data,
    dataset = "adtte", show_statis = FALSE,
    position_coxph = c(0.4, 0.5), position_surv_med = c(1, 0.7)
  ))
  checkmate::assert_true(grid::is.grob(res))
})
