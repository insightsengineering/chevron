# syn_data ----

#' Example `adam` Synthetic Data
#'
#' @format A named `list` of 19 `data.frames`:
#'     - `adsl`
#'     - `adab`
#'     - `adae`
#'     - `adaette`
#'     - `adcm`
#'     - `addv`
#'     - `adeg`
#'     - `adex`
#'     - `adhy`
#'     - `adlb`
#'     - `admh`
#'     - `adpc`
#'     - `adpp`
#'     - `adqs`
#'     - `adrs`
#'     - `adsub`
#'     - `adtr`
#'     - `adtte`
#'     - `advs`
#' @source based on `scda::synthetic_cdisc_data("rcd_2022_06_27")`
"syn_data"


# ctc_dir ----

#' ctc grade data
"ctc_dir"

# mla_grid ----
#' mla grade data
"mla_grid"

#' Get ctc grade data by version
#' @param version (`number`) version of ctc grading.
#' @export
get_ctc <- function(version = 4) {
  ctc_dir %>%
    filter(CTCv == version) %>%
    select(PARAMCD, GRADE_DIR)
}
