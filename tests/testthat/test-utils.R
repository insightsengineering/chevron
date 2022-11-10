
# dm_unite ----

test_that("dm_unite works as expected with characters", {

  x <- dm_unite(dm::dm_nycflights13(), "airlines", c("carrier", "name"), new = "FUSION")
  checkmate::expect_factor(x$airlines$FUSION)
  expect_identical(x$airlines$FUSION, factor(paste(x$airlines$carrier, x$airlines$name, sep = ".")))
})

test_that("dm_unite works as expected with factors", {

  dat <- dm::dm_nycflights13()
  dat <- dat %>%
    dm_zoom_to("airlines") %>%
    mutate(
      carrier_fct = forcats::fct_relevel(factor(carrier), "MQ"),
      name_fct = factor(name)
    ) %>%
    dm_update_zoomed()

  res <- dm_unite(dat, "airlines", c("carrier_fct", "name_fct"), new = "FUSION")
  checkmate::expect_factor(res$airlines$FUSION)
  expect_identical(as.character(res$airlines$FUSION[[1]]), "9E.Endeavor Air Inc.")
  expect_identical(levels(res$airlines$FUSION)[[1]], "MQ.Envoy Air")
})

test_that("dm_unite works as expected with more than 2 columns", {

  dat <- dm::dm_nycflights13()
  dat <- dat %>%
    dm_zoom_to("airports") %>%
    mutate(
      faa_fct = forcats::fct_relevel(factor(faa), "TYS")
    ) %>%
    dm_update_zoomed()

  res <- dm_unite(dat, "airports", c("faa_fct", "name", "dst"), new = "FUSION")
  checkmate::expect_factor(res$airports$FUSION)
  expect_identical(as.character(res$airports$FUSION[[1]]), "ALB.Albany Intl.A")
  expect_identical(levels(res$airports$FUSION)[[1]], "TYS.Mc Ghee Tyson.A")
})
