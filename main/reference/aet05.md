# `AET05` Table 1 (Default) Adverse Event Rate Adjusted for Patient-Years at Risk - First Occurrence.

The `AET05` table produces the standard adverse event rate adjusted for
patient-years at risk summary considering first occurrence.

## Usage

``` r
aet05_main(
  adam_db,
  dataset = "adsaftte",
  arm_var = "ACTARM",
  lbl_overall = NULL,
  ...
)

aet05_pre(adam_db, dataset = "adsaftte", ...)

aet05_post(tlg, prune_0 = FALSE, ...)

aet05
```

## Format

An object of class `chevron_t` of length 1.

## Arguments

- adam_db:

  (`list` of `data.frames`) object containing the `ADaM` datasets

- dataset:

  (`string`) the name of a table in the `adam_db` object.

- arm_var:

  (`string`) the arm variable used for arm splitting.

- lbl_overall:

  (`string`) label used for overall column, if set to `NULL` the overall
  column is omitted

- ...:

  Further arguments passed to
  [`tern::control_incidence_rate()`](https://insightsengineering.github.io/tern/latest-tag/reference/control_incidence_rate.html).

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

- Total patient-years at risk is the sum over all patients of the time
  intervals (in years).

- Split columns by arm, typically `ACTARM`.

- Split rows by parameter code.

- `AVAL` is patient-years at risk.

- `N_EVENTS` is the number of adverse events observed.

- The table allows confidence level to be adjusted, default is 95%.

- Keep zero count rows by default.

## Functions

- `aet05_main()`: Main TLG function

- `aet05_pre()`: Preprocessing

- `aet05_post()`: Postprocessing

## Note

- `adam_db` object must contain table named as `dataset` with the
  columns `"PARAMCD"`, `"PARAM"`, `"AVAL"`, and `"CNSR"`.

## Examples

``` r
library(dplyr)
#> 
#> Attaching package: ‘dplyr’
#> The following objects are masked from ‘package:stats’:
#> 
#>     filter, lag
#> The following objects are masked from ‘package:base’:
#> 
#>     intersect, setdiff, setequal, union
library(dunlin)

proc_data <- log_filter(syn_data, PARAMCD == "AETTE1", "adsaftte")

run(aet05, proc_data)
#>                                                     A: Drug X       B: Placebo      C: Combination
#>                                                      (N=15)           (N=15)            (N=15)    
#>   ————————————————————————————————————————————————————————————————————————————————————————————————
#>   Time to first occurrence of any adverse event                                                   
#>     Total patient-years at risk                       31.0              9.0              22.0     
#>     Number of adverse events observed                   5               13                8       
#>     AE rate per 100 patient-years                     16.13           143.75            36.30     
#>     95% CI                                        (1.99, 30.27)   (65.61, 221.89)   (11.15, 61.45)

run(aet05, proc_data, conf_level = 0.90, conf_type = "exact")
#>                                                     A: Drug X       B: Placebo      C: Combination
#>                                                      (N=15)           (N=15)            (N=15)    
#>   ————————————————————————————————————————————————————————————————————————————————————————————————
#>   Time to first occurrence of any adverse event                                                   
#>     Total patient-years at risk                       31.0              9.0              22.0     
#>     Number of adverse events observed                   5               13                8       
#>     AE rate per 100 patient-years                     16.13           143.75            36.30     
#>     90% CI                                        (6.36, 33.91)   (85.03, 228.55)   (18.06, 65.50)
```
