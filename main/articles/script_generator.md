# Script_Generator

## Introduction

In addition of the embedded
[`run()`](https://insightsengineering.github.io/chevron/reference/run.md)
method to create a `tlg`, chevron offers a script-based approach that
allows the user to quickly edit a chevron workflow without the need for
modifying a `chevron_tlg` object. The script is generated from
`script_funs` method which by default only output the script
corresponding to the preprocessing function in the generated script.

## Using a chevron-defined object

The object returned by the `script` methods are vectors of character
with one element per line of the script, that can be easily rendered.

``` r
res <- script_funs(aet01, adam_db = "syn_data", args = "args_list")
writeLines(res)
#> # Edit Preprocessing Function.
#> preprocess(aet01) <- 
#> function (adam_db, ...) 
#> {
#>     adam_db$adae <- adam_db$adae %>% filter(.data$ANL01FL == 
#>         "Y") %>% mutate(FATAL = with_label(.data$AESDTH == "Y", 
#>         "AE with fatal outcome"), SER = with_label(.data$AESER == 
#>         "Y", "Serious AE"), SEV = with_label(.data$ASEV == "SEVERE", 
#>         "Severe AE (at greatest intensity)"), REL = with_label(.data$AREL == 
#>         "Y", "Related AE"), WD = with_label(.data$AEACN == "DRUG WITHDRAWN", 
#>         "AE leading to withdrawal from treatment"), DSM = with_label(.data$AEACN %in% 
#>         c("DRUG INTERRUPTED", "DOSE INCREASED", "DOSE REDUCED"), 
#>         "AE leading to dose modification/interruption"), SERWD = with_label(.data$SER & 
#>         .data$WD, "Serious AE leading to withdrawal from treatment"), 
#>         SERDSM = with_label(.data$SER & .data$DSM, "Serious AE leading to dose modification/interruption"), 
#>         RELSER = with_label(.data$SER & .data$REL, "Related Serious AE"), 
#>         RELWD = with_label(.data$REL & .data$WD, "Related AE leading to withdrawal from treatment"), 
#>         RELDSM = with_label(.data$REL & .data$DSM, "Related AE leading to dose modification/interruption"), 
#>         CTC35 = with_label(.data$ATOXGR %in% c("3", "4", "5"), 
#>             "Grade 3-5 AE"), CTC45 = with_label(.data$ATOXGR %in% 
#>             c("4", "5"), "Grade 4/5 AE"))
#>     adam_db$adsl <- adam_db$adsl %>% mutate(DCSREAS = reformat(.data$DCSREAS, 
#>         missing_rule))
#>     adam_db
#> }
#> 
#> # Create TLG
#> tlg_output <- run(object = aet01, adam_db = syn_data, verbose = TRUE, user_args = args_list)
```

## With a modified chevron object

The script generator depends on the functions actually stored in the
object. Modifying the `chevron_tlg` object can lead to a different
script.

``` r
aet01_custom <- aet01
preprocess(aet01_custom) <- function(adam_db, new_format, ...) {
  reformat(adam_db, new_format)
}

res_funs <- script_funs(aet01_custom, adam_db = "syn_data", args = "args_list")
```

Print the generated scripts. Note that a new argument `new_format` has
been added and the pre processing function has been modified.

``` r
writeLines(res_funs)
#> # Edit Preprocessing Function.
#> preprocess(aet01_custom) <- 
#> function (adam_db, new_format, ...) 
#> {
#>     reformat(adam_db, new_format)
#> }
#> 
#> # Create TLG
#> tlg_output <- run(object = aet01_custom, adam_db = syn_data, verbose = TRUE, user_args = args_list)
```
