# vst02 functions with default argument value return expected result with test data

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
        Assessment                  A: Drug X      B: Placebo     C: Combination
         Abnormality                  (N=15)         (N=15)           (N=15)    
        ————————————————————————————————————————————————————————————————————————
        Diastolic Blood Pressure                                                
          Low                       6/15 (40%)    10/15 (66.7%)     9/15 (60%)  
          High                      6/15 (40%)    8/15 (53.3%)     12/15 (80%)  
        Pulse Rate                                                              
          Low                      8/15 (53.3%)   5/15 (33.3%)     7/15 (46.7%) 
          High                     7/15 (46.7%)   8/15 (53.3%)     7/15 (46.7%) 
        Respiratory Rate                                                        
          Low                      7/15 (46.7%)   7/15 (46.7%)     5/15 (33.3%) 
          High                     7/15 (46.7%)   4/15 (26.7%)     8/15 (53.3%) 
        Systolic Blood Pressure                                                 
          Low                      7/15 (46.7%)   10/15 (66.7%)    4/15 (26.7%) 
          High                     8/15 (53.3%)   8/15 (53.3%)      6/15 (40%)  
        Temperature                                                             
          Low                       6/15 (40%)    8/15 (53.3%)      9/15 (60%)  
          High                      9/15 (60%)     9/15 (60%)       9/15 (60%)  
        Weight                                                                  
          Low                      12/15 (80%)    7/15 (46.7%)      9/15 (60%)  
          High                     7/15 (46.7%)   10/15 (66.7%)     9/15 (60%)  

# vst02 functions return expected result with test data when excluding subject with baseline abnormality

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
        Assessment                  A: Drug X      B: Placebo    C: Combination
         Abnormality                  (N=15)         (N=15)          (N=15)    
        ———————————————————————————————————————————————————————————————————————
        Diastolic Blood Pressure                                               
          Low                      4/13 (30.8%)    5/10 (50%)     7/13 (53.8%) 
          High                     5/14 (35.7%)    7/14 (50%)      9/12 (75%)  
        Pulse Rate                                                             
          Low                      5/12 (41.7%)   3/13 (23.1%)    6/14 (42.9%) 
          High                     7/15 (46.7%)   5/12 (41.7%)    6/14 (42.9%) 
        Respiratory Rate                                                       
          Low                      5/13 (38.5%)   6/14 (42.9%)    5/15 (33.3%) 
          High                     6/14 (42.9%)   4/15 (26.7%)    8/15 (53.3%) 
        Systolic Blood Pressure                                                
          Low                      5/13 (38.5%)   9/14 (64.3%)    4/15 (26.7%) 
          High                      7/14 (50%)    8/15 (53.3%)    4/13 (30.8%) 
        Temperature                                                            
          Low                      4/13 (30.8%)   6/13 (46.2%)     9/15 (60%)  
          High                      9/15 (60%)    8/14 (57.1%)    7/13 (53.8%) 
        Weight                                                                 
          Low                       9/12 (75%)     2/10 (20%)     7/13 (53.8%) 
          High                     4/12 (33.3%)   9/14 (64.3%)    7/13 (53.8%) 

