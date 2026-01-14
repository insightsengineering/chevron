# `LBT07` Table 1 (Default) Laboratory Test Results and Change from Baseline by Visit.

The `LBT07` table provides an overview of the analysis values and its
change from baseline of each respective arm over the course of the
trial.

## Usage

``` r
lbt07_main(
  adam_db,
  arm_var = "ACTARM",
  lbl_overall = NULL,
  param_var = "PARAM",
  grad_dir_var = "GRADE_DIR",
  grad_anl_var = "GRADE_ANL",
  ...
)

lbt07_pre(adam_db, ...)

lbt07_post(tlg, prune_0 = TRUE, keep = "Any", ...)

lbt07
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

- param_var:

  (`string`) the name of the column storing the parameters name.

- grad_dir_var:

  (`string`) the name of the column storing the grade direction variable
  which is required in order to obtain the correct denominators when
  building the layout as it is used to define row splitting.

- grad_anl_var:

  (`string`) the name of the column storing toxicity grade variable
  where all negative values from `ATOXGR` are replaced by their absolute
  values.

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

## Details

- Split columns by arm, typically `ACTARM`.

## Functions

- `lbt07_main()`: Main TLG function

- `lbt07_pre()`: Preprocessing

- `lbt07_post()`: Postprocessing

## Note

- `adam_db` object must contain an `adlb` table with columns
  `"USUBJID"`, `"ATOXGR"`, `"ONTRTFL"` and column specified by
  `arm_var`.

## Examples

``` r
run(lbt07, syn_data)
#>   Parameter                                                                          
#>     Direction of Abnormality                 A: Drug X    B: Placebo   C: Combination
#>               Highest NCI CTCAE Grade          (N=15)       (N=15)         (N=15)    
#>   ———————————————————————————————————————————————————————————————————————————————————
#>   Alanine Aminotransferase Measurement (n)       15           15             15      
#>     LOW                                                                              
#>               1                              3 (20.0%)        0              0       
#>               2                              2 (13.3%)     1 (6.7%)       1 (6.7%)   
#>               3                               1 (6.7%)     1 (6.7%)      6 (40.0%)   
#>               4                              3 (20.0%)    2 (13.3%)      3 (20.0%)   
#>               Any                            9 (60.0%)    4 (26.7%)      10 (66.7%)  
#>     HIGH                                                                             
#>               Any                                0            0              0       
#>   C-Reactive Protein Measurement (n)             15           15             15      
#>     LOW                                                                              
#>               1                              2 (13.3%)     1 (6.7%)      2 (13.3%)   
#>               2                              5 (33.3%)    2 (13.3%)      5 (33.3%)   
#>               3                              3 (20.0%)    4 (26.7%)      3 (20.0%)   
#>               4                                  0         1 (6.7%)          0       
#>               Any                            10 (66.7%)   8 (53.3%)      10 (66.7%)  
#>     HIGH                                                                             
#>               1                              3 (20.0%)     1 (6.7%)       1 (6.7%)   
#>               2                              4 (26.7%)    4 (26.7%)      2 (13.3%)   
#>               3                               1 (6.7%)    2 (13.3%)      4 (26.7%)   
#>               4                                  0         1 (6.7%)          0       
#>               Any                            8 (53.3%)    8 (53.3%)      7 (46.7%)   
#>   Immunoglobulin A Measurement (n)               15           15             15      
#>     LOW                                                                              
#>               Any                                0            0              0       
#>     HIGH                                                                             
#>               1                              3 (20.0%)     1 (6.7%)       1 (6.7%)   
#>               2                              5 (33.3%)    4 (26.7%)      2 (13.3%)   
#>               3                              3 (20.0%)    3 (20.0%)      2 (13.3%)   
#>               4                                  0            0           1 (6.7%)   
#>               Any                            11 (73.3%)   8 (53.3%)      6 (40.0%)   
```
