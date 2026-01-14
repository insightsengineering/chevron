# Retrieve labels for certain variables

Retrieve labels for certain variables

## Usage

``` r
var_labels_for(df, vars)
```

## Arguments

- df:

  (`data.frame`) containing columns with label attribute.

- vars:

  (`character`) variable names in `df`.

## Value

a `character` with replaced placeholders and a `label` attribute.

## Details

The labels will be returned if the column has `label` attribute,
otherwise the column name will be returned. Any values between brackets
will be replaced with
[`dunlin::render_safe`](https://insightsengineering.github.io/dunlin/latest-tag/reference/render_safe.html).
