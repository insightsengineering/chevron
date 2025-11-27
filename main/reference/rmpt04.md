# `RMPT04`Extent of Exposure by Ethnic Origin for Risk Management Plan Table.

The `RMPT04` table provides an overview of duration of exposure extent.

## Usage

``` r
rmpt04_main(
  adam_db,
  summaryvars = "ETHNIC",
  show_tot = TRUE,
  row_split_var = NULL,
  col_split_var = NULL,
  overall_col_lbl = NULL,
  ...
)

rmpt04_pre(adam_db, summaryvars = "ETHNIC", ...)

rmpt04
```

## Format

An object of class `chevron_t` of length 1.

## Arguments

- adam_db:

  (`list` of `data.frames`) object containing the `ADaM` datasets

- summaryvars:

  (`string`) variables to be analyzed. The label attribute of the
  corresponding columns in `adex` table of `adam_db` is used as label.

- show_tot:

  (`flag`) whether to display the cumulative total.

- row_split_var:

  (`character`) additional row split variables.

- col_split_var:

  (`string`) additional column splitting variable.

- overall_col_lbl:

  (`string`) name of the overall column. If `NULL`, no overall level is
  added.

- ...:

  not used.

## Value

the main function returns an `rtables` object.

the preprocessing function returns a `list` of `data.frame`.

## Details

- Person time is the sum of exposure across all patients.

- Summary statistics are by default based on the number of patients in
  the corresponding `N` row (number of non-missing values).

- Does not remove zero-count rows unless overridden with
  `prune_0 = TRUE`.

## Functions

- `rmpt04_main()`: Main TLG function

- `rmpt04_pre()`: Preprocessing

## Examples

``` r
run(rmpt04, syn_data)
#>                                        Patients     Person time
#>   ETHNIC                                (N=45)        (N=45)   
#>   —————————————————————————————————————————————————————————————
#>   HISPANIC OR LATINO                   2 (4.4%)         309    
#>   NOT HISPANIC OR LATINO              41 (91.1%)       5555    
#>   NOT REPORTED                         2 (4.4%)         49     
#>   Total patients number/person time   45 (100.0%)      5913    
```
