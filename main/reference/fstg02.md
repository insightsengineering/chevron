# `FSTG02` Subgroup Analysis of Survival Duration.

The template produces the subgroup analysis of survival duration
graphic.

## Usage

``` r
fstg02_main(
  adam_db,
  dataset = "adtte",
  arm_var = "ARM",
  subgroups = c("SEX", "AGEGR1", "RACE"),
  strata_var = NULL,
  stat_var = c("n_tot", "n", "median", "hr", "ci"),
  ...
)

fstg02_pre(adam_db, ...)

fstg02
```

## Format

An object of class `chevron_g` of length 1.

## Arguments

- adam_db:

  (`list` of `data.frames`) object containing the `ADaM` datasets

- dataset:

  (`string`) the name of a table in the `adam_db` object.

- arm_var:

  (`string`) the arm variable name used for group splitting.

- subgroups:

  (`character`) the subgroups variable name to list baseline risk
  factors.

- strata_var:

  (`character`) required if stratified analysis is performed.

- stat_var:

  (`character`) the names of statistics to be reported in
  `tabulate_survival_subgroups`.

- ...:

  Further arguments passed to `g_forest` and `extract_rsp_subgroups` (a
  wrapper for `h_odds_ratio_subgroups_df` and
  `h_proportion_subgroups_df`). For details, see the documentation in
  `tern`. Commonly used arguments include `gp`, `col_symbol_size`,
  `col`, `vline`, `groups_lists`, `conf_level`, `method`, `label_all`,
  etc.

## Value

the main function returns a `gTree` object.

a `gTree` object.

the preprocessing function returns a `list` of `data.frame`.

## Details

- No overall value.

- Keep zero count rows by default.

## Functions

- `fstg02_main()`: Main TLG Function

- `fstg02_pre()`: Preprocessing

## Note

- `adam_db` object must contain the table specified by `dataset` with
  `"PARAMCD"`, `"ARM"`, `"AVAL"`, `"AVALU"`, `"CNSR"`, and the columns
  specified by `subgroups` which is denoted as
  `c("SEX", "AGEGR1", "RACE")` by default.

- If the plot is too large to be rendered in the output, please refer to
  `FSTG01`.

## Examples

``` r
library(dplyr)
library(dunlin)

proc_data <- log_filter(
  syn_data,
  PARAMCD == "OS" & ARM %in% c("A: Drug X", "B: Placebo"), "adtte"
)
run(fstg02, proc_data,
  subgroups = c("SEX", "AGEGR1", "RACE"),
  conf_level = 0.90, dataset = "adtte"
)
```
