test_that("mng01_1 works as expected", {
  pre_data <- mng01_1_pre(data, dataset = "adlb")
  raw_res <- mng01_1_main(pre_data, dataset = "adlb")
  checkmate::expect_list(raw_res, len = 3, types = "ggplot")
})
