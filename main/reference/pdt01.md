# `pdt01` Major Protocol Deviations Table.

A major protocol deviations table with the number of subjects and the
total number of treatments by medication class sorted alphabetically and
medication name sorted by frequencies.

## Usage

``` r
pdt01_main(
  adam_db,
  arm_var = "ARM",
  lbl_overall = NULL,
  dvcode_var = "DVDECOD",
  dvterm_var = "DVTERM",
  ...
)

pdt01_pre(adam_db, ...)

pdt01_post(
  tlg,
  prune_0 = TRUE,
  dvcode_var = "DVDECOD",
  dvterm_var = "DVTERM",
  ...
)

pdt01
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

- dvcode_var:

  (`string`) the variable defining the protocol deviation coded term. By
  default `DVDECOD`.

- dvterm_var:

  (`string`) the variable defining the protocol deviation term. By
  default `DVTERM`.

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

- Data should be filtered for major protocol deviations.
  `(DVCAT == "MAJOR")`.

- Numbers represent absolute numbers of subjects and fraction of `N`, or
  absolute numbers when specified.

- Remove zero-count rows unless overridden with `prune_0 = FALSE`.

- Split columns by arm.

- Does not include a total column by default.

- Sort by medication class alphabetically and within medication class by
  decreasing total number of patients with the specific medication.

## Functions

- `pdt01_main()`: Main TLG function

- `pdt01_pre()`: Preprocessing

- `pdt01_post()`: Postprocessing

## Note

- `adam_db` object must contain an `addv` table with the columns
  specified in `dvcode_var` and `dvterm_var` as well as `"DVSEQ"`.

## Examples

``` r
run(pdt01, syn_data)
#>   Category                                                              A: Drug X   B: Placebo   C: Combination
#>     Description                                                          (N=15)       (N=15)         (N=15)    
#>   —————————————————————————————————————————————————————————————————————————————————————————————————————————————
#>   Total number of patients with at least one major protocol deviation   2 (13.3%)   4 (26.7%)          0       
#>   Total number of major protocol deviations                                 2           5              0       
#>   EXCLUSION CRITERIA                                                                                           
#>     Active or untreated or other excluded cns metastases                    0        1 (6.7%)          0       
#>     Pregnancy criteria                                                      0        1 (6.7%)          0       
#>   INCLUSION CRITERIA                                                                                           
#>     Ineligible cancer type or current cancer stage                      1 (6.7%)        0              0       
#>   MEDICATION                                                                                                   
#>     Discontinued study drug for unspecified reason                          0        1 (6.7%)          0       
#>     Received prohibited concomitant medication                              0        1 (6.7%)          0       
#>   PROCEDURAL                                                                                                   
#>     Eligibility-related test not done/out of window                         0        1 (6.7%)          0       
#>     Failure to sign updated ICF within two visits                       1 (6.7%)        0              0       
```
