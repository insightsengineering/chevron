# `aet05` Layout

`aet05` Layout

## Usage

``` r
aet05_lyt(arm_var, lbl_overall, param_label, vars, n_events, control)
```

## Arguments

- arm_var:

  (`string`) variable used for column splitting

- lbl_overall:

  (`string`) label used for overall column, if set to `NULL` the overall
  column is omitted

- param_label:

  (`string`) variable for parameter code.

- vars:

  (`string`) variable for the primary analysis variable to be iterated
  over.

- n_events:

  (`string`) variable to count the number of events observed.

- control:

  (`list`) parameters for estimation details, specified by using the
  helper function control_incidence_rate().

## Value

a `PreDataTableLayouts` object.
