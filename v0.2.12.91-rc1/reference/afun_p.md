# Analyze with defined precision

Analyze with defined precision

## Usage

``` r
afun_p(
  x,
  .N_col,
  .spl_context,
  precision,
  .N_row,
  .var = NULL,
  .df_row = NULL,
  .stats = NULL,
  .labels = NULL,
  .indent_mods = NULL,
  ...
)
```

## Arguments

- x:

  value to analyze

- .N_col:

  (`int`) See
  [`tern::analyze_variables`](https://insightsengineering.github.io/tern/latest-tag/reference/analyze_variables.html).

- .spl_context:

  split context.

- precision:

  (named `list` of `integer`) where names of columns found in `.df_row`
  and the values indicate the number of digits in statistics for numeric
  value. If `default` is set, and parameter precision not specified, the
  value for `default` will be used. If neither are provided, auto
  determination is used. See
  [`tern::format_auto`](https://insightsengineering.github.io/tern/latest-tag/reference/format_auto.html).

- .N_row:

  (`int`) See
  [`tern::analyze_variables`](https://insightsengineering.github.io/tern/latest-tag/reference/analyze_variables.html).

- .var:

  variable name.

- .stats:

  (named `list` of character) where names of columns found in `.df_row`
  and the values indicate the statistical analysis to perform. If
  `default` is set, and parameter precision not specified, the value for
  `default` will be used.

- .labels:

  (`character`) See
  [`tern::analyze_variables`](https://insightsengineering.github.io/tern/latest-tag/reference/analyze_variables.html).

- .indent_mods:

  (`integer`) See
  [`tern::analyze_variables`](https://insightsengineering.github.io/tern/latest-tag/reference/analyze_variables.html).

- ...:

  additional arguments for
  [`tern::a_summary`](https://insightsengineering.github.io/tern/latest-tag/reference/analyze_variables.html).
