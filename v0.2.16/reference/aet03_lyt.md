# `aet03` Layout

`aet03` Layout

## Usage

``` r
aet03_lyt(arm_var, lbl_overall, lbl_aebodsys, lbl_aedecod, intensity_grade)
```

## Arguments

- arm_var:

  (`string`) variable used for column splitting

- lbl_overall:

  (`string`) label used for overall column, if set to `NULL` the overall
  column is omitted

- lbl_aebodsys:

  (`string`) text label for `AEBODSYS`.

- lbl_aedecod:

  (`string`) text label for `AEDECOD`.

- intensity_grade:

  (`character`) describing the intensity levels present in the dataset.

## Value

a `PreDataTableLayouts` object.
