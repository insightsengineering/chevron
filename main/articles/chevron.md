# Introduction to Chevron

## Introduction

The `chevron` R package provides functions to produce standard tables,
listings and graphs (TLGs) used to analyze and report clinical trials
data. The ensemble of function used to produce a particular output are
stored in an `S4` object of virtual class `chevron_tlg`. Each type of
output are associated with a specific class: `chevron_t` for tables,
`chevron_l` for listings and `chevron_g` for graphs.

Each standard output is associated with one *`chevron_tlg` object*. They
contain the following objects in separate slots:

- A `main` function also refereed to as *TLG-function*.
- A `preprocess` function.
- A `postprocess` function

### *TLG-functions*

The *TLG-functions* in `chevron` use other packages to produce the final
outputs, for example `rtables` and `tern` are used to create tables,
`ggplot2`, `lattice`, and `grid` are used to create graphs, `rlistings`
to create listings.

*TLG-functions* in `chevron` such as `dmt01_main`, `aet02_main`,
`aet02_main` have the following properties:

1.  they produce a narrow defined output (currently standards in Roche
    `GDS`). Note, that the naming convention `<gds template id>_main`
    indicates that a Roche `GDS` defined standard may have different
    implementations. Or, alternatively, a `GDS` template id can be
    regarded as a *guideline* and the function name in `chevron` as a
    *standard*.
2.  have, if possible, few arguments to modify the standard. Generally,
    arguments may change the structure of the table (arm variable, which
    variables are summarized) and also parameterize the cell content
    (i.e. alpha-level for p-value).
3.  have always the first argument `adam_db` which is the collection of
    `ADaM` datasets (`ADSL`, `ADAE`, `ADRS`, etc.). Please read the *The
    `adam_db` Argument* vignette in this package for more details.

### *preprocessing*

The *preprocess* functions in `chevron` use `base`, `dplyr` and `dunlin`
packages to process input data object and turn them into a suitable
input for *TLG-functions*.

*preprocess* in chevron such as `dmt01_pre`, `aet02_pre`, `aet02_pre`
have the following properties:

1.  they return a `list` of `data.frame` object amenable to processing
    by a *TLG-functions*. message.
2.  have very few arguments to modify the standard.
3.  have always the first argument `adam_db` which is the collection of
    `ADaM` datasets (`ADSL`, `ADAE`, `ADRS`, etc.). Please read the *The
    `adam_db` Argument* vignette in this package for more details.

Please note that the ultimate responsible person of the preprocessing
functions is the end user. The provided preprocessing function is only a
template and users could modify depending on their need/data. This
preprocessing function will be printed to allow modification in script
generated in `citril`.

### *postprocessing*

By default, the Postprocessing function returns its input or a null
report if the input has no rows. *`postprocessing`* function of a
`chevron_tlg` object must have at least `tlg` as formal arguments.

## Example `AET02`

For example, the `GDS` template `aet02` is implemented in `chevron` with
the `chevropn_tlg` objects that have the name `aet02`.

We first load the data as a `list` of `data.frame`, where each table
represents a domain.

``` r
library(chevron)
#> Registered S3 method overwritten by 'tern':
#>   method   from 
#>   tidy.glm broom
data(syn_data, package = "chevron")
```

A the `aet02` output is then created as follows:

``` r
run(aet02, syn_data)
#>   MedDRA System Organ Class                                    A: Drug X    B: Placebo   C: Combination
#>     MedDRA Preferred Term                                        (N=15)       (N=15)         (N=15)    
#>   —————————————————————————————————————————————————————————————————————————————————————————————————————
#>   Total number of patients with at least one adverse event     13 (86.7%)   14 (93.3%)     15 (100%)   
#>   Overall total number of events                                   58           59             99      
#>   cl B.2                                                                                               
#>     Total number of patients with at least one adverse event   11 (73.3%)   8 (53.3%)      10 (66.7%)  
#>     Total number of events                                         18           15             20      
#>     dcd B.2.2.3.1                                              8 (53.3%)    6 (40.0%)      7 (46.7%)   
#>     dcd B.2.1.2.1                                              5 (33.3%)    6 (40.0%)      5 (33.3%)   
#>   cl D.1                                                                                               
#>     Total number of patients with at least one adverse event   9 (60.0%)    5 (33.3%)      11 (73.3%)  
#>     Total number of events                                         13           9              19      
#>     dcd D.1.1.1.1                                              4 (26.7%)    4 (26.7%)      7 (46.7%)   
#>     dcd D.1.1.4.2                                              6 (40.0%)    2 (13.3%)      7 (46.7%)   
#>   cl A.1                                                                                               
#>     Total number of patients with at least one adverse event   7 (46.7%)    6 (40.0%)      10 (66.7%)  
#>     Total number of events                                         8            11             16      
#>     dcd A.1.1.1.2                                              5 (33.3%)    6 (40.0%)      6 (40.0%)   
#>     dcd A.1.1.1.1                                              3 (20.0%)     1 (6.7%)      6 (40.0%)   
#>   cl B.1                                                                                               
#>     Total number of patients with at least one adverse event   5 (33.3%)    6 (40.0%)      8 (53.3%)   
#>     Total number of events                                         6            6              12      
#>     dcd B.1.1.1.1                                              5 (33.3%)    6 (40.0%)      8 (53.3%)   
#>   cl C.2                                                                                               
#>     Total number of patients with at least one adverse event   6 (40.0%)    4 (26.7%)      8 (53.3%)   
#>     Total number of events                                         6            4              12      
#>     dcd C.2.1.2.1                                              6 (40.0%)    4 (26.7%)      8 (53.3%)   
#>   cl D.2                                                                                               
#>     Total number of patients with at least one adverse event   2 (13.3%)    5 (33.3%)      7 (46.7%)   
#>     Total number of events                                         3            5              10      
#>     dcd D.2.1.5.3                                              2 (13.3%)    5 (33.3%)      7 (46.7%)   
#>   cl C.1                                                                                               
#>     Total number of patients with at least one adverse event   4 (26.7%)    4 (26.7%)      5 (33.3%)   
#>     Total number of events                                         4            9              10      
#>     dcd C.1.1.1.3                                              4 (26.7%)    4 (26.7%)      5 (33.3%)
```

The function associated with a particular slot can be retrieved with the
corresponding method: `main`, `lyt`, `preprocess` `postprocess` and
`datasets`.

``` r
main(aet02)
#> function (adam_db, arm_var = "ACTARM", row_split_var = "AEBODSYS", 
#>     lbl_overall = NULL, summary_labels = list(all = aet02_label, 
#>         TOTAL = c(nonunique = "Overall total number of events")), 
#>     ...) 
#> {
#>     assert_all_tablenames(adam_db, "adsl", "adae")
#>     assert_string(arm_var)
#>     assert_character(row_split_var, null.ok = TRUE)
#>     assert_string(lbl_overall, null.ok = TRUE)
#>     assert_valid_variable(adam_db$adsl, c("USUBJID", arm_var), 
#>         types = list(c("character", "factor")))
#>     assert_valid_variable(adam_db$adae, c(arm_var, row_split_var, 
#>         "AEDECOD"), types = list(c("character", "factor")))
#>     assert_valid_variable(adam_db$adae, "USUBJID", empty_ok = TRUE, 
#>         types = list(c("character", "factor")))
#>     assert_valid_var_pair(adam_db$adsl, adam_db$adae, arm_var)
#>     assert_list(summary_labels, null.ok = TRUE)
#>     assert_subset(names(summary_labels), c("all", "TOTAL", row_split_var))
#>     assert_subset(unique(unlist(lapply(summary_labels, names))), 
#>         c("unique", "nonunique", "unique_count"))
#>     summary_labels <- expand_list(summary_labels, c("TOTAL", 
#>         row_split_var))
#>     lbl_overall <- render_safe(lbl_overall)
#>     lbl_row_split <- var_labels_for(adam_db$adae, row_split_var)
#>     lbl_aedecod <- var_labels_for(adam_db$adae, "AEDECOD")
#>     lyt <- occurrence_lyt(arm_var = arm_var, lbl_overall = lbl_overall, 
#>         row_split_var = row_split_var, lbl_row_split = lbl_row_split, 
#>         medname_var = "AEDECOD", lbl_medname_var = lbl_aedecod, 
#>         summary_labels = summary_labels, count_by = NULL)
#>     tbl <- build_table(lyt, adam_db$adae, alt_counts_df = adam_db$adsl)
#>     tbl
#> }
#> <bytecode: 0x55b13d23c870>
#> <environment: namespace:chevron>
```

These are standard functions that can be used on their own.

``` r
res <- preprocess(aet02)(syn_data)

# or
foo <- aet02@preprocess
res <- foo(syn_data)

str(res, max.level = 0)
#> List of 13
```

## `chevron_tlg` object customization

In some instances it is useful to customize the `chevron_tlg` object,
for example by changing the pre processing functions in script
generated. Please modify the code directly inside the `pre_fun`, and
make sure the function returns a named list of data frames. Please be
careful about the argument names. The default argument of `pre`
functions will be override by the argument in spec.

## Custom `chevron_tlg` object creation

In some cases, you may want to create a new `chevron_tlg` template. To
create a `chevron_tlg` object from scratch, use the provided
constructors corresponding to the desired output:

- [`chevron_t()`](https://insightsengineering.github.io/chevron/reference/chevron_tlg-class.md)
  for tables.
- [`chevron_l()`](https://insightsengineering.github.io/chevron/reference/chevron_tlg-class.md)
  for listings.
- [`chevron_g()`](https://insightsengineering.github.io/chevron/reference/chevron_tlg-class.md)
  for graphs.

``` r
library(rtables)
library(tern)
my_template <- chevron_t(
  main = "<your main function to build the table>",
  preprocess = "<your pre function to process the data>",
  postprocess = "<your post function to add custom sorting>"
)

run(my_template, syn_data)
```

Note that to ensure the correct execution of the `run` function, the
name of the first argument of the `main` function must be `adam_db`; the
input `list` of `data.frame` object to pre-process. The name of the
first argument of the `preprocess` function must be `adam_db`; the input
`list` object to create `TLG` output and finally, the name of the first
argument of the `postprocess` function must be `tlg`, the input
`TableTree` object to post-process. Validation criteria enforce these
rules upon creation of a `chevron_tlg` object.
