# `AET01_AESI` Table 1 (Default) Adverse Event of Special Interest Summary Table.

`AET01_AESI` Table 1 (Default) Adverse Event of Special Interest Summary
Table.

## Usage

``` r
aet01_aesi_main(
  adam_db,
  arm_var = "ACTARM",
  lbl_overall = NULL,
  aesi_vars = NULL,
  grade_groups = NULL,
  ...
)

aet01_aesi_pre(adam_db, ...)

aet01_aesi_post(tlg, prune_0 = FALSE, ...)

aet01_aesi
```

## Format

An object of class `chevron_t` of length 1.

## Arguments

- adam_db:

  (`list` of `data.frames`) object containing the `ADaM` datasets

- arm_var:

  (`string`) variable used for column splitting

- lbl_overall:

  (`string`) label used for overall column, if set to `NULL` the overall
  column is omitted

- aesi_vars:

  (`character`) the `AESI` variables to be included in the summary.
  Defaults to `NA`.

- grade_groups:

  (`list`) the grade groups to be displayed.

- ...:

  not used.

- tlg:

  (`TableTree`, `Listing` or `ggplot`) object typically produced by a
  `main` function.

- prune_0:

  (`flag`) remove 0 count rows

## Value

the main function returns an `rtables` object.

the preprocessing function returns a `list` of `data.frame`.

the postprocessing function returns an `rtables` object or an
`ElementaryTable` (null report).

## Details

- Does not remove rows with zero counts by default.

## Functions

- `aet01_aesi_main()`: Main TLG function

- `aet01_aesi_pre()`: Preprocessing

- `aet01_aesi_post()`: Postprocessing

## Note

- `adam_db` object must contain an `adae` table with columns `"AEOUT"`,
  `"AEACN"`, `"AECONTRT"`, `"AESER"`, `"AREL"`, and the column specified
  by `arm_var`.

- `aesi_vars` may contain any/all of the following variables to display:
  `"ALLRESWD"`, `"ALLRESDSM"`, `"ALLRESCONTRT"`, `"NOTRESWD"`,
  `"NOTRESDSM"`, `"NOTRESCONTRT"`, `"SERWD"`, `"SERDSM"`, `"SERCONTRT"`,
  `"RELWD"`, `"RELDSM"`, `"RELCONTRT"`, `"RELSER"`.

- `aesi_vars` variable prefixes are defined as follows:

  - `"ALLRES"` = "all non-fatal adverse events resolved"

  - `"NOTRES"` = "at least one unresolved or ongoing non-fatal adverse
    event"

  - `"SER"` = "serious adverse event"

  - `"REL"` = "related adverse event"

- `aesi_vars` variable suffixes are defined as follows:

  - `"WD"` = "patients with study drug withdrawn"

  - `"DSM"` = "patients with dose modified/interrupted"

  - `"CONTRT"` = "patients with treatment received"

- Several `aesi_vars` can be added to the table at once:

  - `aesi_vars = "ALL"` will include all possible `aesi_vars`.

  - Including `"ALL_XXX"` in `aesi_vars` where `XXX` is one of the
    prefixes listed above will include all `aesi_vars` with that prefix.

## Examples

``` r
run(aet01_aesi, syn_data)
#>                                                                                   A: Drug X    B: Placebo   C: Combination
#>                                                                                     (N=15)       (N=15)         (N=15)    
#>   ————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————
#>   Total number of patients with at least one AE                                   13 (86.7%)   14 (93.3%)     15 (100%)   
#>   Total number of AEs                                                                 58           59             99      
#>   Total number of patients with at least one AE by worst grade                                                            
#>     Grade 1                                                                           0         1 (6.7%)       1 (6.7%)   
#>     Grade 2                                                                        1 (6.7%)     1 (6.7%)       1 (6.7%)   
#>     Grade 3                                                                        1 (6.7%)    2 (13.3%)       1 (6.7%)   
#>     Grade 4                                                                       3 (20.0%)    2 (13.3%)      2 (13.3%)   
#>     Grade 5 (fatal outcome)                                                       8 (53.3%)    8 (53.3%)      10 (66.7%)  
#>   Total number of patients with study drug withdrawn due to AE                    2 (13.3%)    3 (20.0%)      3 (20.0%)   
#>   Total number of patients with dose modified/interrupted due to AE               6 (40.0%)    9 (60.0%)      11 (73.3%)  
#>   Total number of patients with treatment received for AE                         10 (66.7%)   10 (66.7%)     14 (93.3%)  
#>   Total number of patients with all non-fatal AEs resolved                        9 (60.0%)    10 (66.7%)     12 (80.0%)  
#>   Total number of patients with at least one unresolved or ongoing non-fatal AE   10 (66.7%)   9 (60.0%)      14 (93.3%)  
#>   Total number of patients with at least one serious AE                           12 (80.0%)   12 (80.0%)     11 (73.3%)  
#>   Total number of patients with at least one related AE                           11 (73.3%)   10 (66.7%)     13 (86.7%)  
```
