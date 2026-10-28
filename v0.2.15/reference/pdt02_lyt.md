# `pdt02` Layout

`pdt02` Layout

## Usage

``` r
pdt02_lyt(
  arm_var,
  lbl_overall,
  lbl_dvreas_var,
  lbl_dvterm_var,
  dvreas_var,
  dvterm_var
)
```

## Arguments

- arm_var:

  (`string`) variable used for column splitting

- lbl_overall:

  (`string`) label used for overall column, if set to `NULL` the overall
  column is omitted

- lbl_dvreas_var:

  (`string`) label for the variable defining the reason for deviation.

- lbl_dvterm_var:

  (`string`) label for the variable defining the protocol deviation
  term.

- dvreas_var:

  (`string`) the variable defining the reason for deviation. By default
  `DVREAS`.

- dvterm_var:

  (`string`) the variable defining the protocol deviation term. By
  default `DVTERM`.
