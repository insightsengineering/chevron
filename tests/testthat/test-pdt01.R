# pdt01 functions ----

test_that("pdt01 function with default argument value return expected result with test data", {
  pre_data <- pdt01_pre(syn_data)
  raw_res <- pdt01_main(pre_data)
  res <- pdt01_post(raw_res)
  expect_snapshot(cat(formatters::export_as_txt(res, lpp = 100)))
})

# pdt01 ----

test_that("pdt01 can handle all NA values", {
  proc_data <- syn_data
  proc_data$addv <- proc_data$addv %>%
    mutate(
      DVDECOD = NA_character_,
      DVTERM = NA_character_,
    )

  res <- expect_silent(run(pdt01, proc_data))
  expect_snapshot(cat(formatters::export_as_txt(res, lpp = 100)))
})

test_that("pdt01 can handle some NA values", {
  new_dvdecod <- c(NA_character_, "", as.character(syn_data$addv$DVDECOD[-c(1, 2)]))
  new_dvterm <- c(NA_character_, "", as.character(syn_data$addv$DVTERM[-c(1, 2)]))

  proc_data <- syn_data
  proc_data$addv <- proc_data$addv %>%
    mutate(
      DVDECOD = .env$new_dvdecod,
      DVTERM = .env$new_dvterm
    )

  res <- expect_silent(run(pdt01, proc_data))
  expect_snapshot(cat(formatters::export_as_txt(res, lpp = 100)))
})
