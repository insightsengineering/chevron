# lbt05_1 ----

#' @describeIn lbt05_1 Main TLG function
#'
#' @inheritParams gen_args
#' @param lbl_param (`character`) label of the `PARAM` variable.
#' @param lbl_anrind (`character`) label of the `ANRIND` variable.
#'
#' @details
#'  * `ANRIND` = "LOW LOW" when `ANRIND` = "LOW" and `AVAL` <= 10th quantile of all `AVAL`s for
#'  a given `PARAM` value.
#'  * `ANRIND` = "HIGH HIGH" when `ANRIND` = "HIGH" and `AVAL` >= 90th quantile of all `AVAL`s for
#'  a given `PARAM` value.
#'  * Lab test results with missing `AVAL` values are excluded.
#'  * Split columns by arm, typically `ACTARM`.
#'
#' @note
#'  * `adam_db` object must contain an `adlb` table with columns `"PARCAT2"`, `"PARAM"`, `"ANRIND"`,
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
  map <- unique(
    adam_db$adlb[
      adam_db$adlb$abn_dir %in% c("Low", "High") & adam_db$adlb$AVALCAT1 != "<Missing>", c("PARAM", "abn_dir")
    ]
  ) %>%
    lapply(as.character) %>%
    as.data.frame() %>%
    arrange(PARAM, desc(abn_dir))

  if (nrow(map) == 0) {
    stop("Abnormality mapping cannot be constructed if all values of ANRIND are missing.")
  }


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
lbt05_1_pre <- function(adam_db, ...) {
  checkmate::assert_class(adam_db, "dm")

  lbt05_1_check(adam_db, ...)

  avalcat1 <- c("LAST", "REPLICATED", "SINGLE")

  db <- adam_db %>%
    dm_zoom_to("adlb") %>%
    filter(
      .data$ONTRTFL == "Y",
      .data$PARCAT2 == "LS",
      !is.na(.data$AVAL)
    ) %>%
    dm_update_zoomed() %>%
    dm_add_pk("adlb", "PARAMCD") %>%
    dm_add_fk("adlb", "PARAMCD", "adlb") %>%
    dm_zoom_to("adlb") %>%
    group_by(PARAMCD) %>%
    summarise(as_tibble(t(quantile(AVAL, probs = c(0.1, 0.9)))), .groups = "drop_last") %>%
    rename(q1 = 2, q2 = 3) %>%
    left_join("adlb") %>%
    group_by(USUBJID, PARAMCD, BASETYPE) %>%
    mutate(
      ANRIND = factor(
        case_when(
          ANRIND == "LOW" & AVAL <= q1 ~ "LOW LOW",
          ANRIND == "HIGH" & AVAL >= q2 ~ "HIGH HIGH",
          TRUE ~ as.character(ANRIND)
        ),
        levels = c("", "HIGH", "HIGH HIGH", "LOW", "LOW LOW", "NORMAL")
      ),
      AVALCAT1 = if ("AVALCAT1" %in% names(.)) AVALCAT1 else factor(
        case_when(
          ANRIND %in% c("HIGH HIGH", "LOW LOW") ~
            sample(x = avalcat1, size = n(), replace = TRUE, prob = c(0.3, 0.6, 0.1)),
          TRUE ~ ""
        ),
        levels = c("", avalcat1)
      ),
      PARCAT2 = factor(ifelse(ANRIND %in% c("HIGH HIGH", "LOW LOW"), "LS",
        sample(c("SI", "CV", "LS"), size = n(), replace = TRUE)
      ))
    ) %>%
    ungroup() %>%
    mutate(abn_dir = factor(case_when(
      ANRIND == "LOW LOW" ~ "Low",
      ANRIND == "HIGH HIGH" ~ "High",
      TRUE ~ ""
    ))) %>%
    dm_update_zoomed()

  new_format <- list(
    adlb = list(
      AVALCAT1 = list("<Missing>" = c("", NA, "<Missing>", "No Coding Available")),
      abn_dir = list("<Missing>" = c("", NA, "<Missing>", "No Coding Available"))
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
