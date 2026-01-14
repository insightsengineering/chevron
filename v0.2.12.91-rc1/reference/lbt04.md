# `LBT04` Laboratory Abnormalities Not Present at Baseline Table.

The `LBT04` table provides an overview of laboratory abnormalities not
present at baseline.

## Usage

``` r
lbt04_main(
  adam_db,
  arm_var = "ACTARM",
  lbl_overall = NULL,
  analysis_abn_var = "ANRIND",
  baseline_abn_var = "BNRIND",
  row_split_var = "PARCAT1",
  page_var = tail(row_split_var, 1L),
  ...
)

lbt04_pre(adam_db, ...)

lbt04_post(tlg, ...)

lbt04
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

- analysis_abn_var:

  (`string`) column describing anomaly magnitude

- baseline_abn_var:

  (`string`) column describing anomaly at baseline.

- row_split_var:

  (`character`) additional row split variables.

- page_var:

  (`string`) variable name prior to which the row split is by page.

- ...:

  not used.

- tlg:

  (`TableTree`, `Listing` or `ggplot`) object typically produced by a
  `main` function.

## Value

the main function returns an `rtables` object.

the preprocessing function returns a `list` of `data.frame`.

the postprocessing function returns an `rtables` object or an
`ElementaryTable` (null report).

## Details

- Only count LOW or HIGH values.

- Lab test results with missing `analysis_abn_var` values are excluded.

- Split columns by arm, typically `ACTARM`.

- Does not include a total column by default.

## Functions

- `lbt04_main()`: Main TLG function

- `lbt04_pre()`: Preprocessing

- `lbt04_post()`: Postprocessing

## Note

- `adam_db` object must contain an `adlb` table with columns
  `"PARCAT1"`, `"PARCAT2"`, `"PARAM"`, `"ANRIND"`, and column specified
  by `arm_var`.

## Examples

``` r
run(lbt04, syn_data)
#>   Laboratory Test                           A: Drug X    B: Placebo    C: Combination
#>       Direction of Abnormality               (N=15)        (N=15)          (N=15)    
#>   ———————————————————————————————————————————————————————————————————————————————————
#>   CHEMISTRY                                                                          
#>     Alanine Aminotransferase Measurement                                             
#>       Low                                      0/7           0/2        1/7 (14.3%)  
#>       High                                     0/7           0/3            0/8      
#>     C-Reactive Protein Measurement                                                   
#>       Low                                      0/8       1/2 (50.0%)        0/6      
#>       High                                 3/8 (37.5%)       0/2            0/7      
#>     Immunoglobulin A Measurement                                                     
#>       Low                                      0/5           0/8            0/7      
#>       High                                 1/3 (33.3%)   1/8 (12.5%)        0/6      
#>   COAGULATION                                                                        
#>     Alanine Aminotransferase Measurement                                             
#>       Low                                      0/3           0/6            0/4      
#>       High                                     0/5           0/7            0/4      
#>     C-Reactive Protein Measurement                                                   
#>       Low                                      0/5           0/5        1/3 (33.3%)  
#>       High                                     0/5       1/6 (16.7%)    1/4 (25.0%)  
#>     Immunoglobulin A Measurement                                                     
#>       Low                                      0/8           0/9            0/6      
#>       High                                     0/8           0/9        1/6 (16.7%)  
#>   HEMATOLOGY                                                                         
#>     Alanine Aminotransferase Measurement                                             
#>       Low                                      0/4           0/5            0/4      
#>       High                                     0/6           0/5            0/4      
#>     C-Reactive Protein Measurement                                                   
#>       Low                                      0/5           0/4            0/3      
#>       High                                     0/5           0/4            0/5      
#>     Immunoglobulin A Measurement                                                     
#>       Low                                      0/3           0/4            0/8      
#>       High                                     0/3           0/4            0/7      
```
