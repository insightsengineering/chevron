# `AET03` Table 1 (Default) Advert Events by Greatest Intensity Table 1.

An adverse events table categorized by System Organ Class,
Dictionary-Derived Term and Greatest intensity.

## Usage

``` r
aet03_main(adam_db, arm_var = "ACTARM", lbl_overall = NULL, ...)

aet03_pre(adam_db, ...)

aet03_post(tlg, prune_0 = TRUE, ...)

aet03
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

- Default Adverse Events by Greatest Intensity table.

- Numbers represent absolute numbers of patients and fraction of `N`.

- Remove zero-count rows unless overridden with `prune_0 = FALSE`.

- Split columns by arm.

- Does not include a total column by default.

- Sort by Body System or Organ Class (`SOC`) and Dictionary-Derived Term
  (`PT`).

## Functions

- `aet03_main()`: Main TLG function

- `aet03_pre()`: Preprocessing

- `aet03_post()`: Postprocessing

## Note

- `adam_db` object must contain an `adae` table with the columns
  `"AEBODSYS"`, `"AEDECOD"` and `"ASEV"`.

## Examples

``` r
run(aet03, syn_data)
#>   MedDRA System Organ Class   A: Drug X    B: Placebo   C: Combination
#>     MedDRA Preferred Term       (N=15)       (N=15)         (N=15)    
#>   ————————————————————————————————————————————————————————————————————
#>   - Any Intensity -           13 (86.7%)   14 (93.3%)     15 (100%)   
#>   MILD                            0         1 (6.7%)       1 (6.7%)   
#>   MODERATE                    2 (13.3%)    3 (20.0%)      2 (13.3%)   
#>   SEVERE                      11 (73.3%)   10 (66.7%)     12 (80.0%)  
#>   cl B.2                                                              
#>     - Any Intensity -         11 (73.3%)   8 (53.3%)      10 (66.7%)  
#>     MILD                      6 (40.0%)    2 (13.3%)      5 (33.3%)   
#>     MODERATE                  5 (33.3%)    6 (40.0%)      5 (33.3%)   
#>     dcd B.2.2.3.1                                                     
#>       - Any Intensity -       8 (53.3%)    6 (40.0%)      7 (46.7%)   
#>       MILD                    8 (53.3%)    6 (40.0%)      7 (46.7%)   
#>     dcd B.2.1.2.1                                                     
#>       - Any Intensity -       5 (33.3%)    6 (40.0%)      5 (33.3%)   
#>       MODERATE                5 (33.3%)    6 (40.0%)      5 (33.3%)   
#>   cl D.1                                                              
#>     - Any Intensity -         9 (60.0%)    5 (33.3%)      11 (73.3%)  
#>     MODERATE                  5 (33.3%)     1 (6.7%)      4 (26.7%)   
#>     SEVERE                    4 (26.7%)    4 (26.7%)      7 (46.7%)   
#>     dcd D.1.1.1.1                                                     
#>       - Any Intensity -       4 (26.7%)    4 (26.7%)      7 (46.7%)   
#>       SEVERE                  4 (26.7%)    4 (26.7%)      7 (46.7%)   
#>     dcd D.1.1.4.2                                                     
#>       - Any Intensity -       6 (40.0%)    2 (13.3%)      7 (46.7%)   
#>       MODERATE                6 (40.0%)    2 (13.3%)      7 (46.7%)   
#>   cl A.1                                                              
#>     - Any Intensity -         7 (46.7%)    6 (40.0%)      10 (66.7%)  
#>     MILD                      2 (13.3%)        0          4 (26.7%)   
#>     MODERATE                  5 (33.3%)    6 (40.0%)      6 (40.0%)   
#>     dcd A.1.1.1.2                                                     
#>       - Any Intensity -       5 (33.3%)    6 (40.0%)      6 (40.0%)   
#>       MODERATE                5 (33.3%)    6 (40.0%)      6 (40.0%)   
#>     dcd A.1.1.1.1                                                     
#>       - Any Intensity -       3 (20.0%)     1 (6.7%)      6 (40.0%)   
#>       MILD                    3 (20.0%)     1 (6.7%)      6 (40.0%)   
#>   cl B.1                                                              
#>     - Any Intensity -         5 (33.3%)    6 (40.0%)      8 (53.3%)   
#>     SEVERE                    5 (33.3%)    6 (40.0%)      8 (53.3%)   
#>     dcd B.1.1.1.1                                                     
#>       - Any Intensity -       5 (33.3%)    6 (40.0%)      8 (53.3%)   
#>       SEVERE                  5 (33.3%)    6 (40.0%)      8 (53.3%)   
#>   cl C.2                                                              
#>     - Any Intensity -         6 (40.0%)    4 (26.7%)      8 (53.3%)   
#>     MODERATE                  6 (40.0%)    4 (26.7%)      8 (53.3%)   
#>     dcd C.2.1.2.1                                                     
#>       - Any Intensity -       6 (40.0%)    4 (26.7%)      8 (53.3%)   
#>       MODERATE                6 (40.0%)    4 (26.7%)      8 (53.3%)   
#>   cl D.2                                                              
#>     - Any Intensity -         2 (13.3%)    5 (33.3%)      7 (46.7%)   
#>     MILD                      2 (13.3%)    5 (33.3%)      7 (46.7%)   
#>     dcd D.2.1.5.3                                                     
#>       - Any Intensity -       2 (13.3%)    5 (33.3%)      7 (46.7%)   
#>       MILD                    2 (13.3%)    5 (33.3%)      7 (46.7%)   
#>   cl C.1                                                              
#>     - Any Intensity -         4 (26.7%)    4 (26.7%)      5 (33.3%)   
#>     SEVERE                    4 (26.7%)    4 (26.7%)      5 (33.3%)   
#>     dcd C.1.1.1.3                                                     
#>       - Any Intensity -       4 (26.7%)    4 (26.7%)      5 (33.3%)   
#>       SEVERE                  4 (26.7%)    4 (26.7%)      5 (33.3%)   
```
