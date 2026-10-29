# `egt03` Layout

`egt03` Layout

## Usage

``` r
egt03_lyt(
  arm_var,
  splitvar,
  summaryvar,
  lbl_armvar,
  lbl_summaryvars,
  lbl_param,
  page_var
)
```

## Arguments

- arm_var:

  (`string`) variable used for column splitting

- splitvar:

  (`character`) variables to be analyzed, typically `"ANRIND"`. Labels
  of the corresponding columns are used as subtitles.

- summaryvar:

  (`character`) variables to be analyzed, typically `"BNRIND"`. Labels
  of the corresponding columns are used as subtitles.

- lbl_armvar:

  (`string`) label of the `arm_var` variable.

- lbl_summaryvars:

  (`string`) label of the `summaryvar` variable.

- page_var:

  (`string`) variable name prior to which the row split is by page.

## Value

a `PreDataTableLayouts` object.
