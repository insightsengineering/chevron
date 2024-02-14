# aet01 can handle all NA values

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                                                     A: Drug X    B: Placebo   C: Combination
                                                                       (N=15)       (N=15)         (N=15)    
        —————————————————————————————————————————————————————————————————————————————————————————————————————
        Total number of patients with at least one AE                13 (86.7%)   14 (93.3%)     15 (100%)   
        Total number of AEs                                              58           59             99      
        Total number of deaths                                       2 (13.3%)    4 (26.7%)      3 (20.0%)   
        Total number of patients withdrawn from study due to an AE       0            0           1 (6.7%)   
        Total number of patients with at least one                                                           
          AE with fatal outcome                                          0            0              0       
          Serious AE                                                     0            0              0       
          Serious AE leading to withdrawal from treatment                0            0              0       
          Serious AE leading to dose modification/interruption           0            0              0       
          Related Serious AE                                             0            0              0       
          AE leading to withdrawal from treatment                    2 (13.3%)    3 (20.0%)      3 (20.0%)   
          AE leading to dose modification/interruption               6 (40.0%)    9 (60.0%)      11 (73.3%)  
          Related AE                                                 11 (73.3%)   10 (66.7%)     13 (86.7%)  
          Related AE leading to withdrawal from treatment                0        3 (20.0%)          0       
          Related AE leading to dose modification/interruption        1 (6.7%)    4 (26.7%)      9 (60.0%)   
          Severe AE (at greatest intensity)                          11 (73.3%)   10 (66.7%)     12 (80.0%)  

---

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                                                     A: Drug X    B: Placebo   C: Combination
                                                                       (N=15)       (N=15)         (N=15)    
        —————————————————————————————————————————————————————————————————————————————————————————————————————
        Total number of patients with at least one AE                13 (86.7%)   14 (93.3%)     15 (100%)   
        Total number of AEs                                              58           59             99      
        Total number of deaths                                       2 (13.3%)    4 (26.7%)      3 (20.0%)   
        Total number of patients withdrawn from study due to an AE       0            0           1 (6.7%)   
        Total number of patients with at least one                                                           
          AE leading to withdrawal from treatment                    2 (13.3%)    3 (20.0%)      3 (20.0%)   
          AE leading to dose modification/interruption               6 (40.0%)    9 (60.0%)      11 (73.3%)  
          Related AE                                                 11 (73.3%)   10 (66.7%)     13 (86.7%)  
          Related AE leading to withdrawal from treatment                0        3 (20.0%)          0       
          Related AE leading to dose modification/interruption        1 (6.7%)    4 (26.7%)      9 (60.0%)   
          Severe AE (at greatest intensity)                          11 (73.3%)   10 (66.7%)     12 (80.0%)  

# aet01 can handle some NA values

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                                                     A: Drug X    B: Placebo   C: Combination
                                                                       (N=15)       (N=15)         (N=15)    
        —————————————————————————————————————————————————————————————————————————————————————————————————————
        Total number of patients with at least one AE                13 (86.7%)   14 (93.3%)     15 (100%)   
        Total number of AEs                                              58           59             99      
        Total number of deaths                                       2 (13.3%)    4 (26.7%)      3 (20.0%)   
        Total number of patients withdrawn from study due to an AE       0            0           1 (6.7%)   
        Total number of patients with at least one                                                           
          AE with fatal outcome                                      8 (53.3%)    8 (53.3%)      10 (66.7%)  
          Serious AE                                                 12 (80.0%)   12 (80.0%)     11 (73.3%)  
          Serious AE leading to withdrawal from treatment                0            0          2 (13.3%)   
          Serious AE leading to dose modification/interruption       4 (26.7%)    3 (20.0%)      4 (26.7%)   
          Related Serious AE                                         8 (53.3%)    8 (53.3%)      10 (66.7%)  
          AE leading to withdrawal from treatment                    2 (13.3%)    3 (20.0%)      3 (20.0%)   
          AE leading to dose modification/interruption               6 (40.0%)    9 (60.0%)      11 (73.3%)  
          Related AE                                                 11 (73.3%)   10 (66.7%)     13 (86.7%)  
          Related AE leading to withdrawal from treatment                0        3 (20.0%)          0       
          Related AE leading to dose modification/interruption        1 (6.7%)    4 (26.7%)      9 (60.0%)   
          Severe AE (at greatest intensity)                          11 (73.3%)   10 (66.7%)     12 (80.0%)  

# aet01 can use custom anl_vars

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                                                     A: Drug X    B: Placebo   C: Combination
                                                                       (N=15)       (N=15)         (N=15)    
        —————————————————————————————————————————————————————————————————————————————————————————————————————
        Total number of patients with at least one AE                13 (86.7%)   14 (93.3%)     15 (100%)   
        Total number of AEs                                              58           59             99      
        Total number of deaths                                       2 (13.3%)    4 (26.7%)      3 (20.0%)   
        Total number of patients withdrawn from study due to an AE       0            0           1 (6.7%)   
        Total number of patients with at least one                                                           
          AE with fatal outcome                                      8 (53.3%)    8 (53.3%)      10 (66.7%)  

# aet01 can use custom medconcept_var

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                                                     A: Drug X    B: Placebo   C: Combination
                                                                       (N=15)       (N=15)         (N=15)    
        —————————————————————————————————————————————————————————————————————————————————————————————————————
        Total number of patients with at least one AE                13 (86.7%)   14 (93.3%)     15 (100%)   
        Total number of AEs                                              58           59             99      
        Total number of deaths                                       2 (13.3%)    4 (26.7%)      3 (20.0%)   
        Total number of patients withdrawn from study due to an AE       0            0           1 (6.7%)   
        Total number of patients with at least one                                                           
          AE with fatal outcome                                      8 (53.3%)    8 (53.3%)      10 (66.7%)  
          Serious AE                                                 12 (80.0%)   12 (80.0%)     11 (73.3%)  
          Serious AE leading to withdrawal from treatment                0            0          2 (13.3%)   
          Serious AE leading to dose modification/interruption       4 (26.7%)    3 (20.0%)      4 (26.7%)   
          Related Serious AE                                         8 (53.3%)    8 (53.3%)      10 (66.7%)  
          AE leading to withdrawal from treatment                    2 (13.3%)    3 (20.0%)      3 (20.0%)   
          AE leading to dose modification/interruption               6 (40.0%)    9 (60.0%)      11 (73.3%)  
          Related AE                                                 11 (73.3%)   10 (66.7%)     13 (86.7%)  
          Related AE leading to withdrawal from treatment                0        3 (20.0%)          0       
          Related AE leading to dose modification/interruption        1 (6.7%)    4 (26.7%)      9 (60.0%)   
          Severe AE (at greatest intensity)                          11 (73.3%)   10 (66.7%)     12 (80.0%)  
        Total number of patients with at least one                                                           
          SMQ 01                                                     10 (66.7%)   7 (46.7%)      10 (66.7%)  

