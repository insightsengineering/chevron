# `LBT06` Table 1 (Default) Laboratory Abnormalities by Visit and Baseline Status Table 1.

The `LBT06` table produces the standard laboratory abnormalities by
visit and baseline status summary.

## Usage

``` r
lbt06_main(
  adam_db,
  arm_var = "ACTARM",
  lbl_overall = NULL,
  page_var = "PARAMCD",
  ...
)

lbt06_pre(adam_db, ...)

lbt06_post(tlg, prune_0 = FALSE, ...)

lbt06
```

## Format

An object of class `chevron_t` of length 1.

## Arguments

- adam_db:

  (`list` of `data.frames`) object containing the `ADaM` datasets

- arm_var:

  (`string`) the arm variable used for arm splitting.

- lbl_overall:

  (`string`) label used for overall column, if set to `NULL` the overall
  column is omitted

- page_var:

  (`string`) variable name prior to which the row split is by page.

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

- Only count `"LOW"` or `"HIGH"` values for `ANRIND` and `BNRIND`.

- Lab test results with missing `ANRIND` values are excluded.

- Split columns by arm, typically `ACTARM`.

- Keep zero count rows by default.

## Functions

- `lbt06_main()`: Main TLG function

- `lbt06_pre()`: Preprocessing

- `lbt06_post()`: Postprocessing

## Note

- `adam_db` object must contain an `adlb` table with columns `"AVISIT"`,
  `"ANRIND"`, `"BNRIND"`, `"ONTRTFL"`, and `"PARCAT2"`, and column
  specified by `arm_var`.

## Examples

``` r
run(lbt06, syn_data)
#>   Visit                                                                            
#>     Abnormality at Visit                  A: Drug X    B: Placebo    C: Combination
#>               Baseline Status              (N=15)        (N=15)          (N=15)    
#>   —————————————————————————————————————————————————————————————————————————————————
#>   Alanine Aminotransferase Measurement                                             
#>     WEEK 1 DAY 8                                                                   
#>       Low                                                                          
#>                 Not low                      0/1           0/6            0/1      
#>                 Low                          0/1           0/1            0/1      
#>                 Total                        0/2           0/7            0/2      
#>       High                                                                         
#>                 Not high                     0/2           0/7            0/2      
#>                 High                         0/0           0/0            0/0      
#>                 Total                        0/2           0/7            0/2      
#>     WEEK 2 DAY 15                                                                  
#>       Low                                                                          
#>                 Not low                      0/3           0/2            0/2      
#>                 Low                          0/0           0/0            0/0      
#>                 Total                        0/3           0/2            0/2      
#>       High                                                                         
#>                 Not high                     0/3           0/2            0/2      
#>                 High                         0/0           0/0            0/0      
#>                 Total                        0/3           0/2            0/2      
#>     WEEK 3 DAY 22                                                                  
#>       Low                                                                          
#>                 Not low                      0/5           0/3        1/6 (16.7%)  
#>                 Low                          0/0           0/0            0/0      
#>                 Total                        0/5           0/3        1/6 (16.7%)  
#>       High                                                                         
#>                 Not high                     0/5           0/3            0/6      
#>                 High                         0/0           0/0            0/0      
#>                 Total                        0/5           0/3            0/6      
#>     WEEK 4 DAY 29                                                                  
#>       Low                                                                          
#>                 Not low                      0/3           0/1            0/1      
#>                 Low                          0/3           0/2            0/0      
#>                 Total                        0/6           0/3            0/1      
#>       High                                                                         
#>                 Not high                     0/6           0/3            0/1      
#>                 High                         0/0           0/0            0/0      
#>                 Total                        0/6           0/3            0/1      
#>     WEEK 5 DAY 36                                                                  
#>       Low                                                                          
#>                 Not low                      0/2           0/2            0/5      
#>                 Low                          0/1           0/1            0/0      
#>                 Total                        0/3           0/3            0/5      
#>       High                                                                         
#>                 Not high                     0/3           0/3            0/5      
#>                 High                         0/0           0/0            0/0      
#>                 Total                        0/3           0/3            0/5      
#>   C-Reactive Protein Measurement                                                   
#>     WEEK 1 DAY 8                                                                   
#>       Low                                                                          
#>                 Not low                      0/5           0/3            0/3      
#>                 Low                          0/0           0/1            0/0      
#>                 Total                        0/5           0/4            0/3      
#>       High                                                                         
#>                 Not high                     0/5           0/3        1/3 (33.3%)  
#>                 High                         0/0           0/1            0/0      
#>                 Total                        0/5           0/4        1/3 (33.3%)  
#>     WEEK 2 DAY 15                                                                  
#>       Low                                                                          
#>                 Not low                      0/8           0/2            0/0      
#>                 Low                          0/0           0/0            0/1      
#>                 Total                        0/8           0/2            0/1      
#>       High                                                                         
#>                 Not high                 1/8 (12.5%)       0/1            0/1      
#>                 High                         0/0           0/1            0/0      
#>                 Total                    1/8 (12.5%)       0/2            0/1      
#>     WEEK 3 DAY 22                                                                  
#>       Low                                                                          
#>                 Not low                      0/5           0/4            0/4      
#>                 Low                          0/0       1/1 (100%)         0/2      
#>                 Total                        0/5        1/5 (20%)         0/6      
#>       High                                                                         
#>                 Not high                  1/5 (20%)     1/5 (20%)         0/6      
#>                 High                         0/0           0/0            0/0      
#>                 Total                     1/5 (20%)     1/5 (20%)         0/6      
#>     WEEK 4 DAY 29                                                                  
#>       Low                                                                          
#>                 Not low                      0/2        1/2 (50%)     1/3 (33.3%)  
#>                 Low                          0/0           0/0            0/0      
#>                 Total                        0/2        1/2 (50%)     1/3 (33.3%)  
#>       High                                                                         
#>                 Not high                     0/2           0/2            0/3      
#>                 High                         0/0           0/0            0/0      
#>                 Total                        0/2           0/2            0/3      
#>     WEEK 5 DAY 36                                                                  
#>       Low                                                                          
#>                 Not low                      0/2           0/2            0/5      
#>                 Low                          0/0       1/1 (100%)         0/1      
#>                 Total                        0/2       1/3 (33.3%)        0/6      
#>       High                                                                         
#>                 Not high                  1/2 (50%)        0/3            0/6      
#>                 High                         0/0           0/0            0/0      
#>                 Total                     1/2 (50%)        0/3            0/6      
#>   Immunoglobulin A Measurement                                                     
#>     WEEK 1 DAY 8                                                                   
#>       Low                                                                          
#>                 Not low                      0/6           0/6            0/2      
#>                 Low                          0/0           0/0            0/0      
#>                 Total                        0/6           0/6            0/2      
#>       High                                                                         
#>                 Not high                     0/5       1/6 (16.7%)        0/2      
#>                 High                         0/1           0/0            0/0      
#>                 Total                        0/6       1/6 (16.7%)        0/2      
#>     WEEK 2 DAY 15                                                                  
#>       Low                                                                          
#>                 Not low                      0/3           0/7            0/4      
#>                 Low                          0/0           0/0            0/0      
#>                 Total                        0/3           0/7            0/4      
#>       High                                                                         
#>                 Not high                     0/3           0/7         1/4 (25%)   
#>                 High                         0/0           0/0            0/0      
#>                 Total                        0/3           0/7         1/4 (25%)   
#>     WEEK 3 DAY 22                                                                  
#>       Low                                                                          
#>                 Not low                      0/4           0/5            0/9      
#>                 Low                          0/0           0/0            0/0      
#>                 Total                        0/4           0/5            0/9      
#>       High                                                                         
#>                 Not high                     0/3           0/5            0/8      
#>                 High                         0/1           0/0            0/1      
#>                 Total                        0/4           0/5            0/9      
#>     WEEK 4 DAY 29                                                                  
#>       Low                                                                          
#>                 Not low                      0/2           0/6            0/4      
#>                 Low                          0/0           0/0            0/0      
#>                 Total                        0/2           0/6            0/4      
#>       High                                                                         
#>                 Not high                 1/1 (100%)        0/6            0/3      
#>                 High                         0/1           0/0            0/1      
#>                 Total                     1/2 (50%)        0/6            0/4      
#>     WEEK 5 DAY 36                                                                  
#>       Low                                                                          
#>                 Not low                      0/6           0/5            0/5      
#>                 Low                          0/0           0/0            0/0      
#>                 Total                        0/6           0/5            0/5      
#>       High                                                                         
#>                 Not high                     0/5           0/5            0/5      
#>                 High                         0/1           0/0            0/0      
#>                 Total                        0/6           0/5            0/5      
```
