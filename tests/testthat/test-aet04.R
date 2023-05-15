test_that("aet04 can handle NA values", {
  proc_data <- syn_data
  proc_data$adae <- proc_data$adae %>%
    mutate(
      AEBODSYS = with_label(NA_character_, var_labels_for(syn_data$adae, "AEBODSYS")),
      AEDECOD = with_label(NA_character_, var_labels_for(syn_data$adae, "AEDECOD"))
    )

  res1 <- expect_silent(run(aet04, proc_data))
  expect_snapshot(res1)

  grade_groups <- list(
    "Grade 1-2" = c("1", "2"),
    "Grade 3-4" = c("3", "4"),
    "Grade 5" = c("5")
  )
  res2 <- expect_silent(run(aet04, proc_data, grade_groups = grade_groups))
  expect_identical(res1, res2)

  grade_groups <- list(
    "Grade 1-2" = c("1", "2"),
    "Grade 3-5" = c("3", "4", "5")
  )
  res3 <- expect_silent(run(aet04, proc_data, grade_groups = grade_groups))
  expect_snapshot(res3)
})

test_that("aet04 can handle some NA values", {
  new_aebodsys <- c(NA, "", as.character(syn_data$adae$AEBODSYS[-c(1, 2)]))
  new_aedecod <- c(NA, "", as.character(syn_data$adae$AEDECOD[-c(1, 2)]))
  new_atoxgr <- c(NA, "", as.character(syn_data$adae$ATOXGR[-c(1, 2)]))

  proc_data <- syn_data
  proc_data$adae <- proc_data$adae %>%
    mutate(
      AEBODSYS = with_label(factor(.env$new_aebodsys), var_labels_for(syn_data$adae, "AEBODSYS")),
      AEDECOD = with_label(factor(.env$new_aedecod), var_labels_for(syn_data$adae, "AEDECOD")),
      ATOXGR = factor(.env$new_atoxgr)
    )

  res1 <- expect_silent(run(aet04, proc_data))
  expect_snapshot(res1)

  grade_groups <- list(
    "Grade 1-2" = c("1", "2"),
    "Grade 3-4" = c("3", "4"),
    "Grade 5" = c("5")
  )
  res2 <- expect_silent(run(aet04, proc_data, grade_groups = grade_groups))
  expect_identical(res1, res2)

  grade_groups <- list(
    "Grade 1-2" = c("1", "2"),
    "Grade 3-5" = c("3", "4", "5")
  )
  res3 <- expect_silent(run(aet04, proc_data, grade_groups = grade_groups))
  expect_snapshot(res3)
})
