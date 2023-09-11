# cml02a_gl ----

test_that("cml02a_gl works with admh dataset", {
  expect_message(res <- run(cml02a_gl, syn_data))
  expect_snapshot(cat(export_as_txt(res, lpp = 100)))
})
