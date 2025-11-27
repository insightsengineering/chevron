# `AET05_ALL` Table 1 (Default) Adverse Event Rate Adjusted for Patient-Years at Risk - All Occurrences.

The `AET05_ALL` table produces the standard adverse event rate adjusted
for patient-years at risk summary considering all occurrences.

## Usage

``` r
aet05_all_pre(adam_db, dataset = "adsaftte", ...)

aet05_all
```

## Format

An object of class `chevron_t` of length 1.

## Arguments

- adam_db:

  (`list` of `data.frames`) object containing the `ADaM` datasets

- dataset:

  (`string`) the name of a table in the `adam_db` object.

- ...:

  not used.

## Value

the preprocessing function returns a `list` of `data.frame`.

## Functions

- `aet05_all_pre()`: Preprocessing

## Examples

``` r
library(dplyr)
library(dunlin)

proc_data <- log_filter(syn_data, PARAMCD == "AETOT1" | PARAMCD == "AEREPTTE", "adsaftte")

run(aet05_all, proc_data)
#>                                                  A: Drug X        B: Placebo      C: Combination 
#>                                                    (N=15)           (N=15)            (N=15)     
#>   ———————————————————————————————————————————————————————————————————————————————————————————————
#>   Number of occurrences of any adverse event                                                     
#>     Total patient-years at risk                     44.4             44.2              44.4      
#>     Number of adverse events observed                29               49                56       
#>     AE rate per 100 patient-years                  65.32            110.76            126.15     
#>     95% CI                                     (41.54, 89.09)   (79.75, 141.77)   (93.11, 159.19)

run(aet05_all, proc_data, conf_level = 0.90, conf_type = "exact")
#>                                                  A: Drug X        B: Placebo      C: Combination 
#>                                                    (N=15)           (N=15)            (N=15)     
#>   ———————————————————————————————————————————————————————————————————————————————————————————————
#>   Number of occurrences of any adverse event                                                     
#>     Total patient-years at risk                     44.4             44.2              44.4      
#>     Number of adverse events observed                29               49                56       
#>     AE rate per 100 patient-years                  65.32            110.76            126.15     
#>     90% CI                                     (46.73, 89.06)   (86.08, 140.53)   (99.76, 157.60)
```
