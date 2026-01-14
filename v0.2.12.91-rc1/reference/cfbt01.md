# `CFBT01` Change from Baseline By Visit Table.

The `CFBT01` table provides an overview of the actual values and its
change from baseline of each respective arm over the course of the
trial.

## Usage

``` r
cfbt01_main(
  adam_db,
  dataset,
  arm_var = "ACTARM",
  lbl_overall = NULL,
  row_split_var = NULL,
  summaryvars = c("AVAL", "CHG"),
  visitvar = "AVISIT",
  precision = list(default = 2L),
  page_var = "PARAMCD",
  .stats = c("n", "mean_sd", "median", "range"),
  skip = list(CHG = "BASELINE"),
  ...
)

cfbt01_pre(adam_db, dataset, ...)

cfbt01_post(tlg, prune_0 = TRUE, ...)

cfbt01
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

- `cfbt01_main()`: Main TLG function

- `cfbt01_pre()`: Preprocessing

- `cfbt01_post()`: Postprocessing

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
run(cfbt01, proc_data, dataset = "advs")
#>                                          A: Drug X                            B: Placebo                          C: Combination           
#>                                                   Change from                          Change from                           Change from   
#>                               Value at Visit       Baseline        Value at Visit        Baseline        Value at Visit        Baseline    
#>   Analysis Visit                  (N=15)            (N=15)             (N=15)             (N=15)             (N=15)             (N=15)     
#>   —————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————
#>   Diastolic Blood Pressure                                                                                                                 
#>     SCREENING                                                                                                                              
#>       n                             15                 0                 15                 0                  15                 0        
#>       Mean (SD)              94.385 (17.067)        NE (NE)       106.381 (20.586)       NE (NE)        106.468 (12.628)       NE (NE)     
#>       Median                      94.933              NE              111.133               NE              108.359               NE       
#>       Min - Max               55.71 - 122.00        NE - NE        60.21 - 131.91        NE - NE         83.29 - 127.17        NE - NE     
#>     BASELINE                                                                                                                               
#>       n                             15                                   15                                    15                          
#>       Mean (SD)              96.133 (22.458)                      108.111 (15.074)                      103.149 (19.752)                   
#>       Median                      93.328                              108.951                               102.849                        
#>       Min - Max               60.58 - 136.59                       83.44 - 131.62                        66.05 - 136.55                    
#>     WEEK 1 DAY 8                                                                                                                           
#>       n                             15                15                 15                 15                 15                 15       
#>       Mean (SD)              98.977 (21.359)    2.844 (28.106)    104.110 (16.172)   -4.001 (21.867)    100.826 (19.027)   -2.323 (25.018) 
#>       Median                      92.447            -4.066            107.703             3.227             103.058             -2.476     
#>       Min - Max               67.55 - 130.37    -32.82 - 47.68     70.91 - 132.89     -52.94 - 28.63     70.04 - 128.68     -55.15 - 41.81 
#>     WEEK 2 DAY 15                                                                                                                          
#>       n                             15                15                 15                 15                 15                 15       
#>       Mean (SD)              99.758 (14.477)    3.626 (21.189)    97.473 (17.296)    -10.638 (20.831)   94.272 (16.961)    -8.877 (27.229) 
#>       Median                     101.498             1.731             99.501             -9.727             96.789            -10.155     
#>       Min - Max               71.98 - 122.81    -39.50 - 47.57     53.80 - 125.81     -55.15 - 25.26     63.45 - 117.47     -73.10 - 46.54 
#>     WEEK 3 DAY 22                                                                                                                          
#>       n                             15                15                 15                 15                 15                 15       
#>       Mean (SD)              99.101 (26.109)    2.968 (34.327)    91.984 (16.925)    -16.127 (21.881)   94.586 (13.560)    -8.563 (21.713) 
#>       Median                     101.146            -0.271             91.244            -14.384             98.398            -16.075     
#>       Min - Max               47.68 - 162.22    -47.87 - 76.64     67.80 - 119.72     -53.06 - 22.52     73.50 - 115.43     -37.90 - 32.66 
#>     WEEK 4 DAY 29                                                                                                                          
#>       n                             15                15                 15                 15                 15                 15       
#>       Mean (SD)              103.400 (22.273)   7.267 (30.740)    96.467 (19.451)    -11.644 (25.922)   108.338 (18.417)    5.189 (21.881) 
#>       Median                      98.168             2.510             97.385            -16.793            107.555             7.966      
#>       Min - Max               63.09 - 148.25    -38.43 - 61.90     63.35 - 131.57     -57.11 - 48.13     68.78 - 132.52     -33.96 - 41.50 
#>     WEEK 5 DAY 36                                                                                                                          
#>       n                             15                15                 15                 15                 15                 15       
#>       Mean (SD)              93.222 (18.536)    -2.911 (28.873)   97.890 (20.701)    -10.221 (27.593)   95.317 (16.401)    -7.832 (19.827) 
#>       Median                      90.799            -3.385             99.049            -11.319             93.876             -4.665     
#>       Min - Max               63.55 - 139.11    -48.63 - 47.35     69.47 - 137.64     -54.38 - 37.85     71.91 - 138.54     -44.47 - 29.11 
#>   Systolic Blood Pressure                                                                                                                  
#>     SCREENING                                                                                                                              
#>       n                             15                 0                 15                 0                  15                 0        
#>       Mean (SD)              154.073 (33.511)       NE (NE)       157.840 (34.393)       NE (NE)        152.407 (22.311)       NE (NE)     
#>       Median                     156.169              NE              161.670               NE              149.556               NE       
#>       Min - Max               78.31 - 210.70        NE - NE        79.76 - 210.40        NE - NE        108.21 - 184.88        NE - NE     
#>     BASELINE                                                                                                                               
#>       n                             15                                   15                                    15                          
#>       Mean (SD)              145.925 (28.231)                     152.007 (28.664)                      154.173 (26.317)                   
#>       Median                     142.705                              157.698                               155.282                        
#>       Min - Max               85.21 - 195.68                       98.90 - 194.62                        86.65 - 192.68                    
#>     WEEK 1 DAY 8                                                                                                                           
#>       n                             15                15                 15                 15                 15                 15       
#>       Mean (SD)              156.509 (21.097)   10.584 (34.598)   147.480 (33.473)   -4.527 (48.895)    143.319 (30.759)   -10.854 (34.553)
#>       Median                     160.711             5.802            155.030             2.758             145.548             -5.636     
#>       Min - Max              126.84 - 185.53    -53.28 - 91.52     85.22 - 189.88     -77.34 - 90.98     90.37 - 191.58     -65.71 - 49.04 
#>     WEEK 2 DAY 15                                                                                                                          
#>       n                             15                15                 15                 15                 15                 15       
#>       Mean (SD)              144.202 (33.676)   -1.723 (27.067)   136.892 (30.178)   -15.115 (37.794)   148.622 (27.088)   -5.551 (44.670) 
#>       Median                     144.253             5.325            142.679            -14.083            147.102            -11.512     
#>       Min - Max               62.56 - 203.66    -53.89 - 44.16     70.34 - 174.27     -83.07 - 62.39    108.82 - 200.23    -69.54 - 113.59 
#>     WEEK 3 DAY 22                                                                                                                          
#>       n                             15                15                 15                 15                 15                 15       
#>       Mean (SD)              154.887 (35.374)   8.962 (38.455)    149.761 (28.944)   -2.247 (44.835)    150.460 (21.352)   -3.712 (37.984) 
#>       Median                     158.938            17.191            155.044             -1.796            156.505             -7.606     
#>       Min - Max              112.32 - 218.83    -47.28 - 96.18     84.42 - 192.92    -110.20 - 94.02     94.70 - 180.41     -74.91 - 72.74 
#>     WEEK 4 DAY 29                                                                                                                          
#>       n                             15                15                 15                 15                 15                 15       
#>       Mean (SD)              150.159 (32.249)   4.234 (32.965)    156.043 (22.863)    4.036 (42.494)    145.714 (22.980)   -8.458 (33.175) 
#>       Median                     145.506             3.754            149.094            -10.000            150.797            -14.432     
#>       Min - Max               69.37 - 210.43    -89.16 - 54.32    113.57 - 195.10     -71.44 - 77.75    106.91 - 188.09     -41.95 - 65.16 
#>     WEEK 5 DAY 36                                                                                                                          
#>       n                             15                15                 15                 15                 15                 15       
#>       Mean (SD)              155.964 (30.945)   10.039 (42.252)   156.387 (35.274)    4.380 (51.782)    143.592 (33.170)   -10.581 (44.799)
#>       Median                     158.142             1.448            164.552             7.060             148.501             -2.385     
#>       Min - Max              110.61 - 212.47    -53.91 - 90.45     63.28 - 198.79    -131.34 - 86.84     92.18 - 191.05     -78.77 - 64.35 
```
