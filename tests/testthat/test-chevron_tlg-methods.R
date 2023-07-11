# run ----

test_that("run works as expected for chevron_t object", {
  res <- run(aet04, syn_data, prune_0 = TRUE)
  expect_snapshot(cat(export_as_txt(res, lpp = 100)))
})

test_that("run works as expected for chevron_t object when auto_pre = FALSE", {
  proc_data <- syn_data
  proc_data$adsl <- proc_data$adsl %>%
    mutate(DOMAIN = "ADSL")
  res <- run(dmt01, proc_data, auto_pre = FALSE)
  expect_snapshot(cat(export_as_txt(res, lpp = 100)))
})

# args_ls ----

test_that("args_ls works as expected", {
  res <- expect_silent(args_ls(aet04))
  checkmate::expect_list(res, len = 3, names = "named")
  checkmate::expect_names(names(res), identical.to = c("main", "preprocess", "postprocess"))
})

test_that("args_ls works as expected when simplify is TRUE", {
  res <- expect_silent(args_ls(aet04, simplify = TRUE))
  checkmate::expect_list(res, len = 7, names = "named")
  checkmate::expect_names(
    names(res),
    identical.to = c(
      "adam_db", "arm_var", "lbl_overall", "grade_groups", "...", "tlg", "prune_0"
    )
  )
})

test_that("args_ls works as expected with custom chevron_tlg object", {
  obj <- aet04
  preprocess(obj) <- function(adam_db, arm_var = "overwritten", new_arg = "NEW", ...) {
    adam_db
  }

  res <- expect_silent(args_ls(obj, simplify = TRUE))
  checkmate::expect_list(res, len = 8, names = "named")
  checkmate::expect_names(
    names(res),
    identical.to = c(
      "adam_db", "arm_var", "lbl_overall", "grade_groups", "...", "new_arg", "tlg", "prune_0"
    )
  )
  expect_identical(res$arm_var, "ACTARM")
})

# main ----

test_that("main works as expected", {
  skip_on_covr()
  res <- main(aet04)
  expect_identical(res, aet04_main)
})

test_that("main setter works as expected", {
  func <- function(adam_db, ...) {
    build_table(basic_table(), adam_db)
  }
  obj <- aet04
  main(obj) <- func
  expect_identical(obj@main, func)
})

test_that("main setter throw an error as expected", {
  func <- function(adam_db) {
    build_table(basic_table(), adam_db)
  }
  obj <- aet04
  expect_error(main(obj) <- func, "Variable 'object@main': Must have formal arguments: ....",
    fixed = TRUE
  )
})

# preprocess ----

test_that("preprocess works as expected", {
  skip_on_covr()
  res <- preprocess(aet04)
  expect_identical(res, aet04_pre)
})

test_that("preprocess setter works as expected", {
  func <- function(adam_db, ...) adam_db
  obj <- aet04
  preprocess(obj) <- func
  expect_identical(obj@preprocess, func)
})

test_that("preprocess sends an error as expected", {
  func <- function(adam_db) adam_db
  obj <- aet04
  expect_error(preprocess(obj) <- func, "Variable 'object@preprocess': Must have formal arguments: ....",
    fixed = TRUE
  )
})

# postprocess ----

test_that("postprocess works as expected", {
  res <- postprocess(aet04)
  expect_identical(res, aet04@postprocess)
})

test_that("postprocess setter works as expected", {
  func <- function(tlg, ...) tlg
  obj <- aet04
  postprocess(obj) <- func
  expect_identical(obj@postprocess, func)
})

test_that("postprocess sends an error as expected", {
  func <- function(tlg) tlg
  obj <- aet04
  expect_error(postprocess(obj) <- func, "Variable 'object@postprocess': Must have formal arguments: ....",
    fixed = TRUE
  )
})

# script_args ----

test_that("script works as expected", {
  res <- expect_silent(script_args(aet04))
  checkmate::expect_character(res, len = 4)
  checkmate::expect_subset("adam_db <- stop(\"missing value\")", res)
})

test_that("script works as expected with dictionary of arguments", {
  res <- expect_silent(script_args(aet04, dict = list(adam_db = sym("x"), new_arg = "NEW")))
  checkmate::expect_character(res, len = 5)
  checkmate::expect_subset("adam_db <- x", res)
  checkmate::expect_subset("new_arg <- \"NEW\"", res)
})

# script_funs ----

test_that("script_funs works as expected in interactive mode", {
  skip_if(!interactive())
  res <- expect_silent(script_funs(aet04, adam_db = "data", args = "args_ls"))
  expect_snapshot(res)
})

test_that("script_funs works as expected", {
  res <- expect_silent(script_funs(aet04, adam_db = "data", args = "args_ls"))
  checkmate::expect_character(res)
})

test_that("script_funs works as expected with details set to TRUE", {
  res <- expect_silent(script_funs(aet04, adam_db = "data", args = "args_ls", details = TRUE))
  checkmate::expect_character(res)
})


test_that("script_funs generates a valid script", {
  tmp <- tempfile()

  args_list <- list(
    arm_var = "ARM"
  )

  res_fun <- script_funs(aet04, adam_db = "syn_data", args = "args_list", details = FALSE)
  writeLines(res_fun, tmp)
  source(tmp, local = TRUE)

  expected <- run(aet04, syn_data, arm_var = "ARM")
  expect_identical(tlg_output, expected)

  res_fun <- script_funs(aet04, adam_db = "syn_data", args = "args_list", details = TRUE)
  writeLines(res_fun, tmp)
  source(tmp, local = TRUE)

  expect_identical(tlg_output, expected)
})
