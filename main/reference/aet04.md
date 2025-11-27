# `AET04` Table 1 (Default) Adverse Events by Highest `NCI` `CTACAE` `AE` Grade Table 1.

The `AET04` table provides an overview of adverse event with the highest
`NCI` `CTCAE` grade per individual.

## Usage

``` r
aet04_main(
  adam_db,
  arm_var = "ACTARM",
  lbl_overall = NULL,
  grade_groups = NULL,
  ...
)

aet04_pre(adam_db, ...)

aet04_post(tlg, prune_0 = TRUE, ...)

aet04
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

- grade_groups:

  (`list`) putting in correspondence toxicity grades and labels.

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

- Events with missing grading values are excluded.

- Split columns by arm, typically `ACTARM`.

- Does not include a total column by default.

- Sort Body System or Organ Class and Dictionary-Derived Term by highest
  overall frequencies. Analysis Toxicity Grade is sorted by severity.

## Functions

- `aet04_main()`: Main TLG function

- `aet04_pre()`: Preprocessing

- `aet04_post()`: Postprocessing

## Note

- `adam_db` object must contain an `adae` table with the columns
  `"AEBODSYS"`, `"AEDECOD"` and `"ATOXGR"`.

## Examples

``` r
grade_groups <- list(
  "Grade 1-2" = c("1", "2"),
  "Grade 3-4" = c("3", "4"),
  "Grade 5" = c("5")
)
proc_data <- dunlin::log_filter(syn_data, AEBODSYS == "cl A.1", "adae")
run(aet04, proc_data, grade_groups = grade_groups)
#>   MedDRA System Organ Class                                                          
#>     MedDRA Preferred Term                     A: Drug X   B: Placebo   C: Combination
#>                               Grade            (N=15)       (N=15)         (N=15)    
#>   ———————————————————————————————————————————————————————————————————————————————————
#>   - Any adverse events -                                                             
#>                               - Any Grade -   7 (46.7%)   6 (40.0%)      10 (66.7%)  
#>                               Grade 1-2       7 (46.7%)   6 (40.0%)      10 (66.7%)  
#>                               1               2 (13.3%)       0          4 (26.7%)   
#>                               2               5 (33.3%)   6 (40.0%)      6 (40.0%)   
#>   cl A.1                                                                             
#>     - Overall -                                                                      
#>                               - Any Grade -   7 (46.7%)   6 (40.0%)      10 (66.7%)  
#>                               Grade 1-2       7 (46.7%)   6 (40.0%)      10 (66.7%)  
#>                               1               2 (13.3%)       0          4 (26.7%)   
#>                               2               5 (33.3%)   6 (40.0%)      6 (40.0%)   
#>     dcd A.1.1.1.2                                                                    
#>                               - Any Grade -   5 (33.3%)   6 (40.0%)      6 (40.0%)   
#>                               Grade 1-2       5 (33.3%)   6 (40.0%)      6 (40.0%)   
#>                               2               5 (33.3%)   6 (40.0%)      6 (40.0%)   
#>     dcd A.1.1.1.1                                                                    
#>                               - Any Grade -   3 (20.0%)    1 (6.7%)      6 (40.0%)   
#>                               Grade 1-2       3 (20.0%)    1 (6.7%)      6 (40.0%)   
#>                               1               3 (20.0%)    1 (6.7%)      6 (40.0%)   
```
