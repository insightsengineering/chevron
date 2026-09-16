# Formatting of date

Formatting of date

## Usage

``` r
format_date(date_format = "%d%b%Y")
```

## Arguments

- date_format:

  (`string`) the output format.

## Value

a `function` converting a date into `string`.

## Note

The date is extracted at the location of the measure, not at the
location of the system.

## Examples

``` r
format_date("%d%b%Y")(as.Date("2021-01-01"))
#> [1] "01JAN2021"
if ("NZ" %in% OlsonNames()) {
  format_date("%d%b%Y")(as.POSIXct("2021-01-01 00:00:01", tz = "NZ"))
}
if ("US/Pacific" %in% OlsonNames()) {
  format_date("%d%b%Y")(as.POSIXct("2021-01-01 00:00:01", tz = "US/Pacific"))
}
```
