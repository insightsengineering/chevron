# `MNG01` Mean Plot Graph.

Overview of a summary statistics across time and arm for a selected data
set.

## Usage

``` r
mng01_main(
  adam_db,
  dataset = "adlb",
  x_var = "AVISIT",
  y_var = "AVAL",
  y_name = "PARAM",
  y_unit = NULL,
  arm_var = "ACTARM",
  center_fun = "mean",
  interval_fun = "mean_ci",
  jitter = 0.3,
  line_col = nestcolor::color_palette(),
  line_type = NULL,
  ggtheme = gg_theme_chevron(),
  table = c("n", center_fun, interval_fun),
  ...
)

mng01_pre(adam_db, dataset, x_var = "AVISIT", ...)

mng01
```

## Format

An object of class `chevron_g` of length 1.

## Arguments

- adam_db:

  (`list` of `data.frames`) object containing the `ADaM` datasets

- dataset:

  (`string`) the name of a table in the `adam_db` object.

- x_var:

  (`string`) the name of a column in the `dataset` to represent on the
  x-axis.

- y_var:

  (`string`) the name of the variable to be represented on the y-axis.

- y_name:

  (`string`) the variable name for `y`. Used for plot's subtitle.

- y_unit:

  (`string`) the name of the variable with the units of `y`. Used for
  plot's subtitle. if `NULL`, only `y_name` is displayed as subtitle.

- arm_var:

  (`string`) variable used for column splitting

- center_fun:

  (`string`) the function to compute the estimate value.

- interval_fun:

  (`string`) the function defining the crossbar range. If `NULL`, no
  crossbar is displayed.

- jitter:

  (`numeric`) the width of spread for data points on the x-axis; a
  number from 0 (no `jitter`) to 1 (high `jitter`), with a default of
  0.3 (slight `jitter`).

- line_col:

  (`character`) describing the colors to use for the lines or a named
  `character` associating values of `arm_var` with color names.

- line_type:

  (`character`) describing the line type to use for the lines or a named
  `character` associating values of `arm_var` with line types.

- ggtheme:

  (`theme`) passed to
  [`tern::g_lineplot()`](https://insightsengineering.github.io/tern/latest-tag/reference/g_lineplot.html).

- table:

  (`character`) names of the statistics to be displayed in the table. If
  `NULL`, no table is displayed.

- ...:

  passed to
  [`tern::g_lineplot()`](https://insightsengineering.github.io/tern/latest-tag/reference/g_lineplot.html).

## Value

the main function returns a `list` of `ggplot` objects.

a list of `ggplot` objects.

the preprocessing function returns a `list` of `data.frame`.

## Details

- No overall value.

- Preprocessing filters for `ANL01FL` in the selected data set.

## Functions

- `mng01_main()`: Main TLG Function

- `mng01_pre()`: Preprocessing

## Note

- `adam_db` object must contain the table specified by `dataset` with
  the columns specified by `x_var`, `y_var`, `y_name`, `y_unit` and
  `arm_var`.

## See also

[`gg_theme_chevron()`](https://insightsengineering.github.io/chevron/reference/gg_theme_chevron.md),
[`tern::g_lineplot()`](https://insightsengineering.github.io/tern/latest-tag/reference/g_lineplot.html).

## Examples

``` r
col <- c(
  "A: Drug X" = "black",
  "B: Placebo" = "blue",
  "C: Combination" = "gray"
)

lt <- c(
  "A: Drug X" = "29",
  "B: Placebo" = "99",
  "C: Combination" = "solid"
)

run(
  mng01,
  syn_data,
  dataset = "adlb",
  x_var = c("AVISIT", "AVISITN"),
  line_col = col,
  line_type = lt
)
#> $`Alanine Aminotransferase Measurement`

#> 
#> $`C-Reactive Protein Measurement`

#> 
#> $`Immunoglobulin A Measurement`

#> 
```
