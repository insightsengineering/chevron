# lbt05_1 ----

#' @describeIn lbt05_1 Main TLG function
#'
#' @inheritParams gen_args
#' @param lbl_param (`character`) label of the `PARAM` variable.
#' @param lbl_anrind (`character`) label of the `ANRIND` variable.
#'
#' @details
#'  * Only count LOW or HIGH values.
#'  * Lab test results with missing `ANRIND` values are excluded.
#'  * Split columns by arm, typically `ACTARM`.
#'  * Does not include a total column by default.
#'
#' @note
#'  * `adam_db` object must contain an `adlb` table with columns `"PARCAT1"`, `"PARCAT2"`, `"PARAM"`, `"ANRIND"`,
#'  and column specified by `armvar`.
#'
#' @export
#'
lbt05_1_main <- function(adam_db,
                         armvar = "ACTARM",
                         lbl_param = "Laboratory Test",
                         lbl_anrind = "Direction of Abnormality",
                         deco = std_deco("LBT05"),
                         ...) {
  browser()
  map <- unique(
    adam_db$adlb[
      adam_db$adlb$abn_dir %in% c("Low", "High"), c("PARAM", "abn_dir")
    ]
  ) %>%
    lapply(as.character) %>%
    as.data.frame() %>%
    arrange(PARAM, desc(abn_dir))

  lyt <- lbt05_1_lyt(
    armvar = armvar,
    lbl_param = lbl_param,
    lbl_anrind = lbl_anrind,
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
#' @param ... not used.
#'
#' @export
#'
lbt05_1_lyt <- function(armvar,
                        lbl_param,
                        lbl_anrind,
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
      variables = list(id = "USUBJID", param = "PARAM", direction = "abn_dir")
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
lbt05_1_pre <- function(adam_db, ...) {
  checkmate::assert_class(adam_db, "dm")

  lbt05_1_check(adam_db, ...)

  qntls <- adam_db %>%
    dm_zoom_to("adlb") %>%
    group_by(PARAMCD) %>%
    summarise(as_tibble(t(quantile(AVAL, probs = c(0.1, 0.9)))), .groups = "drop_last") %>%
    rename(q1 = 2, q2 = 3)

  avalcat1 <- c("LAST", "REPLICATED", "SINGLE")
  browser()
  db <- adam_db %>%
    dm_zoom_to("adlb") %>%
    filter(
      .data$ONTRTFL == "Y",
      .data$PARCAT2 == "LS"
    ) %>%
    dm_update_zoomed() %>%
    dm_zoom_to("adlb") %>%
    mutate(
      q1 = qntls$q1[PARAMCD == qntls$PARAMCD],
      q2 = qntls$q1[PARAMCD == qntls$PARAMCD]) %>%
    # group_by(USUBJID, PARAMCD, BASETYPE) %>%
    # mutate(
    #   q1 = qntls$q1[PARAMCD == qntls$PARAMCD]
    #   ANRIND = factor(case_when(
    #     ANRIND == "LOW" & AVAL <= qntls$q1[qntls$PARAMCD == PARAMCD] ~ "LOW LOW",
    #     ANRIND == "HIGH" & AVAL >= qntls$q2[qntls$PARAMCD == PARAMCD] ~ "HIGH HIGH",
    #     TRUE ~ as.character(ANRIND)
    #   ),
    #   levels = c("", "HIGH", "HIGH HIGH", "LOW", "LOW LOW", "NORMAL")
    #   ),
    #   AVALCAT1 = factor(case_when(
    #     ANRIND %in% c("HIGH HIGH", "LOW LOW") ~
    #       sample(x = avalcat1, size = n(), replace = TRUE, prob = c(0.3, 0.6, 0.1)),
    #     TRUE ~ ""
    #   ),
    #   levels = c("", avalcat1)
    #   ),
    #   PARCAT2 = factor(ifelse(ANRIND %in% c("HIGH HIGH", "LOW LOW"), "LS",
    #                           sample(c("SI", "CV", "LS"), size = n(), replace = TRUE)
    #   ))) %>%
    # ungroup() %>%
    # mutate(abn_dir = factor(case_when(
    #     ANRIND == "LOW LOW" ~ "Low",
    #     ANRIND == "HIGH HIGH" ~ "High",
    #     TRUE ~ ""
    #   ))
    # ) %>%
    # filter(
    #   .data$AVALCAT1 != "<Missing>"
    # ) %>%
    dm_update_zoomed()

  new_format <- list(
    adlb = list(
      AVALCAT1 = list("<Missing>" = c("", NA, "<Missing>", "No Coding Available"))
    )
  )

  db <- dunlin::apply_reformat(db, new_format)
  db
}

#' @describeIn lbt05_1 Checks
#'
#' @inheritParams gen_args
#' @param ... not used.
#'
lbt05_1_check <- function(adam_db,
                          req_tables = c("adsl", "adlb"),
                          armvar = "ACTARM",
                          ...) {
  assert_all_tablenames(adam_db, req_tables)

  msg <- NULL

  adlb_layout_col <- c("USUBJID", "ONTRTFL", "PARCAT2", "PARAM", "ANRIND")
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

#' `LBT05` Table 1 (Default) Laboratory Abnormalities Not Present at Baseline.
#'
#' The `LBT05` table provides an
#' overview of laboratory abnormalities not present at baseline.
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
