# coxt02_1 ----

#' @describeIn coxt02_1 Main TLG function
#'
#' @inheritParams gen_args
#' @param lbl_ (`string`) text label for ``. If `NULL`, the value of the argument defaults to the label
#'   of the corresponding column in the `ad` table.
#' @param lbl_ (`string`) text label for ``. If `NULL`, the value of the argument defaults to the label of
#'   the corresponding column in the `ad` table.
#'
#' @details
#'  * Numbers represent absolute numbers of patients and fraction of `N`, or absolute number of event when specified.
#'  * Remove zero-count rows unless overridden with `prune_0 = FALSE`.
#'  * Split columns by arm.
#'  * Does not include a total column by default.
#'  * Order by body system alphabetically and within body system and medical condition by decreasing total number of
#'  patients with the specific condition.
#'
#' @note
#'   * `adam_db` object must contain an `ad` table with columns `""` and `""`.
#'
#' @export
#'
coxt02_1_main <- function(adam_db,
                         arm_var = "ARM",
                         lbl_ = "",
                         conf_level = .95,
                         deco = std_deco("COXT02"),
                         ...) {
  dbsel <- get_db_data(adam_db, "adsl", "adtte")

  multivar_model <- fit_coxreg_multivar(
    variables = list(
      time = "AVAL", event = "event", arm = "ARMCD",
      covariates = c("SEX", "AGE")
    ),
    data = dbsel$adtte
  )

  df <- tidy(multivar_model)

  lyt <- coxt02_1_lyt(
    arm_var = arm_var,
    lbl_mhbodsys = lbl_mhbodsys,
    conf_level = conf_level,
    deco = deco
  )

  tbl <- build_table(lyt, df)

  tbl
}

#' @describeIn coxt02_1 Layout
#'
#' @inheritParams coxt02_1_main
#'
#' @export
#'
coxt02_1_lyt <- function(arm_var,
                        lbl_,
                        conf_level,
                        deco) {
  basic_table_deco(deco) %>%
    split_cols_by(var = arm_var) %>%
    add_colcounts() %>%
    split_rows_by("term",
                  child_labels = "hidden",
                  split_fun = drop_split_levels,
                  label_pos = "topleft",
                  split_label = obj_label(df$term)
    ) %>%
    summarize_coxreg(multivar = TRUE, conf_level = conf_level) %>%
    append_topleft(paste0("  ", lbl_))
}

#' @describeIn coxt02_1 Preprocessing
#'
#' @inheritParams gen_args
#'
#' @export
#'
coxt02_1_pre <- function(adam_db, ...) {
  checkmate::assert_class(adam_db, "dm")

  adam_db <- adam_db %>%
    dm_zoom_to("adtte") %>%
    filter(
      .data$PARAMCD == "OS",
      .data$SEX %in% c("F", "M"),
      .data$RACE %in% c("ASIAN", "BLACK OR AFRICAN AMERICAN", "WHITE")
    ) %>%
    mutate(
      ARM = droplevels(relevel(.data$ARM, "B: Placebo")),
      SEX = droplevels(.data$SEX),
      RACE = droplevels(.data$RACE)
    ) %>%
    mutate(event = 1 - .data$CNSR) %>%
    var_relabel(
      ARM = "Planned Arm",
      SEX = "Sex",
      RACE = "Race",
      AGE = "Age"
    )
    dm_update_zoomed()

  new_format <- list(
    admh = list(
      MHBODSYS = rule(
        "No Coding available" = c("", NA)
      ),
      MHDECOD = rule(
        "No Coding available" = c("", NA)
      )
    )
  )

  dunlin::reformat(adam_db, new_format, na_last = TRUE)
}

#' @describeIn coxt02_1 Postprocessing
#'
#' @inheritParams gen_args
#'
#' @export
#'
coxt02_1_post <- function(tlg, prune_0 = FALSE, ...) {
  if (prune_0) {
    tlg <- smart_prune(tlg)
  }
  std_postprocess(tlg)
}

#' `COXT02` Table 1 (Default) Multi-Variable Cox Regression Model Table 1.
#'
#' The `COXT02` table follows the same principles as the general Cox model analysis
#' and produces the estimates for each of the covariates included in the model
#' (usually the main effects without interaction terms).
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' run(coxt02_1, syn_data)
coxt02_1 <- chevron_t(
  main = coxt02_1_main,
  preprocess = coxt02_1_pre,
  postprocess = coxt02_1_post,
  adam_datasets = c("adsl", "adtte")
)
