# `KMG01` Kaplan-Meier Plot 1.

`KMG01` Kaplan-Meier Plot 1.

## Usage

``` r
kmg01_main(
  adam_db,
  dataset = "adtte",
  arm_var = "ARM",
  strata = NULL,
  strat = lifecycle::deprecated(),
  ...
)

kmg01_pre(adam_db, dataset = "adtte", ...)

kmg01
```

## Format

An object of class `chevron_g` of length 1.

## Arguments

- adam_db:

  (`list` of `data.frames`) object containing the `ADaM` datasets

- dataset:

  (`string`) the name of a table in the `adam_db` object.

- arm_var:

  (`string`) variable used for column splitting

- strata:

  (`character`) the variable name of stratification variables.

- strat:

  (`character`) **\[deprecated\]**; for backwards compatibility only.
  Use `strata` instead.

- ...:

  Further arguments passed to `g_km` and `control_coxph`. For details,
  see the documentation in `tern`. Commonly used arguments include
  `col`, `pval_method`, `ties`, `conf_level`, `conf_type`,
  `annot_coxph`, `annot_stats`, etc.

## Value

the main function returns a `gTree` object.

a `gTree` object.

the preprocessing function returns a `list` of `data.frame`.

## Details

- No overall value.

## Functions

- `kmg01_main()`: Main TLG Function

- `kmg01_pre()`: Preprocessing

## Note

- `adam_db` object must contain the table specified by `dataset` with
  the columns specified by `arm_var`.

## Examples

``` r
library(dplyr)
library(dunlin)

col <- c(
  "A: Drug X" = "black",
  "B: Placebo" = "blue",
  "C: Combination" = "gray"
)

pre_data <- log_filter(syn_data, PARAMCD == "OS", "adtte")
run(kmg01, pre_data, dataset = "adtte", col = col)
```
