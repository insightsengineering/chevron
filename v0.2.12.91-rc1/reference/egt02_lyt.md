# `egt02` Layout

`egt02` Layout

## Usage

``` r
egt02_lyt(
  arm_var = "ACTARM",
  lbl_overall,
  lbl_vs_assessment = "Assessment",
  lbl_vs_abnormality = "Abnormality",
  exclude_base_abn
)
```

## Arguments

- arm_var:

  (`string`) variable used for column splitting

- lbl_overall:

  (`string`) label used for overall column, if set to `NULL` the overall
  column is omitted

- lbl_vs_assessment:

  (`string`) the label of the assessment variable.

- lbl_vs_abnormality:

  (`string`) the label of the abnormality variable.

- exclude_base_abn:

  (`flag`) whether to exclude subjects with baseline abnormality from
  numerator and denominator.

## Value

a `PreDataTableLayouts` object.
