# h_pad_or_round ----

test_that("h_pad_or_round works as exected", {
  res <- expect_silent(h_pad_or_round(123.1234, 10))
  expect_identical(res, "123.1234000000")

  res <- expect_silent(h_pad_or_round(123.1234, 0))
  expect_identical(res, "123")

  res <- expect_silent(h_pad_or_round(123.06, 1))
  expect_identical(res, "123.1")

  res <- expect_silent(h_pad_or_round(123, 3))
  expect_identical(res, "123.000")

  res <- expect_silent(h_pad_or_round(123, 0))
  expect_identical(res, "123")

  res <- expect_silent(h_pad_or_round(0.9, 0))
  expect_identical(res, "1")

  res <- expect_silent(h_pad_or_round(0.92, 3))
  expect_identical(res, "0.920")
})

# h_pad_or_round_sep ----

test_that("h_pad_or_round_sep works as expected", {
  res <- h_pad_or_round_sep(c(123, 222), 3)
  expect_identical(res, "123.000 - 222.000")

  res <- h_pad_or_round_sep(c(123, 222.2, 555.12345), 3, sep = " //// ")
  expect_identical(res, "123.000 //// 222.200 //// 555.123")
})

# h_pad_or_round_pct ----

test_that("h_pad_or_round_pct works as expected", {
  res <- h_pad_or_round_pct(c(123, 12.1234), 3)
  expect_identical(res, "123.000 (12.123%)")

  res <- h_pad_or_round_pct(c(0, 0), 3)
  expect_identical(res, "0")
})
