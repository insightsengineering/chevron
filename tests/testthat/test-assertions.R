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

  expect_silent(
    assert_colnames(mtcars, c("mpg", "cyl"), types = "numeric")
  )

  expect_error(
    assert_colnames(mtcars, c("mpg", "cyl"), types = "character"),
    "`mpg`, `cyl` not of type character"
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

# assert_single_value ----

test_that("assert_single_value works as expected", {
  x <- c("A", "A")
  res <- expect_silent(assert_single_value(x))
  expect_null(res)

  x <- factor(c("A", "A"), levels = c("A", "B"))
  res <- expect_silent(assert_single_value(x))
  expect_null(res)

  x <- factor(c("A", "B"), levels = c("A", "B"))
  expect_error(
    assert_single_value(x),
    "`x` has more than one values A, B, only one value is allowed."
  )

  x <- factor(c("A", NA), levels = c("A", "B"))
  expect_error(
    assert_single_value(x),
    "`x` has more than one values A, NA, only one value is allowed."
  )
})

# assert_valid_var ----

test_that("assert_valid_var.character works as expected", {
  x <- c("a", NA)
  expect_silent(assert_valid_var(x, na_ok = TRUE))
  expect_error(assert_valid_var(x, na_ok = FALSE))

  x <- "test"
  expect_error(assert_valid_var(x, min_chars = 5))

  expect_error(assert_valid_var(character(0)))
  expect_silent(assert_valid_var(character(0), empty_ok = TRUE))
})

test_that("assert_valid_var.factor works as expected", {
  x <- factor(c("a", NA))
  expect_silent(assert_valid_var(x, na_ok = TRUE))
  expect_error(assert_valid_var(x, na_ok = FALSE))

  x <- factor("test")
  expect_error(assert_valid_var(x, min_chars = 5))

  expect_error(assert_valid_var(factor()))
  expect_silent(assert_valid_var(factor(), empty_ok = TRUE))
})


test_that("assert_valid_var.logical works as expected", {
  x <- factor(c(TRUE, NA))
  expect_silent(assert_valid_var(x, na_ok = TRUE))
  expect_error(assert_valid_var(x, na_ok = FALSE))

  expect_error(assert_valid_var(logical()))
  expect_silent(assert_valid_var(logical(), empty_ok = TRUE))
})

test_that("assert_valid_var.numeric works as expected", {
  x <- c(1, NA)
  expect_silent(assert_valid_var(x, na_ok = TRUE))
  expect_error(
    assert_valid_var(x, na_ok = FALSE),
    "Assertion on 'x' failed: Contains missing values (element 2).",
    fixed = TRUE
  )

  expect_error(
    assert_valid_var(numeric()),
    "Assertion on 'numeric()' failed: Must have length >= 1, but has length 0.",
    fixed = TRUE
  )

  expect_silent(assert_valid_var(numeric(), empty_ok = TRUE))

  x <- c(5, 6.6)
  expect_error(
    assert_valid_var(x, integerish = TRUE),
    "Assertion on 'x' failed: Must be of type 'integerish', but element 2 is not close to an integer.",
    fixed = TRUE
  )
  x <- c(5, 6.0)
  expect_silent(assert_valid_var(x, integerish = TRUE))
})


# assert_valid_variable ----

test_that("assert_valid_variable works as expected", {
  expect_silent(assert_valid_variable(iris, "Species"))
  expect_silent(assert_valid_variable(iris, "Species", types = "factor"))
  expect_error(
    assert_valid_variable(iris, "Species", types = "character"),
    "`iris$Species` is not of type character",
    fixed = TRUE
  )

  expect_silent(assert_valid_variable(iris, c("Sepal.Width", "Sepal.Length"), types = "numeric"))
  expect_error(
    assert_valid_variable(iris, c("Sepal.Width", "Species"), types = "numeric"),
    "`iris$Species` is not of type numeric",
    fixed = TRUE
  )
  expect_silent(assert_valid_variable(iris, c("Sepal.Width", "Species"), types = c("numeric", "factor")))
})

# assert_valid_var_pair ----

test_that("assert_valid_var_pair works as expected with character", {
  df1 <- data.frame(
    id = c("1", "2", "3"),
    arm = c("A", "C", "B")
  )

  df2 <- data.frame(
    id = c("1", "2", "3"),
    arm = c("B", "C", "A")
  )

  expect_silent(assert_valid_var_pair(df1, df2, "arm"))

  df3 <- data.frame(
    id = c("1", "2", "3"),
    arm = c("A", "C", "A")
  )

  expect_error(
    assert_valid_var_pair(df1, df3, "arm"),
    "`df1` and `df3` should contain the same levels in variable `arm`!",
    fixed = TRUE
  )
})

test_that("assert_valid_var_pair works as expected with factor", {
  df1 <- data.frame(
    id = c("1", "2", "3"),
    arm = factor(c("A", "C", "B"), levels = c("B", "C", "A"))
  )

  df2 <- data.frame(
    id = c("1", "2", "3"),
    arm = factor(c("B", "A", "A"), levels = c("B", "C", "A"))
  )

  expect_silent(assert_valid_var_pair(df1, df2, "arm"))

  # Missing level returns an error
  df3 <- data.frame(
    id = c("1", "2", "3"),
    arm = factor(c("B", "A", "A"), levels = c("B", "C", "A", "X"))
  )

  expect_error(
    assert_valid_var_pair(df1, df3, "arm"),
    "`df1` and `df3` should contain the same levels in variable `arm`!",
    fixed = TRUE
  )

  # Different level order caused an error
  df4 <- data.frame(
    id = c("1", "2", "3"),
    arm = factor(c("A", "C", "B"), levels = c("C", "B", "A"))
  )

  expect_error(
    assert_valid_var_pair(df1, df4, "arm"),
    "`df1` and `df4` should contain the same levels in variable `arm`!",
    fixed = TRUE
  )
})
