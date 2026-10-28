# `dmt01` Layout

`dmt01` Layout

## Usage

``` r
dmt01_lyt(
  arm_var,
  lbl_overall,
  summaryvars,
  summaryvars_lbls,
  stats,
  precision
)
```

## Arguments

- arm_var:

  (`string`) variable used for column splitting

- lbl_overall:

  (`string`) label used for overall column, if set to `NULL` the overall
  column is omitted

- summaryvars_lbls:

  (`character`) labels corresponding to the analyzed variables.

## Value

a `PreDataTableLayouts` object.
