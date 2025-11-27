# `EGT05_QTCAT` Layout

`EGT05_QTCAT` Layout

## Usage

``` r
egt05_qtcat_lyt(
  arm_var,
  lbl_overall,
  lbl_avisit,
  lbl_param,
  lbl_cat,
  summaryvars,
  summaryvars_lbls,
  row_split_var,
  row_split_lbl,
  visitvar,
  page_var
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

- lbl_cat:

  (`string`) label of the Category of `summaryvars` variable. Default as
  `Category`.

- summaryvars:

  (`character`) the variables to be analyzed. `AVALCAT1` and `CHGCAT1`
  by default.

- summaryvars_lbls:

  (`character`) the label of the variables to be analyzed.

- row_split_var:

  (`character`) additional row split variables.

- visitvar:

  (`string`) typically `"AVISIT"` or user-defined visit incorporating
  `"ATPT"`.

- page_var:

  (`string`) variable name prior to which the row split is by page.

## Value

a `PreDataTableLayouts` object.
