# `COXT01` Layout

`COXT01` Layout

## Usage

``` r
coxt01_lyt(variables, col_split, lbl_vars, control, multivar, ...)
```

## Arguments

- variables:

  (`list`) list of variables in a Cox proportional hazards regression
  model.

- lbl_vars:

  (`string`) text label for the a Cox regression model variables.

- multivar:

  (`flag`) indicator of whether multivariate cox regression is
  conducted.

- ...:

  Further arguments passed to
  [`tern::control_coxreg()`](https://insightsengineering.github.io/tern/latest-tag/reference/control_coxreg.html).

## Value

a `PreDataTableLayouts` object.
