# aet01_aesi can handle all NA values

    Code
      cat(export_as_txt(res, lpp = 100, cpp = 200))
    Output
                                                                                        A: Drug X    B: Placebo   C: Combination
                                                                                          (N=15)       (N=15)         (N=15)    
        ————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————
        Total number of patients with at least one AE                                   13 (86.7%)   14 (93.3%)     15 (100%)   
        Total number of AEs                                                                 58           59             99      
        Total number of patients with at least one AE by worst grade                                                            
          Grade 1                                                                           0         1 (6.7%)       1 (6.7%)   
          Grade 2                                                                        1 (6.7%)     1 (6.7%)       1 (6.7%)   
          Grade 3                                                                        1 (6.7%)    2 (13.3%)       1 (6.7%)   
          Grade 4                                                                       3 (20.0%)    2 (13.3%)      2 (13.3%)   
          Grade 5 (fatal outcome)                                                       8 (53.3%)    8 (53.3%)      10 (66.7%)  
        Total number of patients with study drug withdrawn due to AE                        0            0              0       
        Total number of patients with dose modified/interrupted due to AE                   0            0              0       
        Total number of patients with treatment received for AE                             0            0              0       
        Total number of patients with all non-fatal AEs resolved                        9 (60.0%)    10 (66.7%)     12 (80.0%)  
        Total number of patients with at least one unresolved or ongoing non-fatal AE   10 (66.7%)   9 (60.0%)      14 (93.3%)  
        Total number of patients with at least one serious AE                               0            0              0       
        Total number of patients with at least one related AE                           11 (73.3%)   10 (66.7%)     13 (86.7%)  

---

    Code
      cat(export_as_txt(res, lpp = 100, cpp = 200))
    Output
                                                                                        A: Drug X    B: Placebo   C: Combination
                                                                                          (N=15)       (N=15)         (N=15)    
        ————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————
        Total number of patients with at least one AE                                   13 (86.7%)   14 (93.3%)     15 (100%)   
        Total number of AEs                                                                 58           59             99      
        Total number of patients with at least one AE by worst grade                                                            
          Grade 1                                                                           0         1 (6.7%)       1 (6.7%)   
          Grade 2                                                                        1 (6.7%)     1 (6.7%)       1 (6.7%)   
          Grade 3                                                                        1 (6.7%)    2 (13.3%)       1 (6.7%)   
          Grade 4                                                                       3 (20.0%)    2 (13.3%)      2 (13.3%)   
          Grade 5 (fatal outcome)                                                       8 (53.3%)    8 (53.3%)      10 (66.7%)  
        Total number of patients with all non-fatal AEs resolved                        9 (60.0%)    10 (66.7%)     12 (80.0%)  
        Total number of patients with at least one unresolved or ongoing non-fatal AE   10 (66.7%)   9 (60.0%)      14 (93.3%)  
        Total number of patients with at least one related AE                           11 (73.3%)   10 (66.7%)     13 (86.7%)  

# aet01_aesi can handle some NA values

    Code
      cat(export_as_txt(res, lpp = 100, cpp = 200))
    Output
                                                                                        A: Drug X    B: Placebo   C: Combination
                                                                                          (N=15)       (N=15)         (N=15)    
        ————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————
        Total number of patients with at least one AE                                   13 (86.7%)   14 (93.3%)     15 (100%)   
        Total number of AEs                                                                 58           59             99      
        Total number of patients with at least one AE by worst grade                                                            
          Grade 1                                                                           0         1 (6.7%)       1 (6.7%)   
          Grade 2                                                                        1 (6.7%)     1 (6.7%)       1 (6.7%)   
          Grade 3                                                                        1 (6.7%)    2 (13.3%)       1 (6.7%)   
          Grade 4                                                                       3 (20.0%)    2 (13.3%)      2 (13.3%)   
          Grade 5 (fatal outcome)                                                       8 (53.3%)    8 (53.3%)      10 (66.7%)  
        Total number of patients with study drug withdrawn due to AE                     1 (6.7%)    3 (20.0%)      3 (20.0%)   
        Total number of patients with dose modified/interrupted due to AE               6 (40.0%)    9 (60.0%)      11 (73.3%)  
        Total number of patients with treatment received for AE                         10 (66.7%)   10 (66.7%)     14 (93.3%)  
        Total number of patients with all non-fatal AEs resolved                        9 (60.0%)    10 (66.7%)     12 (80.0%)  
        Total number of patients with at least one unresolved or ongoing non-fatal AE   10 (66.7%)   9 (60.0%)      14 (93.3%)  
        Total number of patients with at least one serious AE                           12 (80.0%)   12 (80.0%)     11 (73.3%)  
        Total number of patients with at least one related AE                           11 (73.3%)   10 (66.7%)     13 (86.7%)  

# aet01_aesi works with `ALL` argument

    Code
      cat(export_as_txt(res, lpp = 100, cpp = 200))
    Output
                                                                                           A: Drug X    B: Placebo   C: Combination
                                                                                             (N=15)       (N=15)         (N=15)    
        ———————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————
        Total number of patients with at least one AE                                      13 (86.7%)   14 (93.3%)     15 (100%)   
        Total number of AEs                                                                    58           59             99      
        Total number of patients with at least one AE by worst grade                                                               
          Grade 1                                                                              0         1 (6.7%)       1 (6.7%)   
          Grade 2                                                                           1 (6.7%)     1 (6.7%)       1 (6.7%)   
          Grade 3                                                                           1 (6.7%)    2 (13.3%)       1 (6.7%)   
          Grade 4                                                                          3 (20.0%)    2 (13.3%)      2 (13.3%)   
          Grade 5 (fatal outcome)                                                          8 (53.3%)    8 (53.3%)      10 (66.7%)  
        Total number of patients with study drug withdrawn due to AE                       2 (13.3%)    3 (20.0%)      3 (20.0%)   
        Total number of patients with dose modified/interrupted due to AE                  6 (40.0%)    9 (60.0%)      11 (73.3%)  
        Total number of patients with treatment received for AE                            10 (66.7%)   10 (66.7%)     14 (93.3%)  
        Total number of patients with all non-fatal AEs resolved                           9 (60.0%)    10 (66.7%)     12 (80.0%)  
          No. of patients with study drug withdrawn due to resolved AE                      1 (6.7%)    2 (13.3%)      2 (13.3%)   
          No. of patients with dose modified/interrupted due to resolved AE                3 (20.0%)    6 (40.0%)      7 (46.7%)   
          No. of patients with treatment received for resolved AE                          7 (46.7%)    5 (33.3%)      7 (46.7%)   
        Total number of patients with at least one unresolved or ongoing non-fatal AE      10 (66.7%)   9 (60.0%)      14 (93.3%)  
          No. of patients with study drug withdrawn due to unresolved or ongoing AE         1 (6.7%)     1 (6.7%)       1 (6.7%)   
          No. of patients with dose modified/interrupted due to unresolved or ongoing AE   3 (20.0%)    3 (20.0%)      7 (46.7%)   
          No. of patients with treatment received for unresolved/ongoing AE                6 (40.0%)    6 (40.0%)      11 (73.3%)  
        Total number of patients with at least one serious AE                              12 (80.0%)   12 (80.0%)     11 (73.3%)  
          No. of patients with study drug withdrawn due to serious AE                          0            0          2 (13.3%)   
          No. of patients with dose modified/interrupted due to serious AE                 4 (26.7%)    3 (20.0%)      4 (26.7%)   
          No. of patients with treatment received for serious AE                           8 (53.3%)    9 (60.0%)      8 (53.3%)   
        Total number of patients with at least one related AE                              11 (73.3%)   10 (66.7%)     13 (86.7%)  
          No. of patients with study drug withdrawn due to related AE                          0        3 (20.0%)          0       
          No. of patients with dose modified/interrupted due to related AE                  1 (6.7%)    4 (26.7%)      9 (60.0%)   
          No. of patients with treatment received for related AE                           5 (33.3%)    6 (40.0%)      9 (60.0%)   
          No. of patients with serious, related AE                                         8 (53.3%)    8 (53.3%)      10 (66.7%)  

