# aet01_aesi can handle all NA values

    Code
      res
    Output
                                                                                         A: Drug X    B: Placebo    C: Combination
                                                                                          (N=134)       (N=134)        (N=132)    
        ——————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————
        Total number of patients with at least one AE                                   122 (91.0%)   123 (91.8%)    120 (90.9%)  
        Total number of AEs                                                                 609           622            703      
        Total number of patients with at least one AE by worst grade                                                              
          Grade 1                                                                        7 (5.2%)      9 (6.7%)        4 (3.0%)   
          Grade 2                                                                        6 (4.5%)      10 (7.5%)       7 (5.3%)   
          Grade 3                                                                       18 (13.4%)    14 (10.4%)      16 (12.1%)  
          Grade 4                                                                       15 (11.2%)    20 (14.9%)      18 (13.6%)  
          Grade 5                                                                       76 (56.7%)    70 (52.2%)      75 (56.8%)  
          Missing                                                                            0             0              0       
        Total number of patients with study drug withdrawn due to AE                         0             0              0       
        Total number of patients with dose modified/interrupted due to AE                    0             0              0       
        Total number of patients with treatment received for AE                              0             0              0       
        Total number of patients with all non-fatal AEs resolved                        84 (62.7%)    92 (68.7%)      97 (73.5%)  
        Total number of patients with at least one unresolved or ongoing non-fatal AE   102 (76.1%)   110 (82.1%)    107 (81.1%)  
        Total number of patients with at least one serious AE                                0             0              0       
        Total number of patients with at least one related AE                           105 (78.4%)   108 (80.6%)    109 (82.6%)  

---

    Code
      res
    Output
                                                                                         A: Drug X    B: Placebo    C: Combination
                                                                                          (N=134)       (N=134)        (N=132)    
        ——————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————
        Total number of patients with at least one AE                                   122 (91.0%)   123 (91.8%)    120 (90.9%)  
        Total number of AEs                                                                 609           622            703      
        Total number of patients with at least one AE by worst grade                                                              
          Grade 1                                                                        7 (5.2%)      9 (6.7%)        4 (3.0%)   
          Grade 2                                                                        6 (4.5%)      10 (7.5%)       7 (5.3%)   
          Grade 3                                                                       18 (13.4%)    14 (10.4%)      16 (12.1%)  
          Grade 4                                                                       15 (11.2%)    20 (14.9%)      18 (13.6%)  
          Grade 5                                                                       76 (56.7%)    70 (52.2%)      75 (56.8%)  
        Total number of patients with all non-fatal AEs resolved                        84 (62.7%)    92 (68.7%)      97 (73.5%)  
        Total number of patients with at least one unresolved or ongoing non-fatal AE   102 (76.1%)   110 (82.1%)    107 (81.1%)  
        Total number of patients with at least one related AE                           105 (78.4%)   108 (80.6%)    109 (82.6%)  

# aet01_aesi can handle some NA values

    Code
      res
    Output
                                                                                         A: Drug X    B: Placebo    C: Combination
                                                                                          (N=134)       (N=134)        (N=132)    
        ——————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————
        Total number of patients with at least one AE                                   122 (91.0%)   123 (91.8%)    120 (90.9%)  
        Total number of AEs                                                                 609           622            703      
        Total number of patients with at least one AE by worst grade                                                              
          Grade 1                                                                        7 (5.2%)      9 (6.7%)        4 (3.0%)   
          Grade 2                                                                        6 (4.5%)      10 (7.5%)       7 (5.3%)   
          Grade 3                                                                       18 (13.4%)    14 (10.4%)      16 (12.1%)  
          Grade 4                                                                       15 (11.2%)    20 (14.9%)      18 (13.6%)  
          Grade 5                                                                       76 (56.7%)    70 (52.2%)      75 (56.8%)  
          Missing                                                                            0             0              0       
        Total number of patients with study drug withdrawn due to AE                    27 (20.1%)    26 (19.4%)      30 (22.7%)  
        Total number of patients with dose modified/interrupted due to AE               66 (49.3%)    76 (56.7%)      74 (56.1%)  
        Total number of patients with treatment received for AE                         98 (73.1%)    102 (76.1%)    103 (78.0%)  
        Total number of patients with all non-fatal AEs resolved                        84 (62.7%)    92 (68.7%)      97 (73.5%)  
        Total number of patients with at least one unresolved or ongoing non-fatal AE   102 (76.1%)   110 (82.1%)    107 (81.1%)  
        Total number of patients with at least one serious AE                           104 (77.6%)   101 (75.4%)     99 (75.0%)  
        Total number of patients with at least one related AE                           105 (78.4%)   108 (80.6%)    109 (82.6%)  

# aet01_aesi works with `ALL` argument

    Code
      res
    Output
                                                                                            A: Drug X    B: Placebo    C: Combination
                                                                                             (N=134)       (N=134)        (N=132)    
        —————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————
        Total number of patients with at least one AE                                      122 (91.0%)   123 (91.8%)    120 (90.9%)  
        Total number of AEs                                                                    609           622            703      
        Total number of patients with at least one AE by worst grade                                                                 
          Grade 1                                                                           7 (5.2%)      9 (6.7%)        4 (3.0%)   
          Grade 2                                                                           6 (4.5%)      10 (7.5%)       7 (5.3%)   
          Grade 3                                                                          18 (13.4%)    14 (10.4%)      16 (12.1%)  
          Grade 4                                                                          15 (11.2%)    20 (14.9%)      18 (13.6%)  
          Grade 5                                                                          76 (56.7%)    70 (52.2%)      75 (56.8%)  
          Missing                                                                               0             0              0       
        Total number of patients with study drug withdrawn due to AE                       27 (20.1%)    26 (19.4%)      30 (22.7%)  
        Total number of patients with dose modified/interrupted due to AE                  66 (49.3%)    76 (56.7%)      74 (56.1%)  
        Total number of patients with treatment received for AE                            98 (73.1%)    102 (76.1%)    103 (78.0%)  
        Total number of patients with all non-fatal AEs resolved                           84 (62.7%)    92 (68.7%)      97 (73.5%)  
        No. of patients with study drug withdrawn due to resolved AE                        9 (6.7%)      12 (9.0%)      15 (11.4%)  
        No. of patients with dose modified/interrupted due to resolved AE                  36 (26.9%)    39 (29.1%)      40 (30.3%)  
        No. of patients with treatment received for resolved AE                            53 (39.6%)    60 (44.8%)      65 (49.2%)  
        Total number of patients with at least one unresolved or ongoing non-fatal AE      102 (76.1%)   110 (82.1%)    107 (81.1%)  
        No. of patients with study drug withdrawn due to unresolved or ongoing AE          19 (14.2%)    15 (11.2%)      19 (14.4%)  
        No. of patients with dose modified/interrupted due to unresolved or ongoing AE     48 (35.8%)    56 (41.8%)      59 (44.7%)  
        No. of patients with treatment received for unresolved/ongoing AE                  69 (51.5%)    80 (59.7%)      74 (56.1%)  
        Total number of patients with at least one serious AE                              104 (77.6%)   101 (75.4%)     99 (75.0%)  
        No. of patients with study drug withdrawn due to serious AE                         9 (6.7%)      6 (4.5%)       11 (8.3%)   
        No. of patients with dose modified/interrupted due to serious AE                   22 (16.4%)    26 (19.4%)      29 (22.0%)  
        No. of patients with treatment received for serious AE                             70 (52.2%)    73 (54.5%)      62 (47.0%)  
        Total number of patients with at least one related AE                              105 (78.4%)   108 (80.6%)    109 (82.6%)  
        No. of patients with study drug withdrawn due to related AE                         6 (4.5%)      12 (9.0%)       8 (6.1%)   
        No. of patients with dose modified/interrupted due to related AE                   29 (21.6%)    38 (28.4%)      38 (28.8%)  
        No. of patients with treatment received for related AE                             69 (51.5%)    74 (55.2%)      72 (54.5%)  
        No. of patients with serious, related AE                                           76 (56.7%)    70 (52.2%)      75 (56.8%)  

