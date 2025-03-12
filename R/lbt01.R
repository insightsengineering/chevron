# lbt01 ----

#' @describeIn lbt01 Main TLG function
#'
#' @inherit cfbt01_main
#'
#' @include cfbt01.R
#' @returns the main function returns an `rtables` object.
#'
#' @export
#'
lbt01_main <- modify_default_args(cfbt01_main, dataset = "adlb", precision = quote(lab_paramcd_precision()))

#' @describeIn lbt01 Preprocessing
#'
#' @inherit cfbt01_pre
#' @returns the preprocessing function returns a `list` of `data.frame`.
#' @export
#'
lbt01_pre <- modify_default_args(cfbt01_pre, dataset = "adlb")

#' `LBT01` Lab Results and Change from Baseline by Visit Table.
#'
#' The `LBT01` table provides an
#' overview of the Lab values and its change from baseline of each respective arm
#' over the course of the trial.
#'
#' @include chevron_tlg-S4class.R
#' @export
#'
#' @examples
#' run(lbt01, syn_data)
lbt01 <- chevron_t(
  main = lbt01_main,
  preprocess = lbt01_pre,
  postprocess = cfbt01_post,
  dataset = c("adlb", "adsl")
)

#' @describeIn lbt01
#'
#' @returns a named `list` with the precision of each lab parameter code (default is `2`).
#' @export
#' @examples
#' # example code
#' head(lab_paramcd_precision())
#'
lab_paramcd_precision <- function() {
  no_suffix <- c(
    HCRIT = 2,
    HGB = 0,
    WBC = 1,
    PLATE = 0,
    MCH = 1,
    MCHC = 0,
    MCV = 0,
    RBC = 2,
    BANDS = 2,
    BANDSF = 2,
    BASOS = 2,
    BASOSF = 2,
    LYMPH = 2,
    LYMPHF = 2,
    MONOS = 2,
    MONOSF = 2,
    NEUTR = 2,
    NEUTRF = 2,
    EOSIN = 2,
    EOSINF = 2,
    PTINR = 2,
    APTT = 1,
    FIB = 2,
    AST = 0,
    LDH = 0,
    CPK = 0,
    CPKMB = 0,
    ALKPH = 0,
    ALT = 0,
    TBILI = 1,
    DBILI = 1,
    GGT = 0,
    BUN = 1,
    CREATN = 0,
    T3 = 2,
    T4 = 0,
    T4FREE = 0,
    TSH = 1,
    ALBUM = 1,
    TPROT = 0,
    TRIG = 2,
    CHOLES = 2,
    LDL = 2,
    HDL = 2,
    CHLOR = 0,
    POTAS = 1,
    SODIUM = 0,
    BICARB = 0,
    CALCUM = 2,
    PHOSAT = 2,
    FASTGL = 2,
    URACID = 0,
    USG = 3
  )

  # add suffixes to list name for each lab parameter code
  res <- c()
  for (i in c("SI", "CV", "LS")) {
    res <- c(res, setNames(no_suffix, paste0(names(no_suffix), i)))
  }

  as.list(res)
}
