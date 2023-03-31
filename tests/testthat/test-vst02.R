# vst02_1 ----

test_that("vst02_1 works", {
  proc_data <- syn_data
  expect_snapshot(run(vst02_1, proc_data))
  expect_snapshot(run(vst02_1, proc_data, prune_0 = TRUE))
})

# vst02_2 ----

test_that("vst02_2 works", {
  proc_data <- syn_data
  expect_snapshot(run(vst02_2, proc_data))
  expect_snapshot(run(vst02_2, proc_data, prune_0 = TRUE))
})
