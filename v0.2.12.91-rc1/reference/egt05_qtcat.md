# `EGT05_QTCAT` ECG Actual Values and Changes from Baseline by Visit Table.

The `EGT05_QTCAT` table summarizes several electrocardiogram parameters
and their evolution throughout the study.

## Usage

``` r
egt05_qtcat_main(
  adam_db,
  arm_var = "ACTARM",
  lbl_overall = NULL,
  summaryvars = c("AVALCAT1", "CHGCAT1"),
  row_split_var = NULL,
  visitvar = "AVISIT",
  page_var = NULL,
  ...
)

egt05_qtcat_pre(adam_db, ...)

egt05_qtcat_post(tlg, prune_0 = TRUE, ...)

egt05_qtcat
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

- summaryvars:

  (`character`) variables to be analyzed. The label attribute of the
  corresponding column in `adeg` table of `adam_db` is used as name.

- row_split_var:

  (`character`) additional row split variables.

- visitvar:

  (`string`) typically `"AVISIT"` or user-defined visit incorporating
  `"ATPT"`.

- page_var:

  (`string`) variable name prior to which the row split is by page.

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

- The `Value at Visit` column, displays the categories of the specific
  `"PARAMCD"` value for patients.

- The `Change from Baseline` column, displays the categories of the
  specific `"PARAMCD"` value change from baseline for patients.

- Remove zero-count rows unless overridden with `prune_0 = FALSE`.

- Split columns by arm, typically `"ACTARM"`.

- Does not include a total column by default.

- Sorted based on factor level; by chronological time point given by
  `"AVISIT"` or user-defined visit incorporating `"ATPT"`. Re-level to
  customize order.

- Please note that it is preferable to convert `summaryvars` to factor.

## Functions

- `egt05_qtcat_main()`: Main TLG function

- `egt05_qtcat_pre()`: Preprocessing

- `egt05_qtcat_post()`: Postprocessing

## Note

- `adam_db` object must contain an `adeg` table with column specified in
  `visitvar`. For `summaryvars`, please make sure `AVALCAT1` and
  `CHGCAT1` columns existed in input data sets.

## Examples

``` r
run(egt05_qtcat, syn_data)
#>   Parameter                                                          
#>     Analysis Visit           A: Drug X    B: Placebo   C: Combination
#>       Category                 (N=15)       (N=15)         (N=15)    
#>   ———————————————————————————————————————————————————————————————————
#>   QT Duration                                                        
#>     BASELINE                                                         
#>       Value at Visit                                                 
#>         n                        15           15             15      
#>         <=450 msec           13 (86.7%)   15 (100%)      13 (86.7%)  
#>         >450 to <=480 msec    1 (6.7%)        0              0       
#>         >480 to <=500 msec       0            0           1 (6.7%)   
#>         >500 msec             1 (6.7%)        0           1 (6.7%)   
#>     WEEK 1 DAY 8                                                     
#>       Value at Visit                                                 
#>         n                        15           15             15      
#>         <=450 msec           12 (80.0%)   9 (60.0%)      13 (86.7%)  
#>         >450 to <=480 msec    1 (6.7%)     1 (6.7%)       1 (6.7%)   
#>         >480 to <=500 msec    1 (6.7%)    3 (20.0%)       1 (6.7%)   
#>         >500 msec             1 (6.7%)    2 (13.3%)          0       
#>       Change from Baseline                                           
#>         n                        15           15             15      
#>         <=30 msec            7 (46.7%)    6 (40.0%)      9 (60.0%)   
#>         >30 to <=60 msec     2 (13.3%)     1 (6.7%)       1 (6.7%)   
#>         >60 msec             6 (40.0%)    8 (53.3%)      5 (33.3%)   
#>     WEEK 2 DAY 15                                                    
#>       Value at Visit                                                 
#>         n                        15           15             15      
#>         <=450 msec           11 (73.3%)   14 (93.3%)     12 (80.0%)  
#>         >450 to <=480 msec   2 (13.3%)        0          2 (13.3%)   
#>         >480 to <=500 msec    1 (6.7%)        0           1 (6.7%)   
#>         >500 msec             1 (6.7%)     1 (6.7%)          0       
#>       Change from Baseline                                           
#>         n                        15           15             15      
#>         <=30 msec            9 (60.0%)    12 (80.0%)     7 (46.7%)   
#>         >30 to <=60 msec     2 (13.3%)        0          3 (20.0%)   
#>         >60 msec             4 (26.7%)    3 (20.0%)      5 (33.3%)   
#>     WEEK 3 DAY 22                                                    
#>       Value at Visit                                                 
#>         n                        15           15             15      
#>         <=450 msec           12 (80.0%)   12 (80.0%)     12 (80.0%)  
#>         >450 to <=480 msec   3 (20.0%)     1 (6.7%)       1 (6.7%)   
#>         >500 msec                0        2 (13.3%)      2 (13.3%)   
#>       Change from Baseline                                           
#>         n                        15           15             15      
#>         <=30 msec            9 (60.0%)    11 (73.3%)     9 (60.0%)   
#>         >30 to <=60 msec      1 (6.7%)     1 (6.7%)          0       
#>         >60 msec             5 (33.3%)    3 (20.0%)      6 (40.0%)   
#>     WEEK 4 DAY 29                                                    
#>       Value at Visit                                                 
#>         n                        15           15             15      
#>         <=450 msec           14 (93.3%)   12 (80.0%)     13 (86.7%)  
#>         >450 to <=480 msec    1 (6.7%)     1 (6.7%)       1 (6.7%)   
#>         >480 to <=500 msec       0            0           1 (6.7%)   
#>         >500 msec                0        2 (13.3%)          0       
#>       Change from Baseline                                           
#>         n                        15           15             15      
#>         <=30 msec            6 (40.0%)    9 (60.0%)      9 (60.0%)   
#>         >30 to <=60 msec     2 (13.3%)     1 (6.7%)      2 (13.3%)   
#>         >60 msec             7 (46.7%)    5 (33.3%)      4 (26.7%)   
#>     WEEK 5 DAY 36                                                    
#>       Value at Visit                                                 
#>         n                        15           15             15      
#>         <=450 msec           12 (80.0%)   15 (100%)      15 (100%)   
#>         >450 to <=480 msec   2 (13.3%)        0              0       
#>         >500 msec             1 (6.7%)        0              0       
#>       Change from Baseline                                           
#>         n                        15           15             15      
#>         <=30 msec            9 (60.0%)    11 (73.3%)     9 (60.0%)   
#>         >30 to <=60 msec         0        3 (20.0%)      2 (13.3%)   
#>         >60 msec             6 (40.0%)     1 (6.7%)      4 (26.7%)   
```
