# assert_colnames ----

test_that("assert_colnames works as expected", {
  expect_silent(
    assert_colnames(mtcars, c("mpg", "cyl"), null_ok = TRUE)
  )

  expect_error(
    assert_colnames(mtcars, c("mpg", "speed", "seats"), null_ok = TRUE),
    "Variable(s) not a column name of mtcars:
 speed
 seats
 [available columns are: mpg, cyl, disp, hp, drat, wt, qsec, vs, am, gear, carb]",
    fixed = TRUE
  )

  expect_silent(
    assert_colnames(mtcars, NULL, null_ok = TRUE)
  )

  expect_error(
    assert_colnames(mtcars, NULL, null_ok = FALSE),
    "x cannot be NULL"
  )
})

# assert_one_tablenames ----

test_that("assert_one_tablenames works as expected", {
  df <- list(mtcars = mtcars, iris = iris)

  expect_silent(
    assert_one_tablenames(
      df,
      c("mtcars"),
      qualifier = "first test:"
    )
  )

  expect_silent(
    assert_one_tablenames(
      df,
      c("iris", "haha"),
      qualifier = "first test:"
    )
  )

  expect_error(
    assert_one_tablenames(
      df,
      c("haha", "hoho"),
      qualifier = "first test:"
    ),
    "first test: At least one of: haha, hoho is expected to be a table name of df"
  )

  expect_error(
    assert_one_tablenames(
      df,
      c("haha", "hoho")
    ),
    "At least one of: haha, hoho is expected to be a table name of df"
  )
})

# assert_all_tablenames ----

test_that("assert_all_tablenames works as expected", {
  df <- list(mtcars = mtcars, iris = iris)

  expect_silent(
    assert_all_tablenames(
      df,
      c("mtcars"),
      qualifier = "first test:"
    )
  )

  expect_error(
    assert_all_tablenames(
      df,
      c("iris", "haha"),
      qualifier = "first test:"
    ),
    "first test: Expected table names: haha not in df"
  )

  expect_error(
    assert_all_tablenames(
      df,
      c("haha", "hoho"),
      qualifier = "first test:"
    ),
    "first test: Expected table names: haha, hoho not in df"
  )
})

# assert_subset_suggest ----

test_that("assert_args works as expected", {
  x <- c(
    "lbl_overall",
    "lbl_",
    "armvar",
    "xxxx"
  )

  choices <- c("adam_db", "arm_var", "lbl_overall", "lbl_x", "lbl_y")

  expect_error(assert_subset_suggest(x, choices))

  x_ok <- c(
    "lbl_overall",
    "arm_var"
  )

  expect_silent(res <- assert_subset_suggest(x_ok, choices))
  expect_null(res)
})
