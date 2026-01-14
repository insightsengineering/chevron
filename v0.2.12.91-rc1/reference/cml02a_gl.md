# `CML02A_GL` Listing 1 (Default) Concomitant Medication Class Level 2, Preferred Name, and Investigator-Specified Terms.

`CML02A_GL` Listing 1 (Default) Concomitant Medication Class Level 2,
Preferred Name, and Investigator-Specified Terms.

## Usage

``` r
cml02a_gl_main(
  adam_db,
  dataset = "adcm",
  key_cols = c("ATC2", "CMDECOD"),
  disp_cols = c("ATC2", "CMDECOD", "CMTRT"),
  split_into_pages_by_var = NULL,
  unique_rows = TRUE,
  ...
)

cml02a_gl_pre(
  adam_db,
  dataset = "adcm",
  disp_cols = c("ATC2", "CMDECOD", "CMTRT"),
  ...
)

cml02a_gl
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

## Value

the main function returns an `rlistings` or a `list` object.

the preprocessing function returns a `list` of `data.frame`.

## Functions

- `cml02a_gl_main()`: Main TLG function

- `cml02a_gl_pre()`: Preprocessing

## Examples

``` r
run(cml02a_gl, syn_data)
#> ATC Class Level 2   WHODrug Preferred Name   Investigator-Specified Treatment Term
#> ——————————————————————————————————————————————————————————————————————————————————
#> ATCCLAS2 A          medname A_1/3            A_1/3                                
#>                     medname A_2/3            A_2/3                                
#>                     medname A_3/3            A_3/3                                
#> ATCCLAS2 A p2       medname A_3/3            A_3/3                                
#> ATCCLAS2 B          medname B_1/4            B_1/4                                
#>                     medname B_2/4            B_2/4                                
#>                     medname B_3/4            B_3/4                                
#>                     medname B_4/4            B_4/4                                
#> ATCCLAS2 B p2       medname B_1/4            B_1/4                                
#>                     medname B_2/4            B_2/4                                
#> ATCCLAS2 B p3       medname B_1/4            B_1/4                                
#>                     medname B_2/4            B_2/4                                
#> ATCCLAS2 C          medname C_1/2            C_1/2                                
#>                     medname C_2/2            C_2/2                                
#> ATCCLAS2 C p2       medname C_1/2            C_1/2                                
#>                     medname C_2/2            C_2/2                                
#> ATCCLAS2 C p3       medname C_2/2            C_2/2                                
```
