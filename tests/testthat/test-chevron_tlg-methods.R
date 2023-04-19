# run ----

test_that("run works as expected for chevron_t object", {
  res <- run(aet04_1, syn_data, prune_0 = TRUE)
  expect_snapshot(res)
})

test_that("run returns a warning if provided with invalid arguments", {
  expect_error(run(aet04_1, syn_data, xyz = TRUE), "xyz is not a valid argument.")
})

test_that("run works as expected for chevron_t object when auto_pre = FALSE", {
  proc_data <- syn_data
  proc_data$adsl <- proc_data$adsl %>%
    mutate(DOMAIN = "ADSL")
  res <- run(dmt01_1, proc_data, auto_pre = FALSE)
  expect_snapshot(res)
})

# args_ls ----

test_that("args_ls works as expected", {
  res <- expect_silent(args_ls(aet04_1))
  checkmate::expect_list(res, len = 3, names = "named")
  checkmate::expect_names(names(res), identical.to = c("main", "preprocess", "postprocess"))
})

test_that("args_ls works as expected when simplify is TRUE", {
  res <- expect_silent(args_ls(aet04_1, simplify = TRUE))
  checkmate::expect_list(res, len = 10, names = "named")
  checkmate::expect_names(
    names(res),
    identical.to = c(
      "adam_db", "arm_var", "lbl_overall", "lbl_aebodsys", "lbl_aedecod",
      "grade_groups", "deco", "...", "tlg", "prune_0"
    )
  )
})

test_that("args_ls works as expected with custom chevron_tlg object", {
  obj <- aet04_1
  preprocess(obj) <- function(adam_db, arm_var = "overwritten", new_arg = "NEW", ...) {
    adam_db
  }

  res <- expect_silent(args_ls(obj, simplify = TRUE))
  checkmate::expect_list(res, len = 11, names = "named")
  checkmate::expect_names(
    names(res),
    identical.to = c(
      "adam_db", "arm_var", "lbl_overall", "lbl_aebodsys", "lbl_aedecod",
      "grade_groups", "deco", "...", "new_arg", "tlg", "prune_0"
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

test_that("get_main works as expected", {
  skip_on_covr()
  expect_warning(
    res <- get_main(aet04_1),
    "deprecated"
  )
  expect_identical(res, aet04_1_main)
})


test_that("main setter works as expected", {
  func <- function(adam_db, ...) {
    build_table(basic_table(), adam_db)
  }
  obj <- aet04_1
  main(obj) <- func
  expect_identical(obj@main, func)
})

test_that("main setter throw an error as expected", {
  func <- function(adam_db) {
    build_table(basic_table(), adam_db)
  }
  obj <- aet04_1
  expect_error(main(obj) <- func, "Variable 'object@main': Must have formal arguments: ....",
    fixed = TRUE
  )
})

# preprocess ----

test_that("preprocess works as expected", {
  skip_on_covr()
  res <- preprocess(aet04_1)
  expect_identical(res, aet04_1_pre)
})

test_that("get_preprocess works as expected", {
  skip_on_covr()
  expect_warning(
    res <- get_preprocess(aet04_1),
    "deprecated"
  )
  expect_identical(res, aet04_1_pre)
})

test_that("preprocess setter works as expected", {
  func <- function(adam_db, ...) adam_db
  obj <- aet04_1
  preprocess(obj) <- func
  expect_identical(obj@preprocess, func)
})

test_that("preprocess sends an error as expected", {
  func <- function(adam_db) adam_db
  obj <- aet04_1
  expect_error(preprocess(obj) <- func, "Variable 'object@preprocess': Must have formal arguments: ....",
    fixed = TRUE
  )
})


# postprocess ----

test_that("postprocess works as expected", {
  res <- postprocess(aet04_1)
  expect_identical(res, aet04_1@postprocess)
})


test_that("get_postprocess works as expected", {
  skip_on_covr()
  expect_warning(
    res <- get_postprocess(aet04_1),
    "deprecated"
  )
  expect_identical(res, aet04_1_post)
})

test_that("postprocess setter works as expected", {
  func <- function(tlg, ...) tlg
  obj <- aet04_1
  postprocess(obj) <- func
  expect_identical(obj@postprocess, func)
})

test_that("postprocess sends an error as expected", {
  func <- function(tlg) tlg
  obj <- aet04_1
  expect_error(postprocess(obj) <- func, "Variable 'object@postprocess': Must have formal arguments: ....",
    fixed = TRUE
  )
})

# Datasets ----

test_that("datasets works as expected", {
  res <- datasets(aet04_1)
  expect_identical(res, c("adsl", "adae"))
})

test_that("get_adam_datasets works as expected", {
  skip_on_covr()
  expect_warning(
    res <- get_adam_datasets(aet04_1),
    "deprecated"
  )
  expect_identical(res, c("adsl", "adae"))
})

test_that("datasets setter works as expected", {
  obj <- aet04_1
  datasets(obj) <- c("adsl", "adxx")
  expect_identical(obj@adam_datasets, c("adsl", "adxx"))
})

# script_args ----

test_that("script works as expected", {
  res <- expect_silent(script_args(aet04_1))
  checkmate::expect_character(res, len = 7)
  checkmate::expect_subset("adam_db <- stop(\"missing value\")", res)
})

test_that("script works as expected with dictionary of arguments", {
  res <- expect_silent(script_args(aet04_1, dict = list(adam_db = sym("x"), new_arg = "NEW")))
  checkmate::expect_character(res, len = 8)
  checkmate::expect_subset("adam_db <- x", res)
  checkmate::expect_subset("new_arg <- \"NEW\"", res)
})

# script_funs ----

test_that("script_funs works as expected in interactive mode", {
  skip_if(!interactive())
  res <- expect_silent(script_funs(aet04_1, adam_db = "data", args = "args_ls"))
  expect_snapshot(res)
})

test_that("script_funs works as expected in non interactive mode", {
  skip_if(interactive())
  res <- expect_silent(script_funs(aet04_1, adam_db = "data", args = "args_ls"))
  expect_snapshot(res)
})

test_that("script_funs works as expected", {
  res <- expect_silent(script_funs(aet04_1, adam_db = "data", args = "args_ls"))
  checkmate::expect_character(res)
})

test_that("script_funs works as expected with details set to TRUE", {
  res <- expect_silent(script_funs(aet04_1, adam_db = "data", args = "args_ls", details = TRUE))
  checkmate::expect_character(res)
})
