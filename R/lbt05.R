# lbt05_1 ----

#' @describeIn lbt05_1 Main TLG function
#'
#' @inheritParams gen_args
#' @param lbl_param (`character`) label of the `PARAM` variable.
#' @param lbl_anrind (`character`) label of the `ANRIND` variable.
#'
#' @details
#'  * Lab test results with missing `AVAL` values are excluded.
#'  * Split columns by arm, typically `ACTARM`.
#'
#' @note
#'  * `adam_db` object must contain an `adlb` table with columns `"ONTRTFL"`, `"PARCAT2"`, `"PARAM"`, `"ANRIND"`,
#'  `"AVALCAT1"`, and column specified by `armvar`.
#'
#' @export
#'
lbt05_1_main <- function(adam_db,
                         armvar = "ACTARM",
                         lbl_param = "Laboratory Test",
                         lbl_anrind = "Direction of Abnormality",
                         deco = std_deco("LBT05"),
                         ...) {
  map <- adam_db %>%
    pull_tbl(adlb) %>%
    select(PARAM, abn_dir) %>%
    unique() %>%
    arrange(PARAM, desc(abn_dir))
  if (nrow(map) == 0) {
    map <- expand.grid(
      PARAM = if (is.factor(map$PARAM)) levels(map$PARAM) else "Missing", abn_dir = c("Low", "High"), stringsAsFactors = FALSE
    )
  }
  map <- mutate_all(map, as.character)
  lyt <- lbt05_1_lyt(
    armvar = armvar,
    lbl_param = lbl_param,
    lbl_anrind = lbl_anrind,
    map = map,
    deco = deco,
    ... = ...
  )

  tbl <- build_table(lyt, adam_db$adlb, alt_counts_df = adam_db$adsl)

  tbl
}

#' @describeIn lbt05_1 Layout
#'
#' @inheritParams gen_args
#'
#' @inheritParams gen_args
#' @param lbl_param (`character`) label of the `PARAM` variable.
#' @param lbl_anrind (`character`) label of the `ANRIND` variable.
#' @param map (`data.frame`) mapping of `PARAM`s to directions of abnormality.
#' @param ... not used.
#'
#' @export
#'
lbt05_1_lyt <- function(armvar,
                        lbl_param,
                        lbl_anrind,
                        map,
                        deco,
                        ...) {
  basic_table_deco(deco, show_colcounts = TRUE) %>%
    split_cols_by(armvar) %>%
    split_rows_by(
      "PARAM",
      label_pos = "topleft",
      split_label = lbl_param
    ) %>%
    summarize_num_patients(var = "USUBJID", .stats = "unique_count") %>%
    split_rows_by("abn_dir", split_fun = trim_levels_to_map(map)) %>%
    count_abnormal_by_marked(
      var = "AVALCAT1",
      variables = list(id = "USUBJID", param = "PARAM", direction = "abn_dir"),
      .formats = c("count_fraction" = format_count_fraction_fixed_dp)
    ) %>%
    append_topleft(paste("   ", lbl_anrind))
}

#' @describeIn lbt05_1 Preprocessing
#'
#' @inheritParams gen_args
#' @param ... not used.
#'
#' @export
#'
lbt05_1_pre <- function(adam_db, arm_var = "ACTARM", ...) {
  checkmate::assert_class(adam_db, "dm")

  lbt05_1_check(adam_db, armvar = armvar, req_tables = "adlb", ...)

  db <- adam_db %>%
    dm_zoom_to("adlb") %>%
    filter(
      .data$ONTRTFL == "Y",
      .data$PARCAT2 == "LS",
      !is.na(.data$AVAL)
    ) %>%
    dm_update_zoomed() %>%
    dm_zoom_to("adlb") %>%
    mutate(abn_dir = factor(case_when(
      ANRIND == "LOW LOW" ~ "Low",
      ANRIND == "HIGH HIGH" ~ "High",
      TRUE ~ ""
    ), levels = c("Low", "High"))) %>%
    dm_update_zoomed()

  new_format <- list(
    adlb = list(
      AVALCAT1 = list("<Missing>" = c("", NA, "<Missing>", "No Coding Available")),
      abn_dir = list("<Missing>" = c("", NA, "<Missing>", "No Coding Available"))
    )
  )

  db <- dunlin::apply_reformat(db, new_format)

  db %>%
    dm_zoom_to("adlb") %>%
    filter(AVALCAT1 != "<Missing>") %>%
    filter(abn_dir %in% c("Low", "High")) %>%
    dm_update_zoomed()
}

#' @describeIn lbt05_1 Checks
#'
#' @inheritParams gen_args
#' @param ... not used.
#'
lbt05_1_check <- function(adam_db,
                          req_tables,
                          armvar,
                          ...) {
  assert_all_tablenames(adam_db, req_tables)

  msg <- NULL

  adlb_layout_col <- c("USUBJID", "ONTRTFL", "PARCAT2", "PARAM", "ANRIND", "AVALCAT1")
  adsl_layout_col <- c("USUBJID")

  msg <- c(msg, check_all_colnames(adam_db$adlb, c(armvar, adlb_layout_col)))
  msg <- c(msg, check_all_colnames(adam_db$adsl, c(adsl_layout_col)))

  if (is.null(msg)) {
    TRUE
  } else {
    stop(paste(msg, collapse = "\n  "))
  }
}

#' @describeIn lbt05_1 Postprocessing
#'
#' @inheritParams gen_args
#' @param ... not used.
#'
#' @export
#'
lbt05_1_post <- function(tlg, ...) {
  std_postprocess(tlg)
}

#' `LBT05` Table 1 (Default) Laboratory Abnormalities with Single and Replicated Marked.
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' run(lbt05_1, syn_data)
lbt05_1 <- chevron_t(
  main = lbt05_1_main,
  preprocess = lbt05_1_pre,
  postprocess = lbt05_1_post,
  adam_datasets = c("adsl", "adlb")
)
