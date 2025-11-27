# `AET01` Table 1 (Default) Overview of Deaths and Adverse Events Summary Table 1.

`AET01` Table 1 (Default) Overview of Deaths and Adverse Events Summary
Table 1.

## Usage

``` r
aet01_main(
  adam_db,
  arm_var = "ACTARM",
  lbl_overall = NULL,
  anl_vars = list(safety_var = c("FATAL", "SER", "SERWD", "SERDSM", "RELSER", "WD",
    "DSM", "REL", "RELWD", "RELDSM", "SEV")),
  anl_lbls = "Total number of {patient_label} with at least one",
  show_wd = TRUE,
  ...
)

aet01_pre(adam_db, ...)

aet01_post(tlg, prune_0 = FALSE, ...)

aet01
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

- anl_vars:

  Named (`list`) of (`character`) variables the safety variables to be
  summarized.

- anl_lbls:

  (`character`) of analysis labels.

- show_wd:

  (`flag`) whether to display the number of patients withdrawn from
  study due to an adverse event and the number of death.

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

- Does not remove rows with zero counts by default.

## Functions

- `aet01_main()`: Main TLG function

- `aet01_pre()`: Preprocessing

- `aet01_post()`: Postprocessing

## Note

- `adam_db` object must contain an `adsl` table with the `"DTHFL"` and
  `"DCSREAS"` columns.

- `adam_db` object must contain an `adae` table with the columns passed
  to `anl_vars`.

## Examples

``` r
run(aet01, syn_data, arm_var = "ARM")
#>                                                                A: Drug X    B: Placebo   C: Combination
#>                                                                  (N=15)       (N=15)         (N=15)    
#>   —————————————————————————————————————————————————————————————————————————————————————————————————————
#>   Total number of patients with at least one AE                13 (86.7%)   14 (93.3%)     15 (100%)   
#>   Total number of AEs                                              58           59             99      
#>   Total number of deaths                                       2 (13.3%)    4 (26.7%)      3 (20.0%)   
#>   Total number of patients withdrawn from study due to an AE       0            0           1 (6.7%)   
#>   Total number of patients with at least one                                                           
#>     AE with fatal outcome                                      8 (53.3%)    8 (53.3%)      10 (66.7%)  
#>     Serious AE                                                 12 (80.0%)   12 (80.0%)     11 (73.3%)  
#>     Serious AE leading to withdrawal from treatment                0            0          2 (13.3%)   
#>     Serious AE leading to dose modification/interruption       4 (26.7%)    3 (20.0%)      4 (26.7%)   
#>     Related Serious AE                                         8 (53.3%)    8 (53.3%)      10 (66.7%)  
#>     AE leading to withdrawal from treatment                    2 (13.3%)    3 (20.0%)      3 (20.0%)   
#>     AE leading to dose modification/interruption               6 (40.0%)    9 (60.0%)      11 (73.3%)  
#>     Related AE                                                 11 (73.3%)   10 (66.7%)     13 (86.7%)  
#>     Related AE leading to withdrawal from treatment                0        3 (20.0%)          0       
#>     Related AE leading to dose modification/interruption        1 (6.7%)    4 (26.7%)      9 (60.0%)   
#>     Severe AE (at greatest intensity)                          11 (73.3%)   10 (66.7%)     12 (80.0%)  
```
