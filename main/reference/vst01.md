# `VST01` Vital Sign Results and change from Baseline By Visit Table.

The `VST01` table provides an overview of the Vital Sign values and its
change from baseline of each respective arm over the course of the
trial.

## Usage

``` r
vst01_main(
  adam_db,
  dataset = "advs",
  arm_var = "ACTARM",
  lbl_overall = NULL,
  row_split_var = NULL,
  summaryvars = c("AVAL", "CHG"),
  visitvar = "AVISIT",
  precision = list(DIABP = 0, PUL = 0, SYSBP = 0, default = 2L),
  page_var = "PARAMCD",
  .stats = c("n", "mean_sd", "median", "range"),
  skip = list(CHG = "BASELINE"),
  ...
)

vst01_pre(adam_db, dataset = "advs", ...)

vst01
```

## Format

An object of class `chevron_t` of length 1.

## Arguments

- adam_db:

  (`list` of `data.frames`) object containing the `ADaM` datasets

- dataset:

  (`string`) the name of a table in the `adam_db` object.

- arm_var:

  (`string`) variable used for column splitting

- lbl_overall:

  (`string`) label used for overall column, if set to `NULL` the overall
  column is omitted

- row_split_var:

  (`character`) additional row split variables.

- summaryvars:

  (`character`) variables to be analyzed. The label attribute of the
  corresponding column in table of `adam_db` is used as label.

- visitvar:

  (`string`) typically one of `"AVISIT"` or user-defined visit
  incorporating `"ATPT"`.

- precision:

  (named `list` of `integer`) where names are values found in the
  `PARAMCD` column and the values indicate the number of digits in
  statistics. If `default` is set, and parameter precision not
  specified, the value for `default` will be used. If `default` is not
  set, the default precision is 2.

- page_var:

  (`string`) variable name prior to which the row split is by page.

- .stats:

  (`character`) statistics names, see
  [`tern::analyze_vars()`](https://insightsengineering.github.io/tern/latest-tag/reference/analyze_variables.html).

- skip:

  Named (`list`) of visit values that need to be inhibited.

- ...:

  additional arguments like `.indent_mods`, `.labels`.

## Value

the main function returns an `rtables` object.

the preprocessing function returns a `list` of `data.frame`.

## Details

- The `Analysis Value` column, displays the number of patients, the
  mean, standard deviation, median and range of the analysis value for
  each visit.

- The `Change from Baseline` column, displays the number of patient and
  the mean, standard deviation, median and range of changes relative to
  the baseline.

- Remove zero-count rows unless overridden with `prune_0 = FALSE`.

- Split columns by arm, typically `ACTARM`.

- Does not include a total column by default.

- Sorted based on factor level; first by `PARAM` labels in alphabetic
  order then by chronological time point given by `AVISIT`. Re-level to
  customize order

## Functions

- `vst01_main()`: Main TLG function

- `vst01_pre()`: Preprocessing

## Note

- `adam_db` object must contain table named as `dataset` with the
  columns specified in `summaryvars`.

## Examples

``` r
library(dunlin)

proc_data <- log_filter(
  syn_data,
  PARAMCD %in% c("DIABP", "SYSBP"), "advs"
)
run(vst01, proc_data)
#>                                        A: Drug X                      B: Placebo                    C: Combination        
#>                                               Change from                     Change from                     Change from 
#>                              Value at Visit     Baseline     Value at Visit     Baseline     Value at Visit     Baseline  
#>   Analysis Visit                 (N=15)          (N=15)          (N=15)          (N=15)          (N=15)          (N=15)   
#>   ————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————
#>   Diastolic Blood Pressure                                                                                                
#>     SCREENING                                                                                                             
#>       n                            15              0               15              0               15              0      
#>       Mean (SD)               94.4 (17.1)       NE (NE)       106.4 (20.6)      NE (NE)       106.5 (12.6)      NE (NE)   
#>       Median                      94.9             NE            111.1             NE            108.4             NE     
#>       Min - Max                 56 - 122        NE - NE         60 - 132        NE - NE         83 - 127        NE - NE   
#>     BASELINE                                                                                                              
#>       n                            15                              15                              15                     
#>       Mean (SD)               96.1 (22.5)                     108.1 (15.1)                    103.1 (19.8)                
#>       Median                      93.3                           109.0                           102.8                    
#>       Min - Max                 61 - 137                        83 - 132                        66 - 137                  
#>     WEEK 1 DAY 8                                                                                                          
#>       n                            15              15              15              15              15              15     
#>       Mean (SD)               99.0 (21.4)      2.8 (28.1)     104.1 (16.2)    -4.0 (21.9)     100.8 (19.0)    -2.3 (25.0) 
#>       Median                      92.4            -4.1           107.7            3.2            103.1            -2.5    
#>       Min - Max                 68 - 130        -33 - 48        71 - 133        -53 - 29        70 - 129        -55 - 42  
#>     WEEK 2 DAY 15                                                                                                         
#>       n                            15              15              15              15              15              15     
#>       Mean (SD)               99.8 (14.5)      3.6 (21.2)     97.5 (17.3)     -10.6 (20.8)    94.3 (17.0)     -8.9 (27.2) 
#>       Median                     101.5            1.7             99.5            -9.7            96.8           -10.2    
#>       Min - Max                 72 - 123        -40 - 48        54 - 126        -55 - 25        63 - 117        -73 - 47  
#>     WEEK 3 DAY 22                                                                                                         
#>       n                            15              15              15              15              15              15     
#>       Mean (SD)               99.1 (26.1)      3.0 (34.3)     92.0 (16.9)     -16.1 (21.9)    94.6 (13.6)     -8.6 (21.7) 
#>       Median                     101.1            -0.3            91.2           -14.4            98.4           -16.1    
#>       Min - Max                 48 - 162        -48 - 77        68 - 120        -53 - 23        74 - 115        -38 - 33  
#>     WEEK 4 DAY 29                                                                                                         
#>       n                            15              15              15              15              15              15     
#>       Mean (SD)               103.4 (22.3)     7.3 (30.7)     96.5 (19.5)     -11.6 (25.9)    108.3 (18.4)     5.2 (21.9) 
#>       Median                      98.2            2.5             97.4           -16.8           107.6            8.0     
#>       Min - Max                 63 - 148        -38 - 62        63 - 132        -57 - 48        69 - 133        -34 - 42  
#>     WEEK 5 DAY 36                                                                                                         
#>       n                            15              15              15              15              15              15     
#>       Mean (SD)               93.2 (18.5)     -2.9 (28.9)     97.9 (20.7)     -10.2 (27.6)    95.3 (16.4)     -7.8 (19.8) 
#>       Median                      90.8            -3.4            99.0           -11.3            93.9            -4.7    
#>       Min - Max                 64 - 139        -49 - 47        69 - 138        -54 - 38        72 - 139        -44 - 29  
#>   Systolic Blood Pressure                                                                                                 
#>     SCREENING                                                                                                             
#>       n                            15              0               15              0               15              0      
#>       Mean (SD)               154.1 (33.5)      NE (NE)       157.8 (34.4)      NE (NE)       152.4 (22.3)      NE (NE)   
#>       Median                     156.2             NE            161.7             NE            149.6             NE     
#>       Min - Max                 78 - 211        NE - NE         80 - 210        NE - NE        108 - 185        NE - NE   
#>     BASELINE                                                                                                              
#>       n                            15                              15                              15                     
#>       Mean (SD)               145.9 (28.2)                    152.0 (28.7)                    154.2 (26.3)                
#>       Median                     142.7                           157.7                           155.3                    
#>       Min - Max                 85 - 196                        99 - 195                        87 - 193                  
#>     WEEK 1 DAY 8                                                                                                          
#>       n                            15              15              15              15              15              15     
#>       Mean (SD)               156.5 (21.1)    10.6 (34.6)     147.5 (33.5)    -4.5 (48.9)     143.3 (30.8)    -10.9 (34.6)
#>       Median                     160.7            5.8            155.0            2.8            145.5            -5.6    
#>       Min - Max                127 - 186        -53 - 92        85 - 190        -77 - 91        90 - 192        -66 - 49  
#>     WEEK 2 DAY 15                                                                                                         
#>       n                            15              15              15              15              15              15     
#>       Mean (SD)               144.2 (33.7)    -1.7 (27.1)     136.9 (30.2)    -15.1 (37.8)    148.6 (27.1)    -5.6 (44.7) 
#>       Median                     144.3            5.3            142.7           -14.1           147.1           -11.5    
#>       Min - Max                 63 - 204        -54 - 44        70 - 174        -83 - 62       109 - 200       -70 - 114  
#>     WEEK 3 DAY 22                                                                                                         
#>       n                            15              15              15              15              15              15     
#>       Mean (SD)               154.9 (35.4)     9.0 (38.5)     149.8 (28.9)    -2.2 (44.8)     150.5 (21.4)    -3.7 (38.0) 
#>       Median                     158.9            17.2           155.0            -1.8           156.5            -7.6    
#>       Min - Max                112 - 219        -47 - 96        84 - 193       -110 - 94        95 - 180        -75 - 73  
#>     WEEK 4 DAY 29                                                                                                         
#>       n                            15              15              15              15              15              15     
#>       Mean (SD)               150.2 (32.2)     4.2 (33.0)     156.0 (22.9)     4.0 (42.5)     145.7 (23.0)    -8.5 (33.2) 
#>       Median                     145.5            3.8            149.1           -10.0           150.8           -14.4    
#>       Min - Max                 69 - 210        -89 - 54       114 - 195        -71 - 78       107 - 188        -42 - 65  
#>     WEEK 5 DAY 36                                                                                                         
#>       n                            15              15              15              15              15              15     
#>       Mean (SD)               156.0 (30.9)    10.0 (42.3)     156.4 (35.3)     4.4 (51.8)     143.6 (33.2)    -10.6 (44.8)
#>       Median                     158.1            1.4            164.6            7.1            148.5            -2.4    
#>       Min - Max                111 - 212        -54 - 90        63 - 199       -131 - 87        92 - 191        -79 - 64  
```
