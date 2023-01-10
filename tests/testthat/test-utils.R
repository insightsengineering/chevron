# h_pad_or_round ----

test_that("h_format_dec works as exected", {
  res <- expect_silent(h_format_dec(123.1234, 10, "%f"))
  expect_identical(res, "123.1234000000")

  res <- expect_silent(h_format_dec(123.1234, 0, "%f"))
  expect_identical(res, "123")

  res <- expect_silent(h_format_dec(123.06, 1, "%f"))
  expect_identical(res, "123.1")

  res <- expect_silent(h_format_dec(123, 3, "%f"))
  expect_identical(res, "123.000")

  res <- expect_silent(h_format_dec(123, 0, "%f"))
  expect_identical(res, "123")

  res <- expect_silent(h_format_dec(0.9, 0, "%f"))
  expect_identical(res, "1")
})

test_that("h_format_dec works as expected with more than one value", {
  res <- h_format_dec(c(123, 222), 3, "%f - %f")
  expect_identical(res, "123.000 - 222.000")

  res <- h_format_dec(c(123, 222.2, 555.12345), 3, "%f /// %f /// %f")
  expect_identical(res, "123.000 /// 222.200 /// 555.123")
})

test_that("h_format_dec works as expected with NA format", {
  res <- h_format_dec(c(123, 222), 3)
  expect_identical(res, "123, 222")
})

test_that("h_format_dec works as expected with NA digits", {
  res <- h_format_dec(c(123, 222.21), format = "%f - %f")
  expect_identical(res, "123.000000 - 222.210000")
})

test_that("h_format_dec works as expected with NA digits", {
  res <- h_format_dec(c(123, 222.21), 3, format = "%f - %.6f")
  expect_identical(res, "123.000 - 222.210000")
})
