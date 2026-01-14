# `AEL01_NOLLT` Listing 1 (Default) Glossary of Preferred Terms and Investigator-Specified Terms.

`AEL01_NOLLT` Listing 1 (Default) Glossary of Preferred Terms and
Investigator-Specified Terms.

## Usage

``` r
ael01_nollt_main(
  adam_db,
  dataset = "adae",
  key_cols = c("AEBODSYS", "AEDECOD"),
  disp_cols = "AETERM",
  split_into_pages_by_var = NULL,
  unique_rows = TRUE,
  ...
)

ael01_nollt_pre(
  adam_db,
  dataset = "adae",
  key_cols = c("AEBODSYS", "AEDECOD"),
  disp_cols = "AETERM",
  ...
)

ael01_nollt
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

  additional arguments passed to
  [`rlistings::as_listing`](https://insightsengineering.github.io/rlistings/latest-tag/reference/listings.html).

## Value

the main function returns an `rlistings` or a `list` object.

the preprocessing function returns a `list` of `data.frame`.

## Details

- Removes duplicate rows.

- By default, uses dataset `adae`, sorting by key columns `AEBODSYS` and
  `AEDECOD`.

- If using with a dataset other than `adae`, be sure to specify the
  desired labels for variables in `key_cols` and `disp_cols`, and
  pre-process missing data.

## Functions

- `ael01_nollt_main()`: Main TLG function

- `ael01_nollt_pre()`: Preprocessing

## Note

- `adam_db` object must contain the `dataset` table with columns
  specified by `key_cols` and `disp_cols`.

## Examples

``` r
run(ael01_nollt, syn_data)
#> MedDRA System Organ Class   MedDRA Preferred Term   Reported Term for the Adverse Event
#> ———————————————————————————————————————————————————————————————————————————————————————
#> cl A.1                      dcd A.1.1.1.1           trm A.1.1.1.1                      
#>                             dcd A.1.1.1.2           trm A.1.1.1.2                      
#> cl B.1                      dcd B.1.1.1.1           trm B.1.1.1.1                      
#> cl B.2                      dcd B.2.1.2.1           trm B.2.1.2.1                      
#>                             dcd B.2.2.3.1           trm B.2.2.3.1                      
#> cl C.1                      dcd C.1.1.1.3           trm C.1.1.1.3                      
#> cl C.2                      dcd C.2.1.2.1           trm C.2.1.2.1                      
#> cl D.1                      dcd D.1.1.1.1           trm D.1.1.1.1                      
#>                             dcd D.1.1.4.2           trm D.1.1.4.2                      
#> cl D.2                      dcd D.2.1.5.3           trm D.2.1.5.3                      
```
