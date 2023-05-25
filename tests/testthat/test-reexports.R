# with_label ----

test_that("with_label exported correctly", {
  expect_identical(
    chevron::with_label,
    formatters::with_label
  )
})

# reformat ----

test_that("reformat exported correctly", {
  expect_identical(
    chevron::reformat,
    dunlin::reformat
  )
})
