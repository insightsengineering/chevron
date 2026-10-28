# Check whether var is valid

Check whether var is valid

## Usage

``` r
assert_valid_var(x, label, na_ok, empty_ok, ...)

# S3 method for class 'character'
assert_valid_var(
  x,
  label = deparse(substitute(x)),
  na_ok = FALSE,
  empty_ok = FALSE,
  min_chars = 1L,
  ...
)

# S3 method for class 'factor'
assert_valid_var(
  x,
  label = deparse(substitute(x)),
  na_ok = FALSE,
  empty_ok = FALSE,
  min_chars = 1L,
  ...
)

# S3 method for class 'logical'
assert_valid_var(
  x,
  label = deparse(substitute(x)),
  na_ok = TRUE,
  empty_ok = FALSE,
  ...
)

# S3 method for class 'numeric'
assert_valid_var(
  x,
  label = deparse(substitute(x)),
  na_ok = TRUE,
  empty_ok = FALSE,
  integerish = FALSE,
  ...
)

# S3 method for class 'POSIXct'
assert_valid_var(
  x,
  label = deparse(substitute(x)),
  na_ok = TRUE,
  empty_ok = FALSE,
  tzs = OlsonNames(),
  ...
)

# Default S3 method
assert_valid_var(
  x,
  label = deparse(substitute(x)),
  na_ok = FALSE,
  empty_ok = FALSE,
  ...
)
```

## Arguments

- x:

  value of col_split variable

- label:

  (`string`) hints.

- na_ok:

  (`flag`) whether NA value is allowed

- empty_ok:

  (`flag`) whether length 0 value is allowed.

- ...:

  Further arguments to methods.

- min_chars:

  (`integer`) the minimum length of the characters.

- integerish:

  (`flag`) whether the number should be treated as `integerish`.

- tzs:

  (`character`) time zones.

## Value

invisible `NULL` or an error message if the criteria are not fulfilled.

## Details

This function checks the variable values are valid or not.
