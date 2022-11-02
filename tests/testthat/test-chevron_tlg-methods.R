# run ----

test_that("run works as expected for chevron_t object", {
  res <- run(aet04_1, syn_test_data(), prune_0 = TRUE)
  expect_snapshot(res)
})

# main ----

test_that("main works as expected", {
  res <- main(aet04_1)
  expect_identical(res, aet04_1_main)
})

test_that("main setter works as expected", {
  func <- function(adam_db, lyt_ls, ...) {
    build_table(lyt_ls, adam_db)
  }
  main(aet04_1) <- func
  expect_identical(aet04_1@main, func)
})

# lyt ----

# test_that("lyt works as expected", {
#   res <- lyt(aet02_1)
#   expect_identical(
#     res[[1]](),
#     aet02_1_lyt(armvar = "ACTARM", lbl_overall = NULL, deco = list()))
# })

test_that("lyt setter works as expected with pre-data table layout", {
  my_tab <- rtables::basic_table() %>% rtables::split_cols_by("ARM")
  lyt(aet04_1) <- my_tab
  expect_equal(
    aet04_1@lyt[[1]](),
    my_tab
  )
})

# preprocess ----

test_that("preprocess works as expected", {
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

# get_main ----

test_that("get_main works as expected", {
  skip_if_not(interactive())
  res <- get_main(aet04_1)
  expect_identical(res, aet04_1_main)
})

# get_preprocess ----

test_that("get_preprocess works as expected", {
  skip_if_not(interactive())
  res <- get_preprocess(aet04_1)
  expect_identical(res, aet04_1_pre)
})

# get_postprocess ----

test_that("get_postprocess works as expected", {
  skip_if_not(interactive())
  res <- get_postprocess(aet04_1)
  expect_identical(res, report_null)
})

# get_adam_datasets ----

test_that("get_adam_datasets works as expected", {
  skip_if_not(interactive())
  res <- get_adam_datasets(aet04_1)
  expect_identical(res, c("adsl", "adae"))
})
