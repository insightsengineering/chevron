# `aet04` Layout

`aet04` Layout

## Usage

``` r
aet04_lyt(
  arm_var,
  total_var,
  lbl_overall,
  lbl_aebodsys,
  lbl_aedecod,
  grade_groups
)
```

## Arguments

- arm_var:

  (`string`) variable used for column splitting

- total_var:

  (`string`) variable to create summary of all variables.

- lbl_overall:

  (`string`) label used for overall column, if set to `NULL` the overall
  column is omitted

- lbl_aebodsys:

  (`string`) text label for `AEBODSYS`.

- lbl_aedecod:

  (`string`) text label for `AEDECOD`.

- grade_groups:

  (`list`) putting in correspondence toxicity grades and labels.

## Value

a `PreDataTableLayouts` object.
