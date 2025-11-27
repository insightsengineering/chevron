# `DTHT01` Table 1 (Default) Death Table.

A description of the causes of death optionally with the breakdown of
the `OTHER` category and/or post-study reporting of death.

## Usage

``` r
dtht01_main(
  adam_db,
  arm_var = "ACTARM",
  lbl_overall = NULL,
  other_category = FALSE,
  time_since_last_dose = FALSE,
  ...
)

dtht01_pre(adam_db, ...)

dtht01_post(tlg, prune_0 = TRUE, ...)

dtht01
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

- other_category:

  (`flag`) should the breakdown of the `OTHER` category be displayed.

- time_since_last_dose:

  (`flag`) should the time to event information be displayed.

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

- Numbers represent absolute numbers of subjects and fraction of `N`, or
  absolute numbers when specified.

- Remove zero-count rows unless overridden with `prune_0 = FALSE`.

- Does not include a total column by default.

## Functions

- `dtht01_main()`: Main TLG function

- `dtht01_pre()`: Preprocessing

- `dtht01_post()`: Postprocessing

## Note

- `adam_db` object must contain an `adsl` table with the columns
  `"DTHFL"`, `"DTHCAT"` as well as `LDDTHGR1` if `time_since_last_dose`
  is `TRUE`.

## Examples

``` r
run(dtht01, syn_data)
#>                            A: Drug X   B: Placebo   C: Combination
#>                             (N=15)       (N=15)         (N=15)    
#>   ————————————————————————————————————————————————————————————————
#>   Total number of deaths   2 (13.3%)   4 (26.7%)      3 (20.0%)   
#>   Primary Cause of Death                                          
#>     n                          2           4              3       
#>     Adverse Event          1 (50.0%)   2 (50.0%)      1 (33.3%)   
#>     Progressive Disease    1 (50.0%)       0          2 (66.7%)   
#>     Other                      0       2 (50.0%)          0       

run(dtht01, syn_data, other_category = TRUE, time_since_last_dose = TRUE)
#>                                                               A: Drug X   B: Placebo   C: Combination
#>                                                                (N=15)       (N=15)         (N=15)    
#>   ———————————————————————————————————————————————————————————————————————————————————————————————————
#>   Total number of deaths                                      2 (13.3%)   4 (26.7%)      3 (20.0%)   
#>   Primary Cause of Death                                                                             
#>     n                                                             2           4              3       
#>     Adverse Event                                             1 (50.0%)   2 (50.0%)      1 (33.3%)   
#>     Progressive Disease                                       1 (50.0%)       0          2 (66.7%)   
#>     Other                                                         0       2 (50.0%)          0       
#>       LOST TO FOLLOW UP                                           0        1 (50%)           0       
#>       SUICIDE                                                     0        1 (50%)           0       
#>   Days from last drug administration                                                                 
#>     n                                                             2           4              3       
#>     <=30                                                      2 (100%)    1 (25.0%)      2 (66.7%)   
#>     >30                                                           0       3 (75.0%)      1 (33.3%)   
#>   Primary cause by days from last study drug administration                                          
#>     <=30                                                                                             
#>       n                                                           2           1              2       
#>       Adverse Event                                           1 (50.0%)       0          1 (50.0%)   
#>       Progressive Disease                                     1 (50.0%)       0          1 (50.0%)   
#>       Other                                                       0        1 (100%)          0       
#>     >30                                                                                              
#>       n                                                           0           3              1       
#>       Adverse Event                                               0       2 (66.7%)          0       
#>       Progressive Disease                                         0           0           1 (100%)   
#>       Other                                                       0       1 (33.3%)          0       
```
