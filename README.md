# Chevron: Standard TLGs for clinical trials reporting


*chevron* is a collection of function to create standard tables, listings, and graphs for clinical trials reporting.

## Installation

### Clone and install manually

1. Clone the repository

2. Install `staged.dependencies` with
  ```
  devtools::install_github("openpharma/staged.dependencies")
  ```
  and setup your GitHub tokens following the instructions on the `staged.dependencies` [website](https://github.com/openpharma/staged.dependencies).  Make sure that you enable SSO for the token.
  
3. Install the `chevron` package dependencies with (make sure the working directory is set to the root of `chevron`)
  ```
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

```
library(chevron)
library(magrittr)

db <- syn_test_data() %>%
  preprocess_data("aet02_1")

aet02_1(adam_db = db)
```

which returns 

```
Adverse Events: {Specify Population}
Protocol: {{protocol}}, Snapshot: {{snapshot}}, Snapshot Date: {{snapshot-date}}, Cutoff Date: {{cutoff-date}}

—————————————————————————————————————————————————————————————————————————————————————————————————————
MedDRA System Organ Class                                    A: Drug X    B: Placebo   C: Combination
  MedDRA Preferred Term                                       (N=122)      (N=123)        (N=120)    
—————————————————————————————————————————————————————————————————————————————————————————————————————
Total number of patients with at least one adverse event     122 (100%)   123 (100%)     120 (100%)  
Overall total number of events                                  609          622            703      
cl A.1                                                                                               
  Total number of patients with at least one adverse event   78 (63.9%)    75 (61%)      89 (74.2%)  
  Total number of events                                        132          130            160      
  dcd A.1.1.1.1                                               50 (41%)    45 (36.6%)     63 (52.5%)  
  dcd A.1.1.1.2                                              48 (39.3%)    48 (39%)      50 (41.7%)  
cl B.2                                                                                               
  Total number of patients with at least one adverse event   79 (64.8%)   74 (60.2%)     85 (70.8%)  
  Total number of events                                        129          138            143      
  dcd B.2.2.3.1                                              48 (39.3%)   54 (43.9%)     51 (42.5%)  
  dcd B.2.1.2.1                                              49 (40.2%)   44 (35.8%)     52 (43.3%)  
cl D.1                                                                                               
  Total number of patients with at least one adverse event   79 (64.8%)   67 (54.5%)     80 (66.7%)  
  Total number of events                                        127          106            135      
  dcd D.1.1.1.1                                               50 (41%)    42 (34.1%)     51 (42.5%)  
  dcd D.1.1.4.2                                              48 (39.3%)   42 (34.1%)     50 (41.7%)  
cl D.2                                                                                               
  Total number of patients with at least one adverse event   47 (38.5%)   58 (47.2%)     57 (47.5%)  
  Total number of events                                         62           72             74      
  dcd D.2.1.5.3                                              47 (38.5%)   58 (47.2%)     57 (47.5%)  
cl C.2                                                                                               
  Total number of patients with at least one adverse event   35 (28.7%)    48 (39%)      55 (45.8%)  
  Total number of events                                         48           53             65      
  dcd C.2.1.2.1                                              35 (28.7%)    48 (39%)      55 (45.8%)  
cl B.1                                                                                               
  Total number of patients with at least one adverse event   47 (38.5%)   49 (39.8%)     43 (35.8%)  
  Total number of events                                         56           60             62      
  dcd B.1.1.1.1                                              47 (38.5%)   49 (39.8%)     43 (35.8%)  
cl C.1                                                                                               
  Total number of patients with at least one adverse event   43 (35.2%)   46 (37.4%)     43 (35.8%)  
  Total number of events                                         55           63             64      
  dcd C.1.1.1.3                                              43 (35.2%)   46 (37.4%)     43 (35.8%)  
—————————————————————————————————————————————————————————————————————————————————————————————————————

Investigator text for AEs encoded using MedDRA version xx.x.  Percentages are based on N in the column headings. For frequency counts by preferred term, multiple occurrences of the same AE in an individual are counted only once.  For frequency counts of "Total number of events" rows, multiple occurrences of the same AE in an individual are counted separately. Standard footnote defining AEs included in table (e.g., includes AEs with onset from first dose of study drug through 7 days after last dose of study drug).                                         48 (39.3%)   54 (43.9%)     51 (42.5%)  
```
