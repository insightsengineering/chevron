
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
 [available columns are: mpg, cyl, disp, hp, drat, wt, qsec, vs, am, gear, carb]", fixed = TRUE
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
