# `EGT01` ECG Parameters and Change from Baseline By Visit Table.

The `EGT01` table provides an overview of the ECG values and its change
from baseline of each respective arm over the course of the trial.

## Usage

``` r
egt01_main(
  adam_db,
  dataset = "adeg",
  arm_var = "ACTARM",
  lbl_overall = NULL,
  row_split_var = NULL,
  summaryvars = c("AVAL", "CHG"),
  visitvar = "AVISIT",
  precision = list(default = 0L),
  page_var = "PARAMCD",
  .stats = c("n", "mean_sd", "median", "range"),
  skip = list(CHG = "BASELINE"),
  ...
)

egt01_pre(adam_db, dataset = "adeg", ...)

egt01
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

- `egt01_main()`: Main TLG function

- `egt01_pre()`: Preprocessing

## Note

default precision is 0.

## Examples

``` r
run(egt01, syn_data)
#>                                A: Drug X                        B: Placebo                     C: Combination         
#>                                       Change from                       Change from                      Change from  
#>                     Value at Visit      Baseline      Value at Visit     Baseline      Value at Visit      Baseline   
#>   Analysis Visit        (N=15)           (N=15)           (N=15)          (N=15)           (N=15)           (N=15)    
#>   ————————————————————————————————————————————————————————————————————————————————————————————————————————————————————
#>   Heart Rate                                                                                                          
#>     BASELINE                                                                                                          
#>       n                   15                                15                               15                       
#>       Mean (SD)      76.6 (17.9)                       69.9 (18.8)                      70.5 (18.2)                   
#>       Median             77.5                              77.2                             74.1                      
#>       Min - Max        46 - 107                          26 - 98                          45 - 115                    
#>     WEEK 1 DAY 8                                                                                                      
#>       n                   15               15               15              15               15               15      
#>       Mean (SD)      71.1 (23.4)      -5.5 (25.1)      71.0 (14.9)      1.1 (23.3)      67.4 (18.9)      -3.0 (23.8)  
#>       Median             77.2             -2.2             70.0            -8.4             68.5             0.2      
#>       Min - Max        9 - 103          -51 - 37         45 - 94         -25 - 60         39 - 100         -52 - 33   
#>     WEEK 2 DAY 15                                                                                                     
#>       n                   15               15               15              15               15               15      
#>       Mean (SD)      69.4 (16.1)      -7.2 (29.0)      76.1 (15.0)      6.2 (29.3)      63.7 (12.9)      -6.8 (23.9)  
#>       Median             65.7            -11.4             75.3             0.3             61.1             -5.0     
#>       Min - Max        47 - 101         -50 - 43         47 - 111        -38 - 69         43 - 86          -53 - 41   
#>     WEEK 3 DAY 22                                                                                                     
#>       n                   15               15               15              15               15               15      
#>       Mean (SD)      73.9 (24.6)      -2.7 (32.1)      67.6 (19.1)      -2.3 (30.0)     72.1 (19.3)       1.6 (27.5)  
#>       Median             69.3             5.5              68.5            -2.1             68.7             -5.8     
#>       Min - Max        44 - 132         -63 - 38         32 - 109        -52 - 67         32 - 110         -50 - 35   
#>     WEEK 4 DAY 29                                                                                                     
#>       n                   15               15               15              15               15               15      
#>       Mean (SD)      73.2 (19.3)      -3.4 (29.2)      66.5 (25.5)      -3.4 (36.0)     66.6 (22.8)      -3.9 (24.1)  
#>       Median             68.7             0.2              66.4            -11.7            65.0             -6.8     
#>       Min - Max        34 - 112         -55 - 65         20 - 111        -60 - 61         10 - 101         -51 - 27   
#>     WEEK 5 DAY 36                                                                                                     
#>       n                   15               15               15              15               15               15      
#>       Mean (SD)      61.7 (22.2)      -14.9 (30.3)     60.7 (20.0)      -9.2 (24.6)     72.7 (23.5)       2.2 (26.7)  
#>       Median             57.9            -12.7             60.5            -16.1            77.6             14.6     
#>       Min - Max        24 - 104         -60 - 57         33 - 102        -53 - 51         31 - 105         -43 - 35   
#>   QT Duration                                                                                                         
#>     BASELINE                                                                                                          
#>       n                   15                                15                               15                       
#>       Mean (SD)     335.3 (123.2)                      363.1 (68.2)                     347.3 (86.2)                  
#>       Median            372.7                             386.3                            348.3                      
#>       Min - Max       121 - 555                         215 - 446                        171 - 509                    
#>     WEEK 1 DAY 8                                                                                                      
#>       n                   15               15               15              15               15               15      
#>       Mean (SD)      357.4 (85.7)     22.1 (144.2)    415.2 (105.4)    52.1 (144.3)    321.1 (107.6)    -26.2 (129.1) 
#>       Median            344.8             49.4            422.0            62.8            308.0            -17.0     
#>       Min - Max       241 - 517        -207 - 245       234 - 605       -191 - 365       118 - 480        -363 - 164  
#>     WEEK 2 DAY 15                                                                                                     
#>       n                   15               15               15              15               15               15      
#>       Mean (SD)     344.9 (106.8)     9.6 (174.8)      370.5 (80.9)     7.4 (91.3)      354.1 (95.1)     6.8 (142.4)  
#>       Median            312.2             -9.3            388.5            -9.4            365.3             39.9     
#>       Min - Max       188 - 502        -279 - 373       205 - 514       -191 - 174       200 - 493        -279 - 266  
#>     WEEK 3 DAY 22                                                                                                     
#>       n                   15               15               15              15               15               15      
#>       Mean (SD)      342.1 (92.6)     6.8 (151.5)     326.7 (116.4)    -36.4 (145.4)    366.2 (99.1)     18.9 (168.4) 
#>       Median            352.9            -22.8            298.4            -78.4           329.7            -21.6     
#>       Min - Max       199 - 476        -230 - 303       151 - 561       -205 - 294       249 - 581        -253 - 410  
#>     WEEK 4 DAY 29                                                                                                     
#>       n                   15               15               15              15               15               15      
#>       Mean (SD)      371.7 (44.8)     36.4 (139.3)    333.7 (110.4)    -29.4 (125.6)    333.2 (96.5)    -14.1 (107.6) 
#>       Median            375.4             59.0            308.0            -41.0           330.9            -25.8     
#>       Min - Max       302 - 452        -214 - 258       183 - 531       -242 - 134       127 - 489        -235 - 152  
#>     WEEK 5 DAY 36                                                                                                     
#>       n                   15               15               15              15               15               15      
#>       Mean (SD)     345.5 (130.5)     10.2 (198.2)     309.9 (84.6)    -53.2 (105.7)    322.9 (67.8)    -24.4 (117.3) 
#>       Median            355.7            -23.2            306.2            -12.4           342.0            -27.0     
#>       Min - Max        88 - 661        -271 - 540       189 - 449        -257 - 92       218 - 427        -291 - 171  
#>   RR Duration                                                                                                         
#>     BASELINE                                                                                                          
#>       n                   15                                15                               15                       
#>       Mean (SD)     1086.9 (363.8)                    1050.0 (390.4)                   1102.7 (310.4)                 
#>       Median            1116.8                            1089.2                           1250.0                     
#>       Min - Max       626 - 1653                        415 - 1722                       386 - 1431                   
#>     WEEK 1 DAY 8                                                                                                      
#>       n                   15               15               15              15               15               15      
#>       Mean (SD)     968.5 (287.8)    -118.4 (546.8)   1041.2 (211.2)   -8.8 (435.3)    948.5 (213.7)    -154.2 (442.9)
#>       Median            961.3            -147.5           1013.8           24.8            965.4            -224.1    
#>       Min - Max       359 - 1594      -1015 - 912       714 - 1418      -619 - 847       513 - 1229       -737 - 844  
#>     WEEK 2 DAY 15                                                                                                     
#>       n                   15               15               15              15               15               15      
#>       Mean (SD)     932.7 (259.6)    -154.2 (331.9)   1139.3 (454.2)   89.3 (582.7)    1021.3 (233.5)   -81.4 (415.8) 
#>       Median            950.5            -205.9           1068.0           -5.4            964.6            -142.2    
#>       Min - Max       410 - 1269       -650 - 473       487 - 2049      -847 - 1149      667 - 1367       -647 - 616  
#>     WEEK 3 DAY 22                                                                                                     
#>       n                   15               15               15              15               15               15      
#>       Mean (SD)     1068.9 (319.5)   -18.0 (513.4)    1110.9 (259.5)   60.8 (432.7)    1105.9 (306.2)    3.3 (516.7)  
#>       Median            1202.0           -65.1            1163.7           51.2            1187.1            30.3     
#>       Min - Max       380 - 1552       -833 - 704       621 - 1453      -887 - 822       446 - 1648       -985 - 816  
#>     WEEK 4 DAY 29                                                                                                     
#>       n                   15               15               15              15               15               15      
#>       Mean (SD)     1087.9 (205.9)    1.0 (403.0)     1161.7 (293.3)   111.6 (461.0)   992.1 (283.2)    -110.5 (334.9)
#>       Median            1084.7           146.6            1055.2           191.0           1029.0           -112.6    
#>       Min - Max       698 - 1499       -801 - 403       722 - 1762      -528 - 1192      497 - 1382       -598 - 758  
#>     WEEK 5 DAY 36                                                                                                     
#>       n                   15               15               15              15               15               15      
#>       Mean (SD)     1016.9 (424.4)   -70.0 (505.1)    1135.1 (224.7)   85.1 (497.7)    1089.5 (238.9)   -13.1 (362.6) 
#>       Median            962.6            -142.9           1158.8           -9.6            1081.0            16.7     
#>       Min - Max       353 - 1844      -895 - 1163       714 - 1437      -843 - 992       700 - 1611       -696 - 562  
```
