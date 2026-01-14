# DST01 Table 1 (Default) Patient Disposition Table 1.

The DST01 Disposition Table provides an overview of patients study
completion. For patients who discontinued the study a reason is
provided.

## Usage

``` r
dst01_main(
  adam_db,
  arm_var = "ARM",
  lbl_overall = "All {Patient_label}",
  study_status_var = "EOSSTT",
  detail_vars = list(Discontinued = c("DCSREAS")),
  trt_status_var = NULL,
  ...
)

dst01_pre(adam_db, ...)

dst01_post(tlg, prune_0 = TRUE, ...)

dst01
```

## Format

An object of class `chevron_t` of length 1.

## Arguments

- adam_db:

  (`list` of `data.frames`) object containing the `ADaM` datasets

- arm_var:

  (`string`) variable. Usually one of `ARM`, `ACTARM`, `TRT01A`, or
  `TRT01A`.

- lbl_overall:

  (`string`) label used for overall column, if set to `NULL` the overall
  column is omitted

- study_status_var:

  (`string`) variable used to define patient status. Default is
  `EOSSTT`, however can also be a variable name with the pattern
  `EOPxxSTT` where `xx` must be substituted by 2 digits referring to the
  analysis period.

- detail_vars:

  Named (`list`) of grouped display of `study_status_var`. The names
  must be subset of unique levels of `study_status_var`.

- trt_status_var:

  (`string`) variable of treatment status.

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

- Default patient disposition table summarizing the reasons for patients
  withdrawal.

- Numbers represent absolute numbers of patients and fraction of `N`.

- Remove zero-count rows.

- Split columns by arm.

- Include a total column by default.

- Sort withdrawal reasons by alphabetic order.

## Functions

- `dst01_main()`: Main TLG function

- `dst01_pre()`: Preprocessing

- `dst01_post()`: Postprocessing

## Note

- `adam_db` object must contain an `adsl` table with the columns
  specified by `status_var` and `disc_reason_var`.

## Examples

``` r
run(dst01, syn_data, detail_vars = list(Ongoing = "STDONS"))
#>               A: Drug X    B: Placebo   C: Combination   All Patients
#>                 (N=15)       (N=15)         (N=15)          (N=45)   
#>   ———————————————————————————————————————————————————————————————————
#>   Completed   10 (66.7%)   10 (66.7%)     10 (66.7%)      30 (66.7%) 

run(dst01, syn_data, detail_vars = list(Discontinued = "DCSREAS", Ongoing = "STDONS"))
#>                                     A: Drug X    B: Placebo   C: Combination   All Patients
#>                                       (N=15)       (N=15)         (N=15)          (N=45)   
#>   —————————————————————————————————————————————————————————————————————————————————————————
#>   Completed                         10 (66.7%)   10 (66.7%)     10 (66.7%)      30 (66.7%) 
#>   Discontinued                      5 (33.3%)    5 (33.3%)      5 (33.3%)       15 (33.3%) 
#>     ADVERSE EVENT                       0            0           1 (6.7%)        1 (2.2%)  
#>     DEATH                           2 (13.3%)    4 (26.7%)      3 (20.0%)       9 (20.0%)  
#>     LACK OF EFFICACY                2 (13.3%)        0              0            2 (4.4%)  
#>     PHYSICIAN DECISION                  0            0           1 (6.7%)        1 (2.2%)  
#>     PROTOCOL VIOLATION                  0         1 (6.7%)          0            1 (2.2%)  
#>     WITHDRAWAL BY PARENT/GUARDIAN    1 (6.7%)        0              0            1 (2.2%)  

run(
  dst01, syn_data,
  detail_vars = list(
    Discontinued = c("DCSREASGP", "DCSREAS"),
    Ongoing = "STDONS"
  )
)
#>                                       A: Drug X    B: Placebo   C: Combination   All Patients
#>                                         (N=15)       (N=15)         (N=15)          (N=45)   
#>   ———————————————————————————————————————————————————————————————————————————————————————————
#>   Completed                           10 (66.7%)   10 (66.7%)     10 (66.7%)      30 (66.7%) 
#>   Discontinued                        5 (33.3%)    5 (33.3%)      5 (33.3%)       15 (33.3%) 
#>     Safety                                                                                   
#>       ADVERSE EVENT                       0            0           1 (6.7%)        1 (2.2%)  
#>       DEATH                           2 (13.3%)    4 (26.7%)      3 (20.0%)       9 (20.0%)  
#>     Non-Safety                                                                               
#>       LACK OF EFFICACY                2 (13.3%)        0              0            2 (4.4%)  
#>       PHYSICIAN DECISION                  0            0           1 (6.7%)        1 (2.2%)  
#>       PROTOCOL VIOLATION                  0         1 (6.7%)          0            1 (2.2%)  
#>       WITHDRAWAL BY PARENT/GUARDIAN    1 (6.7%)        0              0            1 (2.2%)  
```
