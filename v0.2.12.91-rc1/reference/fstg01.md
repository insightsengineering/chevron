# `FSTG01` Subgroup Analysis of Best Overall Response.

The template produces the subgroup analysis of best overall response
graphic.

## Usage

``` r
fstg01_main(
  adam_db,
  dataset = "adrs",
  arm_var = "ARM",
  rsp_var = "IS_RSP",
  subgroups = c("SEX", "AGEGR1", "RACE"),
  strata_var = NULL,
  stat_var = c("n_tot", "n", "n_rsp", "prop", "or", "ci"),
  ...
)

fstg01_pre(adam_db, ...)

fstg01
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

- rsp_var:

  (`string`) the response variable name to flag whether each subject is
  a binary response or not.

- subgroups:

  (`character`) the subgroups variable name to list baseline risk
  factors.

- strata_var:

  (`character`) required if stratified analysis is performed.

- stat_var:

  (`character`) the names of statistics to be reported in
  `tabulate_rsp_subgroups`.

- ...:

  Further arguments passed to `g_forest` and `extract_rsp_subgroups` (a
  wrapper for `h_odds_ratio_subgroups_df` and
  `h_proportion_subgroups_df`). For details, see the documentation in
  `tern`. Commonly used arguments include `col_symbol_size`, `col`,
  `vline`, `groups_lists`, `conf_level`, `method`, `label_all`, etc.

## Value

the main function returns a `grob` object.

a `gTree` object.

the preprocessing function returns a `list` of `data.frame`.

## Details

- No overall value.

- Keep zero count rows by default.

## Functions

- `fstg01_main()`: Main TLG Function

- `fstg01_pre()`: Preprocessing

## Note

- `adam_db` object must contain the table specified by `dataset` with
  `"PARAMCD"`, `"ARM"`, `"AVALC"`, and the columns specified by
  `subgroups` which is denoted as `c("SEX", "AGEGR1", "RACE")` by
  default.

- If the plot is too large to be rendered in the output, please provide
  `gp`, `width_row_names`, `width_columns` and `width_forest` manually
  to make it fit. See
  [`tern::g_forest`](https://insightsengineering.github.io/tern/latest-tag/reference/g_forest.html)
  for more details.

## Examples

``` r
library(dplyr)
library(dunlin)

proc_data <- log_filter(
  syn_data,
  PARAMCD == "BESRSPI" & ARM %in% c("A: Drug X", "B: Placebo"), "adrs"
)
run(fstg01, proc_data,
  subgroups = c("SEX", "AGEGR1", "RACE"),
  conf_level = 0.90, dataset = "adrs"
)
```
