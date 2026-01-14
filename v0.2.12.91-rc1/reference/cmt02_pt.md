# `CMT02_PT` Table 1 (Default) Concomitant Medications by Preferred Name.

A concomitant medication table with the number of subjects and the total
number of treatments by medication name sorted by frequencies.

## Usage

``` r
cmt02_pt_main(
  adam_db,
  arm_var = "ARM",
  lbl_overall = NULL,
  row_split_var = NULL,
  medname_var = "CMDECOD",
  summary_labels = list(TOTAL = cmt01_label),
  ...
)

cmt02_pt_pre(adam_db, ...)

cmt02_pt_post(
  tlg,
  prune_0 = TRUE,
  sort_by_freq = FALSE,
  row_split_var = NULL,
  medname_var = "CMDECOD",
  ...
)

cmt02_pt
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

- row_split_var:

  (`character`) the variable defining the medication category. By
  default `ATC2`.

- medname_var:

  (`string`) variable name of medical treatment name.

- summary_labels:

  (`list`) of summarize labels. See details.

- ...:

  not used.

- tlg:

  (`TableTree`, `Listing` or `ggplot`) object typically produced by a
  `main` function.

- prune_0:

  (`flag`) remove 0 count rows

- sort_by_freq:

  (`flag`) whether to sort medication class by frequency.

## Value

the main function returns an `rtables` object.

the preprocessing function returns a `list` of `data.frame`.

the postprocessing function returns an `rtables` object or an
`ElementaryTable` (null report).

## Details

- Data should be filtered for concomitant medication.
  `(ATIREL == "CONCOMITANT")`.

- Numbers represent absolute numbers of subjects and fraction of `N`, or
  absolute numbers when specified.

- Remove zero-count rows unless overridden with `prune_0 = FALSE`.

- Split columns by arm.

- Does not include a total column by default.

- Sort by medication class alphabetically and within medication class by
  decreasing total number of patients with the specific medication.
  `summary_labels` is used to control the summary for each level. If
  "all" is used, then each split will have that summary statistic with
  the labels. One special case is "TOTAL", this is for the overall
  population.

## Functions

- `cmt02_pt_main()`: Main TLG function

- `cmt02_pt_pre()`: Preprocessing

- `cmt02_pt_post()`: Postprocessing

## Note

- `adam_db` object must contain an `adcm` table with the columns
  specified in `row_split_var` and `medname_var` as well as `"CMSEQ"`.

## Examples

``` r
run(cmt02_pt, syn_data)
#>                                                          A: Drug X    B: Placebo   C: Combination
#>   Other Treatment                                          (N=15)       (N=15)         (N=15)    
#>   ———————————————————————————————————————————————————————————————————————————————————————————————
#>   Total number of patients with at least one treatment   13 (86.7%)   14 (93.3%)     15 (100%)   
#>   Total number of treatments                                 58           59             99      
#>   medname B_3/4                                          8 (53.3%)    6 (40.0%)      8 (53.3%)   
#>   medname B_2/4                                          6 (40.0%)    5 (33.3%)      10 (66.7%)  
#>   medname A_3/3                                          5 (33.3%)    8 (53.3%)      6 (40.0%)   
#>   medname B_1/4                                          7 (46.7%)    6 (40.0%)      6 (40.0%)   
#>   medname A_2/3                                          5 (33.3%)    6 (40.0%)      7 (46.7%)   
#>   medname B_4/4                                          4 (26.7%)    5 (33.3%)      8 (53.3%)   
#>   medname C_2/2                                          4 (26.7%)    5 (33.3%)      7 (46.7%)   
#>   medname A_1/3                                          4 (26.7%)    3 (20.0%)      8 (53.3%)   
#>   medname C_1/2                                          6 (40.0%)    2 (13.3%)      6 (40.0%)   
```
