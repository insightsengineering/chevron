# `ext01` Layout

`ext01` Layout

## Usage

``` r
ext01_lyt(
  arm_var,
  lbl_overall,
  summaryvars,
  summaryvars_lbls,
  row_split_var,
  row_split_lbl,
  page_var,
  map,
  stats = list(default = c("n", "mean_sd", "median", "range", "count_fraction")),
  precision = list()
)
```

## Arguments

- arm_var:

  (`string`) variable used for column splitting

- lbl_overall:

  (`string`) label used for overall column, if set to `NULL` the overall
  column is omitted

- summaryvars:

  (`character`) the name of the variable to be analyzed. By default
  `"AVAL"`.

- summaryvars_lbls:

  (`character`) the label associated with the analyzed variable.

- row_split_var:

  (`character`) additional row split variables.

- page_var:

  (`string`) variable name prior to which the row split is by page.

## Value

a `PreDataTableLayouts` object.
