# Creates `NULL` Report

Creates `NULL` Report

## Usage

``` r
report_null(tlg, ...)

# S4 method for class 'NULL'
report_null(tlg, ind = 2L, ...)

# S4 method for class 'VTableTree'
report_null(tlg, ind = 2L, ...)

# S4 method for class 'listing_df'
report_null(tlg, ind = 2L, ...)

# S4 method for class 'list'
report_null(tlg, ind = 2L, ...)

# S4 method for class 'ANY'
report_null(tlg, ...)

standard_null_report()
```

## Arguments

- tlg:

  to convert to null report.

- ...:

  not used.

- ind:

  (`integer`) indentation for the outputs of class `VTableTree`.

## Value

the `tlg` object or a `NULL` report if the `tlg` is `NULL`, is a
`TableTree` with 0 rows, is a `listing_df` with 0 rows or is a `list`
with 0 elements.

## Examples

``` r
report_null(NULL)
#>                                                                                           
#>   ————————————————————————————————————————————————————————————————————————————————————————
#>      Null Report: No observations met the reporting criteria for inclusion in this output.
```
