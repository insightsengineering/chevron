# cml02a_gl ----

test_that("cml02a_gl works with admh dataset", {
  expect_message(res <- run(cml02a_gl, syn_data))
  expect_snapshot(cat(export_as_txt(res, lpp = 100)))
})

# cml02a_gl functions ----

test_that("cml02a_gl works with admh dataset", {
  expect_message(
    res <- cml02a_gl_pre(syn_data) %>%
      cml02a_gl_main() %>%
      cml02a_gl_post()
  )
  expect_snapshot(cat(export_as_txt(res, lpp = 100)))
})
