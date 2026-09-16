# Check variable only has one unique value.

Check variable only has one unique value.

## Usage

``` r
assert_single_value(x, label = deparse(substitute(x)))
```

## Arguments

- x:

  value vector.

- label:

  (`string`) label of input.

## Value

invisible `NULL` or an error message if the criteria are not fulfilled.
