# Extracting Layout Function.

Extracting Layout Function.

## Usage

``` r
unwrap_layout(x, pattern = "_lyt$")
```

## Arguments

- x:

  (`function`) containing a call to a layout function.

- pattern:

  (`string`) identifying layout functions

## Value

invisible `NULL` and print the content of the layout functions found in
the body of `x`.

## Examples

``` r
unwrap_layout(aet01_main)
#> Layout function:
#>   aet01_lyt:
#> function (arm_var, lbl_overall, anl_vars, anl_lbls, lbl_vars) 
#> {
#>     lyt_base <- basic_table(show_colcounts = TRUE) %>% split_cols_by_with_overall(arm_var, 
#>         lbl_overall)
#>     lyt_ae1 <- lyt_base %>% analyze_num_patients(vars = "USUBJID", 
#>         .stats = c("unique", "nonunique"), .labels = c(unique = render_safe("Total number of {patient_label} with at least one AE"), 
#>             nonunique = "Total number of AEs"), .formats = list(unique = format_count_fraction_fixed_dp, 
#>             nonunique = "xx"), show_labels = "hidden")
#>     lyt_adsl <- lyt_base %>% count_patients_with_event("USUBJID", 
#>         filters = c(DTHFL = "Y"), denom = "N_col", .labels = c(count_fraction = "Total number of deaths"), 
#>         table_names = "TotDeath") %>% count_patients_with_event("USUBJID", 
#>         filters = c(DCSREAS = "ADVERSE EVENT"), denom = "N_col", 
#>         .labels = c(count_fraction = render_safe("Total number of {patient_label} withdrawn from study due to an AE")), 
#>         table_names = "TotWithdrawal")
#>     lyt_ae2 <- lyt_base %>% count_patients_recursive(anl_vars = anl_vars, 
#>         anl_lbls = anl_lbls, lbl_vars = lbl_vars)
#>     list(ae1 = lyt_ae1, ae2 = lyt_ae2, adsl = lyt_adsl)
#> }
```
