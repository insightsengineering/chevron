# rmpt06 ----

test_that("rmpt06 works as expected", {
  res <- rmpt06_pre(syn_data) %>%
    rmpt06_main() %>%
    rmpt01_post()

  expect_snapshot(cat(export_as_txt(res, lpp = 100, cpp = 200)))
})

test_that("rmpt06 works as expected with show_diff = TRUE", {
  res <- rmpt06_pre(syn_data) %>%
    rmpt06_main(show_diff = TRUE) %>%
    rmpt01_post()

  expect_snapshot(cat(export_as_txt(res, lpp = 100, cpp = 200)))
})


test_that("rmpt06 can handle all NA values", {
  proc_data <- syn_data
  proc_data$adae <- proc_data$adae %>%
    mutate(
      ATOXGR = factor(NA, levels = 1:5),
      AEOUT = factor(NA),
      AESER = NA
    )

  res <- expect_silent(run(rmpt06, proc_data))
  expect_snapshot(cat(export_as_txt(res, lpp = 100, cpp = 200)))
  res <- expect_silent(run(rmpt06, proc_data, prune_0 = TRUE))
  expect_snapshot(cat(export_as_txt(res, lpp = 100, cpp = 200)))
})
