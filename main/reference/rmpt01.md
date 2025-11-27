# `RMPT01`Duration of Exposure for Risk Management Plan Table.

The `RMPT01` table provides an overview of duration of exposure.

## Usage

``` r
rmpt01_main(
  adam_db,
  summaryvars = "AVALCAT1",
  show_tot = TRUE,
  row_split_var = NULL,
  col_split_var = NULL,
  overall_col_lbl = NULL,
  ...
)

rmpt01_pre(adam_db, summaryvars = "AVALCAT1", ...)

rmpt01_post(tlg, prune_0 = FALSE, ...)

rmpt01
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

- Person time is the sum of exposure across all patients.

- Summary statistics are by default based on the number of patients in
  the corresponding `N` row (number of non-missing values).

- Does not remove zero-count rows unless overridden with
  `prune_0 = TRUE`.

## Functions

- `rmpt01_main()`: Main TLG function

- `rmpt01_pre()`: Preprocessing

- `rmpt01_post()`: Postprocessing

## Note

- `adam_db` object must contain an `adex` table with `"AVAL"` and the
  columns specified by `summaryvars`.

## Examples

``` r
run(rmpt01, syn_data, col_split_var = "SEX")
#>                                                   F                           M            
#>                                        Patients     Person time    Patients     Person time
#>   Duration of exposure                  (N=30)        (N=30)        (N=15)        (N=15)   
#>   —————————————————————————————————————————————————————————————————————————————————————————
#>   < 1 month                            3 (10.0%)        45         1 (6.7%)         22     
#>   1 to <3 months                       8 (26.7%)        554        5 (33.3%)        283    
#>   3 to <6 months                       8 (26.7%)       1042        5 (33.3%)        686    
#>   >=6 months                          11 (36.7%)       2447        4 (26.7%)        834    
#>   Total patients number/person time   30 (100.0%)      4088       15 (100.0%)      1825    
```
