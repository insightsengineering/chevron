# `COXT02` Multi-Variable Cox Regression Model Table.

The `COXT02` table follows the same principles as the general Cox model
analysis and produces the estimates for each of the covariates included
in the model (usually the main effects without interaction terms).

## Usage

``` r
coxt02_main(
  adam_db,
  arm_var = "ARM",
  time_var = "AVAL",
  event_var = "EVENT",
  covariates = c("SEX", "RACE", "AAGE"),
  strata = NULL,
  lbl_vars = "Effect/Covariate Included in the Model",
  multivar = TRUE,
  ...
)

coxt02
```

## Format

An object of class `chevron_t` of length 1.

## Arguments

- adam_db:

  (`list` of `data.frames`) object containing the `ADaM` datasets

- arm_var:

  (`string`) the arm variable used for arm splitting.

- time_var:

  (`string`) the time variable in a Cox proportional hazards regression
  model.

- event_var:

  (`string`) the event variable in a Cox proportional hazards regression
  model.

- covariates:

  (`character`) will be fitted and the corresponding effect will be
  estimated.

- strata:

  (`character`) will be fitted for the stratified analysis.

- lbl_vars:

  (`string`) text label for the a Cox regression model variables.

- multivar:

  (`flag`) indicator of whether multivariate cox regression is
  conducted.

- ...:

  Further arguments passed to
  [`tern::control_coxreg()`](https://insightsengineering.github.io/tern/latest-tag/reference/control_coxreg.html).

## Value

the main function returns an `rtables` object.

## Details

- The reference arm will always the first level of `arm_var`. Please
  change the level if you want to change the reference arms.

- The table allows confidence level to be adjusted, default is two-sided
  95%.

- The stratified analysis is with DISCRETE tie handling (equivalent to
  `tern::control_coxreg(ties = "exact")` in R).

- Model includes treatment plus specified covariate(s) as factor(s) or
  numeric(s), with `"SEX"`, `"RACE"` and `"AAGE"` as default candidates.

- The selection of the covariates and whether or not there is a
  selection process (vs. a fixed, pre-specified list) needs to be
  pre-specified.

- For pairwise comparisons using the hazard ratio, the value for the
  control group is the denominator.

- Keep zero-count rows unless overridden with `prune_0 = TRUE`.

## Functions

- `coxt02_main()`: Main TLG function

## Note

- `adam_db` object must contain an `adtte` table with `"PARAMCD"`,
  `"ARM"`, `"AVAL"`, `"CNSR`, and the columns specified by
  `"covariates"` which is denoted as `c("SEX", "RACE", "AAGE")` by
  default.

## Examples

``` r
library(dunlin)

proc_data <- log_filter(syn_data, PARAMCD == "CRSD", "adtte")

run(coxt02, proc_data)
#>   Effect/Covariate Included in the Model                  Hazard Ratio      95% CI       p-value
#>   ——————————————————————————————————————————————————————————————————————————————————————————————
#>   Treatment:                                                                                    
#>     Description of Planned Arm (reference = A: Drug X)                                   0.6859 
#>       B: Placebo                                              0.77       (0.29, 2.08)    0.6113 
#>       C: Combination                                          0.62       (0.21, 1.82)    0.3853 
#>   Covariate:                                                                                    
#>     Sex (reference = F)                                                                         
#>       M                                                       1.41       (0.61, 3.23)    0.4194 
#>     RACE (reference = AMERICAN INDIAN OR ALASKA NATIVE)                                  0.8938 
#>       ASIAN                                                   1.69       (0.36, 7.99)    0.5055 
#>       BLACK OR AFRICAN AMERICAN                               1.86       (0.29, 11.72)   0.5109 
#>       WHITE                                                   2.03       (0.34, 12.25)   0.4414 
#>     Age (yr)                                                                                    
#>       All                                                     1.00       (0.94, 1.08)    0.8951 

run(coxt02, proc_data, covariates = c("SEX", "AAGE"), strata = c("RACE"), conf_level = 0.90)
#>   Effect/Covariate Included in the Model                 Hazard Ratio      90% CI      p-value
#>   ————————————————————————————————————————————————————————————————————————————————————————————
#>   Treatment:                                                                                  
#>     Description of Planned Arm (reference = A: Drug X)                                 0.7644 
#>       B: Placebo                                             0.97       (0.40, 2.35)   0.9586 
#>       C: Combination                                         0.70       (0.29, 1.73)   0.5199 
#>   Covariate:                                                                                  
#>     Sex (reference = F)                                                                       
#>       M                                                      1.66       (0.81, 3.41)   0.2468 
#>     Age (yr)                                                                                  
#>       All                                                    1.01       (0.95, 1.06)   0.8541 
```
