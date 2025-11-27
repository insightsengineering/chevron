# Check that all names are among column names

Check that all names are among column names

## Usage

``` r
check_all_colnames(df, x, null_ok = TRUE, qualifier = NULL)
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
