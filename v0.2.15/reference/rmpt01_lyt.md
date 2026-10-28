# `rmpt01` Layout

`rmpt01` Layout

## Usage

``` r
rmpt01_lyt(
  summaryvars,
  lbl_summaryvars,
  show_tot,
  row_split_var,
  col_split_var,
  overall_col_lbl
)
```

## Arguments

- summaryvars:

  (`string`) variables to be analyzed. The label attribute of the
  corresponding columns in `adex` table of `adam_db` is used as label.

- lbl_summaryvars:

  (`character`) label associated with the analyzed variables.

- show_tot:

  (`flag`) whether to display the cumulative total.

- row_split_var:

  (`character`) additional row split variables.

- col_split_var:

  (`string`) additional column splitting variable.

- overall_col_lbl:

  (`string`) name of the overall column. If `NULL`, no overall level is
  added.
