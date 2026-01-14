# `LBT15` Laboratory Test Shifts to `NCI-CTCAE` Grade 3-4 Post-Baseline Table.

`LBT15` Laboratory Test Shifts to `NCI-CTCAE` Grade 3-4 Post-Baseline
Table.

## Usage

``` r
lbt15_pre(adam_db, ...)

lbt15
```

## Format

An object of class `chevron_t` of length 1.

## Source

`lbt04.R`

## Arguments

- adam_db:

  (`list` of `data.frames`) object containing the `ADaM` datasets

- ...:

  not used.

## Value

the preprocessing function returns a `list` of `data.frame`.

## Functions

- `lbt15_pre()`: Preprocessing

## Examples

``` r
run(lbt15, syn_data)
#>   Laboratory Test                          A: Drug X   B: Placebo    C: Combination
#>       Analysis Toxicity Grade               (N=15)       (N=15)          (N=15)    
#>   —————————————————————————————————————————————————————————————————————————————————
#>   CHEMISTRY                                                                        
#>     Alanine Aminotransferase Measurement                                           
#>       Low                                     0/7          0/3        1/7 (14.3%)  
#>       High                                    0/7          0/3            0/8      
#>     C-Reactive Protein Measurement                                                 
#>       Low                                     0/8          0/3            0/7      
#>       High                                    0/8          0/2            0/7      
#>     Immunoglobulin A Measurement                                                   
#>       Low                                     0/5          0/8            0/7      
#>       High                                    0/5          0/8            0/6      
#>   COAGULATION                                                                      
#>     Alanine Aminotransferase Measurement                                           
#>       Low                                     0/4          0/7            0/4      
#>       High                                    0/5          0/7            0/4      
#>     C-Reactive Protein Measurement                                                 
#>       Low                                     0/5          0/6            0/4      
#>       High                                    0/5      1/6 (16.7%)    1/4 (25.0%)  
#>     Immunoglobulin A Measurement                                                   
#>       Low                                     0/8          0/9            0/6      
#>       High                                    0/8          0/9        1/6 (16.7%)  
#>   HEMATOLOGY                                                                       
#>     Alanine Aminotransferase Measurement                                           
#>       Low                                     0/5          0/5            0/4      
#>       High                                    0/6          0/5            0/4      
#>     C-Reactive Protein Measurement                                                 
#>       Low                                     0/5          0/5            0/4      
#>       High                                    0/5          0/4            0/5      
#>     Immunoglobulin A Measurement                                                   
#>       Low                                     0/3          0/4            0/8      
#>       High                                    0/3          0/4            0/8      
```
