# aet01_aesi can handle all NA values

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                                                                         A: Drug X 
                                                                                          (N=134)  
        ———————————————————————————————————————————————————————————————————————————————————————————
        Total number of patients with at least one AE                                   122 (91.0%)
        Total number of AEs                                                                 609    
        Total number of patients with at least one AE by worst grade                               
          Grade 1                                                                        7 (5.2%)  
          Grade 2                                                                        6 (4.5%)  
          Grade 3                                                                       18 (13.4%) 
          Grade 4                                                                       15 (11.2%) 
          Grade 5 (fatal outcome)                                                       76 (56.7%) 
        Total number of patients with study drug withdrawn due to AE                         0     
        Total number of patients with dose modified/interrupted due to AE                    0     
        Total number of patients with treatment received for AE                              0     
        Total number of patients with all non-fatal AEs resolved                        84 (62.7%) 
        Total number of patients with at least one unresolved or ongoing non-fatal AE   102 (76.1%)
        Total number of patients with at least one serious AE                                0     
        Total number of patients with at least one related AE                           105 (78.4%)
      \s\n                                                                                  B: Placebo 
                                                                                          (N=134)  
        ———————————————————————————————————————————————————————————————————————————————————————————
        Total number of patients with at least one AE                                   123 (91.8%)
        Total number of AEs                                                                 622    
        Total number of patients with at least one AE by worst grade                               
          Grade 1                                                                        9 (6.7%)  
          Grade 2                                                                        10 (7.5%) 
          Grade 3                                                                       14 (10.4%) 
          Grade 4                                                                       20 (14.9%) 
          Grade 5 (fatal outcome)                                                       70 (52.2%) 
        Total number of patients with study drug withdrawn due to AE                         0     
        Total number of patients with dose modified/interrupted due to AE                    0     
        Total number of patients with treatment received for AE                              0     
        Total number of patients with all non-fatal AEs resolved                        92 (68.7%) 
        Total number of patients with at least one unresolved or ongoing non-fatal AE   110 (82.1%)
        Total number of patients with at least one serious AE                                0     
        Total number of patients with at least one related AE                           108 (80.6%)
      \s\n                                                                                  C: Combination
                                                                                           (N=132)    
        ——————————————————————————————————————————————————————————————————————————————————————————————
        Total number of patients with at least one AE                                    120 (90.9%)  
        Total number of AEs                                                                  703      
        Total number of patients with at least one AE by worst grade                                  
          Grade 1                                                                          4 (3.0%)   
          Grade 2                                                                          7 (5.3%)   
          Grade 3                                                                         16 (12.1%)  
          Grade 4                                                                         18 (13.6%)  
          Grade 5 (fatal outcome)                                                         75 (56.8%)  
        Total number of patients with study drug withdrawn due to AE                          0       
        Total number of patients with dose modified/interrupted due to AE                     0       
        Total number of patients with treatment received for AE                               0       
        Total number of patients with all non-fatal AEs resolved                          97 (73.5%)  
        Total number of patients with at least one unresolved or ongoing non-fatal AE    107 (81.1%)  
        Total number of patients with at least one serious AE                                 0       
        Total number of patients with at least one related AE                            109 (82.6%)  

---

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                                                                         A: Drug X 
                                                                                          (N=134)  
        ———————————————————————————————————————————————————————————————————————————————————————————
        Total number of patients with at least one AE                                   122 (91.0%)
        Total number of AEs                                                                 609    
        Total number of patients with at least one AE by worst grade                               
          Grade 1                                                                        7 (5.2%)  
          Grade 2                                                                        6 (4.5%)  
          Grade 3                                                                       18 (13.4%) 
          Grade 4                                                                       15 (11.2%) 
          Grade 5 (fatal outcome)                                                       76 (56.7%) 
        Total number of patients with all non-fatal AEs resolved                        84 (62.7%) 
        Total number of patients with at least one unresolved or ongoing non-fatal AE   102 (76.1%)
        Total number of patients with at least one related AE                           105 (78.4%)
      \s\n                                                                                  B: Placebo 
                                                                                          (N=134)  
        ———————————————————————————————————————————————————————————————————————————————————————————
        Total number of patients with at least one AE                                   123 (91.8%)
        Total number of AEs                                                                 622    
        Total number of patients with at least one AE by worst grade                               
          Grade 1                                                                        9 (6.7%)  
          Grade 2                                                                        10 (7.5%) 
          Grade 3                                                                       14 (10.4%) 
          Grade 4                                                                       20 (14.9%) 
          Grade 5 (fatal outcome)                                                       70 (52.2%) 
        Total number of patients with all non-fatal AEs resolved                        92 (68.7%) 
        Total number of patients with at least one unresolved or ongoing non-fatal AE   110 (82.1%)
        Total number of patients with at least one related AE                           108 (80.6%)
      \s\n                                                                                  C: Combination
                                                                                           (N=132)    
        ——————————————————————————————————————————————————————————————————————————————————————————————
        Total number of patients with at least one AE                                    120 (90.9%)  
        Total number of AEs                                                                  703      
        Total number of patients with at least one AE by worst grade                                  
          Grade 1                                                                          4 (3.0%)   
          Grade 2                                                                          7 (5.3%)   
          Grade 3                                                                         16 (12.1%)  
          Grade 4                                                                         18 (13.6%)  
          Grade 5 (fatal outcome)                                                         75 (56.8%)  
        Total number of patients with all non-fatal AEs resolved                          97 (73.5%)  
        Total number of patients with at least one unresolved or ongoing non-fatal AE    107 (81.1%)  
        Total number of patients with at least one related AE                            109 (82.6%)  

# aet01_aesi can handle some NA values

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                                                                         A: Drug X 
                                                                                          (N=134)  
        ———————————————————————————————————————————————————————————————————————————————————————————
        Total number of patients with at least one AE                                   122 (91.0%)
        Total number of AEs                                                                 609    
        Total number of patients with at least one AE by worst grade                               
          Grade 1                                                                        7 (5.2%)  
          Grade 2                                                                        6 (4.5%)  
          Grade 3                                                                       18 (13.4%) 
          Grade 4                                                                       15 (11.2%) 
          Grade 5 (fatal outcome)                                                       76 (56.7%) 
        Total number of patients with study drug withdrawn due to AE                    27 (20.1%) 
        Total number of patients with dose modified/interrupted due to AE               66 (49.3%) 
        Total number of patients with treatment received for AE                         98 (73.1%) 
        Total number of patients with all non-fatal AEs resolved                        84 (62.7%) 
        Total number of patients with at least one unresolved or ongoing non-fatal AE   102 (76.1%)
        Total number of patients with at least one serious AE                           104 (77.6%)
        Total number of patients with at least one related AE                           105 (78.4%)
      \s\n                                                                                  B: Placebo 
                                                                                          (N=134)  
        ———————————————————————————————————————————————————————————————————————————————————————————
        Total number of patients with at least one AE                                   123 (91.8%)
        Total number of AEs                                                                 622    
        Total number of patients with at least one AE by worst grade                               
          Grade 1                                                                        9 (6.7%)  
          Grade 2                                                                        10 (7.5%) 
          Grade 3                                                                       14 (10.4%) 
          Grade 4                                                                       20 (14.9%) 
          Grade 5 (fatal outcome)                                                       70 (52.2%) 
        Total number of patients with study drug withdrawn due to AE                    26 (19.4%) 
        Total number of patients with dose modified/interrupted due to AE               76 (56.7%) 
        Total number of patients with treatment received for AE                         102 (76.1%)
        Total number of patients with all non-fatal AEs resolved                        92 (68.7%) 
        Total number of patients with at least one unresolved or ongoing non-fatal AE   110 (82.1%)
        Total number of patients with at least one serious AE                           101 (75.4%)
        Total number of patients with at least one related AE                           108 (80.6%)
      \s\n                                                                                  C: Combination
                                                                                           (N=132)    
        ——————————————————————————————————————————————————————————————————————————————————————————————
        Total number of patients with at least one AE                                    120 (90.9%)  
        Total number of AEs                                                                  703      
        Total number of patients with at least one AE by worst grade                                  
          Grade 1                                                                          4 (3.0%)   
          Grade 2                                                                          7 (5.3%)   
          Grade 3                                                                         16 (12.1%)  
          Grade 4                                                                         18 (13.6%)  
          Grade 5 (fatal outcome)                                                         75 (56.8%)  
        Total number of patients with study drug withdrawn due to AE                      30 (22.7%)  
        Total number of patients with dose modified/interrupted due to AE                 74 (56.1%)  
        Total number of patients with treatment received for AE                          103 (78.0%)  
        Total number of patients with all non-fatal AEs resolved                          97 (73.5%)  
        Total number of patients with at least one unresolved or ongoing non-fatal AE    107 (81.1%)  
        Total number of patients with at least one serious AE                             99 (75.0%)  
        Total number of patients with at least one related AE                            109 (82.6%)  

# aet01_aesi works with `ALL` argument

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                                                                            A: Drug X 
                                                                                             (N=134)  
        ——————————————————————————————————————————————————————————————————————————————————————————————
        Total number of patients with at least one AE                                      122 (91.0%)
        Total number of AEs                                                                    609    
        Total number of patients with at least one AE by worst grade                                  
          Grade 1                                                                           7 (5.2%)  
          Grade 2                                                                           6 (4.5%)  
          Grade 3                                                                          18 (13.4%) 
          Grade 4                                                                          15 (11.2%) 
          Grade 5 (fatal outcome)                                                          76 (56.7%) 
        Total number of patients with study drug withdrawn due to AE                       27 (20.1%) 
        Total number of patients with dose modified/interrupted due to AE                  66 (49.3%) 
        Total number of patients with treatment received for AE                            98 (73.1%) 
        Total number of patients with all non-fatal AEs resolved                           84 (62.7%) 
        No. of patients with study drug withdrawn due to resolved AE                        9 (6.7%)  
        No. of patients with dose modified/interrupted due to resolved AE                  36 (26.9%) 
        No. of patients with treatment received for resolved AE                            53 (39.6%) 
        Total number of patients with at least one unresolved or ongoing non-fatal AE      102 (76.1%)
        No. of patients with study drug withdrawn due to unresolved or ongoing AE          19 (14.2%) 
        No. of patients with dose modified/interrupted due to unresolved or ongoing AE     48 (35.8%) 
        No. of patients with treatment received for unresolved/ongoing AE                  69 (51.5%) 
        Total number of patients with at least one serious AE                              104 (77.6%)
        No. of patients with study drug withdrawn due to serious AE                         9 (6.7%)  
        No. of patients with dose modified/interrupted due to serious AE                   22 (16.4%) 
        No. of patients with treatment received for serious AE                             70 (52.2%) 
        Total number of patients with at least one related AE                              105 (78.4%)
        No. of patients with study drug withdrawn due to related AE                         6 (4.5%)  
        No. of patients with dose modified/interrupted due to related AE                   29 (21.6%) 
        No. of patients with treatment received for related AE                             69 (51.5%) 
        No. of patients with serious, related AE                                           76 (56.7%) 
      \s\n                                                                                     B: Placebo 
                                                                                             (N=134)  
        ——————————————————————————————————————————————————————————————————————————————————————————————
        Total number of patients with at least one AE                                      123 (91.8%)
        Total number of AEs                                                                    622    
        Total number of patients with at least one AE by worst grade                                  
          Grade 1                                                                           9 (6.7%)  
          Grade 2                                                                           10 (7.5%) 
          Grade 3                                                                          14 (10.4%) 
          Grade 4                                                                          20 (14.9%) 
          Grade 5 (fatal outcome)                                                          70 (52.2%) 
        Total number of patients with study drug withdrawn due to AE                       26 (19.4%) 
        Total number of patients with dose modified/interrupted due to AE                  76 (56.7%) 
        Total number of patients with treatment received for AE                            102 (76.1%)
        Total number of patients with all non-fatal AEs resolved                           92 (68.7%) 
        No. of patients with study drug withdrawn due to resolved AE                        12 (9.0%) 
        No. of patients with dose modified/interrupted due to resolved AE                  39 (29.1%) 
        No. of patients with treatment received for resolved AE                            60 (44.8%) 
        Total number of patients with at least one unresolved or ongoing non-fatal AE      110 (82.1%)
        No. of patients with study drug withdrawn due to unresolved or ongoing AE          15 (11.2%) 
        No. of patients with dose modified/interrupted due to unresolved or ongoing AE     56 (41.8%) 
        No. of patients with treatment received for unresolved/ongoing AE                  80 (59.7%) 
        Total number of patients with at least one serious AE                              101 (75.4%)
        No. of patients with study drug withdrawn due to serious AE                         6 (4.5%)  
        No. of patients with dose modified/interrupted due to serious AE                   26 (19.4%) 
        No. of patients with treatment received for serious AE                             73 (54.5%) 
        Total number of patients with at least one related AE                              108 (80.6%)
        No. of patients with study drug withdrawn due to related AE                         12 (9.0%) 
        No. of patients with dose modified/interrupted due to related AE                   38 (28.4%) 
        No. of patients with treatment received for related AE                             74 (55.2%) 
        No. of patients with serious, related AE                                           70 (52.2%) 
      \s\n                                                                                     C: Combination
                                                                                              (N=132)    
        —————————————————————————————————————————————————————————————————————————————————————————————————
        Total number of patients with at least one AE                                       120 (90.9%)  
        Total number of AEs                                                                     703      
        Total number of patients with at least one AE by worst grade                                     
          Grade 1                                                                             4 (3.0%)   
          Grade 2                                                                             7 (5.3%)   
          Grade 3                                                                            16 (12.1%)  
          Grade 4                                                                            18 (13.6%)  
          Grade 5 (fatal outcome)                                                            75 (56.8%)  
        Total number of patients with study drug withdrawn due to AE                         30 (22.7%)  
        Total number of patients with dose modified/interrupted due to AE                    74 (56.1%)  
        Total number of patients with treatment received for AE                             103 (78.0%)  
        Total number of patients with all non-fatal AEs resolved                             97 (73.5%)  
        No. of patients with study drug withdrawn due to resolved AE                         15 (11.4%)  
        No. of patients with dose modified/interrupted due to resolved AE                    40 (30.3%)  
        No. of patients with treatment received for resolved AE                              65 (49.2%)  
        Total number of patients with at least one unresolved or ongoing non-fatal AE       107 (81.1%)  
        No. of patients with study drug withdrawn due to unresolved or ongoing AE            19 (14.4%)  
        No. of patients with dose modified/interrupted due to unresolved or ongoing AE       59 (44.7%)  
        No. of patients with treatment received for unresolved/ongoing AE                    74 (56.1%)  
        Total number of patients with at least one serious AE                                99 (75.0%)  
        No. of patients with study drug withdrawn due to serious AE                          11 (8.3%)   
        No. of patients with dose modified/interrupted due to serious AE                     29 (22.0%)  
        No. of patients with treatment received for serious AE                               62 (47.0%)  
        Total number of patients with at least one related AE                               109 (82.6%)  
        No. of patients with study drug withdrawn due to related AE                           8 (6.1%)   
        No. of patients with dose modified/interrupted due to related AE                     38 (28.8%)  
        No. of patients with treatment received for related AE                               72 (54.5%)  
        No. of patients with serious, related AE                                             75 (56.8%)  

