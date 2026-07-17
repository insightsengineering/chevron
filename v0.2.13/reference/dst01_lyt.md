# `dst01` Layout

`dst01` Layout

## Usage

``` r
dst01_lyt(arm_var, lbl_overall, study_status_var, detail_vars, trt_status_var)
```

## Arguments

- arm_var:

  (`string`) variable. Usually one of `ARM`, `ACTARM`, `TRT01A`, or
  `TRT01A`.

- lbl_overall:

  (`string`) label used for overall column, if set to `NULL` the overall
  column is omitted

- study_status_var:

  (`string`) variable used to define patient status. Default is
  `EOSSTT`, however can also be a variable name with the pattern
  `EOPxxSTT` where `xx` must be substituted by 2 digits referring to the
  analysis period.

- detail_vars:

  Named (`list`) of grouped display of `study_status_var`.

- trt_status_var:

  (`string`) variable of treatment status.

## Value

a `PreDataTableLayouts` object.
