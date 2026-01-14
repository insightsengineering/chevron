# `cfbt01` Layout

`cfbt01` Layout

## Usage

``` r
cfbt01_lyt(
  arm_var,
  lbl_overall,
  lbl_avisit,
  lbl_param,
  summaryvars,
  summaryvars_lbls,
  row_split_var,
  row_split_lbl,
  visitvar,
  precision,
  page_var,
  .stats,
  skip,
  ...
)
```

## Arguments

- arm_var:

  (`string`) variable used for column splitting

- lbl_overall:

  (`string`) label used for overall column, if set to `NULL` the overall
  column is omitted

- lbl_avisit:

  (`string`) label of the `visitvar` variable.

- lbl_param:

  (`string`) label of the `PARAM` variable.

- summaryvars:

  (`character`) the variables to be analyzed. For this table, `AVAL` and
  `CHG` by default.

- summaryvars_lbls:

  (`character`) the label of the variables to be analyzed.

- row_split_var:

  (`character`) additional row split variables.

- row_split_lbl:

  (`character`) label of further row splits.

- visitvar:

  (`string`) typically one of `"AVISIT"` or user-defined visit
  incorporating `"ATPT"`.

- precision:

  (named `list` of `integer`) where names are values found in the
  `PARAMCD` column and the values indicate the number of digits in
  statistics. If `default` is set, and parameter precision not
  specified, the value for `default` will be used. If `default` is not
  set, the default precision is 2.

- page_var:

  (`string`) variable name prior to which the row split is by page.

- .stats:

  (`character`) statistics names, see
  [`tern::analyze_vars()`](https://insightsengineering.github.io/tern/latest-tag/reference/analyze_variables.html).

- skip:

  Named (`list`) of visit values that need to be inhibited.

- ...:

  not used.

## Value

a `PreDataTableLayouts` object.
