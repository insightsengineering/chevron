# run ----

test_that("run works as expected for chevron_t object", {
  res <- run(aet04_1, syn_data, prune_0 = TRUE)
  expect_snapshot(res)
})

# main ----

test_that("main works as expected", {
  skip_on_covr()
  res <- main(aet04_1)
  expect_identical(res, aet04_1_main)
})

test_that("main setter works as expected", {
  func <- function(adam_db, ...) {
    build_table(basic_table(), adam_db)
  }
  main(aet04_1) <- func
  expect_identical(aet04_1@main, func)
})

# args ----

test_that("args works as expected", {
  res <- expect_silent(args(aet04_1))
  checkmate::expect_list(res, len = 3, names = "named")
  checkmate::expect_names(names(res), identical.to = c("main", "preprocess", "postprocess"))
})

test_that("args works as expected when simplify is TRUE", {
  res <- expect_silent(args(aet04_1, simplify = TRUE))
  checkmate::expect_list(res, len = 8, names = "named")
  checkmate::expect_names(
    names(res),
    identical.to = c("adam_db", "arm_var", "grade_groups", "lbl_overall", "deco", "...", "tlg", "prune_0")
  )
})

test_that("args works as expected with custom chevron_tlg object", {
  obj <- aet04_1
  preprocess(obj) <- function(adam_db, arm_var = "overwritten", new_arg = "NEW", ...) {
    adam_db
  }

  res <- expect_silent(args(obj, simplify = TRUE))
  checkmate::expect_list(res, len = 9, names = "named")
  checkmate::expect_names(
    names(res),
    identical.to = c("adam_db", "arm_var", "grade_groups", "lbl_overall", "deco", "...", "new_arg", "tlg", "prune_0")
  )
  expect_identical(res$arm_var, "ACTARM")
})

# preprocess ----

test_that("preprocess works as expected", {
  skip_on_covr()
  res <- preprocess(aet04_1)
  expect_identical(res, aet04_1_pre)
})

test_that("preprocess setter works as expected", {
  func <- function(adam_db, ...) adam_db
  preprocess(aet04_1) <- func
  expect_identical(aet04_1@preprocess, func)
})

# postprocess ----

test_that("postprocess works as expected", {
  res <- postprocess(aet04_1)
  expect_identical(res, aet04_1@postprocess)
})

test_that("postprocess setter works as expected", {
  func <- function(tlg, ...) tlg
  postprocess(aet04_1) <- func
  expect_identical(aet04_1@postprocess, func)
})

# Datasets ----

test_that("datasets works as expected", {
  res <- datasets(aet04_1)
  expect_identical(res, c("adsl", "adae"))
})

test_that("datasets setter works as expected", {
  datasets(aet04_1) <- c("adsl", "adxx")
  expect_identical(aet04_1@adam_datasets, c("adsl", "adxx"))
})

# script

test_that("script works as expected", {
  res <- expect_silent(script(aet04_1))
  checkmate::expect_character(res, len = 24)
  checkmate::expect_subset("adam_db <- \"# enter custom value\"", res)
  checkmate::expect_subset("    adam_db <- dunlin::apply_reformat(adam_db, new_format)", res)
})

test_that("script works as expected with dictionary of arguments", {
  res <- expect_silent(script(aet04_1, dict = list(adam_db = sym("x"), new_arg = "NEW")))
  checkmate::expect_character(res, len = 25)
  checkmate::expect_subset("adam_db <- x", res)
  checkmate::expect_subset("new_arg <- \"NEW\"", res)
  checkmate::expect_subset("    adam_db <- dunlin::apply_reformat(adam_db, new_format)", res)
})

test_that("script works as expected with details set to TRUE", {
  res <- expect_silent(script(aet04_1, details = TRUE))
  checkmate::expect_character(res, len = 51)
  checkmate::expect_subset("main_fun <- function (adam_db, arm_var = \"ACTARM\", grade_groups = NULL, ", res)
})
