# `AET02` Table 1 (Default) Adverse Events by System Organ Class and Preferred Term Table 1.

The `AET02` table provides an overview of the number of subjects
experiencing adverse events and the number of advert events categorized
by Body System and Dictionary-Derived Term.

## Usage

``` r
aet02_label

aet02_main(
  adam_db,
  arm_var = "ACTARM",
  row_split_var = "AEBODSYS",
  lbl_overall = NULL,
  summary_labels = list(all = aet02_label, TOTAL = c(nonunique =
    "Overall total number of events")),
  ...
)

aet02_pre(adam_db, row_split_var = "AEBODSYS", ...)

aet02_post(tlg, row_split_var = "AEBODSYS", prune_0 = TRUE, ...)

aet02
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

- Numbers represent absolute numbers of subject and fraction of `N`, or
  absolute number of event when specified.

- Remove zero-count rows unless overridden with `prune_0 = FALSE`.

- Split columns by arm.

- Does not include a total column by default.

- Sort Dictionary-Derived Code (`AEDECOD`) by highest overall
  frequencies.

- Missing values in `AEBODSYS`, and `AEDECOD` are labeled by
  `No Coding Available`. `summary_labels` is used to control the summary
  for each level. If "all" is used, then each split will have that
  summary statistic with the labels. One special case is "TOTAL", this
  is for the overall population.

## Functions

- `aet02_label`: Default labels

- `aet02_main()`: Main TLG function

- `aet02_pre()`: Preprocessing

- `aet02_post()`: Postprocessing

## Note

- `adam_db` object must contain an `adae` table with the columns
  `"AEBODSYS"` and `"AEDECOD"`.

## Examples

``` r
run(aet02, syn_data)
#>   MedDRA System Organ Class                                    A: Drug X    B: Placebo   C: Combination
#>     MedDRA Preferred Term                                        (N=15)       (N=15)         (N=15)    
#>   —————————————————————————————————————————————————————————————————————————————————————————————————————
#>   Total number of patients with at least one adverse event     13 (86.7%)   14 (93.3%)     15 (100%)   
#>   Overall total number of events                                   58           59             99      
#>   cl B.2                                                                                               
#>     Total number of patients with at least one adverse event   11 (73.3%)   8 (53.3%)      10 (66.7%)  
#>     Total number of events                                         18           15             20      
#>     dcd B.2.2.3.1                                              8 (53.3%)    6 (40.0%)      7 (46.7%)   
#>     dcd B.2.1.2.1                                              5 (33.3%)    6 (40.0%)      5 (33.3%)   
#>   cl D.1                                                                                               
#>     Total number of patients with at least one adverse event   9 (60.0%)    5 (33.3%)      11 (73.3%)  
#>     Total number of events                                         13           9              19      
#>     dcd D.1.1.1.1                                              4 (26.7%)    4 (26.7%)      7 (46.7%)   
#>     dcd D.1.1.4.2                                              6 (40.0%)    2 (13.3%)      7 (46.7%)   
#>   cl A.1                                                                                               
#>     Total number of patients with at least one adverse event   7 (46.7%)    6 (40.0%)      10 (66.7%)  
#>     Total number of events                                         8            11             16      
#>     dcd A.1.1.1.2                                              5 (33.3%)    6 (40.0%)      6 (40.0%)   
#>     dcd A.1.1.1.1                                              3 (20.0%)     1 (6.7%)      6 (40.0%)   
#>   cl B.1                                                                                               
#>     Total number of patients with at least one adverse event   5 (33.3%)    6 (40.0%)      8 (53.3%)   
#>     Total number of events                                         6            6              12      
#>     dcd B.1.1.1.1                                              5 (33.3%)    6 (40.0%)      8 (53.3%)   
#>   cl C.2                                                                                               
#>     Total number of patients with at least one adverse event   6 (40.0%)    4 (26.7%)      8 (53.3%)   
#>     Total number of events                                         6            4              12      
#>     dcd C.2.1.2.1                                              6 (40.0%)    4 (26.7%)      8 (53.3%)   
#>   cl D.2                                                                                               
#>     Total number of patients with at least one adverse event   2 (13.3%)    5 (33.3%)      7 (46.7%)   
#>     Total number of events                                         3            5              10      
#>     dcd D.2.1.5.3                                              2 (13.3%)    5 (33.3%)      7 (46.7%)   
#>   cl C.1                                                                                               
#>     Total number of patients with at least one adverse event   4 (26.7%)    4 (26.7%)      5 (33.3%)   
#>     Total number of events                                         4            9              10      
#>     dcd C.1.1.1.3                                              4 (26.7%)    4 (26.7%)      5 (33.3%)   
```
