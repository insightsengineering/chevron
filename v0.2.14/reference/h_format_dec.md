# Decimal formatting

Decimal formatting

## Usage

``` r
h_format_dec(digits, format, ne = NULL)
```

## Arguments

- digits:

  (`integer`) number of digits.

- format:

  (`string`) describing how the numbers should be formatted following
  the `sprintf` syntax.

- ne:

  (`string`) that should replace actual value. If `NULL`, no replacement
  is performed.

## Value

`function` formatting numbers with the defined format.

## Examples

``` r
fun <- h_format_dec(c(1, 1), "%s - %s")
fun(c(123, 567.89))
#> [1] "123.0 - 567.9"
```
