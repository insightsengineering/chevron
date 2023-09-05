# rmpt06 works as expected

    Code
      cat(export_as_txt(res, lpp = 100, cpp = 200))
    Output
                                                                           A: Drug X      B: Placebo    C: Combination
                                                                            (N=134)        (N=134)         (N=132)    
        ——————————————————————————————————————————————————————————————————————————————————————————————————————————————
        Number of patients with at least one adverse event                122 (91.0%)    123 (91.8%)     120 (90.9%)  
        95% CI for % of patients with at least one AE (Clopper-Pearson)   (84.9, 95.3)   (85.8, 95.8)    (84.7, 95.2) 
        Total number of AEs                                                   609            622             703      
        Total number of patients with at least one AE by worst grade                                                  
          Grade 1                                                           7 (5.2%)       9 (6.7%)        4 (3.0%)   
          Grade 2                                                           6 (4.5%)      10 (7.5%)        7 (5.3%)   
          Grade 3                                                          18 (13.4%)     14 (10.4%)      16 (12.1%)  
          Grade 4                                                          15 (11.2%)     20 (14.9%)      18 (13.6%)  
          Grade 5 (fatal outcome)                                          76 (56.7%)     70 (52.2%)      75 (56.8%)  
        Number of patients with at least one serious AE                   104 (77.6%)    101 (75.4%)      99 (75.0%)  
        Number of patients with at least one AE by outcome                                                            
          Fatal outcome                                                    76 (62.3%)     70 (56.9%)      75 (62.5%)  
          Unresolved                                                       66 (54.1%)     64 (52.0%)      70 (58.3%)  
          Recovered/Resolved                                               73 (59.8%)     83 (67.5%)      88 (73.3%)  
          Resolved with sequelae                                           44 (36.1%)     40 (32.5%)      43 (35.8%)  
          Recovering/Resolving                                             81 (66.4%)     84 (68.3%)      88 (73.3%)  
          Unknown outcome                                                  38 (31.1%)     49 (39.8%)      44 (36.7%)  

# rmpt06 works as expected with show_diff = TRUE

    Code
      cat(export_as_txt(res, lpp = 100, cpp = 200))
    Output
                                                                           A: Drug X      B: Placebo    C: Combination
                                                                            (N=134)        (N=134)         (N=132)    
        ——————————————————————————————————————————————————————————————————————————————————————————————————————————————
        Number of patients with at least one adverse event                122 (91.0%)    123 (91.8%)     120 (90.9%)  
        95% CI for % of patients with at least one AE (Clopper-Pearson)   (84.9, 95.3)   (85.8, 95.8)    (84.7, 95.2) 
        Difference in % of patients with at least one AE                                     0.7             -0.1     
          95% CI of difference (Wald with correction)                                    (-6.0, 7.5)     (-7.0, 6.8)  
        Total number of AEs                                                   609            622             703      
        Total number of patients with at least one AE by worst grade                                                  
          Grade 1                                                           7 (5.2%)       9 (6.7%)        4 (3.0%)   
          Grade 2                                                           6 (4.5%)      10 (7.5%)        7 (5.3%)   
          Grade 3                                                          18 (13.4%)     14 (10.4%)      16 (12.1%)  
          Grade 4                                                          15 (11.2%)     20 (14.9%)      18 (13.6%)  
          Grade 5 (fatal outcome)                                          76 (56.7%)     70 (52.2%)      75 (56.8%)  
        Number of patients with at least one serious AE                   104 (77.6%)    101 (75.4%)      99 (75.0%)  
        Number of patients with at least one AE by outcome                                                            
          Fatal outcome                                                    76 (62.3%)     70 (56.9%)      75 (62.5%)  
          Unresolved                                                       66 (54.1%)     64 (52.0%)      70 (58.3%)  
          Recovered/Resolved                                               73 (59.8%)     83 (67.5%)      88 (73.3%)  
          Resolved with sequelae                                           44 (36.1%)     40 (32.5%)      43 (35.8%)  
          Recovering/Resolving                                             81 (66.4%)     84 (68.3%)      88 (73.3%)  
          Unknown outcome                                                  38 (31.1%)     49 (39.8%)      44 (36.7%)  

# rmpt06 can handle all NA values

    Code
      cat(export_as_txt(res, lpp = 100, cpp = 200))
    Output
                                                                           A: Drug X      B: Placebo    C: Combination
                                                                            (N=134)        (N=134)         (N=132)    
        ——————————————————————————————————————————————————————————————————————————————————————————————————————————————
        Number of patients with at least one adverse event                122 (91.0%)    123 (91.8%)     120 (90.9%)  
        95% CI for % of patients with at least one AE (Clopper-Pearson)   (84.9, 95.3)   (85.8, 95.8)    (84.7, 95.2) 
        Total number of AEs                                                   609            622             703      
        Total number of patients with at least one AE by worst grade                                                  
          Grade 1                                                              0              0               0       
          Grade 2                                                              0              0               0       
          Grade 3                                                              0              0               0       
          Grade 4                                                              0              0               0       
          Grade 5 (fatal outcome)                                              0              0               0       
        Number of patients with at least one serious AE                        0              0               0       
        Number of patients with at least one AE by outcome                                                            
          Fatal outcome                                                        0              0               0       
          Unresolved                                                           0              0               0       
          Recovered/Resolved                                                   0              0               0       
          Resolved with sequelae                                               0              0               0       
          Recovering/Resolving                                                 0              0               0       
          Unknown outcome                                                      0              0               0       

---

    Code
      cat(export_as_txt(res, lpp = 100, cpp = 200))
    Output
                                                                           A: Drug X      B: Placebo    C: Combination
                                                                            (N=134)        (N=134)         (N=132)    
        ——————————————————————————————————————————————————————————————————————————————————————————————————————————————
        Number of patients with at least one adverse event                122 (91.0%)    123 (91.8%)     120 (90.9%)  
        95% CI for % of patients with at least one AE (Clopper-Pearson)   (84.9, 95.3)   (85.8, 95.8)    (84.7, 95.2) 
        Total number of AEs                                                   609            622             703      
