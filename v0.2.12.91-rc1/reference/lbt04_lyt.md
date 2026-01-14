# `lbt04` Layout

`lbt04` Layout

## Usage

``` r
lbt04_lyt(
  arm_var,
  lbl_overall,
  lbl_param,
  lbl_abn_var,
  var_parcat,
  var_param,
  row_split_var,
  row_split_lbl,
  analysis_abn_var,
  variables,
  page_var
)
```

## Arguments

- arm_var:

  (`string`) variable used for column splitting

- lbl_overall:

  (`string`) label used for overall column, if set to `NULL` the overall
  column is omitted

- lbl_param:

  (`string`) label of the `PARAM` variable.

- lbl_abn_var:

  (`string`) label of the `analysis_abn_var` variable.

- row_split_var:

  (`character`) additional row split variables.

- variables:

  (`list`) see
  [tern::count_abnormal](https://insightsengineering.github.io/tern/latest-tag/reference/abnormal.html)

- page_var:

  (`string`) variable name prior to which the row split is by page.
