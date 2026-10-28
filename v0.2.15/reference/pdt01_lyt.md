# `pdt01` Layout

`pdt01` Layout

## Usage

``` r
pdt01_lyt(
  arm_var,
  lbl_overall,
  dvcode_var,
  lbl_dvcode_var,
  dvterm_var,
  lbl_dvterm_var
)
```

## Arguments

- arm_var:

  (`string`) variable used for column splitting

- lbl_overall:

  (`string`) label used for overall column, if set to `NULL` the overall
  column is omitted

- dvcode_var:

  (`string`) the variable defining the protocol deviation coded term. By
  default `DVDECOD`.

- lbl_dvcode_var:

  (`string`) label for the variable defining the protocol deviation
  coded term.

- dvterm_var:

  (`string`) the variable defining the protocol deviation term. By
  default `DVTERM`.

- lbl_dvterm_var:

  (`string`) label for the variable defining the protocol deviation
  term.
