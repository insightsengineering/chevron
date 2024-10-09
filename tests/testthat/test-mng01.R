# mng01 functions ---

test_that("mng01 works as expected with default argument values", {
  withr::with_options(opts_partial_match_old, {
    pre_data <- mng01_pre(syn_data, dataset = "adlb")
    res <- mng01_main(pre_data, dataset = "adlb")
    expect_list(res, len = 3, types = "ggplot")

    skip_on_ci()
    vdiffr::expect_doppelganger("mng01 with default value", res[[1]])
  })
})

test_that("mng01 works as expected with custom argument values", {
  skip_on_os("windows")
  withr::with_options(opts_partial_match_old, {
    col <- c(
      "B: Placebo" = "black",
      "A: Drug X" = "blue",
      "C: Combination" = "gray"
    )

    pre_data <- mng01_pre(syn_data, dataset = "adlb")

    res <- mng01_main(
      pre_data,
      dataset = "adlb",
      ggtheme = ggplot2::theme(axis.text.x = ggplot2::element_text(colour = "red", angle = 30, hjust = 1)),
      line_col = col
    )

    expect_list(res, len = 3, types = "ggplot")

    bad_col <- c(
      "B: Placebo" = "black",
      "A: Drug X" = "blue"
    )

    expect_error(
      mng01_main(pre_data, dataset = "adlb", line_col = bad_col),
      "Missing color matching for C: Combination",
      fixed = TRUE
    )

    skip_on_ci()
    vdiffr::expect_doppelganger("mng01 with custom theme", res[[1]])
  })
})


# mng01 ----

test_that("mng01 works as expected with custom color set", {
  skip_on_os("windows")
  withr::with_options(opts_partial_match_old, {
    col <- c(
      "B: Placebo" = "black",
      "A: Drug X" = "blue",
      "C: Combination" = "gray"
    )
    proc_data <- syn_data

    res <- run(mng01, proc_data, dataset = "adlb", line_col = col)
    expect_list(res, len = 3, types = "ggplot")

    res2 <- run(mng01, proc_data, dataset = "adlb", line_col = unname(col))
    expect_list(res2, len = 3, types = "ggplot")

    skip_on_ci()
    vdiffr::expect_doppelganger("run mng01 with custom color set", res[[1]])
    vdiffr::expect_doppelganger("run mng01 with custom unnamed color set", res2[[1]])
  })
})

test_that("mng01 works as expected with custom line type set", {
  skip_on_os("windows")
  withr::with_options(opts_partial_match_old, {
    lty <- c(
      "B: Placebo" = "99",
      "A: Drug X" = "92",
      "C: Combination" = "solid"
    )
    proc_data <- syn_data

    res <- run(mng01, proc_data, dataset = "adlb", line_type = lty)
    expect_list(res, len = 3, types = "ggplot")

    res2 <- run(mng01, proc_data, dataset = "adlb", line_type = unname(lty))
    expect_list(res, len = 3, types = "ggplot")

    skip_on_ci()
    vdiffr::expect_doppelganger("run mng01 with custom line type set", res[[1]])
    vdiffr::expect_doppelganger("run mng01 with custom unnamed line type set", res2[[1]])
  })
})

test_that("mng01 works with table = NULL", {
  withr::with_options(opts_partial_match_old, {
    proc_data <- syn_data
    res <- run(mng01, proc_data, dataset = "adlb", table = NULL)
    expect_list(res, len = 3, types = "ggplot")

    skip_on_ci()
    vdiffr::expect_doppelganger("run mng01 without table", res[[1]])
  })
})

test_that("mng01 works with combination of x variables", {
  skip_on_os("windows")
  withr::with_options(opts_partial_match_old, {
    proc_data <- syn_data
    res <- run(
      mng01,
      proc_data,
      dataset = "adlb",
      x_var = c("AVISIT", "AVISITN")
    )

    expect_list(res, len = 3, types = "ggplot")

    skip_on_ci()
    vdiffr::expect_doppelganger("run mng01 with combination of x variables", res[[1]])
  })
})

test_that("mng01 works with numeric x variable", {
  withr::with_options(opts_partial_match_old, {
    proc_data <- syn_data
    proc_data$adlb$AVISITN[1:20] <- 10
    proc_data$adlb$AVISITN[21:40] <- -3

    res <- run(
      mng01,
      proc_data,
      dataset = "adlb",
      x_var = c("AVISITN")
    )

    expect_list(res, len = 3, types = "ggplot")

    skip_on_ci()
    vdiffr::expect_doppelganger("run mng01 with numeric x variables", res[[1]])
  })
})

test_that("mng01 works with numeric jitter", {
  withr::with_options(opts_partial_match_old, {
    proc_data <- syn_data

    res <- run(
      mng01,
      proc_data,
      dataset = "adlb",
      jitter = 0.7
    )

    expect_list(res, len = 3, types = "ggplot")
    skip_on_ci()
    vdiffr::expect_doppelganger("run mng01 with jitter", res[[1]])
  })
})
