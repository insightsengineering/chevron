# h_pad_or_round ----

test_that("h_format_dec works as exected", {
  fun <- expect_silent(h_format_dec(10, "%f"))
  res <- fun(123.1234)
  expect_identical(res, "123.1234000000")

  fun <- expect_silent(h_format_dec(0, "%f"))
  res <- fun(123.1234)
  expect_identical(res, "123")

  fun <- expect_silent(h_format_dec(1, "%f"))
  res <- fun(123.06)
  expect_identical(res, "123.1")

  fun <- expect_silent(h_format_dec(3, "%f"))
  res <- fun(123)
  expect_identical(res, "123.000")

  fun <- expect_silent(h_format_dec(0, "%f"))
  res <- fun(123)
  expect_identical(res, "123")

  fun <- expect_silent(h_format_dec(0, "%f"))
  res <- fun(0.9)
  expect_identical(res, "1")
})

test_that("h_format_dec works as expected with more than one value", {
  fun <- h_format_dec(3, "%f - %f")
  res <- fun(c(123, 222))
  expect_identical(res, "123.000 - 222.000")

  fun <- h_format_dec(3, "%f /// %f /// %f")
  res <- fun(c(123, 222.2, 555.12345))
  expect_identical(res, "123.000 /// 222.200 /// 555.123")
})

test_that("h_format_dec works as expected with NA format", {
  fun <- h_format_dec(3)
  res <- fun(c(123, 222))
  expect_identical(res, "123, 222")
})

test_that("h_format_dec works as expected with NA digits", {
  fun <- h_format_dec(format = "%f - %f")
  res <- fun(c(123, 222.21))
  expect_identical(res, "123.000000 - 222.210000")
})

test_that("h_format_dec works as expected with NA digits", {
  fun <- h_format_dec(3, format = "%f - %.6f")
  res <- fun(c(123, 222.21))
  expect_identical(res, "123.000 - 222.210000")
})
