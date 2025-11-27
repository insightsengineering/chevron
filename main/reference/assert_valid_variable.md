# Check variables in a data frame are valid character or factor.

Check variables in a data frame are valid character or factor.

## Usage

``` r
assert_valid_variable(
  df,
  vars,
  label = deparse(substitute(df)),
  types = NULL,
  ...
)
```

## Arguments

- df:

  (`data.frame`) input dataset.

- vars:

  (`character`) variables to check.

- label:

  (`string`) labels of the data frame.

- types:

  Named (`list`) of type of the input.

- ...:

  further arguments for `assert_valid_var`. Please note that different
  methods have different arguments so if provided make sure the
  variables to check is of the same class.

## Value

invisible `TRUE` or an error message if the criteria are not fulfilled.
