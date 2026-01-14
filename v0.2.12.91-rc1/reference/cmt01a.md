# `CMT01A` Concomitant Medication by Medication Class and Preferred Name.

A concomitant medication table with the number of subjects and the total
number of treatments by medication class.

## Usage

``` r
cmt01_label

cmt01a_main(
  adam_db,
  arm_var = "ARM",
  lbl_overall = NULL,
  row_split_var = "ATC2",
  medname_var = "CMDECOD",
  summary_labels = setNames(rep(list(cmt01_label), length(row_split_var) + 1L),
    c("TOTAL", row_split_var)),
  ...
)

cmt01a_pre(adam_db, ...)

cmt01a_post(
  tlg,
  prune_0 = TRUE,
  sort_by_freq = FALSE,
  row_split_var = "ATC2",
  medname_var = "CMDECOD",
  ...
)

cmt01a
```

## Format

An object of class `character` of length 2.

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

- `cmt01_label`: Default labels

- `cmt01a_main()`: Main TLG function

- `cmt01a_pre()`: Preprocessing

- `cmt01a_post()`: Postprocessing

## Note

- `adam_db` object must contain an `adcm` table with the columns
  specified in `row_split_var` and `medname_var` as well as `"CMSEQ"`.

## Examples

``` r
library(dplyr)

proc_data <- syn_data
proc_data$adcm <- proc_data$adcm %>%
  filter(ATIREL == "CONCOMITANT")

run(cmt01a, proc_data)
#>   ATC Level 2 Text                                         A: Drug X    B: Placebo   C: Combination
#>     Other Treatment                                          (N=15)       (N=15)         (N=15)    
#>   —————————————————————————————————————————————————————————————————————————————————————————————————
#>   Total number of patients with at least one treatment     13 (86.7%)   14 (93.3%)     14 (93.3%)  
#>   Total number of treatments                                   40           40             61      
#>   ATCCLAS2 A                                                                                       
#>     Total number of patients with at least one treatment   7 (46.7%)    10 (66.7%)     10 (66.7%)  
#>     Total number of treatments                                 11           17             19      
#>     medname A_3/3                                          5 (33.3%)    8 (53.3%)      6 (40.0%)   
#>     medname A_2/3                                          5 (33.3%)    6 (40.0%)      7 (46.7%)   
#>   ATCCLAS2 A p2                                                                                    
#>     Total number of patients with at least one treatment   5 (33.3%)    8 (53.3%)      6 (40.0%)   
#>     Total number of treatments                                 6            8              8       
#>     medname A_3/3                                          5 (33.3%)    8 (53.3%)      6 (40.0%)   
#>   ATCCLAS2 B                                                                                       
#>     Total number of patients with at least one treatment   10 (66.7%)   8 (53.3%)      10 (66.7%)  
#>     Total number of treatments                                 16           15             23      
#>     medname B_1/4                                          7 (46.7%)    6 (40.0%)      6 (40.0%)   
#>     medname B_4/4                                          4 (26.7%)    5 (33.3%)      8 (53.3%)   
#>   ATCCLAS2 B p2                                                                                    
#>     Total number of patients with at least one treatment   7 (46.7%)    6 (40.0%)      6 (40.0%)   
#>     Total number of treatments                                 12           8              10      
#>     medname B_1/4                                          7 (46.7%)    6 (40.0%)      6 (40.0%)   
#>   ATCCLAS2 B p3                                                                                    
#>     Total number of patients with at least one treatment   7 (46.7%)    6 (40.0%)      6 (40.0%)   
#>     Total number of treatments                                 12           8              10      
#>     medname B_1/4                                          7 (46.7%)    6 (40.0%)      6 (40.0%)   
#>   ATCCLAS2 C                                                                                       
#>     Total number of patients with at least one treatment   9 (60.0%)    7 (46.7%)      12 (80.0%)  
#>     Total number of treatments                                 13           8              19      
#>     medname C_2/2                                          4 (26.7%)    5 (33.3%)      7 (46.7%)   
#>     medname C_1/2                                          6 (40.0%)    2 (13.3%)      6 (40.0%)   
#>   ATCCLAS2 C p2                                                                                    
#>     Total number of patients with at least one treatment   9 (60.0%)    7 (46.7%)      12 (80.0%)  
#>     Total number of treatments                                 13           8              19      
#>     medname C_2/2                                          4 (26.7%)    5 (33.3%)      7 (46.7%)   
#>     medname C_1/2                                          6 (40.0%)    2 (13.3%)      6 (40.0%)   
#>   ATCCLAS2 C p3                                                                                    
#>     Total number of patients with at least one treatment   4 (26.7%)    5 (33.3%)      7 (46.7%)   
#>     Total number of treatments                                 5            5              12      
#>     medname C_2/2                                          4 (26.7%)    5 (33.3%)      7 (46.7%)   
```
