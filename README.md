# Chevron: Standard TLGs for clinical trials reporting


*chevron* is a collection of function to create standard tables, listings, and graphs for clinical trials reporting.

# Installation

## Clone and install manually

1. Clone the repository

2. Install `staged.dependencies` with
   ```r
   devtools::install_github("openpharma/staged.dependencies")
   ```
   and setup your GitHub tokens following the instructions on the `staged.dependencies` [website](https://github.com/openpharma/staged.dependencies).
   
3. Install the `chevron` package dependencies with (make sure the working directory is set to the root of `chevron`)
   ```r
   staged.dependencies::install_deps(verbose = TRUE, install_external_deps = TRUE)
   ```


# Usage

```
library(chevron)


library(scda)
sd <- synthetic_cdisc_data("rcd_2021_03_22")
adsl <- sd$adsl
adae <- sd$adae |> 
  mutate(ANL01FL = 'Y')

aet02_1(adsl, adae)

#> Body System or Organ Class                                   A: Drug X    B: Placebo    C: Combination
#>   Dictionary-Derived Term                                     (N=134)       (N=134)        (N=132)    
#> ------------------------------------------------------------------------------------------------------
#> Total number of patients with at least one adverse event     122 (91%)    123 (91.8%)    120 (90.9%)  
#> Overall total number of events                                  609           622            703      
#> cl A.1                                                                                                
#>   Total number of patients with at least one adverse event   78 (58.2%)    75 (56%)       89 (67.4%)  
#>   Total number of events                                        132           130            160      
#>   dcd A.1.1.1.1                                              50 (37.3%)   45 (33.6%)      63 (47.7%)  
#>   dcd A.1.1.1.2                                              48 (35.8%)   48 (35.8%)      50 (37.9%)  
#> cl B.2                                                                                                
#>   Total number of patients with at least one adverse event    79 (59%)    74 (55.2%)      85 (64.4%)  
#>   Total number of events                                        129           138            143      
#>   dcd B.2.2.3.1                                              48 (35.8%)   54 (40.3%)      51 (38.6%)  
#>   dcd B.2.1.2.1                                              49 (36.6%)   44 (32.8%)      52 (39.4%)  
#> cl D.1                                                                                                
#>   Total number of patients with at least one adverse event    79 (59%)     67 (50%)       80 (60.6%)  
#>   Total number of events                                        127           106            135      
#>   dcd D.1.1.1.1                                              50 (37.3%)   42 (31.3%)      51 (38.6%)  
#>   dcd D.1.1.4.2                                              48 (35.8%)   42 (31.3%)      50 (37.9%)  
#> cl D.2                                                                                                
#>   Total number of patients with at least one adverse event   47 (35.1%)   58 (43.3%)      57 (43.2%)  
#>   Total number of events                                         62           72              74      
#>   dcd D.2.1.5.3                                              47 (35.1%)   58 (43.3%)      57 (43.2%)  
#> cl B.1                                                                                                
#>   Total number of patients with at least one adverse event   47 (35.1%)   49 (36.6%)      43 (32.6%)  
#>   Total number of events                                         56           60              62      
#>   dcd B.1.1.1.1                                              47 (35.1%)   49 (36.6%)      43 (32.6%)  
#> cl C.2                                                                                                
#>   Total number of patients with at least one adverse event   35 (26.1%)   48 (35.8%)      55 (41.7%)  
#>   Total number of events                                         48           53              65      
#>   dcd C.2.1.2.1                                              35 (26.1%)   48 (35.8%)      55 (41.7%)  
#> cl C.1                                                                                                
#>   Total number of patients with at least one adverse event   43 (32.1%)   46 (34.3%)      43 (32.6%)  
#>   Total number of events                                         55           63              64      
#>   dcd C.1.1.1.3                                              43 (32.1%)   46 (34.3%)      43 (32.6%)  
#> ------------------------------------------------------------------------------------------------------
#> 
#> Footnotes go here
```


# Acknowledgment


# Notes for Developers

## Conventions
