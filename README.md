# Chevron: Standard TLGs for clinical trials reporting


*chevron* is a collection of function to create standard tables, listings, and graphs for clinical trials reporting.

## Installation

### Clone and install manually

1. Clone the repository

2. Install `staged.dependencies` with
  ```r
  devtools::install_github("openpharma/staged.dependencies")
  ```
  and setup your GitHub tokens following the instructions on the `staged.dependencies`.  Make sure that you enable SSO for the token.
  
3. Install the `chevron` package dependencies with (make sure the working directory is set to the root of `chevron`)
  ```r
  library(staged.dependencies)
     x <- dependency_table(
     project = "insightsengineering/chevron", 
     project_type = "repo@host", 
     ref = "main", 
     verbose = 1
  )

  install_deps(x, install_direction = "upstream", install_project = TRUE)
  ```


## Usage

```r
library(chevron)
library(dm)
library(rtables)

db <- syn_test_data() %>%
    dm_select_tbl(adsl, adae)

db <- db %>%
   (std_filter("aet02_1"))() %>%
   (std_mutate("aet02_1"))()

aet02_1(adam_db = db)

#> Adverse Events: {Specify Population}
#> Protocol: {{protocol}}, Snapshot: {{snapshot}}, Snapshot Date: {{snapshot-date}}, Cutoff Date: {{cutoff-date}}
#> 
#> -----------------------------------------------------------------------------------------------------
#> Body System or Organ Class                                   A: Drug X    B: Placebo   C: Combination
#>   Dictionary-Derived Term                                     (N=122)      (N=123)        (N=120)    
#> -----------------------------------------------------------------------------------------------------
#> Total number of patients with at least one adverse event     122 (100%)   123 (100%)     120 (100%)  
#> Overall total number of events                                  609          622            703      
#> cl A.1                                                                                               
#>   Total number of patients with at least one adverse event   78 (63.9%)    75 (61%)      89 (74.2%)  
#>   Total number of events                                        132          130            160      
#>   dcd A.1.1.1.1                                               50 (41%)    45 (36.6%)     63 (52.5%)  
#>   dcd A.1.1.1.2                                              48 (39.3%)    48 (39%)      50 (41.7%)  
#> cl B.2                                                                                               
#>   Total number of patients with at least one adverse event   79 (64.8%)   74 (60.2%)     85 (70.8%)  
#>   Total number of events                                        129          138            143      
#>   dcd B.2.2.3.1                                              48 (39.3%)   54 (43.9%)     51 (42.5%)  
```

(Table truncated)


## Acknowledgment


## Notes for Developers

### Conventions
