# `pdt02` Major Protocol Deviations Related to Epidemic/Pandemic Table.

A major protocol deviations table with the number of subjects and the
total number of Major Protocol Deviations Related to Epidemic/Pandemic
sorted alphabetically and deviations name sorted by frequencies.

## Usage

``` r
pdt02_main(
  adam_db,
  arm_var = "ARM",
  lbl_overall = NULL,
  dvreas_var = "DVREAS",
  dvterm_var = "DVTERM",
  ...
)

pdt02_pre(adam_db, ...)

pdt02_post(
  tlg,
  prune_0 = TRUE,
  dvreas_var = "DVREAS",
  dvterm_var = "DVTERM",
  ...
)

pdt02
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

- dvreas_var:

  (`string`) the variable defining the reason for deviation. By default
  `DVREAS`.

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

the preprocessing function returns a `list` of `data.frame`.

the postprocessing function returns an `rtables` object or an
`ElementaryTable` (null report).

## Details

- Data should be filtered for major protocol deviations related to
  epidemic/pandemic. `(AEPRELFL == "Y" & DVCAT == "MAJOR")`.

- Numbers represent absolute numbers of subjects and fraction of `N`, or
  absolute numbers when specified.

- Remove zero-count rows unless overridden with `prune_0 = FALSE`.

- Split columns by arm.

- Does not include a total column by default.

- Sort by deviation reason alphabetically and within deviation reason by
  decreasing total number of patients with the specific deviation term.

## Functions

- `pdt02_main()`: Main TLG function

- `pdt02_pre()`: Preprocessing

- `pdt02_post()`: Postprocessing

## Note

- `adam_db` object must contain an `addv` table with the columns
  specified in `dvreas_var` and `dvterm_var`.

## Examples

``` r
run(pdt02, syn_data)
#>   Primary Reason                                                                                     A: Drug X   B: Placebo   C: Combination
#>     Description                                                                                       (N=15)       (N=15)         (N=15)    
#>   ——————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————
#>   Total number of patients with at least one major protocol deviation related to epidemic/pandemic   1 (6.7%)        0              0       
#>   Total number of major protocol deviations related to epidemic/pandemic                                 1           0              0       
#>   Site action due to epidemic/pandemic                                                               1 (6.7%)        0              0       
#>     Failure to sign updated ICF within two visits                                                    1 (6.7%)        0              0       
```
