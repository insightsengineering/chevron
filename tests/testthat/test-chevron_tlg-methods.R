# run ----

test_that("run works as expected for chevron_t object", {
  res <- run(aet04_1, syn_data, prune_0 = TRUE)
  expect_snapshot(res)
})

test_that("run returns a warning if provided with invalid arguments", {
  expect_error(run(aet04_1, syn_data, xyz = TRUE), "xyz is not a valid argument.")
})

# args_ls ----

test_that("args_ls works as expected", {
  res <- expect_silent(args_ls(aet04_1))
  checkmate::expect_list(res, len = 3, names = "named")
  checkmate::expect_names(names(res), identical.to = c("main", "preprocess", "postprocess"))
})

test_that("args_ls works as expected when simplify is TRUE", {
  res <- expect_silent(args_ls(aet04_1, simplify = TRUE))
  checkmate::expect_list(res, len = 9, names = "named")
  checkmate::expect_names(
    names(res),
    identical.to = c(
      "adam_db", "arm_var", "lbl_overall", "lbl_aebodsys", "lbl_aedecod",
      "grade_groups", "deco", "tlg", "prune_0"
    )
  )
})

test_that("args_ls works as expected with custom chevron_tlg object", {
  obj <- aet04_1
  preprocess(obj) <- function(adam_db, arm_var = "overwritten", new_arg = "NEW") {
    adam_db
  }

  res <- expect_silent(args_ls(obj, simplify = TRUE))
  checkmate::expect_list(res, len = 10, names = "named")
  checkmate::expect_names(
    names(res),
    identical.to = c(
      "adam_db", "arm_var", "lbl_overall", "lbl_aebodsys", "lbl_aedecod",
      "grade_groups", "deco", "new_arg", "tlg", "prune_0"
    )
  )
  expect_identical(res$arm_var, "ACTARM")
})

# main ----

test_that("main works as expected", {
  skip_on_covr()
  res <- main(aet04_1)
  expect_identical(res, aet04_1_main)
})

test_that("main setter works as expected", {
  func <- function(adam_db) {
    build_table(basic_table(), adam_db)
  }
  main(aet04_1) <- func
  expect_identical(aet04_1@main, func)
})

test_that("main setter throw an error as expected", {
  func <- function(adam_db, ...) {
    build_table(basic_table(), adam_db)
  }
  expect_error(main(aet04_1) <- func, "Variable 'rlang::fn_fmls_names(object@main)': Must be disjunct from
 * {'...'}, but has elements {'...'}.",
    fixed = TRUE
  )
})

# preprocess ----

test_that("preprocess works as expected", {
  skip_on_covr()
  res <- preprocess(aet04_1)
  expect_identical(res, aet04_1_pre)
})

test_that("preprocess setter works as expected", {
  func <- function(adam_db) adam_db
  preprocess(aet04_1) <- func
  expect_identical(aet04_1@preprocess, func)
})

test_that("preprocess sends an error as expected", {
  func <- function(adam_db, ...) adam_db
  expect_error(preprocess(aet04_1) <- func, "Variable 'rlang::fn_fmls_names(object@preprocess)': Must be disjunct
 * from {'...'}, but has elements {'...'}.",
    fixed = TRUE
  )
})


# postprocess ----

test_that("postprocess works as expected", {
  res <- postprocess(aet04_1)
  expect_identical(res, aet04_1@postprocess)
})

test_that("postprocess setter works as expected", {
  func <- function(tlg) tlg
  postprocess(aet04_1) <- func
  expect_identical(aet04_1@postprocess, func)
})

test_that("postprocess sends an error as expected", {
  func <- function(tlg, ...) tlg
  expect_error(postprocess(aet04_1) <- func, "Variable 'rlang::fn_fmls_names(object@postprocess)': Must be
 * disjunct from {'...'}, but has elements {'...'}.",
    fixed = TRUE
  )
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

# script_args ----

test_that("script works as expected", {
  res <- expect_silent(script_args(aet04_1))
  checkmate::expect_character(res, len = 7)
  checkmate::expect_subset("adam_db <- stop(\"enter dataset\")", res)
})

test_that("script works as expected with dictionary of arguments", {
  res <- expect_silent(script_args(aet04_1, dict = list(adam_db = sym("x"), new_arg = "NEW")))
  checkmate::expect_character(res, len = 8)
  checkmate::expect_subset("adam_db <- x", res)
  checkmate::expect_subset("new_arg <- \"NEW\"", res)
})

# script_funs ----

test_that("script_funs works as expected", {
  res <- expect_silent(script_funs(aet04_1))
  checkmate::expect_character(res, len = 20)
  checkmate::expect_subset("    adam_db <- dunlin::reformat(adam_db, new_format, na_last = TRUE)", res)
})

test_that("script_funs works as expected with details set to TRUE", {
  res <- expect_silent(script_funs(aet04_1, details = TRUE))
  checkmate::expect_character(res, len = 64)
  checkmate::expect_subset("main_fun <- function (adam_db, arm_var = \"ACTARM\", lbl_overall = NULL, ", res)
})
