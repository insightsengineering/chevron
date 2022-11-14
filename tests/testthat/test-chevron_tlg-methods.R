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

# main ----

test_that("main works as expected", {
  skip_if_not(interactive())
  res <- get_main(aet04_1)
  expect_identical(res, aet04_1_main)
})

# preprocess ----

test_that("preprocess works as expected", {
  skip_if_not(interactive())
  res <- get_preprocess(aet04_1)
  expect_identical(res, aet04_1_pre)
})

# postprocess ----

test_that("postprocess works as expected", {
  skip_if_not(interactive())
  res <- postprocess(aet04_1)
  expect_identical(res, aet04_1_post)
})
