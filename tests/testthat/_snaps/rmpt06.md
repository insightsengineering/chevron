# rmpt06 works as expected

    Code
      cat(export_as_txt(res, lpp = 100, cpp = 200))
    Output
                                                                        A: Drug X      B: Placebo    C: Combination
                                                                          (N=15)         (N=15)          (N=15)    
        ———————————————————————————————————————————————————————————————————————————————————————————————————————————
        Number of patients with at least one adverse event              13 (86.7%)     14 (93.3%)     15 (100.0%)  
        95% CI for % of patients with at least one AE                  (59.5, 98.3)   (68.1, 99.8)   (78.2, 100.0) 
        Total number of AEs                                                 58             59              99      
        Total number of patients with at least one AE by worst grade                                               
          Grade 1                                                           0           1 (6.7%)        1 (6.7%)   
          Grade 2                                                        1 (6.7%)       1 (6.7%)        1 (6.7%)   
          Grade 3                                                        1 (6.7%)      2 (13.3%)        1 (6.7%)   
          Grade 4                                                       3 (20.0%)      2 (13.3%)       2 (13.3%)   
          Grade 5 (fatal outcome)                                       8 (53.3%)      8 (53.3%)       10 (66.7%)  
        Number of patients with at least one serious AE                 12 (80.0%)     12 (80.0%)      11 (73.3%)  
        Number of patients with at least one AE by outcome                                                         
          Fatal outcome                                                 8 (61.5%)      8 (57.1%)       10 (66.7%)  
          Unresolved                                                    4 (30.8%)      6 (42.9%)       9 (60.0%)   
          Recovered/Resolved                                            9 (69.2%)      8 (57.1%)       11 (73.3%)  
          Resolved with sequelae                                        5 (38.5%)      4 (28.6%)       7 (46.7%)   
          Recovering/Resolving                                          9 (69.2%)      6 (42.9%)       13 (86.7%)  
          Unknown outcome                                               2 (15.4%)      4 (28.6%)       7 (46.7%)   

# rmpt06 works as expected with show_diff = TRUE

    Code
      cat(export_as_txt(res, lpp = 100, cpp = 200))
    Output
                                                                        A: Drug X      B: Placebo     C: Combination
                                                                          (N=15)         (N=15)           (N=15)    
        ————————————————————————————————————————————————————————————————————————————————————————————————————————————
        Number of patients with at least one adverse event              13 (86.7%)     14 (93.3%)      15 (100.0%)  
        95% CI for % of patients with at least one AE                  (59.5, 98.3)   (68.1, 99.8)    (78.2, 100.0) 
        Difference in % of patients with at least one AE                                   6.7             13.3     
          95% CI of difference                                                        (-14.7, 28.0)    (-3.9, 30.5) 
        Total number of AEs                                                 58             59               99      
        Total number of patients with at least one AE by worst grade                                                
          Grade 1                                                           0           1 (6.7%)         1 (6.7%)   
          Grade 2                                                        1 (6.7%)       1 (6.7%)         1 (6.7%)   
          Grade 3                                                        1 (6.7%)       2 (13.3%)        1 (6.7%)   
          Grade 4                                                       3 (20.0%)       2 (13.3%)       2 (13.3%)   
          Grade 5 (fatal outcome)                                       8 (53.3%)       8 (53.3%)       10 (66.7%)  
        Number of patients with at least one serious AE                 12 (80.0%)     12 (80.0%)       11 (73.3%)  
        Number of patients with at least one AE by outcome                                                          
          Fatal outcome                                                 8 (61.5%)       8 (57.1%)       10 (66.7%)  
          Unresolved                                                    4 (30.8%)       6 (42.9%)       9 (60.0%)   
          Recovered/Resolved                                            9 (69.2%)       8 (57.1%)       11 (73.3%)  
          Resolved with sequelae                                        5 (38.5%)       4 (28.6%)       7 (46.7%)   
          Recovering/Resolving                                          9 (69.2%)       6 (42.9%)       13 (86.7%)  
          Unknown outcome                                               2 (15.4%)       4 (28.6%)       7 (46.7%)   

# rmpt06 can handle all NA values

    Code
      cat(export_as_txt(res, lpp = 100, cpp = 200))
    Output
                                                                        A: Drug X      B: Placebo    C: Combination
                                                                          (N=15)         (N=15)          (N=15)    
        ———————————————————————————————————————————————————————————————————————————————————————————————————————————
        Number of patients with at least one adverse event              13 (86.7%)     14 (93.3%)     15 (100.0%)  
        95% CI for % of patients with at least one AE                  (59.5, 98.3)   (68.1, 99.8)   (78.2, 100.0) 
        Total number of AEs                                                 58             59              99      
        Total number of patients with at least one AE by worst grade                                               
          Grade 1                                                           0              0               0       
          Grade 2                                                           0              0               0       
          Grade 3                                                           0              0               0       
          Grade 4                                                           0              0               0       
          Grade 5 (fatal outcome)                                           0              0               0       
        Number of patients with at least one serious AE                     0              0               0       
        Number of patients with at least one AE by outcome                                                         
          Fatal outcome                                                     0              0               0       
          Unresolved                                                        0              0               0       
          Recovered/Resolved                                                0              0               0       
          Resolved with sequelae                                            0              0               0       
          Recovering/Resolving                                              0              0               0       
          Unknown outcome                                                   0              0               0       

---

    Code
      cat(export_as_txt(res, lpp = 100, cpp = 200))
    Output
                                                              A: Drug X      B: Placebo    C: Combination
                                                                (N=15)         (N=15)          (N=15)    
        —————————————————————————————————————————————————————————————————————————————————————————————————
        Number of patients with at least one adverse event    13 (86.7%)     14 (93.3%)     15 (100.0%)  
        95% CI for % of patients with at least one AE        (59.5, 98.3)   (68.1, 99.8)   (78.2, 100.0) 
        Total number of AEs                                       58             59              99      

