# `LBT14` Laboratory Test Results Shift Table – Highest `NCI-CTCAE` Grade Post-Baseline by Baseline Grade (Low or High Direction).

`LBT14` Laboratory Test Results Shift Table – Highest `NCI-CTCAE` Grade
Post-Baseline by Baseline Grade (Low or High Direction).

## Usage

``` r
lbt14_main(
  adam_db,
  arm_var = "ACTARM",
  lbl_overall = NULL,
  gr_missing = "incl",
  page_var = "PARAMCD",
  ...
)

lbt14_pre(adam_db, gr_missing = "incl", direction = "low", ...)

lbt14_post(tlg, prune_0 = TRUE, ...)

lbt14
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

- gr_missing:

  (`string`) how missing baseline grades should be handled. Defaults to
  `"incl"` to include the `"Missing"` level. Other options are `"excl"`
  to exclude patients with missing baseline grades and `"gr_0"` to
  convert missing baseline grades to grade 0.

- page_var:

  (`string`) variable name prior to which the row split is by page.

- ...:

  not used.

- direction:

  (`string`) one of `"high"` or `"low"` indicating which shift direction
  should be detailed.

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

- This table follows ADaMIG v1.1.

- Only the worst grade recorded for each patient is included in the
  table.

- If no missing baseline lab results, the "Missing" level of `BTOXGR` is
  excluded.

- Grading takes value from -4 to 4, negative value means the abnormality
  direction is low, positive value means the abnormality direction is
  high.

- Grades 0, 1, 2, 3, and 4 are counted as `"Not Low"` when
  `direction = "low"`. Conversely, when `direction = "high"`, Grades 0,
  -1, -2, -3, and -4 are counted as \`"Not High".

- Remove zero-count rows unless overridden with `prune_0 = FALSE`.

- Split columns by arm, typically `ACTARM`.

## Functions

- `lbt14_main()`: Main TLG function

- `lbt14_pre()`: Preprocessing

- `lbt14_post()`: Postprocessing

## Note

- `adam_db` object must contain an `adlb` table with columns
  `"USUBJID"`, `"PARAM"`, `"BTOXGR"`, `"ATOXGR"`, and the column
  specified by `arm_var`.

## Examples

``` r
run(lbt14, syn_data)
#>   Baseline Toxicity Grade                 A: Drug X   B: Placebo   C: Combination
#>           Post-baseline NCI-CTCAE Grade    (N=15)       (N=15)         (N=15)    
#>   ———————————————————————————————————————————————————————————————————————————————
#>   Alanine Aminotransferase Measurement                                           
#>     Not Low                                  12           12             14      
#>             Not Low                       5 (41.7%)   8 (66.7%)      5 (35.7%)   
#>             1                             3 (25.0%)       0              0       
#>             2                             2 (16.7%)    1 (8.3%)       1 (7.1%)   
#>             3                                 0        1 (8.3%)      5 (35.7%)   
#>             4                             2 (16.7%)   2 (16.7%)      3 (21.4%)   
#>     1                                         1           2              0       
#>             Not Low                       1 (100%)     2 (100%)          0       
#>     2                                         1           1              0       
#>             Not Low                           0        1 (100%)          0       
#>             4                             1 (100%)        0              0       
#>     3                                         1           0              1       
#>             3                             1 (100%)        0           1 (100%)   
#>   C-Reactive Protein Measurement                                                 
#>     Not Low                                  14           13             12      
#>             Not Low                       5 (35.7%)   7 (53.8%)      4 (33.3%)   
#>             1                             2 (14.3%)       0          2 (16.7%)   
#>             2                             5 (35.7%)   2 (15.4%)      4 (33.3%)   
#>             3                             2 (14.3%)   3 (23.1%)      2 (16.7%)   
#>             4                                 0        1 (7.7%)          0       
#>     1                                         0           0              2       
#>             Not Low                           0           0          1 (50.0%)   
#>             2                                 0           0          1 (50.0%)   
#>     2                                         0           1              0       
#>             1                                 0        1 (100%)          0       
#>     3                                         1           1              1       
#>             3                             1 (100%)     1 (100%)       1 (100%)   
#>   Immunoglobulin A Measurement                                                   
#>     Not Low                                  15           15             15      
#>             Not Low                       15 (100%)   15 (100%)      15 (100%)   
```
