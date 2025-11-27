# `COXT01` (Default) Cox Regression Model Table.

Cox models are the most commonly used methods to estimate the magnitude
of the effect in survival analyses. It assumes proportional hazards;
that is, it assumes that the ratio of the hazards of the two groups
(e.g. two arms) is constant over time. This ratio is referred to as the
"hazard ratio" and is one of the most commonly reported metrics to
describe the effect size in survival analysis.

## Usage

``` r
coxt01_main(
  adam_db,
  arm_var = "ARM",
  time_var = "AVAL",
  event_var = "EVENT",
  covariates = c("SEX", "RACE", "AAGE"),
  strata = NULL,
  lbl_vars = "Effect/Covariate Included in the Model",
  multivar = FALSE,
  ...
)

coxt01_pre(adam_db, arm_var = "ARM", ...)

coxt01_post(tlg, prune_0 = FALSE, ...)

coxt01
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

- tlg:

  (`TableTree`, `Listing` or `ggplot`) object typically produced by a
  `main` function.

- prune_0:

  (`flag`) remove 0 count rows

## Value

the main function returns an `rtables` object

the preprocessing function returns a `list` of `data.frame`.

the postprocessing function returns an `rtables` object or an
`ElementaryTable` (null report).

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

- `coxt01_main()`: Main TLG function

- `coxt01_pre()`: Preprocessing

- `coxt01_post()`: Postprocessing

## Note

- `adam_db` object must contain an `adtte` table with `"PARAMCD"`,
  `"ARM"`, `"AVAL"`, `"CNSR`, and the columns specified by
  `"covariates"` which is denoted as `c("SEX", "RACE", "AAGE")` by
  default.

## Examples

``` r
library(dunlin)

proc_data <- log_filter(syn_data, PARAMCD == "CRSD", "adtte")
proc_data <- log_filter(proc_data, ARMCD != "ARM C", "adsl")
run(coxt01, proc_data)
#>                                                Treatment Effect Adjusted for Covariate     
#>   Effect/Covariate Included in the Model    n      Hazard Ratio       95% CI       p-value 
#>   —————————————————————————————————————————————————————————————————————————————————————————
#>   Treatment:                                                                               
#>     B: Placebo vs control (A: Drug X)       30         0.68        (0.25, 1.89)     0.4638 
#>   Covariate:                                                                               
#>     Sex                                     30         0.53        (0.18, 1.58)     0.2553 
#>     RACE                                    30         0.79        (0.28, 2.17)     0.6415 
#>     Age (yr)                                30         0.67        (0.24, 1.89)     0.4526 

run(coxt01, proc_data, covariates = c("SEX", "AAGE"), strata = c("RACE"), conf_level = 0.90)
#>                                                Treatment Effect Adjusted for Covariate     
#>   Effect/Covariate Included in the Model    n      Hazard Ratio       90% CI       p-value 
#>   —————————————————————————————————————————————————————————————————————————————————————————
#>   Treatment:                                                                               
#>     B: Placebo vs control (A: Drug X)       30         1.03        (0.44, 2.42)     0.9578 
#>   Covariate:                                                                               
#>     Sex                                     30         0.81        (0.31, 2.10)     0.7214 
#>     Age (yr)                                30         1.01        (0.42, 2.40)     0.9856 
```
