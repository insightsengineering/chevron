# Analyze skip baseline

Analyze skip baseline

## Usage

``` r
afun_skip(
  x,
  .var,
  .spl_context,
  paramcdvar,
  visitvar,
  skip,
  precision,
  .stats,
  .labels = NULL,
  .indent_mods = NULL,
  .N_col,
  .N_row,
  ...
)
```

## Arguments

- x:

  value to analyze

- .var:

  variable name.

- .spl_context:

  split context.

- paramcdvar:

  (`string`) name of parameter code.

- visitvar:

  (`string`) name of the visit variable.

- skip:

  Named (`character`) indicating the pairs to skip in analyze.

- precision:

  (named `list` of `integer`) where names are values found in the
  `PARAMCD` column and the values indicate the number of digits in
  statistics. If `default` is set, and parameter precision not
  specified, the value for `default` will be used. If `default` is not
  set, the default precision is 2.

- .stats:

  (`character`) See
  [`tern::analyze_variables`](https://insightsengineering.github.io/tern/latest-tag/reference/analyze_variables.html).

- .labels:

  (`character`) See
  [`tern::analyze_variables`](https://insightsengineering.github.io/tern/latest-tag/reference/analyze_variables.html).

- .indent_mods:

  (`integer`) See
  [`tern::analyze_variables`](https://insightsengineering.github.io/tern/latest-tag/reference/analyze_variables.html).

- .N_col:

  (`int`) See
  [`tern::analyze_variables`](https://insightsengineering.github.io/tern/latest-tag/reference/analyze_variables.html).

- .N_row:

  (`int`) See
  [`tern::analyze_variables`](https://insightsengineering.github.io/tern/latest-tag/reference/analyze_variables.html).

- ...:

  additional arguments for
  [`tern::a_summary`](https://insightsengineering.github.io/tern/latest-tag/reference/analyze_variables.html).
