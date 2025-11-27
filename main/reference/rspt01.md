# `RSPT01` Binary Outcomes Summary.

`RSPT01` template may be used to summarize any binary outcome or
response variable at a single time point. Typical application for
oncology

## Usage

``` r
rspt01_main(
  adam_db,
  dataset = "adrs",
  arm_var = "ARM",
  ref_group = NULL,
  odds_ratio = TRUE,
  perform_analysis = "unstrat",
  strata = NULL,
  conf_level = 0.95,
  methods = list(),
  ...
)

rspt01_pre(adam_db, ...)

rspt01_post(tlg, prune_0 = TRUE, ...)

rspt01
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

- odds_ratio:

  (`flag`) should the odds ratio be calculated, default is `TRUE`

- perform_analysis:

  (`string`) option to display statistical comparisons using stratified
  analyses, or unstratified analyses, or both, e.g.
  `c("unstrat", "strat")`. Only unstratified will be displayed by
  default

- strata:

  (`string`) stratification factors, e.g.
  `strata = c("STRATA1", "STRATA2")`, by default as NULL

- conf_level:

  (`numeric`) the level of confidence interval, default is 0.95.

- methods:

  (`list`) a named list, use a named list to control, for example:
  `methods = list(prop_conf_method = "wald", diff_conf_method = "wald", strat_diff_conf_method = "ha", diff_pval_method = "fisher", strat_diff_pval_method = "schouten")`
  `prop_conf_method` controls the methods of calculating proportion
  confidence interval, `diff_conf_method` controls the methods of
  calculating unstratified difference confidence interval,
  `strat_diff_conf_method` controls the methods of calculating
  stratified difference confidence interval, `diff_pval_method` controls
  the methods of calculating unstratified p-value for odds ratio,
  `strat_diff_pval_method` controls the methods of calculating
  stratified p-value for odds ratio, see more details in `tern`

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

- No overall value.

## Functions

- `rspt01_main()`: Main TLG function

- `rspt01_pre()`: Preprocessing

- `rspt01_post()`: Postprocessing

## Examples

``` r
library(dplyr)
library(dunlin)

proc_data <- log_filter(syn_data, PARAMCD == "BESRSPI", "adrs")

run(rspt01, proc_data)
#> Warning: Chi-squared approximation may be incorrect
#>                                          A: Drug X          B: Placebo         C: Combination  
#>                                            (N=15)             (N=15)               (N=15)      
#>   —————————————————————————————————————————————————————————————————————————————————————————————
#>   Responders                             10 (66.7%)         9 (60.0%)            11 (73.3%)    
#>   95% CI (Wald, with correction)        (39.5, 93.9)       (31.9, 88.1)         (47.6, 99.0)   
#>   Unstratified Analysis                                                                        
#>     Difference in Response rate (%)                            -6.7                 6.7        
#>       95% CI (Wald, with correction)                      (-47.7, 34.4)        (-32.7, 46.0)   
#>     p-value (Chi-Squared Test)                                0.7048               0.6903      
#>   Odds Ratio (95% CI)                                   0.75 (0.17 - 3.33)   1.37 (0.29 - 6.60)
#>   Complete Response (CR)                 4 (26.7%)          4 (26.7%)            7 (46.7%)     
#>     95% CI (Wald, with correction)     (0.95, 52.38)      (0.95, 52.38)        (18.09, 75.25)  
#>   Partial Response (PR)                  6 (40.0%)          5 (33.3%)            4 (26.7%)     
#>     95% CI (Wald, with correction)     (11.87, 68.13)     (6.14, 60.52)        (0.95, 52.38)   
#>   Stable Disease (SD)                    5 (33.3%)          6 (40.0%)            4 (26.7%)     
#>     95% CI (Wald, with correction)     (6.14, 60.52)      (11.87, 68.13)       (0.95, 52.38)   

run(rspt01, proc_data,
  odds_ratio = FALSE, perform_analysis = c("unstrat", "strat"),
  strata = c("STRATA1", "STRATA2"), methods = list(diff_pval_method = "fisher")
)
#> Warning: Less than 5 observations in some strata.
#> Warning: Less than 5 observations in some strata.
#> Warning: <5 data points in some strata. CMH test may be incorrect.
#> Warning: <5 data points in some strata. CMH test may be incorrect.
#>                                                A: Drug X        B: Placebo     C: Combination
#>                                                  (N=15)           (N=15)           (N=15)    
#>   ———————————————————————————————————————————————————————————————————————————————————————————
#>   Responders                                   10 (66.7%)       9 (60.0%)        11 (73.3%)  
#>   95% CI (Wald, with correction)              (39.5, 93.9)     (31.9, 88.1)     (47.6, 99.0) 
#>   Unstratified Analysis                                                                      
#>     Difference in Response rate (%)                                -6.7             6.7      
#>       95% CI (Wald, with correction)                          (-47.7, 34.4)    (-32.7, 46.0) 
#>     p-value (Fisher's Exact Test)                                 1.0000           1.0000    
#>   Stratified Analysis                                                                        
#>     Difference in Response rate (%)                               -11.0             22.5     
#>       95% CI (CMH, without correction)                        (-42.7, 20.7)     (-3.5, 48.5) 
#>     p-value (Cochran-Mantel-Haenszel Test)                        0.5731           0.3088    
#>   Complete Response (CR)                       4 (26.7%)        4 (26.7%)        7 (46.7%)   
#>     95% CI (Wald, with correction)           (0.95, 52.38)    (0.95, 52.38)    (18.09, 75.25)
#>   Partial Response (PR)                        6 (40.0%)        5 (33.3%)        4 (26.7%)   
#>     95% CI (Wald, with correction)           (11.87, 68.13)   (6.14, 60.52)    (0.95, 52.38) 
#>   Stable Disease (SD)                          5 (33.3%)        6 (40.0%)        4 (26.7%)   
#>     95% CI (Wald, with correction)           (6.14, 60.52)    (11.87, 68.13)   (0.95, 52.38) 
```
