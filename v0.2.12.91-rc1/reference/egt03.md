# `EGT03` Shift Table of ECG Interval Data - Baseline versus Minimum or Maximum Post-Baseline.

The `EGT03` Table entries provide the number of patients by baseline
assessment and minimum or maximum post-baseline assessment. Percentages
are based on the total number of patients in a treatment group. Baseline
is the patient's last observation prior to initiation of study drug.

## Usage

``` r
egt03_main(
  adam_db,
  arm_var = "ACTARMCD",
  summaryvar = "BNRIND",
  splitvar = "ANRIND",
  visitvar = "AVISIT",
  page_var = "PARAMCD",
  ...
)

egt03_pre(adam_db, ...)

egt03_post(tlg, prune_0 = FALSE, ...)

egt03
```

## Format

An object of class `chevron_t` of length 1.

## Arguments

- adam_db:

  (`list` of `data.frames`) object containing the `ADaM` datasets

- arm_var:

  (`character`) the arm variables used for row split, typically
  `"ACTARMCD"`.

- summaryvar:

  (`character`) variables to be analyzed, typically `"BNRIND"`. Labels
  of the corresponding columns are used as subtitles.

- splitvar:

  (`character`) variables to be analyzed, typically `"ANRIND"`. Labels
  of the corresponding columns are used as subtitles.

- visitvar:

  (`string`) typically `"AVISIT"` or user-defined visit incorporating
  `"ATPT"`.

- page_var:

  (`string`) variable name prior to which the row split is by page.

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

- `ADEG` data are subsetted to contain only "POST-BASELINE
  MINIMUM"/"POST-BASELINE MAXIMUM" visit according to the preprocessing.

- Percentages are based on the total number of patients in a treatment
  group.

- Split columns by Analysis Reference Range Indicator, typically
  `ANRIND`.

- Does not include a total column by default.

- Sorted based on factor level.

## Functions

- `egt03_main()`: Main TLG function

- `egt03_pre()`: Preprocessing

- `egt03_post()`: Postprocessing

## Note

- `adam_db` object must contain an `adeg` table with a `"ACTARMCD"`
  column as well as columns specified in `summaryvar` and `splitvar`.

## Examples

``` r
library(dunlin)

proc_data <- log_filter(syn_data, PARAMCD == "HR", "adeg")
run(egt03, proc_data)
#>   Actual Arm Code                            Minimum Post-Baseline Assessment     
#>     Baseline Reference Range Indicator      LOW         NORMAL      HIGH   Missing
#>   ————————————————————————————————————————————————————————————————————————————————
#>   Heart Rate                                                                      
#>     ARM A (N=15)                                                                  
#>       LOW                                    0             0         0        0   
#>       NORMAL                             4 (26.7%)     9 (60.0%)     0        0   
#>       HIGH                                   0         2 (13.3%)     0        0   
#>       Missing                                0             0         0        0   
#>     ARM B (N=15)                                                                  
#>       LOW                                    0         1 (6.7%)      0        0   
#>       NORMAL                             4 (26.7%)    10 (66.7%)     0        0   
#>       HIGH                                   0             0         0        0   
#>       Missing                                0             0         0        0   
#>     ARM C (N=15)                                                                  
#>       LOW                                    0             0         0        0   
#>       NORMAL                             4 (26.7%)    10 (66.7%)     0        0   
#>       HIGH                                   0         1 (6.7%)      0        0   
#>       Missing                                0             0         0        0   
```
