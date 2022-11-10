
# chevron_t ----

test_that("chevron_t object can be constructed with default values", {
  obj <- expect_silent(chevron_t())
  expect_true(validObject(obj))
})

test_that("chevron_t object can be constructed with custom values", {
  obj <- expect_silent(
    .chevron_t(
      preprocess = function(adam_db, ...) adam_db[c("adsl, adlb")],
      main = function(adam_db, col, fl, ...) {
        lyt <- basic_tables() %>%
          split_cols_by(col) %>%
          count_patients_with_flags(fl)
        build_table(lyt, adam_db$adlb, adam_db$adsl)
      },
      postprocess = function(tlg, ...) report_null(tlg),
      adam_datasets = c("adsl, adlb")
    )
  )
  expect_true(validObject(obj))

  obj <- expect_silent(
    chevron_t(
      preprocess = function(adam_db, ...) adam_db[c("adsl, adlb")],
      main = function(adam_db, col, fl, ...) {
        lyt <- basic_tables() %>%
          split_cols_by(col) %>%
          count_patients_with_flags(fl)
        build_table(lyt, adam_db$adlb, adam_db$adsl)
      },
      postprocess = function(tlg, ...) report_null(tlg),
      adam_datasets = c("adsl, adlb")
    )
  )
  expect_true(validObject(obj))
})

test_that("chevron_t constructor returns an error when expected", {
  obj <- capture_error(
    .chevron_t(
      preprocess = function(z) z[c("adsl, adlb")],
      main = function(x, y, fl) {
        lyt <- basic_tables() %>%
          split_cols_by(y) %>%
          count_patients_with_flags(fl)
        build_table(lyt, x$adlb, x$adsl)
      },
      postprocess = function(w) report_null(w),
      adam_datasets = c("adsl, adlb")
    )
  )

  obj_string <- toString(obj)

  expect_match(obj_string, "Variable 'object@main': Must have first formal arguments (ordered):
 * adam_db.", fixed = TRUE)
  expect_match(obj_string, "Variable 'object@main': Must have formal arguments: ....", fixed = TRUE)
  expect_match(obj_string, "Variable 'object@preprocess': Must have first formal arguments
 * (ordered): adam_db.", fixed = TRUE)
  expect_match(obj_string, "Variable 'object@preprocess': Must have formal arguments: ....", fixed = TRUE)
  expect_match(obj_string, "Variable 'object@postprocess': Must have first formal arguments
 * (ordered): tlg.", fixed = TRUE)
  expect_match(obj_string, "Variable 'object@postprocess': Must have formal arguments: ....", fixed = TRUE)
})

# chevron_l ----

test_that("chevron_l object can be constructed with default values", {
  obj <- expect_silent(chevron_l())
  expect_true(validObject(obj))
})

# chevron_g ----

test_that("chevron_g object can be constructed with custom values", {
  obj <- expect_silent(
    .chevron_g(
      preprocess = function(adam_db, ...) adam_db[c("adsl, adlb")],
      main = function(adam_db, x, ...) {
        ggplot(adam_db$adsl, aes_string(x = x)) +
          geom_histogram()
      },
      postprocess = function(tlg, ...) tlg,
      adam_datasets = c("adsl, adlb")
    )
  )
  expect_true(validObject(obj))

  obj <- expect_silent(
    chevron_g(
      preprocess = function(adam_db, ...) adam_db[c("adsl, adlb")],
      main = function(adam_db, x, ...) {
        ggplot(adam_db$adsl, aes_string(x = x)) +
          geom_histogram()
      },
      adam_datasets = c("adsl, adlb")
    )
  )
  expect_true(validObject(obj))
})

test_that("chevron_g constructor returns an error when expected", {
  obj <- capture_error(
    .chevron_g(
      preprocess = function(z) z[c("adsl, adlb")],
      main = function(dat, x) {
        ggplot(dat$adsl, aes_string(x = x)) +
          geom_histogram()
      },
      postprocess = function(w) w,
      adam_datasets = c("adsl, adlb")
    )
  )

  obj_string <- toString(obj)

  expect_match(obj_string, "Variable 'object@main': Must have first formal arguments (ordered):
 * adam_db.", fixed = TRUE)
  expect_match(obj_string, "Variable 'object@main': Must have formal arguments: ....", fixed = TRUE)
  expect_match(obj_string, "Variable 'object@preprocess': Must have first formal arguments
 * (ordered): adam_db.", fixed = TRUE)
  expect_match(obj_string, "Variable 'object@preprocess': Must have formal arguments: ....", fixed = TRUE)
  expect_match(obj_string, "Variable 'object@postprocess': Must have first formal arguments
 * (ordered): tlg.", fixed = TRUE)
  expect_match(obj_string, "Variable 'object@postprocess': Must have formal arguments: ....", fixed = TRUE)
})
