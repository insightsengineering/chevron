# Check variables are of same levels

Check variables are of same levels

## Usage

``` r
assert_valid_var_pair(
  df1,
  df2,
  var,
  lab1 = deparse(substitute(df1)),
  lab2 = deparse(substitute(df2))
)
```

## Arguments

- df1:

  (`data.frame`) input.

- df2:

  (`data.frame`) input.

- var:

  (`string`) variable to check.

- lab1:

  (`string`) label hint for `df1`.

- lab2:

  (`string`) label hint for `df2`.

## Value

invisible `NULL` or an error message if the criteria are not fulfilled.
