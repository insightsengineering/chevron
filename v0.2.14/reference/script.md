# Create Script for `TLG` Generation

Create Script for `TLG` Generation

## Usage

``` r
script_funs(x, adam_db, args, name = deparse(substitute(x)))

# S4 method for class 'chevron_tlg'
script_funs(x, adam_db, args, name = deparse(substitute(x)))

# S4 method for class 'chevron_simple'
script_funs(x, adam_db, args, name = deparse(substitute(x)))
```

## Arguments

- x:

  (`chevron_tlg`) input.

- adam_db:

  (`string`) the name of the dataset.

- args:

  (`string`) the name of argument list.

- name:

  (`string`) name of the template.

## Value

`character` that can be integrated into an executable script.

## Examples

``` r
script_funs(aet04, adam_db = "syn_data", args = "args")
#>  [1] "# Edit Preprocessing Function."                                                                  
#>  [2] "preprocess(aet04) <- "                                                                           
#>  [3] "function (adam_db, ...) "                                                                        
#>  [4] "{"                                                                                               
#>  [5] "    atoxgr_lvls <- c(\"1\", \"2\", \"3\", \"4\", \"5\")"                                         
#>  [6] "    adam_db$adae <- adam_db$adae %>% filter(.data$ANL01FL == "                                   
#>  [7] "        \"Y\") %>% mutate(AEBODSYS = with_label(reformat(.data$AEBODSYS, "                       
#>  [8] "        nocoding), \"MedDRA System Organ Class\"), AEDECOD = with_label(reformat(.data$AEDECOD, "
#>  [9] "        nocoding), \"MedDRA Preferred Term\"), ATOXGR = factor(.data$ATOXGR, "                   
#> [10] "        levels = atoxgr_lvls))"                                                                  
#> [11] "    adam_db"                                                                                     
#> [12] "}"                                                                                               
#> [13] ""                                                                                                
#> [14] "# Create TLG"                                                                                    
#> [15] "tlg_output <- run(object = aet04, adam_db = syn_data, verbose = TRUE, user_args = args)"         
```
