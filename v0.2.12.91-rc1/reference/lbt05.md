# `LBT05` Table 1 (Default) Laboratory Abnormalities with Single and Replicated Marked.

`LBT05` Table 1 (Default) Laboratory Abnormalities with Single and
Replicated Marked.

## Usage

``` r
lbt05_main(
  adam_db,
  arm_var = "ACTARM",
  lbl_overall = NULL,
  map = lab_paramcd_abn_dir(),
  ...
)

lbt05_pre(adam_db, ...)

lbt05_post(tlg, prune_0 = FALSE, keep = "Any Abnormality", ...)

lbt05

lab_paramcd_abn_dir()
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

- map:

  (`data.frame`) with two columns mapping of parameters code (`PARAMCD`)
  to directions of abnormality (`ABN_DIR`). If a parameter is not in the
  `map` or if `map` is `NULL`, both directions are analyzed.

- ...:

  not used.

- tlg:

  (`TableTree`, `Listing` or `ggplot`) object typically produced by a
  `main` function.

- prune_0:

  (`flag`) remove 0 count rows

- keep:

  (`character`) the levels to keep in the table even if they are empty.
  If `NULL`, all levels are pruned.

## Value

the main function returns an `rtables` object.

the preprocessing function returns a `list` of `data.frame`.

the postprocessing function returns an `rtables` object or an
`ElementaryTable` (null report).

a `data.frame` with the direction of abnormality of each lab parameter
code.

## Details

- Does not remove rows with zero counts by default.

- Lab test results with missing `AVAL` values are excluded.

- Split columns by arm, typically `ACTARM`.

## Functions

- `lbt05_main()`: Main TLG function

- `lbt05_pre()`: Preprocessing

- `lbt05_post()`: Postprocessing

- `lab_paramcd_abn_dir()`:

## Note

- `adam_db` object must contain an `adlb` table with columns
  `"ONTRTFL"`, `"PARCAT2"`, `"PARAM"`, `"ANRIND"`, `"AVALCAT1"`, and
  column specified by `arm_var`.

## Examples

``` r
run(lbt05, syn_data)
#>   Laboratory Test                            A: Drug X   B: Placebo   C: Combination
#>       Direction of Abnormality                (N=15)       (N=15)         (N=15)    
#>   ——————————————————————————————————————————————————————————————————————————————————
#>   Alanine Aminotransferase Measurement (n)      15           14             14      
#>     Low                                                                             
#>       Single, not last                       1 (6.7%)        0          4 (28.6%)   
#>       Last or replicated                     5 (33.3%)   4 (28.6%)      4 (28.6%)   
#>       Any Abnormality                        6 (40.0%)   4 (28.6%)      8 (57.1%)   
#>     High                                                                            
#>       Single, not last                           0           0              0       
#>       Last or replicated                         0           0              0       
#>       Any Abnormality                            0           0              0       
#>   C-Reactive Protein Measurement (n)            15           15             15      
#>     Low                                                                             
#>       Single, not last                       4 (26.7%)       0          3 (20.0%)   
#>       Last or replicated                     3 (20.0%)   5 (33.3%)      6 (40.0%)   
#>       Any Abnormality                        7 (46.7%)   5 (33.3%)      9 (60.0%)   
#>     High                                                                            
#>       Single, not last                       1 (6.7%)    3 (20.0%)          0       
#>       Last or replicated                     4 (26.7%)   3 (20.0%)      6 (40.0%)   
#>       Any Abnormality                        5 (33.3%)   6 (40.0%)      6 (40.0%)   
#>   Immunoglobulin A Measurement (n)              13           14             14      
#>     Low                                                                             
#>       Single, not last                           0           0              0       
#>       Last or replicated                         0           0              0       
#>       Any Abnormality                            0           0              0       
#>     High                                                                            
#>       Single, not last                       6 (46.2%)    1 (7.1%)      2 (14.3%)   
#>       Last or replicated                     3 (23.1%)   4 (28.6%)      3 (21.4%)   
#>       Any Abnormality                        9 (69.2%)   5 (35.7%)      5 (35.7%)   

map <- data.frame(PARAMCD = c("ALT", "ALT", "CRP", "CRP", "IGA", "XXX"), ABN_DIR = c("Low", "High"))
run(lbt05, syn_data, map = map)
#>   Laboratory Test                            A: Drug X   B: Placebo   C: Combination
#>       Direction of Abnormality                (N=15)       (N=15)         (N=15)    
#>   ——————————————————————————————————————————————————————————————————————————————————
#>   Alanine Aminotransferase Measurement (n)      15           14             14      
#>     Low                                                                             
#>       Single, not last                       1 (6.7%)        0          4 (28.6%)   
#>       Last or replicated                     5 (33.3%)   4 (28.6%)      4 (28.6%)   
#>       Any Abnormality                        6 (40.0%)   4 (28.6%)      8 (57.1%)   
#>     High                                                                            
#>       Single, not last                           0           0              0       
#>       Last or replicated                         0           0              0       
#>       Any Abnormality                            0           0              0       
#>   C-Reactive Protein Measurement (n)            15           15             15      
#>     Low                                                                             
#>       Single, not last                       4 (26.7%)       0          3 (20.0%)   
#>       Last or replicated                     3 (20.0%)   5 (33.3%)      6 (40.0%)   
#>       Any Abnormality                        7 (46.7%)   5 (33.3%)      9 (60.0%)   
#>     High                                                                            
#>       Single, not last                       1 (6.7%)    3 (20.0%)          0       
#>       Last or replicated                     4 (26.7%)   3 (20.0%)      6 (40.0%)   
#>       Any Abnormality                        5 (33.3%)   6 (40.0%)      6 (40.0%)   
#>   Immunoglobulin A Measurement (n)              13           14             14      
#>     Low                                                                             
#>       Single, not last                           0           0              0       
#>       Last or replicated                         0           0              0       
#>       Any Abnormality                            0           0              0       
# example code
head(lab_paramcd_abn_dir())
#>    PARAMCD ABN_DIR
#> 1 HCRIT1SI     Low
#> 2 HCRIT2SI    High
#> 3   HGB1SI     Low
#> 4   HGB2SI    High
#> 5   WBC1SI     Low
#> 6   WBC2SI    High
```
