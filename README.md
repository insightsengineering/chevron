<!-- markdownlint-disable MD033 -->

# Chevron: Standard TLGs for clinical trials reporting <a href='https://github.com/insightsengineering/chevron'><img src="man/figures/chevron.png" align="right" height="139" style="max-width: 100%;"/></a>

<!-- start badges -->
[![Check 🛠](https://github.com/insightsengineering/chevron/actions/workflows/check.yaml/badge.svg)](https://insightsengineering.github.io/chevron/main/unit-test-report/)
[![Docs 📚](https://github.com/insightsengineering/chevron/actions/workflows/docs.yaml/badge.svg)](https://insightsengineering.github.io/chevron/)
[![Code Coverage 📔](https://raw.githubusercontent.com/insightsengineering/chevron/_xml_coverage_reports/data/main/badge.svg)](https://insightsengineering.github.io/chevron/main/coverage-report/)

![GitHub forks](https://img.shields.io/github/forks/insightsengineering/chevron?style=social)
![GitHub repo stars](https://img.shields.io/github/stars/insightsengineering/chevron?style=social)

![GitHub commit activity](https://img.shields.io/github/commit-activity/m/insightsengineering/chevron)
![GitHub contributors](https://img.shields.io/github/contributors/insightsengineering/chevron)
![GitHub last commit](https://img.shields.io/github/last-commit/insightsengineering/chevron)
![GitHub pull requests](https://img.shields.io/github/issues-pr/insightsengineering/chevron)
![GitHub repo size](https://img.shields.io/github/repo-size/insightsengineering/chevron)
![GitHub language count](https://img.shields.io/github/languages/count/insightsengineering/chevron)
[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![Current Version](https://img.shields.io/github/r-package/v/insightsengineering/chevron/main?color=purple\&label=package%20version)](https://github.com/insightsengineering/chevron/tree/main)
[![Open Issues](https://img.shields.io/github/issues-raw/insightsengineering/chevron?color=red\&label=open%20issues)](https://github.com/insightsengineering/chevron/issues?q=is%3Aissue+is%3Aopen+sort%3Aupdated-desc)
<!-- end badges -->

<!-- markdownlint-enable MD033 -->

`chevron` is a collection of function to create standard tables, listings, and graphs for clinical trials reporting.

## Installation

It is recommended that you [create and use a GitHub PAT](https://docs.github.com/en/github/authenticating-to-github/keeping-your-account-and-data-secure/creating-a-personal-access-token) to install the latest version of this package. Once you have the PAT, run the following:

```r
Sys.setenv(GITHUB_PAT = "your_access_token_here")
if (!require("remotes")) install.packages("remotes")
remotes::install_github("insightsengineering/chevron@*release")
```

## Usage

```r
library(chevron)

data(syn_data)
run(aet02, syn_data)
```

which returns

```text
  MedDRA System Organ Class                                     A: Drug X    B: Placebo    C: Combination
    MedDRA Preferred Term                                        (N=134)       (N=134)        (N=132)    
  ———————————————————————————————————————————————————————————————————————————————————————————————————————
  Total number of patients with at least one adverse event     122 (91.0%)   123 (91.8%)    120 (90.9%)  
  Overall total number of events                                   609           622            703      
  cl A.1                                                                                                 
    Total number of patients with at least one adverse event   78 (58.2%)    75 (56.0%)      89 (67.4%)  
    Total number of events                                         132           130            160      
    dcd A.1.1.1.1                                              50 (37.3%)    45 (33.6%)      63 (47.7%)  
    dcd A.1.1.1.2                                              48 (35.8%)    48 (35.8%)      50 (37.9%)  
  cl B.2                                                                                                 
    Total number of patients with at least one adverse event   79 (59.0%)    74 (55.2%)      85 (64.4%)  
    Total number of events                                         129           138            143      
    dcd B.2.2.3.1                                              48 (35.8%)    54 (40.3%)      51 (38.6%)  
    dcd B.2.1.2.1                                              49 (36.6%)    44 (32.8%)      52 (39.4%)  
  cl D.1                                                                                                 
    Total number of patients with at least one adverse event   79 (59.0%)    67 (50.0%)      80 (60.6%)  
    Total number of events                                         127           106            135      
    dcd D.1.1.1.1                                              50 (37.3%)    42 (31.3%)      51 (38.6%)  
    dcd D.1.1.4.2                                              48 (35.8%)    42 (31.3%)      50 (37.9%)  
  cl D.2                                                                                                 
    Total number of patients with at least one adverse event   47 (35.1%)    58 (43.3%)      57 (43.2%)  
    Total number of events                                         62            72              74      
    dcd D.2.1.5.3                                              47 (35.1%)    58 (43.3%)      57 (43.2%)  
  cl B.1                                                                                                 
    Total number of patients with at least one adverse event   47 (35.1%)    49 (36.6%)      43 (32.6%)  
    Total number of events                                         56            60              62      
    dcd B.1.1.1.1                                              47 (35.1%)    49 (36.6%)      43 (32.6%)  
  cl C.2                                                                                                 
    Total number of patients with at least one adverse event   35 (26.1%)    48 (35.8%)      55 (41.7%)  
    Total number of events                                         48            53              65      
    dcd C.2.1.2.1                                              35 (26.1%)    48 (35.8%)      55 (41.7%)  
  cl C.1                                                                                                 
    Total number of patients with at least one adverse event   43 (32.1%)    46 (34.3%)      43 (32.6%)  
    Total number of events                                         55            63              64      
    dcd C.1.1.1.3                                              43 (32.1%)    46 (34.3%)      43 (32.6%)  
```
