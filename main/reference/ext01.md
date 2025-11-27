# `EXT01` Exposure Summary Table.

The `EXT01` table provides an overview of the of the exposure of the
patients in terms of Total dose administered or missed, and treatment
duration.

## Usage

``` r
ext01_main(
  adam_db,
  arm_var = "ACTARM",
  lbl_overall = NULL,
  summaryvars = "AVAL",
  row_split_var = "PARCAT2",
  page_var = NULL,
  map = NULL,
  stats = list(default = c("n", "mean_sd", "median", "range", "count_fraction")),
  precision = list(default = 0),
  ...
)

ext01_pre(adam_db, ...)

ext01_post(tlg, prune_0 = TRUE, ...)

ext01
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
  corresponding column in `adex` table of `adam_db` is used as label.

- row_split_var:

  (`character`) additional row split variables.

- page_var:

  (`string`) variable name prior to which the row split is by page.

- map:

  (`data.frame`) of mapping for split rows.

- stats:

  (named `list` of character) where names are values found in the
  `PARAMCD` column and the values indicate the statistical analysis to
  perform. If `default` is set, and parameter precision not specified,
  the value for `default` will be used.

- precision:

  (named `list` of `integer`) where names are values found in the
  `PARAMCD` column and the values

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

- Default Exposure table

- The `n` row provides the number of non-missing values. The percentages
  for categorical variables is based on `n`. The percentages for
  `Total number of patients with at least one dose modification` are
  based on the number of patients in the corresponding analysis
  population given by `N`.

- Split columns by arm, typically `ACTARM`.

- Does not include a total column by default.

- Sorted by alphabetic order of the `PARAM` value. Transform to factor
  and re-level for custom order.

- `ANL01FL` is not relevant subset.

## Functions

- `ext01_main()`: Main TLG function

- `ext01_pre()`: Preprocessing

- `ext01_post()`: Postprocessing

## Note

- `adam_db` object must contain an `adex` table with columns specified
  in `summaryvars`.

## Examples

``` r
run(ext01, syn_data)
#>                                  A: Drug X        B: Placebo      C: Combination 
#>   PARCAT2                         (N=15)            (N=15)            (N=15)     
#>   ———————————————————————————————————————————————————————————————————————————————
#>   Drug A                                                                         
#>     Overall duration (days)                                                      
#>       n                             11                 7                 7       
#>       Mean (SD)                157.5 (67.4)      115.4 (62.8)       98.6 (68.8)  
#>       Median                       174.0             119.0             89.0      
#>       Min - Max                  53 - 239          22 - 219           1 - 182    
#>     Total dose administered                                                      
#>       n                             11                 7                 7       
#>       Mean (SD)               6567.3 (1127.1)   7028.6 (1626.1)   6377.1 (863.7) 
#>       Median                      6720.0            7200.0            6480.0     
#>       Min - Max                 4800 - 8400       5280 - 9360       5280 - 7440  
#>   Drug B                                                                         
#>     Overall duration (days)                                                      
#>       n                              4                 8                 8       
#>       Mean (SD)                142.2 (100.3)     105.9 (60.0)      158.2 (96.2)  
#>       Median                       160.0             95.0              203.0     
#>       Min - Max                  17 - 232          37 - 211          27 - 249    
#>     Total dose administered                                                      
#>       n                              4                 8                 8       
#>       Mean (SD)               7020.0 (1148.9)   5250.0 (864.7)    5940.0 (1187.9)
#>       Median                      6960.0            5160.0            5880.0     
#>       Min - Max                 5760 - 8400       4080 - 6480       4320 - 7680  

run(ext01, syn_data, summaryvars = c("AVAL", "AVALCAT1"), prune_0 = FALSE)
#>                                  A: Drug X        B: Placebo      C: Combination 
#>   PARCAT2                         (N=15)            (N=15)            (N=15)     
#>   ———————————————————————————————————————————————————————————————————————————————
#>   Drug A                                                                         
#>     Overall duration (days)                                                      
#>       n                             11                 7                 7       
#>       Mean (SD)                157.5 (67.4)      115.4 (62.8)       98.6 (68.8)  
#>       Median                       174.0             119.0             89.0      
#>       Min - Max                  53 - 239          22 - 219           1 - 182    
#>       n                             11                 7                 7       
#>       < 1 month                      0             1 (14.3%)         1 (14.3%)   
#>       1 to <3 months             3 (27.3%)         1 (14.3%)         3 (42.9%)   
#>       3 to <6 months             3 (27.3%)         4 (57.1%)         2 (28.6%)   
#>       >=6 months                 5 (45.5%)         1 (14.3%)         1 (14.3%)   
#>       <700                           0                 0                 0       
#>       700-900                        0                 0                 0       
#>       900-1200                       0                 0                 0       
#>       >1200                          0                 0                 0       
#>       <5000                          0                 0                 0       
#>       5000-7000                      0                 0                 0       
#>       7000-9000                      0                 0                 0       
#>       >9000                          0                 0                 0       
#>       7                              0                 0                 0       
#>     Total dose administered                                                      
#>       n                             11                 7                 7       
#>       Mean (SD)               6567.3 (1127.1)   7028.6 (1626.1)   6377.1 (863.7) 
#>       Median                      6720.0            7200.0            6480.0     
#>       Min - Max                 4800 - 8400       5280 - 9360       5280 - 7440  
#>       n                             11                 7                 7       
#>       < 1 month                      0                 0                 0       
#>       1 to <3 months                 0                 0                 0       
#>       3 to <6 months                 0                 0                 0       
#>       >=6 months                     0                 0                 0       
#>       <700                           0                 0                 0       
#>       700-900                        0                 0                 0       
#>       900-1200                       0                 0                 0       
#>       >1200                          0                 0                 0       
#>       <5000                      1 (9.1%)              0                 0       
#>       5000-7000                  6 (54.5%)         3 (42.9%)         5 (71.4%)   
#>       7000-9000                  4 (36.4%)         3 (42.9%)         2 (28.6%)   
#>       >9000                          0             1 (14.3%)             0       
#>       7                              0                 0                 0       
#>   Drug B                                                                         
#>     Overall duration (days)                                                      
#>       n                              4                 8                 8       
#>       Mean (SD)                142.2 (100.3)     105.9 (60.0)      158.2 (96.2)  
#>       Median                       160.0             95.0              203.0     
#>       Min - Max                  17 - 232          37 - 211          27 - 249    
#>       n                              4                 8                 8       
#>       < 1 month                  1 (25.0%)             0             1 (12.5%)   
#>       1 to <3 months                 0             4 (50.0%)         2 (25.0%)   
#>       3 to <6 months             1 (25.0%)         3 (37.5%)             0       
#>       >=6 months                 2 (50.0%)         1 (12.5%)         5 (62.5%)   
#>       <700                           0                 0                 0       
#>       700-900                        0                 0                 0       
#>       900-1200                       0                 0                 0       
#>       >1200                          0                 0                 0       
#>       <5000                          0                 0                 0       
#>       5000-7000                      0                 0                 0       
#>       7000-9000                      0                 0                 0       
#>       >9000                          0                 0                 0       
#>       7                              0                 0                 0       
#>     Total dose administered                                                      
#>       n                              4                 8                 8       
#>       Mean (SD)               7020.0 (1148.9)   5250.0 (864.7)    5940.0 (1187.9)
#>       Median                      6960.0            5160.0            5880.0     
#>       Min - Max                 5760 - 8400       4080 - 6480       4320 - 7680  
#>       n                              4                 8                 8       
#>       < 1 month                      0                 0                 0       
#>       1 to <3 months                 0                 0                 0       
#>       3 to <6 months                 0                 0                 0       
#>       >=6 months                     0                 0                 0       
#>       <700                           0                 0                 0       
#>       700-900                        0                 0                 0       
#>       900-1200                       0                 0                 0       
#>       >1200                          0                 0                 0       
#>       <5000                          0             4 (50.0%)         2 (25.0%)   
#>       5000-7000                  2 (50.0%)         4 (50.0%)         4 (50.0%)   
#>       7000-9000                  2 (50.0%)             0             2 (25.0%)   
#>       >9000                          0                 0                 0       
#>       7                              0                 0                 0       

levels(syn_data$adex$AVALCAT1) <- c(levels(syn_data$adex$AVALCAT1), "12 months")
map <- data.frame(
  PARAMCD = "TDURD",
  AVALCAT1 = c("< 1 month", "1 to <3 months", ">=6 months", "3 to <6 months", "12 months")
)
run(
  ext01,
  syn_data,
  summaryvars = c("AVAL", "AVALCAT1"),
  prune_0 = FALSE,
  map = map,
  precision = list(TDOSE = 4, default = 4),
  stats = list(TDURD = "n", default = c("n", "count_fraction"))
)
#>                               A: Drug X   B: Placebo   C: Combination
#>   PARCAT2                      (N=15)       (N=15)         (N=15)    
#>   ———————————————————————————————————————————————————————————————————
#>   Drug A                                                             
#>     Overall duration (days)                                          
#>       n                          11           7              7       
#>       n                          11           7              7       
#>     Total dose administered                                          
#>       n                          11           7              7       
#>       n                          11           7              7       
#>       <5000                   1 (9.1%)        0              0       
#>       5000-7000               6 (54.5%)   3 (42.9%)      5 (71.4%)   
#>       7000-9000               4 (36.4%)   3 (42.9%)      2 (28.6%)   
#>       >9000                       0       1 (14.3%)          0       
#>   Drug B                                                             
#>     Overall duration (days)                                          
#>       n                           4           8              8       
#>       n                           4           8              8       
#>     Total dose administered                                          
#>       n                           4           8              8       
#>       n                           4           8              8       
#>       <5000                       0       4 (50.0%)      2 (25.0%)   
#>       5000-7000               2 (50.0%)   4 (50.0%)      4 (50.0%)   
#>       7000-9000               2 (50.0%)       0          2 (25.0%)   
#>       >9000                       0           0              0       
```
