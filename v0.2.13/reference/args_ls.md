# Get Arguments List

Get Arguments List

## Usage

``` r
args_ls(x, simplify = FALSE, omit = NULL)

# S4 method for class 'chevron_tlg'
args_ls(x, simplify = FALSE, omit = NULL)
```

## Arguments

- x:

  (`chevron_tlg`) input.

- simplify:

  (`flag`) whether to simplify the output, coalescing the values of the
  parameters. The order of priority for the value of the parameters is:
  `main`, `preprocess` and `postprocess`.

- omit:

  (`character`) the names of the argument to omit from the output.

## Value

a `list` of the formal arguments with their default for the functions
stored in the `chevron_tlg` object passed a `x` argument.

## Examples

``` r
args_ls(aet01, simplify = TRUE)
#> $adam_db
#> 
#> 
#> $arm_var
#> [1] "ACTARM"
#> 
#> $lbl_overall
#> NULL
#> 
#> $anl_vars
#> list(safety_var = c("FATAL", "SER", "SERWD", "SERDSM", "RELSER", 
#>     "WD", "DSM", "REL", "RELWD", "RELDSM", "SEV"))
#> 
#> $anl_lbls
#> [1] "Total number of {patient_label} with at least one"
#> 
#> $show_wd
#> [1] TRUE
#> 
#> $...
#> 
#> 
#> $tlg
#> 
#> 
#> $prune_0
#> [1] FALSE
#> 
```
