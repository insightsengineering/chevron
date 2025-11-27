# `RMPT06` Table 1 (Default) Seriousness, Outcomes, Severity, Frequency with 95% CI for Risk Management Plan.

`RMPT06` Table 1 (Default) Seriousness, Outcomes, Severity, Frequency
with 95% CI for Risk Management Plan.

## Usage

``` r
rmpt06_main(
  adam_db,
  arm_var = "ACTARM",
  lbl_overall = NULL,
  method = "clopper-pearson",
  conf_level = 0.95,
  show_diff = FALSE,
  ref_group = NULL,
  method_diff = "wald",
  conf_level_diff = 0.95,
  grade_groups = NULL,
  ...
)

rmpt06_pre(adam_db, ...)

rmpt06_post(tlg, prune_0 = FALSE, ...)

rmpt06
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

- method:

  (`string`) the method used to construct the confidence interval. See
  [`tern::estimate_proportion`](https://insightsengineering.github.io/tern/latest-tag/reference/estimate_proportion.html).

- conf_level:

  (`proportion`) the confidence level of the interval. See
  [`tern::estimate_proportion`](https://insightsengineering.github.io/tern/latest-tag/reference/estimate_proportion.html).

- show_diff:

  (`flag`) whether to show the difference of patient with at least one
  adverse event between groups.

- ref_group:

  (`string`) the reference group for the difference.

- method_diff:

  (`string`) the method used to construct the confidence interval for
  the difference between groups.

- conf_level_diff:

  (`proportion`) the confidence level of the interval for the difference
  between groups.

- grade_groups:

  (`list`) the grade groups to be displayed.

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

## Functions

- `rmpt06_main()`: Main TLG function

- `rmpt06_pre()`: Preprocessing

- `rmpt06_post()`: Postprocessing

## Examples

``` r
run(rmpt06, syn_data)
#>                                                                   A: Drug X      B: Placebo    C: Combination
#>                                                                     (N=15)         (N=15)          (N=15)    
#>   ———————————————————————————————————————————————————————————————————————————————————————————————————————————
#>   Number of patients with at least one adverse event              13 (86.7%)     14 (93.3%)     15 (100.0%)  
#>   95% CI for % of patients with at least one AE                  (59.5, 98.3)   (68.1, 99.8)   (78.2, 100.0) 
#>   Total number of AEs                                                 58             59              99      
#>   Total number of patients with at least one AE by worst grade                                               
#>     Grade 1                                                           0           1 (6.7%)        1 (6.7%)   
#>     Grade 2                                                        1 (6.7%)       1 (6.7%)        1 (6.7%)   
#>     Grade 3                                                        1 (6.7%)      2 (13.3%)        1 (6.7%)   
#>     Grade 4                                                       3 (20.0%)      2 (13.3%)       2 (13.3%)   
#>     Grade 5 (fatal outcome)                                       8 (53.3%)      8 (53.3%)       10 (66.7%)  
#>   Number of patients with at least one serious AE                 12 (80.0%)     12 (80.0%)      11 (73.3%)  
#>   Number of patients with at least one AE by outcome                                                         
#>     Fatal outcome                                                 8 (61.5%)      8 (57.1%)       10 (66.7%)  
#>     Unresolved                                                    4 (30.8%)      6 (42.9%)       9 (60.0%)   
#>     Recovered/Resolved                                            9 (69.2%)      8 (57.1%)       11 (73.3%)  
#>     Resolved with sequelae                                        5 (38.5%)      4 (28.6%)       7 (46.7%)   
#>     Recovering/Resolving                                          9 (69.2%)      6 (42.9%)       13 (86.7%)  
#>     Unknown outcome                                               2 (15.4%)      4 (28.6%)       7 (46.7%)   
```
