# fstg02 functions ----

test_that("fstg02 works as expected", {
  proc_data <- dunlin::log_filter(syn_data, PARAMCD == "OS" & ARM %in% c("A: Drug X", "B: Placebo"), "adtte")
  pre_data <- expect_silent(fstg02_pre(proc_data, dataset = "adtte"))
  raw_res <- expect_silent(fstg02_main(pre_data, dataset = "adtte"))
  checkmate::assert_true(ggplot2::is.ggplot(raw_res))
})

# fstg02 ----

test_that("fstg02 works as expected with custom color set", {
  skip_on_os("windows")
  proc_data <- dunlin::log_filter(syn_data, PARAMCD == "OS" & ARM %in% c("A: Drug X", "B: Placebo"), "adtte")

  res1 <- expect_silent(run(fstg02, proc_data, dataset = "adtte", col = "gray"))
  checkmate::assert_true(ggplot2::is.ggplot(res1))

  res2 <- expect_silent(run(fstg02, proc_data, dataset = "adtte", col_symbol_size = NULL))
  checkmate::assert_true(ggplot2::is.ggplot(res2))
})

test_that("fstg02 works if changes are in subgroups, strata_var, conf_level, and label_all", {
  skip_on_os("windows")
  proc_data <- dunlin::log_filter(syn_data, PARAMCD == "OS" & ARM %in% c("A: Drug X", "B: Placebo"), "adtte")

  res1 <- expect_silent(run(fstg02, proc_data, subgroups = NULL, dataset = "adtte"))
  checkmate::assert_true(ggplot2::is.ggplot(res1))

  res2 <- expect_silent(run(fstg02, proc_data,
    subgroups = c("SEX"), strata_var = c("AGEGR1"),
    conf_level = 0.9, label_all = "All Patients", dataset = "adtte"
  ))
  checkmate::assert_true(ggplot2::is.ggplot(res2))
})

test_that("fstg02 can handle some NA values in subgroups", {
  skip_on_os("windows")
  proc_data <- dunlin::log_filter(syn_data, PARAMCD == "OS" & ARM %in% c("A: Drug X", "B: Placebo"), "adtte")
  proc_data$adtte[1:2, "SEX"] <- NA
  proc_data$adtte[3:4, "AGEGR1"] <- NA
  proc_data$adtte[5:6, "RACE"] <- NA

  res <- expect_silent(run(fstg02, proc_data, dataset = "adtte"))
  checkmate::assert_true(ggplot2::is.ggplot(res))
})

test_that("fstg02 can handle customized time units", {
  proc_data <- dunlin::log_filter(syn_data, PARAMCD == "OS" & ARM %in% c("A: Drug X", "B: Placebo"), "adtte")

  proc_data$adtte[1:10, "AVAL"] <- 28
  new_avalu <- c(rep("MONTHS", 10), as.character(proc_data$adtte$AVALU[-c(1:10)]))
  proc_data$adtte <- proc_data$adtte %>%
    mutate(
      AVALU = factor(.env$new_avalu),
    )

  expect_silent(res1 <- run(fstg02, proc_data, dataset = "adtte"))
  checkmate::assert_true(ggplot2::is.ggplot(res1))

  proc_data$adtte$AVALU <- "DAYS"
  expect_warning(res2 <- run(fstg02, proc_data, dataset = "adtte"))
  checkmate::assert_true(ggplot2::is.ggplot(res2))
})
