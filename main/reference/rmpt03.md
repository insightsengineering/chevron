# `rmpt03`Duration of Exposure for Risk Management Plan Table.

The `rmpt03` table provides an overview of duration of exposure.

## Usage

``` r
rmpt03_main(
  adam_db,
  summaryvars = "AGEGR1",
  show_tot = TRUE,
  row_split_var = NULL,
  col_split_var = "SEX",
  overall_col_lbl = "All Genders",
  ...
)

rmpt03_pre(adam_db, summaryvars = "AGEGR1", ...)

rmpt03
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

  (`string`) the name of the column that containing variable to split
  exposure by.

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

- `rmpt03_main()`: Main TLG function

- `rmpt03_pre()`: Preprocessing

## Examples

``` r
pre_data <- dunlin::propagate(syn_data, "adsl", "AGEGR1", "USUBJID")
#> 
#> Updating: adae with: AGEGR1
#> Updating: adsaftte with: AGEGR1
#> Updating: adcm with: AGEGR1
#> Updating: addv with: AGEGR1
#> Updating: adeg with: AGEGR1
#> Updating: adex with: AGEGR1
#> Updating: adlb with: AGEGR1
#> Updating: admh with: AGEGR1
#> Skipping: adrs
#> Updating: adsub with: AGEGR1
#> Skipping: adtte
#> Updating: advs with: AGEGR1
run(rmpt03, pre_data)
#>                                                   F                           M                      All Genders       
#>                                        Patients     Person time    Patients     Person time    Patients     Person time
#>   Age Group                             (N=30)        (N=30)        (N=15)        (N=15)        (N=45)        (N=45)   
#>   —————————————————————————————————————————————————————————————————————————————————————————————————————————————————————
#>   <65                                 30 (100.0%)      4088       15 (100.0%)      1825       45 (100.0%)      5913    
#>   Total patients number/person time   30 (100.0%)      4088       15 (100.0%)      1825       45 (100.0%)      5913    
```
