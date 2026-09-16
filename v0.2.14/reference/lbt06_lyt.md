# `lbt06` Layout

`lbt06` Layout

## Usage

``` r
lbt06_lyt(
  arm_var,
  lbl_overall,
  lbl_param,
  lbl_visit,
  lbl_anrind,
  lbl_bnrind,
  visitvar,
  anrind_var,
  bnrind_var,
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

  (`string`) text label of the `PARAM` variable.

- lbl_visit:

  (`string`) text label of the `AVISIT` variable.

- lbl_anrind:

  (`string`) text label of the `ANRIND` variable.

- lbl_bnrind:

  (`string`) text label of the `BNRIND` variable.

- visitvar:

  (`string`) typically `"AVISIT"` or user-defined visit incorporating
  `"ATPT"`.

- anrind_var:

  (`string`) the variable for analysis reference range indicator.

- bnrind_var:

  (`string`) the variable for baseline reference range indicator.

- page_var:

  (`string`) variable name prior to which the row split is by page.
