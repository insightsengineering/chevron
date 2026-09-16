# Check that at least one name is among column names

Check that at least one name is among column names

## Usage

``` r
check_one_colnames(df, x, null_ok = TRUE, qualifier = NULL)
```

## Arguments

- df:

  (`data.frame`)

- x:

  (`character`) the names of the columns to be checked.

- null_ok:

  (`flag`) can `x` be NULL.

- qualifier:

  (`string`) to be returned if the check fails.

## Value

invisible `NULL` or a string if the criteria are not fulfilled.
