# `dtht01` Layout

`dtht01` Layout

## Usage

``` r
dtht01_lyt(
  arm_var,
  lbl_overall,
  death_flag,
  death_var,
  other_level,
  other_var,
  dose_death_var
)
```

## Arguments

- arm_var:

  (`string`) variable used for column splitting

- lbl_overall:

  (`string`) label used for overall column, if set to `NULL` the overall
  column is omitted

- death_flag:

  (`string`) variable name of death flag.

- death_var:

  (`string`) variable name of death category.

- other_level:

  (`string`) `"Other"` level in death category.

- other_var:

  (`string`) variable name of death cause under `"Other"`.

- dose_death_var:

  (`string`) variable name of the days from last dose.

## Value

a `PreDataTableLayouts` object.
