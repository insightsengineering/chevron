# `DMT01` Table 1 (Default) Demographics and Baseline Characteristics Table 1.

For each variable, summary statistics are by default based on the number
of patients in the corresponding `n` row.

## Usage

``` r
dmt01_main(
  adam_db,
  arm_var = "ARM",
  lbl_overall = "All {Patient_label}",
  summaryvars = c("AAGE", "AGEGR1", "SEX", "ETHNIC", "RACE"),
  stats = list(default = c("n", "mean_sd", "median", "range", "count_fraction")),
  precision = list(),
  ...
)

dmt01_pre(adam_db, ...)

dmt01_post(tlg, prune_0 = TRUE, ...)

dmt01
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

- summaryvars:

  (`character`) variables summarized in demographic table. The label
  attribute of the corresponding column in `adsl` table of `adam_db` is
  used as label.

- stats:

  (named `list` of character) where names are `strings` found in
  `summaryvars` and the values indicate the statistical analysis to
  perform. If `default` is set, and parameter precision not specified,
  the value for `default` will be used.

- precision:

  (named `list` of `integer`) where names are `strings` found in
  `summaryvars` and the values indicate the number of digits in
  statistics for numeric variables. If `default` is set, and parameter
  precision not specified, the value for `default` will be used. If
  neither are provided, auto determination is used. See
  [`tern::format_auto`](https://insightsengineering.github.io/tern/latest-tag/reference/format_auto.html).

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

- Information from `ADSUB` are generally included into `ADSL` before
  analysis.

- Default demographic and characteristics table

- If not specified otherwise, numbers represent absolute numbers of
  patients and fraction of `N`

- Remove zero-count rows

- Split columns by arm (planned or actual / code or description)

- Include a total column by default

## Functions

- `dmt01_main()`: Main TLG function

- `dmt01_pre()`: Preprocessing

- `dmt01_post()`: Postprocessing

## Note

- `adam_db` object must contain an `adsl` table with the columns
  specified in `summaryvars`.

## Examples

``` r
run(dmt01, syn_data)
#>                                        A: Drug X    B: Placebo   C: Combination   All Patients
#>                                          (N=15)       (N=15)         (N=15)          (N=45)   
#>   ————————————————————————————————————————————————————————————————————————————————————————————
#>   Age (yr)                                                                                    
#>     n                                      15           15             15              45     
#>     Mean (SD)                          31.3 (5.3)   35.1 (9.0)     36.6 (6.4)      34.3 (7.3) 
#>     Median                                31.0         35.0           35.0            34.0    
#>     Min - Max                           24 - 40      24 - 57        24 - 49         24 - 57   
#>   Age Group                                                                                   
#>     n                                      15           15             15              45     
#>     <65                                15 (100%)    15 (100%)      15 (100%)       45 (100%)  
#>   Sex                                                                                         
#>     n                                      15           15             15              45     
#>     Male                               3 (20.0%)    7 (46.7%)      5 (33.3%)       15 (33.3%) 
#>     Female                             12 (80.0%)   8 (53.3%)      10 (66.7%)      30 (66.7%) 
#>   Ethnicity                                                                                   
#>     n                                      15           15             15              45     
#>     HISPANIC OR LATINO                 2 (13.3%)        0              0            2 (4.4%)  
#>     NOT HISPANIC OR LATINO             13 (86.7%)   15 (100%)      13 (86.7%)      41 (91.1%) 
#>     NOT REPORTED                           0            0          2 (13.3%)        2 (4.4%)  
#>   RACE                                                                                        
#>     n                                      15           15             15              45     
#>     AMERICAN INDIAN OR ALASKA NATIVE       0        2 (13.3%)       1 (6.7%)        3 (6.7%)  
#>     ASIAN                              8 (53.3%)    10 (66.7%)     8 (53.3%)       26 (57.8%) 
#>     BLACK OR AFRICAN AMERICAN          4 (26.7%)     1 (6.7%)      4 (26.7%)       9 (20.0%)  
#>     WHITE                              3 (20.0%)    2 (13.3%)      2 (13.3%)       7 (15.6%)  
```
