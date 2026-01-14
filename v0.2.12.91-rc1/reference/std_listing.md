# Standard Main Listing Function

Standard Main Listing Function

## Usage

``` r
std_listing(
  adam_db,
  dataset,
  key_cols,
  disp_cols,
  split_into_pages_by_var,
  unique_rows = FALSE,
  ...
)
```

## Arguments

- adam_db:

  (`list` of `data.frames`) object containing the `ADaM` datasets

- dataset:

  (`string`) the name of a table in the `adam_db` object.

- key_cols:

  (`character`) names of columns that should be treated as key columns
  when rendering the listing. Key columns allow you to group repeat
  occurrences.

- disp_cols:

  (`character`) names of non-key columns which should be displayed when
  the listing is rendered.

- split_into_pages_by_var:

  (`character` or `NULL`) the name of the variable to split the listing
  by.

- unique_rows:

  (`flag`) whether to keep only unique rows in listing.

- ...:

  additional arguments passed to
  [`rlistings::as_listing`](https://insightsengineering.github.io/rlistings/latest-tag/reference/listings.html).

## Value

the main function returns an `rlistings` or a `list` object.
