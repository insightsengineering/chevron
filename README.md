# Chevron: Standard TLGs for clinical trials reporting


*chevron* is a collection of function to create standard tables, listings, and graphs for clinical trials reporting.

# Installation

## Clone and install manually
1. Clone the repository

   The repository can be downloaded directly from the `github.com` site as an archive (see [Github tutorial on cloning to learn more](https://docs.github.com/en/github/creating-cloning-and-archiving-repositories/cloning-a-repository-from-github/cloning-a-repository)). Alternatively, Git command line tools offer the same functionality, without the need for manual downloading and unpacking the archive, but require to authenticate to Github. You can authenticate using a key pair or a Personal Access Token (PAT). Please refer to excellent Github tutorials on [connecting to Github using SSH](https://docs.github.com/en/github/authenticating-to-github) or [creating and using PAT](https://docs.github.com/en/github/authenticating-to-github/keeping-your-account-and-data-secure/creating-a-personal-access-token).
   1. Using PAT. Input in the Git Bash console, PowerShell or any Linux shell:

      ```
      $ git clone https://github.com/insightsengineering/chevron.git
      Username: your_username_goes_here
      Password: your_token_goes_here
      ```
    1. Using SSH. If set up properly, the repository is ready to be cloned executing:

       ```
       $ git clone https://github.com/insightsengineering/chevron.git
       ```
   This creates a subdirectory `chevron` containing the cloned repository.

2. Build and install

   The native R tools provide a quick way to install a package. Run in PowerShell or any Linux shell:
   ```
   $ R CMD build chevron
   ```
   This command builds the package and creates an archive. The name of the archive is output by the command at then of building. Then input in the shell:
   ```
   $ Rscript -e 'install.packages("name_of_the_archive")
   ```
   Here is an example of a real command (with name_of_the_archive substituted by the output of the build command):
   ```
   $ Rscript -e 'install.packages("chevron_0.1.0.tar.gz")'
   ```

# Usage

```
library(chevron)
library(dplyr)
library(scda)
sd <- synthetic_cdisc_data("rcd_2021_03_22")
adsl <- sd$adsl
adae <- sd$adae %>% mutate(ANL01FL = 'Y')

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
