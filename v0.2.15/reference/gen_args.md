# General Argument Name Convention

General Argument Name Convention

## Usage

``` r
gen_args(
  adam_db,
  main,
  preprocess,
  postprocess,
  dataset,
  type,
  arm_var,
  lbl_overall,
  prune_0,
  req_tables,
  deco,
  group,
  tlg,
  visitvar,
  visit_value,
  paramcd_value,
  key_cols,
  disp_cols,
  row_split_var,
  split_into_pages_by_var,
  page_var,
  unique_rows,
  ...
)
```

## Arguments

- adam_db:

  (`list` of `data.frames`) object containing the `ADaM` datasets

- main:

  (`function`) returning a `tlg`, with `adam_db` as first argument.
  Typically one of the `_main` function of `chevron`.

- preprocess:

  (`function`) returning a pre-processed `list` of `data.frames`, with
  `adam_db` as first argument. Typically one of the `_pre` function of
  `chevron`.

- postprocess:

  (`function`) returning a post-processed `tlg`, with `tlg` as first
  argument.

- dataset:

  (`string`) the name of a table in the `adam_db` object.

- type:

  (`string`) indicating the subclass.

- arm_var:

  (`string`) variable used for column splitting

- lbl_overall:

  (`string`) label used for overall column, if set to `NULL` the overall
  column is omitted

- prune_0:

  (`flag`) remove 0 count rows

- req_tables:

  (`character`) names of the required tables.

- deco:

  (`character`) decoration with `title`, `subtitles` and `main_footer`
  content

- group:

  (`list of lists`) for group-dependent data binning

- tlg:

  (`TableTree`, `Listing` or `ggplot`) object typically produced by a
  `main` function.

- visitvar:

  (`string`) typically `"AVISIT"` or user-defined visit incorporating
  `"ATPT"`.

- visit_value:

  Value of visit variable.

- paramcd_value:

  Value of `PARAMCD` variable.

- key_cols:

  (`character`) names of columns that should be treated as key columns
  when rendering the listing. Key columns allow you to group repeat
  occurrences.

- disp_cols:

  (`character`) names of non-key columns which should be displayed when
  the listing is rendered.

- row_split_var:

  (`character`) additional row split variables.

- split_into_pages_by_var:

  (`character` or `NULL`) the name of the variable to split the listing
  by.

- page_var:

  (`string`) variable name prior to which the row split is by page.

- unique_rows:

  (`flag`) whether to keep only unique rows in listing.

- ...:

  not used.

## Value

invisible `NULL`. This function is for documentation purpose only.

## Details

the following arguments are better provided through the study object:
`lbl_overall`, `arm_var`.
