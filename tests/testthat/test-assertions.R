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
  expect_silent(
    assert_one_tablenames(
      dm::dm_nycflights13(),
      c("airlines"),
      qualifier = "first test:"
    )
  )

  expect_silent(
    assert_one_tablenames(
      dm::dm_nycflights13(),
      c("airlines", "haha"),
      qualifier = "first test:"
    )
  )

  expect_error(
    assert_one_tablenames(
      dm::dm_nycflights13(),
      c("haha", "hoho"),
      qualifier = "first test:"
    ),
    "first test: At least one of: haha, hoho is expected to be a table name of dm::dm_nycflights13()"
  )

  expect_error(
    assert_one_tablenames(
      dm::dm_nycflights13(),
      c("haha", "hoho")
    ),
    "At least one of: haha, hoho is expected to be a table name of dm::dm_nycflights13()"
  )
})

# assert_all_tablenames ----

test_that("assert_all_tablenames works as expected", {
  expect_silent(
    assert_all_tablenames(
      dm::dm_nycflights13(),
      c("airlines"),
      qualifier = "first test:"
    )
  )

  expect_error(
    assert_all_tablenames(
      dm::dm_nycflights13(),
      c("airlines", "haha"),
      qualifier = "first test:"
    ),
    "first test: Expected table names: haha not in dm::dm_nycflights13()"
  )

  expect_error(
    assert_all_tablenames(
      dm::dm_nycflights13(),
      c("haha", "hoho"),
      qualifier = "first test:"
    ),
    "first test: Expected table names: haha, hoho not in dm::dm_nycflights13()"
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

  expect_error(
    assert_subset_suggest(x, choices),
    "lbl_ is not a valid argument. Do you mean: lbl_x, lbl_y ?
armvar is not a valid argument. Do you mean: arm_var ?
xxxx is not a valid argument. ",
    fixed = TRUE
  )

  x_ok <- c(
    "lbl_overall",
    "arm_var"
  )

  expect_silent(res <- assert_subset_suggest(x_ok, choices))
  expect_null(res)
})
