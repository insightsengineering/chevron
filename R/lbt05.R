# lbt05 ----

#' @describeIn lbt05 Main TLG function
#'
#' @inheritParams gen_args
#' @param map (`data.frame`) with two columns mapping of parameters code (`PARAMCD`) to directions of abnormality
#' (`ABN_DIR`). If a parameter is not in the `map` or if `map` is `NULL`, both directions are analyzed.
#' @returns the main function returns an `rtables` object.
#'
#' @details
#'  * Does not remove rows with zero counts by default.
#'  * Lab test results with missing `AVAL` values are excluded.
#'  * Split columns by arm, typically `ACTARM`.
#'
#' @note
#'  * `adam_db` object must contain an `adlb` table with columns `"ONTRTFL"`, `"PARCAT2"`, `"PARAM"`, `"ANRIND"`,
#'  `"AVALCAT1"`, and column specified by `arm_var`.
#'
#' @export
#'
lbt05_main <- function(adam_db,
                       arm_var = "ACTARM",
                       lbl_overall = NULL,
                       map = lab_paramcd_abn_dir(),
                       ...) {
  assert_all_tablenames(adam_db, c("adsl", "adlb"))
  assert_string(arm_var)
  assert_string(lbl_overall, null.ok = TRUE)
  # expand.grid steps requires levels later.
  assert_data_frame(map, ncols = 2, min.rows = 1, null.ok = TRUE)
  assert_subset(colnames(map), c("PARAMCD", "ABN_DIR"))
  assert_valid_variable(adam_db$adlb, c("PARAM", "AVALCAT1", "ABN_DIR"), types = list("factor"))
  assert_valid_variable(adam_db$adlb, c("USUBJID"), types = list(c("character", "factor")), empty_ok = TRUE)
  assert_valid_variable(adam_db$adsl, c("USUBJID"), types = list(c("character", "factor")))
  assert_valid_var_pair(adam_db$adsl, adam_db$adlb, arm_var)

  lbl_overall <- render_safe(lbl_overall)
  lbl_anrind <- var_labels_for(adam_db$adlb, "ABN_DIR")
  lbl_param <- var_labels_for(adam_db$adlb, "PARAM")


  # This is the only way to get the correspondence between PARAM and PARAMCD if some levels are missing.
  matching <- data.frame(
    PARAMCD = levels(adam_db$adlb$PARAMCD),
    PARAM = levels(adam_db$adlb$PARAM)
  )

  un_mapped <- adam_db$adlb %>%
    dplyr::select("PARAM", "PARAMCD") %>%
    distinct() %>%
    tidyr::drop_na() %>%
    dplyr::anti_join(matching, by = c("PARAM", "PARAMCD"))

  if (nrow(un_mapped) > 0) {
    rlang::abort("unanticipated mapping! Please check for unique correspondence of PARAM and PARAMCD")
  }

  map <- map %||% expand.grid(ABN_DIR = c("Low", "High"), PARAMCD = levels(adam_db$adlb$PARAM))

  # Add both directions by default.
  map_paramcd <- matching %>%
    left_join(tidyr::nest(map, ABN_DIR = "ABN_DIR"), by = "PARAMCD") %>%
    rowwise() %>%
    mutate(ABN_DIR = ifelse((is.null(.data$ABN_DIR)), list(c("Low", "High")), .data$ABN_DIR)) %>%
    tidyr::unnest("ABN_DIR") %>%
    dplyr::select("PARAM", "ABN_DIR") %>%
    mutate(across(everything(), as.character))


  lyt <- lbt05_lyt(
    arm_var = arm_var,
    lbl_overall = lbl_overall,
    lbl_param = lbl_param,
    lbl_anrind = lbl_anrind,
    map = map_paramcd
  )

  tbl <- build_table(lyt, adam_db$adlb, alt_counts_df = adam_db$adsl)

  tbl
}

#' `lbt05` Layout
#'
#' @inheritParams gen_args
#'
#' @param lbl_param (`string`) label of the `PARAM` variable.
#' @param lbl_anrind (`string`) label of the `ANRIND` variable.
#' @param map (`data.frame`) mapping of `PARAM`s to directions of abnormality.
#'
#' @keywords internal
#'
lbt05_lyt <- function(arm_var,
                      lbl_overall,
                      lbl_param,
                      lbl_anrind,
                      map) {
  basic_table(show_colcounts = TRUE) %>%
    split_cols_by_with_overall(arm_var, lbl_overall) %>%
    split_rows_by(
      "PARAM",
      label_pos = "topleft",
      split_label = lbl_param
    ) %>%
    summarize_num_patients(var = "USUBJID", .stats = "unique_count") %>%
    split_rows_by("ABN_DIR", split_fun = trim_levels_to_map(map)) %>%
    count_abnormal_by_marked(
      var = "AVALCAT1",
      variables = list(id = "USUBJID", param = "PARAM", direction = "ABN_DIR"),
      .formats = c("count_fraction" = format_count_fraction_fixed_dp)
    ) %>%
    append_topleft(paste("   ", lbl_anrind))
}

#' @describeIn lbt05 Preprocessing
#'
#' @inheritParams gen_args
#' @returns the preprocessing function returns a `list` of `data.frame`.
#' @export
#'
lbt05_pre <- function(adam_db, ...) {
  adam_db$adlb <- adam_db$adlb %>%
    filter(
      .data$ONTRTFL == "Y",
      .data$PARCAT2 == "LS",
      !is.na(.data$AVAL)
    ) %>%
    mutate(ABN_DIR = factor(case_when(
      ANRIND == "LOW LOW" ~ "Low",
      ANRIND == "HIGH HIGH" ~ "High",
      TRUE ~ ""
    ), levels = c("Low", "High"))) %>%
    mutate(
      ABN_DIR = with_label(.data$ABN_DIR, "Direction of Abnormality"),
      PARAM = with_label(.data$PARAM, "Laboratory Test")
    ) %>%
    mutate(
      across(all_of(c("AVALCAT1", "ABN_DIR")), ~ reformat(.x, missing_rule, .drop = FALSE))
    )

  adam_db
}

#' @describeIn lbt05 Postprocessing
#'
#' @inheritParams gen_args
#' @param keep (`character`) the levels to keep in the table even if they are empty. If `NULL`, all levels are pruned.
#' @returns the postprocessing function returns an `rtables` object or an `ElementaryTable` (null report).
#' @export
#'
lbt05_post <- function(tlg, prune_0 = FALSE, keep = "Any Abnormality", ...) {
  assert_character(keep, null.ok = TRUE)
  if (prune_0) {
    tlg <- prune_table(tlg, prune_func = prune_except(keep))
  }

  std_postprocessing(tlg)
}

#' `LBT05` Table 1 (Default) Laboratory Abnormalities with Single and Replicated Marked.
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' run(lbt05, syn_data)
#'
#' map <- data.frame(PARAMCD = c("ALT", "ALT", "CRP", "CRP", "IGA", "XXX"), ABN_DIR = c("Low", "High"))
#' run(lbt05, syn_data, map = map)
lbt05 <- chevron_t(
  main = lbt05_main,
  preprocess = lbt05_pre,
  postprocess = lbt05_post,
  dataset = c("adsl", "adlb")
)



#' @describeIn lbt05
#'
#' @returns a `data.frame` with the direction of abnormality of each lab parameter code.
#' @export
#' @examples
#' # example code
#' head(lab_paramcd_abn_dir())
#'
lab_paramcd_abn_dir <- function() {
  no_suffix <- c(
    HCRIT = c("Low", "High"),
    HGB = c("Low", "High"),
    WBC = c("Low", "High"),
    PLATE = c("Low", "High"),
    MCH = c("Low", "High"),
    MCHC = c("Low", "High"),
    MCV = c("Low", "High"),
    RBC = c("Low", "High"),
    BANDS = c("High"),
    BANDSF = c("High"),
    BASOS = c("High"),
    BASOSF = c("High"),
    LYMPH = c("Low", "High"),
    LYMPHF = c("Low", "High"),
    MONOS = c("High"),
    MONOSF = c("High"),
    NEUTR = c("Low", "High"),
    NEUTRF = c("Low", "High"),
    EOSIN = c("High"),
    EOSINF = c("High"),
    PTINR = c("High"),
    APTT = c("High"),
    FIB = c("Low"),
    AST = c("High"),
    LDH = c("High"),
    CPK = c("High"),
    CPKMB = c("High"),
    ALKPH = c("High"),
    ALT = c("High"),
    TBILI = c("High"),
    DBILI = c("High"),
    GGT = c("High"),
    BUN = c("High"),
    CREATN = c("High"),
    T3 = c("Low", "High"),
    T4 = c("Low", "High"),
    T4FREE = c("Low", "High"),
    TSH = c("High"),
    ALBUM = c("Low"),
    TPROT = c("Low", "High"),
    TRIG = c("High"),
    CHOLES = c("High"),
    LDL = c("High"),
    HDL = c("Low"),
    CHLOR = c("Low", "High"),
    POTAS = c("Low", "High"),
    SODIUM = c("Low", "High"),
    BICARB = c("Low", "High"),
    CALCUM = c("Low", "High"),
    PHOSAT = c("Low", "High"),
    FASTGL = c("Low", "High"),
    URACID = c("High")
  )

  # add suffixes to list name for each lab parameter code
  res <- c()
  for (i in c("SI", "CV", "LS")) {
    res <- c(res, setNames(no_suffix, paste0(names(no_suffix), i)))
  }

  res %>%
    tibble::enframe(name = "PARAMCD", value = "ABN_DIR") %>%
    as.data.frame()
}
