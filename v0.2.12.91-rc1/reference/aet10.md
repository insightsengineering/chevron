# `AET10` Table 1 (Default) Most Common (xx%) Adverse Events Preferred Terms Table 1.

The `AET10` table Include Adverse Events occurring with user-specified
threshold X% in at least one of the treatment groups. Standard table
summarized by preferred term (PT). Order the data by total column
frequency from most to least frequently reported PT (regardless of SOC).

## Usage

``` r
aet10_main(adam_db, arm_var = "ACTARM", lbl_overall = NULL, ...)

aet10_pre(adam_db, ...)

aet10_post(tlg, atleast = 0.05, ...)

aet10
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

- atleast:

  given cut-off in numeric format, default is `0.05`

## Value

the main function returns an `rtables` object

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

- Missing values in `AEDECOD` are labeled by `No Coding Available`.

## Functions

- `aet10_main()`: Main TLG function

- `aet10_pre()`: Preprocessing

- `aet10_post()`: Postprocessing

## Note

- `adam_db` object must contain an `adae` table with the columns
  `"AEDECOD"`.

## Examples

``` r
run(aet10, syn_data)
#>                           A: Drug X   B: Placebo   C: Combination
#>   MedDRA Preferred Term    (N=15)       (N=15)         (N=15)    
#>   ———————————————————————————————————————————————————————————————
#>   dcd B.2.2.3.1           8 (53.3%)   6 (40.0%)      7 (46.7%)   
#>   dcd B.1.1.1.1           5 (33.3%)   6 (40.0%)      8 (53.3%)   
#>   dcd C.2.1.2.1           6 (40.0%)   4 (26.7%)      8 (53.3%)   
#>   dcd A.1.1.1.2           5 (33.3%)   6 (40.0%)      6 (40.0%)   
#>   dcd B.2.1.2.1           5 (33.3%)   6 (40.0%)      5 (33.3%)   
#>   dcd D.1.1.1.1           4 (26.7%)   4 (26.7%)      7 (46.7%)   
#>   dcd D.1.1.4.2           6 (40.0%)   2 (13.3%)      7 (46.7%)   
#>   dcd D.2.1.5.3           2 (13.3%)   5 (33.3%)      7 (46.7%)   
#>   dcd C.1.1.1.3           4 (26.7%)   4 (26.7%)      5 (33.3%)   
#>   dcd A.1.1.1.1           3 (20.0%)    1 (6.7%)      6 (40.0%)   
```
