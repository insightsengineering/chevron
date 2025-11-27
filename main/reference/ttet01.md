# `TTET01` Binary Outcomes Summary.

`TTET01` template may be used to summarize any binary outcome or
response variable at a single time point. Typical application for
oncology

## Usage

``` r
ttet01_main(
  adam_db,
  dataset = "adtte",
  arm_var = "ARM",
  ref_group = NULL,
  summarize_event = TRUE,
  perform_analysis = "unstrat",
  strata = NULL,
  ...
)

ttet01_pre(adam_db, dataset = "adtte", ...)

ttet01_post(tlg, prune_0 = TRUE, ...)

ttet01
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

- ref_group:

  (`string`) The name of the reference group, the value should be
  identical to the values in `arm_var`, if not specified, it will by
  default use the first level or value of `arm_var`.

- summarize_event:

  (`flag`) should the event description be displayed, default is TRUE

- perform_analysis:

  (`string`) option to display statistical comparisons using stratified
  analyses, or unstratified analyses, or both, e.g.
  `c("unstrat", "strat")`. Only unstratified will be displayed by
  default

- strata:

  (`string`) stratification factors, e.g.
  `strata = c("STRATA1", "STRATA2")`, by default as NULL

- ...:

  Further arguments passed to `control_surv_time()`, `control_coxph()`,
  `control_survtp()`, and `surv_timepoint()`. For details, see the
  documentation in `tern`. Commonly used arguments include
  `pval_method`, `conf_level`, `conf_type`, `quantiles`, `ties`,
  `time_point`, `method`, etc.

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

- No overall value.

## Functions

- `ttet01_main()`: Main TLG function

- `ttet01_pre()`: Preprocessing

- `ttet01_post()`: Postprocessing

## Examples

``` r
library(dplyr)
library(dunlin)

proc_data <- log_filter(syn_data, PARAMCD == "PFS", "adtte")
run(ttet01, proc_data)
#>                                       A: Drug X        B: Placebo      C: Combination 
#>                                         (N=15)           (N=15)            (N=15)     
#>   ————————————————————————————————————————————————————————————————————————————————————
#>   Patients with event (%)             7 (46.7%)         12 (80%)          8 (53.3%)   
#>     Earliest contributing event                                                       
#>       Death                               5                11                 7       
#>       Disease Progression                 2                 1                 1       
#>   Patients without event (%)          8 (53.3%)          3 (20%)          7 (46.7%)   
#>   Time to Event (MONTHS)                                                              
#>     Median                               8.6               6.2               8.4      
#>       95% CI                          (7.3, NE)        (4.8, 7.6)         (7.0, NE)   
#>     25% and 75%-ile                    3.8, NE          4.7, 8.4           5.8, NE    
#>     Range                           1.2 to 9.5 {1}     0.9 to 9.1      0.9 to 9.5 {1} 
#>   Unstratified Analysis                                                               
#>     p-value (log-rank)                                   0.0973            0.9111     
#>     Hazard Ratio                                          2.18              1.06      
#>     95% CI                                            (0.85, 5.60)      (0.38, 2.94)  
#>   6 MONTHS                                                                            
#>     Patients remaining at risk            11                8                11       
#>     Event Free Rate (%)                 73.33             53.33             73.33     
#>     95% CI                          (50.95, 95.71)   (28.09, 78.58)    (50.95, 95.71) 
#>     Difference in Event Free Rate                        -20.00             0.00      
#>       95% CI                                         (-53.74, 13.74)   (-31.65, 31.65)
#>       p-value (Z-test)                                   0.2453            1.0000     
#>   ————————————————————————————————————————————————————————————————————————————————————
#> 
#>   {1} - Censored observation: range maximum
#>   ————————————————————————————————————————————————————————————————————————————————————
#> 

run(ttet01, proc_data,
  summarize_event = FALSE, perform_analysis = c("unstrat", "strat"),
  strata = c("STRATA1", "STRATA2"),
  conf_type = "log-log",
  time_point = c(6, 12),
  method = "both"
)
#>                                       A: Drug X        B: Placebo      C: Combination 
#>                                         (N=15)           (N=15)            (N=15)     
#>   ————————————————————————————————————————————————————————————————————————————————————
#>   Patients with event (%)             7 (46.7%)         12 (80%)          8 (53.3%)   
#>   Patients without event (%)          8 (53.3%)          3 (20%)          7 (46.7%)   
#>   Time to Event (MONTHS)                                                              
#>     Median                               8.6               6.2               8.4      
#>       95% CI                          (2.6, NE)        (2.2, 7.6)         (3.8, NE)   
#>     25% and 75%-ile                    3.8, NE          4.7, 8.4           5.8, NE    
#>     Range                           1.2 to 9.5 {1}     0.9 to 9.1      0.9 to 9.5 {1} 
#>   Unstratified Analysis                                                               
#>     p-value (log-rank)                                   0.0973            0.9111     
#>     Hazard Ratio                                          2.18              1.06      
#>     95% CI                                            (0.85, 5.60)      (0.38, 2.94)  
#>   Stratified Analysis                                                                 
#>     p-value (log-rank)                                   0.1505            0.8372     
#>     Hazard Ratio                                          2.11              0.86      
#>     95% CI                                            (0.75, 5.96)      (0.21, 3.49)  
#>   6 MONTHS                                                                            
#>     Patients remaining at risk            11                8                11       
#>     Event Free Rate (%)                 73.33             53.33             73.33     
#>     95% CI                          (43.62, 89.05)   (26.32, 74.38)    (43.62, 89.05) 
#>     Difference in Event Free Rate                        -20.00             0.00      
#>       95% CI                                         (-53.74, 13.74)   (-31.65, 31.65)
#>       p-value (Z-test)                                   0.2453            1.0000     
#>   ————————————————————————————————————————————————————————————————————————————————————
#> 
#>   {1} - Censored observation: range maximum
#>   ————————————————————————————————————————————————————————————————————————————————————
#> 
```
