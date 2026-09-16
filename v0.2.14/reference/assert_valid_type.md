# Check variable is of correct type

Check variable is of correct type

## Usage

``` r
assert_valid_type(x, types, label = deparse(substitute(x)))
```

## Arguments

- x:

  Object to check the type.

- types:

  (`character`) possible types to check.

- label:

  (`string`) label.

## Value

invisible `NULL` or an error message if the criteria are not fulfilled.
