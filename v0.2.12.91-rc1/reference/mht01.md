# `MHT01` Medical History Table.

The `MHT01` table provides an overview of the subjects medical history
by SOC and Preferred Term.

## Usage

``` r
mht01_label

mht01_main(
  adam_db,
  arm_var = "ARM",
  row_split_var = "MHBODSYS",
  lbl_overall = NULL,
  summary_labels = list(all = mht01_label),
  ...
)

mht01_pre(adam_db, ...)

mht01_post(tlg, row_split_var = "MHBODSYS", prune_0 = TRUE, ...)

mht01
```

## Format

An object of class `character` of length 2.

An object of class `chevron_t` of length 1.

## Arguments

- adam_db:

  (`list` of `data.frames`) object containing the `ADaM` datasets

- arm_var:

  (`string`) variable used for column splitting

- row_split_var:

  (`character`) additional row split variables.

- lbl_overall:

  (`string`) label used for overall column, if set to `NULL` the overall
  column is omitted

- summary_labels:

  (`list`) of summarize labels. See details.

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

- Numbers represent absolute numbers of patients and fraction of `N`, or
  absolute number of event when specified.

- Remove zero-count rows unless overridden with `prune_0 = FALSE`.

- Split columns by arm.

- Does not include a total column by default.

- Order by `row_split_var` alphabetically and medical condition by
  decreasing total number of patients with the specific condition.
  `summary_labels` is used to control the summary for each level. If
  "all" is used, then each split will have that summary statistic with
  the labels. One special case is "TOTAL", this is for the overall
  population.

## Functions

- `mht01_label`: Default labels

- `mht01_main()`: Main TLG function

- `mht01_pre()`: Preprocessing

- `mht01_post()`: Postprocessing

## Note

- `adam_db` object must contain an `admh` table with columns
  `"MHBODSYS"` and `"MHDECOD"`.

## Examples

``` r
run(mht01, syn_data)
#>   MedDRA System Organ Class                                A: Drug X    B: Placebo   C: Combination
#>     MedDRA Preferred Term                                    (N=15)       (N=15)         (N=15)    
#>   —————————————————————————————————————————————————————————————————————————————————————————————————
#>   Total number of patients with at least one condition     13 (86.7%)   14 (93.3%)     15 (100%)   
#>   Total number of conditions                                   58           59             99      
#>   cl A                                                                                             
#>     Total number of patients with at least one condition   7 (46.7%)    6 (40.0%)      10 (66.7%)  
#>     Total number of conditions                                 8            11             16      
#>     trm A_2/2                                              5 (33.3%)    6 (40.0%)      6 (40.0%)   
#>     trm A_1/2                                              3 (20.0%)     1 (6.7%)      6 (40.0%)   
#>   cl B                                                                                             
#>     Total number of patients with at least one condition   12 (80.0%)   11 (73.3%)     12 (80.0%)  
#>     Total number of conditions                                 24           21             32      
#>     trm B_3/3                                              8 (53.3%)    6 (40.0%)      7 (46.7%)   
#>     trm B_1/3                                              5 (33.3%)    6 (40.0%)      8 (53.3%)   
#>     trm B_2/3                                              5 (33.3%)    6 (40.0%)      5 (33.3%)   
#>   cl C                                                                                             
#>     Total number of patients with at least one condition   8 (53.3%)    6 (40.0%)      11 (73.3%)  
#>     Total number of conditions                                 10           13             22      
#>     trm C_2/2                                              6 (40.0%)    4 (26.7%)      8 (53.3%)   
#>     trm C_1/2                                              4 (26.7%)    4 (26.7%)      5 (33.3%)   
#>   cl D                                                                                             
#>     Total number of patients with at least one condition   10 (66.7%)   7 (46.7%)      13 (86.7%)  
#>     Total number of conditions                                 16           14             29      
#>     trm D_1/3                                              4 (26.7%)    4 (26.7%)      7 (46.7%)   
#>     trm D_2/3                                              6 (40.0%)    2 (13.3%)      7 (46.7%)   
#>     trm D_3/3                                              2 (13.3%)    5 (33.3%)      7 (46.7%)   
```
