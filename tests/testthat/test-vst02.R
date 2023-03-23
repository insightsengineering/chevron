# vst02_1 ----

test_that("vst02_1 works", {
  expect_snapshot(run(vst02_1, syn_data))
  expect_snapshot(run(vst02_1, syn_data, prune_0 = TRUE))
})

# vst02_2 ----

test_that("vst02_2 works", {
  expect_snapshot(run(vst02_2, syn_data))
  expect_snapshot(run(vst02_2, syn_data, prune_0 = TRUE))
})
