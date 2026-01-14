# `LBT01` Lab Results and Change from Baseline by Visit Table.

The `LBT01` table provides an overview of the Lab values and its change
from baseline of each respective arm over the course of the trial.

## Usage

``` r
lbt01_main(
  adam_db,
  dataset = "adlb",
  arm_var = "ACTARM",
  lbl_overall = NULL,
  row_split_var = NULL,
  summaryvars = c("AVAL", "CHG"),
  visitvar = "AVISIT",
  precision = lab_paramcd_precision(),
  page_var = "PARAMCD",
  .stats = c("n", "mean_sd", "median", "range"),
  skip = list(CHG = "BASELINE"),
  ...
)

lbt01_pre(adam_db, dataset = "adlb", ...)

lbt01

lab_paramcd_precision()
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

a named `list` with the precision of each lab parameter code (default is
`2`).

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

- `lbt01_main()`: Main TLG function

- `lbt01_pre()`: Preprocessing

- `lab_paramcd_precision()`:

## Note

- `adam_db` object must contain table named as `dataset` with the
  columns specified in `summaryvars`.

## Examples

``` r
run(lbt01, syn_data)
#>                                                      A: Drug X                          B: Placebo                        C: Combination          
#>                                                              Change from                        Change from                         Change from   
#>                                          Value at Visit       Baseline       Value at Visit       Baseline      Value at Visit        Baseline    
#>   Analysis Visit                             (N=15)            (N=15)            (N=15)            (N=15)           (N=15)             (N=15)     
#>   ————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————
#>   Alanine Aminotransferase Measurement                                                                                                            
#>     BASELINE                                                                                                                                      
#>       n                                        15                                  15                                 15                          
#>       Mean (SD)                          18.655 (12.455)                     16.835 (11.080)                    22.385 (9.452)                    
#>       Median                                 16.040                              17.453                             25.250                        
#>       Min - Max                           2.43 - 44.06                        1.48 - 31.99                       0.57 - 37.23                     
#>     WEEK 1 DAY 8                                                                                                                                  
#>       n                                        15                15                15                15               15                 15       
#>       Mean (SD)                          16.308 (10.850)   -2.348 (17.558)   22.055 (7.537)    5.220 (16.359)   19.574 (9.876)    -2.811 (10.902) 
#>       Median                                 14.664            -5.369            22.476            7.252            19.425             -0.995     
#>       Min - Max                           0.10 - 36.30     -30.18 - 22.66     9.72 - 33.81     -16.82 - 32.33    1.03 - 36.28      -19.61 - 18.45 
#>     WEEK 2 DAY 15                                                                                                                                 
#>       n                                        15                15                15                15               15                 15       
#>       Mean (SD)                          16.646 (10.528)   -2.010 (15.773)   20.758 (9.578)    3.923 (14.084)   10.911 (7.721)    -11.474 (11.002)
#>       Median                                 15.470            -6.427            18.499            6.248             9.850             -8.657     
#>       Min - Max                           0.40 - 35.29     -29.99 - 32.86     1.56 - 42.84     -24.92 - 29.85    0.35 - 25.01      -27.38 - 2.52  
#>     WEEK 3 DAY 22                                                                                                                                 
#>       n                                        15                15                15                15               15                 15       
#>       Mean (SD)                          17.488 (10.679)   -1.167 (15.759)   20.055 (8.086)    3.219 (16.285)   18.413 (9.513)     -3.973 (9.966) 
#>       Median                                 14.224             1.355            21.852            5.345            19.529             -7.194     
#>       Min - Max                           1.78 - 33.19     -40.09 - 18.58     3.46 - 34.44     -23.02 - 31.38    3.02 - 32.34      -18.70 - 17.30 
#>     WEEK 4 DAY 29                                                                                                                                 
#>       n                                        15                15                15                15               15                 15       
#>       Mean (SD)                          16.793 (9.101)    -1.863 (15.499)   17.560 (9.857)    0.725 (13.170)   18.397 (11.618)   -3.989 (13.150) 
#>       Median                                 12.816             3.098            17.687            -3.104           18.532             -1.684     
#>       Min - Max                           3.58 - 34.00     -32.93 - 18.92     1.90 - 34.08     -16.29 - 22.18    0.72 - 34.47      -30.33 - 17.38 
#>     WEEK 5 DAY 36                                                                                                                                 
#>       n                                        15                15                15                15               15                 15       
#>       Mean (SD)                          17.879 (7.239)    -0.776 (15.471)   17.417 (7.065)    0.581 (14.309)   15.173 (8.410)    -7.213 (10.518) 
#>       Median                                 18.749             1.108            17.751            2.055            16.394             -8.121     
#>       Min - Max                           3.99 - 29.40     -40.08 - 17.24     5.10 - 30.90     -21.68 - 23.41    0.28 - 26.73      -27.12 - 15.83 
#>   C-Reactive Protein Measurement                                                                                                                  
#>     BASELINE                                                                                                                                      
#>       n                                        15                                  15                                 15                          
#>       Mean (SD)                           9.032 (0.650)                       9.164 (0.900)                      8.652 (0.769)                    
#>       Median                                  8.819                               9.472                              8.502                        
#>       Min - Max                            7.81 - 9.93                        7.38 - 10.60                       7.73 - 10.86                     
#>     WEEK 1 DAY 8                                                                                                                                  
#>       n                                        15                15                15                15               15                 15       
#>       Mean (SD)                           9.050 (1.222)     0.018 (1.242)     8.690 (0.990)    -0.474 (1.418)    9.507 (1.279)     0.854 (1.080)  
#>       Median                                  8.960            -0.180             8.734            -0.074            9.830             1.107      
#>       Min - Max                           6.87 - 11.33      -1.83 - 2.81      6.84 - 10.14      -3.14 - 1.55     7.27 - 11.09       -1.14 - 2.05  
#>     WEEK 2 DAY 15                                                                                                                                 
#>       n                                        15                15                15                15               15                 15       
#>       Mean (SD)                           8.825 (0.990)    -0.207 (1.204)     9.371 (1.185)    0.207 (1.572)     8.890 (1.021)     0.238 (1.263)  
#>       Median                                  8.860            -0.567             9.073            0.293             8.994             0.462      
#>       Min - Max                           7.12 - 10.44      -2.12 - 2.05      8.06 - 12.73      -2.35 - 3.19     6.68 - 10.84       -2.50 - 2.89  
#>     WEEK 3 DAY 22                                                                                                                                 
#>       n                                        15                15                15                15               15                 15       
#>       Mean (SD)                           9.134 (0.897)     0.102 (1.179)     9.288 (1.033)    0.124 (1.135)     9.176 (0.919)     0.523 (1.209)  
#>       Median                                  9.318             0.090             9.413            -0.022            8.963             0.564      
#>       Min - Max                           7.38 - 11.00      -1.57 - 1.86      7.42 - 10.66      -1.41 - 3.27     7.72 - 11.20       -2.25 - 3.26  
#>     WEEK 4 DAY 29                                                                                                                                 
#>       n                                        15                15                15                15               15                 15       
#>       Mean (SD)                           8.728 (0.959)    -0.303 (1.226)     8.971 (0.704)    -0.194 (1.077)    8.662 (0.712)     0.010 (1.039)  
#>       Median                                  8.704            -0.046             8.879            -0.375            8.718             0.143      
#>       Min - Max                           6.70 - 10.81      -3.17 - 1.99      7.88 - 10.23      -1.59 - 1.54      7.21 - 9.60       -2.63 - 1.68  
#>     WEEK 5 DAY 36                                                                                                                                 
#>       n                                        15                15                15                15               15                 15       
#>       Mean (SD)                           8.545 (0.846)    -0.487 (1.060)     9.165 (1.182)    0.000 (0.929)     8.654 (0.790)     0.002 (1.102)  
#>       Median                                  8.601            -0.452             8.755            0.153             8.766             0.008      
#>       Min - Max                           7.10 - 10.03      -2.39 - 1.66      7.86 - 12.50      -1.58 - 1.90      7.37 - 9.92       -3.14 - 1.67  
#>   Immunoglobulin A Measurement                                                                                                                    
#>     BASELINE                                                                                                                                      
#>       n                                        15                                  15                                 15                          
#>       Mean (SD)                           2.923 (0.059)                       2.866 (0.083)                      2.887 (0.120)                    
#>       Median                                  2.911                               2.862                              2.896                        
#>       Min - Max                            2.80 - 3.01                         2.76 - 3.01                        2.65 - 3.14                     
#>     WEEK 1 DAY 8                                                                                                                                  
#>       n                                        15                15                15                15               15                 15       
#>       Mean (SD)                           2.885 (0.060)    -0.038 (0.082)     2.938 (0.137)    0.073 (0.152)     2.925 (0.091)     0.038 (0.128)  
#>       Median                                  2.886            -0.010             2.972            0.109             2.931             0.021      
#>       Min - Max                            2.76 - 2.96      -0.18 - 0.06       2.69 - 3.16      -0.27 - 0.27      2.78 - 3.10       -0.12 - 0.28  
#>     WEEK 2 DAY 15                                                                                                                                 
#>       n                                        15                15                15                15               15                 15       
#>       Mean (SD)                           2.889 (0.141)    -0.034 (0.171)     2.928 (0.075)    0.063 (0.124)     2.913 (0.080)     0.026 (0.156)  
#>       Median                                  2.871            -0.024             2.936            0.084             2.910             0.067      
#>       Min - Max                            2.67 - 3.16      -0.34 - 0.27       2.79 - 3.03      -0.12 - 0.26      2.78 - 3.09       -0.28 - 0.26  
#>     WEEK 3 DAY 22                                                                                                                                 
#>       n                                        15                15                15                15               15                 15       
#>       Mean (SD)                           2.875 (0.105)    -0.048 (0.120)     2.919 (0.114)    0.053 (0.151)     2.889 (0.082)     0.002 (0.128)  
#>       Median                                  2.861            -0.046             2.938            0.045             2.899             0.020      
#>       Min - Max                            2.67 - 3.07      -0.25 - 0.16       2.73 - 3.18      -0.19 - 0.33      2.75 - 3.02       -0.24 - 0.14  
#>     WEEK 4 DAY 29                                                                                                                                 
#>       n                                        15                15                15                15               15                 15       
#>       Mean (SD)                           2.912 (0.134)    -0.010 (0.140)     2.886 (0.097)    0.020 (0.136)     2.869 (0.104)     -0.019 (0.141) 
#>       Median                                  2.942             0.023             2.924            -0.012            2.840             -0.055     
#>       Min - Max                            2.63 - 3.16      -0.39 - 0.19       2.58 - 2.96      -0.28 - 0.20      2.74 - 3.08       -0.31 - 0.22  
#>     WEEK 5 DAY 36                                                                                                                                 
#>       n                                        15                15                15                15               15                 15       
#>       Mean (SD)                           2.933 (0.089)     0.010 (0.136)     2.899 (0.094)    0.034 (0.131)     2.902 (0.091)     0.015 (0.168)  
#>       Median                                  2.938             0.031             2.936            0.059             2.921             0.026      
#>       Min - Max                            2.78 - 3.08      -0.23 - 0.26       2.68 - 3.04      -0.25 - 0.19      2.78 - 3.13       -0.27 - 0.32  
# example code
head(lab_paramcd_precision())
#> $HCRITSI
#> [1] 2
#> 
#> $HGBSI
#> [1] 0
#> 
#> $WBCSI
#> [1] 1
#> 
#> $PLATESI
#> [1] 0
#> 
#> $MCHSI
#> [1] 1
#> 
#> $MCHCSI
#> [1] 0
#> 
```
