# `AEL02` Listing 1 (Default) Listing of Adverse Events.

`AEL02` Listing 1 (Default) Listing of Adverse Events.

## Usage

``` r
ael02_main(
  adam_db,
  dataset = "adae",
  key_cols = c("ID", "ASR"),
  disp_cols = c("AEDECOD", "TRTSDTM", "ASTDY", "ADURN", "AESER", "ASEV", "AREL", "AEOUT",
    "AECONTRT", "AEACN"),
  split_into_pages_by_var = "ACTARM",
  unique_rows = FALSE,
  ...
)

ael02_pre(adam_db, dataset = "adae", arm_var = "ACTARM", ...)

ael02
```

## Format

An object of class `chevron_l` of length 1.

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

  not used.

- arm_var:

  (`string`) variable used for column splitting

## Value

the main function returns an `rlistings` or a `list` object.

the preprocessing function returns a `list` of `data.frame`.

## Functions

- `ael02_main()`: Main TLG function

- `ael02_pre()`: Preprocessing

## Examples

``` r
res <- run(ael02, syn_data)
```
