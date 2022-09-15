# aet04_1 ----

test_that("aet04_1 works as expected", {
  res <- run(aet04_1, syn_test_data(), prune_0 = TRUE)
  expect_snapshot(res)
})

res <- run(aet04_1, syn_test_data(), prune_0 = FALSE)
