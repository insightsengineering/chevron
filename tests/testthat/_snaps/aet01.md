# aet01 can handle all NA values

    Code
      res
    Output
                                                                      A: Drug X    B: Placebo    C: Combination
                                                                       (N=134)       (N=134)        (N=132)    
        ———————————————————————————————————————————————————————————————————————————————————————————————————————
        Total number of patients with at least one AE                122 (91.0%)   123 (91.8%)    120 (90.9%)  
        Total number of AEs                                              609           622            703      
        Total number of deaths                                       25 (18.7%)    23 (17.2%)      22 (16.7%)  
        Total number of patients withdrawn from study due to an AE    3 (2.2%)      6 (4.5%)        5 (3.8%)   
        Total number of patients with at least one                                                             
          AE with fatal outcome                                           0             0              0       
          Serious AE                                                      0             0              0       
          Serious AE leading to withdrawal from treatment                 0             0              0       
          Serious AE leading to dose modification/interruption            0             0              0       
          Related Serious AE                                              0             0              0       
          AE leading to withdrawal from treatment                    27 (20.1%)    26 (19.4%)      30 (22.7%)  
          AE leading to dose modification/interruption               66 (49.3%)    76 (56.7%)      74 (56.1%)  
          Related AE                                                 105 (78.4%)   108 (80.6%)    109 (82.6%)  
          Related AE leading to withdrawal from treatment             6 (4.5%)      12 (9.0%)       8 (6.1%)   
          Related AE leading to dose modification/interruption       29 (21.6%)    38 (28.4%)      38 (28.8%)  
          Severe AE (at greatest intensity)                          91 (67.9%)    90 (67.2%)      93 (70.5%)  

---

    Code
      res
    Output
                                                                      A: Drug X    B: Placebo    C: Combination
                                                                       (N=134)       (N=134)        (N=132)    
        ———————————————————————————————————————————————————————————————————————————————————————————————————————
        Total number of patients with at least one AE                122 (91.0%)   123 (91.8%)    120 (90.9%)  
        Total number of AEs                                              609           622            703      
        Total number of deaths                                       25 (18.7%)    23 (17.2%)      22 (16.7%)  
        Total number of patients withdrawn from study due to an AE    3 (2.2%)      6 (4.5%)        5 (3.8%)   
        Total number of patients with at least one                                                             
          AE leading to withdrawal from treatment                    27 (20.1%)    26 (19.4%)      30 (22.7%)  
          AE leading to dose modification/interruption               66 (49.3%)    76 (56.7%)      74 (56.1%)  
          Related AE                                                 105 (78.4%)   108 (80.6%)    109 (82.6%)  
          Related AE leading to withdrawal from treatment             6 (4.5%)      12 (9.0%)       8 (6.1%)   
          Related AE leading to dose modification/interruption       29 (21.6%)    38 (28.4%)      38 (28.8%)  
          Severe AE (at greatest intensity)                          91 (67.9%)    90 (67.2%)      93 (70.5%)  

# aet01 can handle some NA values

    Code
      res
    Output
                                                                      A: Drug X    B: Placebo    C: Combination
                                                                       (N=134)       (N=134)        (N=132)    
        ———————————————————————————————————————————————————————————————————————————————————————————————————————
        Total number of patients with at least one AE                122 (91.0%)   123 (91.8%)    120 (90.9%)  
        Total number of AEs                                              609           622            703      
        Total number of deaths                                       25 (18.7%)    23 (17.2%)      22 (16.7%)  
        Total number of patients withdrawn from study due to an AE    3 (2.2%)      6 (4.5%)        5 (3.8%)   
        Total number of patients with at least one                                                             
          AE with fatal outcome                                      76 (56.7%)    70 (52.2%)      75 (56.8%)  
          Serious AE                                                 104 (77.6%)   101 (75.4%)     99 (75.0%)  
          Serious AE leading to withdrawal from treatment             9 (6.7%)      6 (4.5%)       11 (8.3%)   
          Serious AE leading to dose modification/interruption       22 (16.4%)    26 (19.4%)      29 (22.0%)  
          Related Serious AE                                         76 (56.7%)    70 (52.2%)      75 (56.8%)  
          AE leading to withdrawal from treatment                    27 (20.1%)    26 (19.4%)      30 (22.7%)  
          AE leading to dose modification/interruption               66 (49.3%)    76 (56.7%)      74 (56.1%)  
          Related AE                                                 105 (78.4%)   108 (80.6%)    109 (82.6%)  
          Related AE leading to withdrawal from treatment             6 (4.5%)      12 (9.0%)       8 (6.1%)   
          Related AE leading to dose modification/interruption       29 (21.6%)    38 (28.4%)      38 (28.8%)  
          Severe AE (at greatest intensity)                          91 (67.9%)    90 (67.2%)      93 (70.5%)  

# aet01 can use custom anl_vars

    Code
      res
    Output
                                                                      A: Drug X    B: Placebo    C: Combination
                                                                       (N=134)       (N=134)        (N=132)    
        ———————————————————————————————————————————————————————————————————————————————————————————————————————
        Total number of patients with at least one AE                122 (91.0%)   123 (91.8%)    120 (90.9%)  
        Total number of AEs                                              609           622            703      
        Total number of deaths                                       25 (18.7%)    23 (17.2%)      22 (16.7%)  
        Total number of patients withdrawn from study due to an AE    3 (2.2%)      6 (4.5%)        5 (3.8%)   
        Total number of patients with at least one                                                             
          AE with fatal outcome                                      76 (56.7%)    70 (52.2%)      75 (56.8%)  

# aet01 can use custom medconcept_var

    Code
      res
    Output
                                                                      A: Drug X    B: Placebo    C: Combination
                                                                       (N=134)       (N=134)        (N=132)    
        ———————————————————————————————————————————————————————————————————————————————————————————————————————
        Total number of patients with at least one AE                122 (91.0%)   123 (91.8%)    120 (90.9%)  
        Total number of AEs                                              609           622            703      
        Total number of deaths                                       25 (18.7%)    23 (17.2%)      22 (16.7%)  
        Total number of patients withdrawn from study due to an AE    3 (2.2%)      6 (4.5%)        5 (3.8%)   
        Total number of patients with at least one                                                             
          AE with fatal outcome                                      76 (56.7%)    70 (52.2%)      75 (56.8%)  
          Serious AE                                                 104 (77.6%)   101 (75.4%)     99 (75.0%)  
          Serious AE leading to withdrawal from treatment             9 (6.7%)      6 (4.5%)       11 (8.3%)   
          Serious AE leading to dose modification/interruption       22 (16.4%)    26 (19.4%)      29 (22.0%)  
          Related Serious AE                                         76 (56.7%)    70 (52.2%)      75 (56.8%)  
          AE leading to withdrawal from treatment                    27 (20.1%)    26 (19.4%)      30 (22.7%)  
          AE leading to dose modification/interruption               66 (49.3%)    76 (56.7%)      74 (56.1%)  
          Related AE                                                 105 (78.4%)   108 (80.6%)    109 (82.6%)  
          Related AE leading to withdrawal from treatment             6 (4.5%)      12 (9.0%)       8 (6.1%)   
          Related AE leading to dose modification/interruption       29 (21.6%)    38 (28.4%)      38 (28.8%)  
          Severe AE (at greatest intensity)                          91 (67.9%)    90 (67.2%)      93 (70.5%)  
        Total number of patients with at least one                                                             
          SMQ 01                                                     72 (53.7%)    79 (59.0%)      75 (56.8%)  

