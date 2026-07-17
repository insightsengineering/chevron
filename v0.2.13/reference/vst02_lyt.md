# `vst02_1` Layout

`vst02_1` Layout

## Usage

``` r
vst02_lyt(
  arm_var,
  lbl_overall,
  exclude_base_abn,
  lbl_vs_assessment,
  lbl_vs_abnormality
)
```

## Arguments

- arm_var:

  (`string`) variable used for column splitting

- lbl_overall:

  (`string`) label used for overall column, if set to `NULL` the overall
  column is omitted

- exclude_base_abn:

  (`flag`) whether to exclude subjects with baseline abnormality from
  numerator and denominator.

- lbl_vs_assessment:

  (`string`) the label of the assessment variable.

- lbl_vs_abnormality:

  (`string`) the label of the abnormality variable.
